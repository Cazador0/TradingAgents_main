"""Low-cost TradingAgents run for the ANT (Anthropic) IPO on Claude Sonnet 5.

Usage (needs ANTHROPIC_API_KEY in the environment):
    python scripts/run_ant_ipo.py            # trade date = today
    python scripts/run_ant_ipo.py 2026-11-19 # explicit trade date

Budget choices:
- Only the News and Sentiment analysts: before or right after listing, ANT has
  no price history or Yahoo fundamentals, so the market/fundamentals analysts
  would spend tokens to report "no data".
- One bull/bear round and one risk round.
- Medium effort and a smaller news window to keep prompts short.

Every agent's output (each analyst report, the bull/bear debate, research
manager, trader, each risk debater and the portfolio manager) is written as
markdown under the reports folder printed at the end.
"""
import sys
from datetime import date

from tradingagents.default_config import DEFAULT_CONFIG
from tradingagents.graph.trading_graph import TradingAgentsGraph

trade_date = sys.argv[1] if len(sys.argv) > 1 else date.today().isoformat()

config = DEFAULT_CONFIG.copy()
config.update(
    llm_provider="anthropic",
    deep_think_llm="claude-sonnet-5",
    quick_think_llm="claude-sonnet-5",
    anthropic_effort="medium",
    max_debate_rounds=1,
    max_risk_discuss_rounds=1,
    news_article_limit=10,
    global_news_article_limit=5,
    llm_max_retries=4,
)

graph = TradingAgentsGraph(selected_analysts=("social", "news"), config=config)
final_state, decision = graph.propagate("ANT", trade_date)
path = graph.save_reports(final_state, "ANT")

print(f"\nFinal rating: {decision}")
print(f"Per-agent reports: {path}")
