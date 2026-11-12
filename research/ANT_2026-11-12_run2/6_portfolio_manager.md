# ANT Portfolio Manager (2026-11-12, run 2)

## Reasoning
Inputs: `1_news_analyst.md`, `1_sentiment_analyst.md`, `2_bull_researcher.md`, `2_bear_researcher.md`, `3_research_manager.md`, `4_trader.md`, `5_risk_aggressive.md`, `5_risk_conservative.md`, `5_risk_neutral.md` — no new data pulled, per the role's scope (synthesize the risk debate, don't re-research). The Research Manager called a genuine Hold (no verified oversubscription multiple, a range cut sourced to real investor pushback rather than scarcity, Polymarket mass moving *out of* the >$1.75T brackets, softening-but-still-positive sentiment, risk-off macro). The risk debate then tested whether to flex the trader's 1.30×P ceiling: Aggressive argued for 1.35-1.40×P on scarcity grounds; Conservative and Neutral both rejected this — Neutral correctly notes nobody proposed tightening the ceiling either, and that "it's only ~$150" is a sizing-on-vibes tell, not a risk argument, against a dataset every single analyst called low-confidence. I weigh Neutral's synthesis as decisive: it's the only risk-debate entry that doesn't ask to move the user's pre-set rule in either direction, and no file in this chain presents verified evidence (a demand multiple, a confirmed macro resolution, a primary-filing lock-up read) strong enough to override a mechanical plan the user set in advance. What failed/unresolved and is simply carried forward, not resolved: oversubscription multiple, S-1/A amendment date conflict, Nvidia-CEO headline, FRED macro series, Reddit access. None of these move the direction of the open, so no discretionary deviation is justified.

## Report
**Rating: Hold** — maintain the pre-set contingent entry exactly as specified; no edge found to flex the ceiling up or down.

**Plan (all prices in terms of final IPO price P, confirmed at pricing ~Nov 18):**
- **Order**: One limit **BUY**, GTC, Fidelity, limit price = **1.30 × P** (round down to the cent). Quantity = floor($2,000 / (1.30×P)). Illustrative at range extremes: P=$70 → $91.00 limit, ~21 sh (~$1,911); P=$78 → $101.40 limit, ~19 sh (~$1,927).
- **Condition to submit**: Only after ANT's first trade prints (~Nov 19) and the symbol is order-able. If the first print is already above 1.30×P, **do not submit — stay fully in cash.** No chasing, no partial fills above the ceiling.
- **Cash reserve**: Full $2,000 held until/unless filled; no leverage, no margin.
- **Stops/alerts**: No hard stop (illiquid new listing risk). Soft manual-review alert at **-15% from fill price**, not an auto-sell.
- **If unfilled**: Let the GTC order stand 3-5 sessions, then cancel and reassess.
- **Worst case**: Loss capped at capital deployed (≤~$1,930); zero-bound is the tail, not the base case.
- **Day-3 rerun checklist**: re-enable market/fundamentals analysts once real price/volume history exists; verify actual fill vs. P and ceiling; check if an oversubscription multiple or confirmed lock-up percentages have since surfaced; confirm Nvidia-CEO status and whether Dec-hike odds moved; re-check Polymarket cap-bracket drift.

FINAL TRANSACTION PROPOSAL: **HOLD**
