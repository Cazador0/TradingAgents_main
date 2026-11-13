# ANT (Anthropic) — Trader

## Reasoning

**Used:** `1_news_analyst.md`, `1_sentiment_analyst.md`, `2_bull_researcher.md`, `2_bear_researcher.md`, `3_research_manager.md` (all from this run).

**Weighed:** The Research Manager's "Overweight, standard starter only" plan is adopted as-is — my mandate is to convert it into executable Fidelity orders, not to re-litigate it, and it does not ask the trader to exceed the FIXED SIZING RULES. Those rules are mechanical and binding (budget $2,000, day-one cap $500, stop/alert formulas, cash floor), so this proposal sizes at or below them, never above. No new data pulled; no price **P** exists yet since ANT hasn't traded — every $ level below is a formula in **P**, not a number, until first print.

**Gaps carried forward (unresolved):** exact pricing date (Nov 18/19 reported, unconfirmed), lock-up carve-out terms, and whether Fidelity accepts the DAY limit orders pre-market on first-trade day or only once trading is live — confirm order-entry timing in-app before market open.

## Order Checklist (place only after ANT's first trade prints)

1. **Gate check:** Note ANT's first-trade price. If open > 1.30×P → **STAY IN CASH.** No orders. Stop here.
2. If open ≤ 1.30×P, enter two DAY limit buys immediately:
   - Order A: BUY 1 ANT, LIMIT = 1.05×P, DAY, qty sized to ≈$250 (round shares down).
   - Order B: BUY 1 ANT, LIMIT = 1.15×P, DAY, qty sized to ≈$250 (round shares down).
   - Total day-one risk capital: ≤$500. Cash remaining after both fills: ≥$1,500.
3. **Price alert:** Set alert at 0.90×P. If triggered, cancel any unfilled Orders A/B immediately and add nothing — do not average down.
4. **Stop-limit (per fill, or combined avg fill if both fill):** STOP price = avg fill × 0.85 (15% below); LIMIT = stop price × 0.98 (2% below stop). Enter as GTC stop-limit once a fill confirms.
5. **Cash discipline:** Hold ≥$1,500 cash through the first full trading week regardless of price action. No step-ups this week even on a positive trigger.
6. **Week 2+:** Add at most $500 per step, only on a named positive trigger (confirmed oversubscription, stable first week, softer rate-hike odds), limit orders ≤1.30× then-current price.

**Worst case, day one:** stop working as designed ≈ -$75. Gap-through-stop scenario: up to most of the $500 deployed.

**Action:** Buy (standard starter, rules-capped; no size increase).

---

**Position Sizing**: ≤$500 day one (two $250 DAY limits at 1.05×P / 1.15×P), ≥$1,500 cash reserved, step-ups capped at $500 and 1.30×current price thereafter.

FINAL TRANSACTION PROPOSAL: **BUY**
