#!/usr/bin/env bash
# Run the TradingAgents ANT IPO pipeline as one headless Claude Code CLI
# session per phase (Sonnet 5). Each session reads the repo's own role
# prompts, writes its reports (with a Reasoning section) into OUT, and the
# CLI's JSON result (cost/tokens) is logged to OUT/_logs.
#
# Usage: scripts/ant_cli_pipeline.sh [out_dir] [first_phase]
set -euo pipefail
cd "$(dirname "$0")/.."

OUT="${1:-research/ANT_$(date +%F)_run2}"
START="${2:-1}"
MODEL="${MODEL:-claude-sonnet-5}"
mkdir -p "$OUT/_logs"

TODAY="$(date +%F)"
if [[ "$TODAY" < "2026-11-19" ]]; then
  STATUS="ANT is not trading yet."
else
  STATUS="ANT began trading on Nov 19 (verify); use real price data where the repo tools return it."
fi

# User-fixed position sizing (chosen from run 1). Agents may recommend
# trading LESS than this, never more.
SIZING="FIXED SIZING RULES (set by the user; you may advise trading less, never more):
- Budget \$2,000. P = final IPO price. Limit orders only; place them only after ANT's first trade prints (Fidelity usually rejects IPO orders before then).
- If ANT opens above 1.30x P: STAY IN CASH. No starter position, no exceptions.
- Day one, at most \$500 total: one \$250 DAY limit buy at 1.05x P and one \$250 DAY limit buy at 1.15x P.
- Stop: stop-limit 15% below average fill, limit 2% below the stop. Price alert at 0.90x P: if it fires, cancel any open buy orders and add nothing.
- Keep at least \$1,500 in cash through the first full trading week. After that, add at most \$500 per step, only on a named positive trigger (confirmed oversubscription, a stable first week, or softer rate-hike odds), with limits at or below 1.30x the then-current price.
- Worst case with the stop working is about \$75 on day one; a gap down through the stop can lose most of the amount deployed."

CONTEXT="Ticker ANT = Anthropic's Nasdaq IPO. Amended S-1 (Nov 10, 2026): \$70-\$78 range, 825M Class A shares. Pricing reportedly Nov 18, first trade Nov 19 (unconfirmed). Today is $TODAY; $STATUS
User: no IPO allocation; buys on the open market in the Fidelity app.
$SIZING
Rules: market and fundamentals analysts are skipped (no trading history). Never invent data; mark gaps and conflicts. Be concise. Every file you write has a '## Reasoning' section (what you used, what failed, how you weighed it) followed by the role's output. Output folder: $OUT"

run_phase() {
  local n="$1" name="$2" tools="$3" task="$4"
  [ "$n" -lt "$START" ] && return 0
  echo ">>> Phase $n: $name"
  # Prompt goes on stdin: --allowedTools is variadic and would swallow it.
  printf '%s\n\nPHASE %s - %s\n%s\n' "$CONTEXT" "$n" "$name" "$task" |
    claude -p --model "$MODEL" --output-format json \
      --allowedTools "$tools" > "$OUT/_logs/phase${n}.json"
  python3 - "$OUT/_logs/phase${n}.json" <<'PY'
import json, sys
d = json.load(open(sys.argv[1]))
u = d.get("usage", {})
print(f"    error={d.get('is_error')} cost=${d.get('total_cost_usd', 0):.2f} "
      f"in={u.get('input_tokens', 0)} cache_read={u.get('cache_read_input_tokens', 0)} "
      f"out={u.get('output_tokens', 0)}")
print("    " + str(d.get("result", ""))[:400].replace("\n", "\n    "))
if d.get("is_error"):
    sys.exit(1)
PY
}

RO="Read,Glob,Grep,Write"

run_phase 1 "Analyst team" "$RO,WebSearch,Bash(python3:*),Bash(python:*)" \
"Act as two agents in turn. Read their role prompts first:
 a) Sentiment Analyst - tradingagents/agents/analysts/sentiment_analyst.py. Get data with the repo functions fetch_stocktwits_messages (tradingagents/dataflows/stocktwits.py) and fetch_reddit_posts (tradingagents/dataflows/reddit.py) via python; keep only Anthropic-IPO content. Write $OUT/1_sentiment_analyst.md (<=600 words).
 b) News Analyst - tradingagents/agents/analysts/news_analyst.py. Use repo news/polymarket functions in tradingagents/dataflows/ where they work, plus at most 5 WebSearch calls (IPO demand, S-1 facts, lock-ups, macro backdrop for Nov 16-20). Write $OUT/1_news_analyst.md (<=700 words) with a Sources list.
Reply with a 3-line summary."

run_phase 2 "Research debate" "$RO" \
"Act as the Bull Researcher (tradingagents/agents/researchers/bull_researcher.py), write $OUT/2_bull_researcher.md (<=400 words). Then act as the Bear Researcher (tradingagents/agents/researchers/bear_researcher.py), rebutting the bull directly, write $OUT/2_bear_researcher.md (<=400 words). Inputs: $OUT/1_*.md only. No new research. Reply with a 2-line summary."

run_phase 3 "Research Manager" "$RO" \
"Act as the Research Manager (tradingagents/agents/managers/research_manager.py and its schema in tradingagents/agents/schemas.py). Inputs: $OUT/1_*.md, $OUT/2_*.md. Write $OUT/3_research_manager.md (<=400 words) with the rating and investment plan. Reply with the rating."

run_phase 4 "Trader" "$RO" \
"Act as the Trader (tradingagents/agents/trader/trader.py and its schema). Inputs: all files 1_ to 3_ in $OUT. Turn the FIXED SIZING RULES into an executable Fidelity order checklist (each order, timing, stop/alert levels, cash reserve, worst-case loss). Your proposal may say HOLD/trade less, but must not exceed those rules. Write $OUT/4_trader.md (<=400 words). Reply with the final proposal line."

run_phase 5 "Risk debate" "$RO" \
"Act as three risk debaters in turn, each reading its role prompt in tradingagents/agents/risk_mgmt/ (aggressive_debator.py, conservative_debator.py, neutral_debator.py). Each later debater responds to the earlier ones. Inputs: all files 1_ to 4_ in $OUT. Write $OUT/5_risk_aggressive.md, $OUT/5_risk_conservative.md, $OUT/5_risk_neutral.md (<=300 words each). Reply with a 3-line summary."

run_phase 6 "Portfolio Manager" "$RO" \
"Act as the Portfolio Manager (tradingagents/agents/managers/portfolio_manager.py and its schema). Inputs: all files 1_ to 5_ in $OUT. Give the five-tier rating and ONE final executable plan in terms of P (conditions, each order, stops/alerts, cash reserve, worst-case loss, what to re-check on the day-3 rerun). The plan must stay within the FIXED SIZING RULES; if the risk debaters argued for more, note it but do not adopt it. Write $OUT/6_portfolio_manager.md (<=450 words). Reply with the rating and a 4-line plan summary."

echo ">>> Done. Reports in $OUT"
