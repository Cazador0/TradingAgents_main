# ANT Trader (2026-11-12, run 2)

## Reasoning
Inputs: `1_news_analyst.md`, `1_sentiment_analyst.md`, `2_bull_researcher.md`, `2_bear_researcher.md`, `3_research_manager.md` only — no new data pulled. The Research Manager's Hold rating reflects a genuinely balanced bull/bear debate with no verified edge either direction; it explicitly does not override the user's pre-set mechanical rule (limit-only entry at ≤1.3x final IPO price P, $2,000 cap, stay-in-cash if the open prints above that). What failed/unresolved and carried into sizing: no oversubscription multiple, conflicting S-1/A amendment dates, unconfirmed Nvidia-CEO headline, no FRED macro read, Reddit 403. None of these resolve the direction of the open, so I did not invent a price target or add a discretionary stop beyond what the user's rule already specifies. I weighted "mechanical rule execution" above "conviction trade," since the Manager found no data strong enough to justify deviating from it in either direction.

## Report
**Action: Hold** (no directional edge) — **execute the user's standing contingent order; do not chase.**

**Order:** Limit **BUY**, GTC, limit price = **1.30 × P** (round down to nearest cent). Quantity = floor($2,000 / (1.30×P)). At range extremes: P=$70 → limit $91.00, ~21 sh (~$1,911); P=$78 → limit $101.40, ~19 sh (~$1,927). Recompute exact quantity once P is confirmed at pricing (expected ~Nov 18).

**Timing:** Fidelity will not accept an order in ANT until *after* the first trade prints (expected open ~Nov 19). Have the GTC limit order staged/ready to submit the instant the symbol is tradable — do not pre-submit against an unconfirmed P. If the first print is already above 1.30×P when the symbol opens for orders, **do not place the order — stay in cash**, per the rule.

**If filled:** No hard stop-loss on a brand-new, highly illiquid listing (a tight stop risks a forced exit on a normal first-day air pocket). Instead, set a **soft alert at -15% from fill price** to prompt a manual re-review, not an automatic sell. Re-run market/fundamentals analysis once real post-listing price/volume data exists.

**If unfilled:** Let the GTC order stand through the first 3-5 trading sessions, then cancel and reassess — this is a disciplined entry attempt, not a must-fill conviction trade.

**Worst case:** Capped at capital deployed (~$1,900-$1,930, never more than $2,000); a zero-bound loss is the tail case, not the base case. No leverage, no margin.

FINAL TRANSACTION PROPOSAL: **HOLD**
