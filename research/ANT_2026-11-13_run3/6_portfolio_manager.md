# ANT (Anthropic) — Portfolio Manager

## Reasoning

**Used:** `3_research_manager.md`, `4_trader.md`, `5_risk_aggressive.md`, `5_risk_conservative.md`, `5_risk_neutral.md` (plus `1_`/`2_` reports via the chain above) — all from this run. No new data pulled.

**Weighed:** The Research Manager's call — Overweight, constructive-but-not-strong, standard starter only — is the anchor; nothing in the risk debate challenges its evidence, only its sizing stance. Aggressive argued for deploying the full day-one $500 with no held-back powder, framing hesitation as the real risk. Conservative argued for leaning toward the floor of the cap, treating 6x-oversubscribed as an unverified echo and macro (hot inflation print, 10Y spike, 1% Dec-cut odds) as confirmed headwind, not priced in. Neutral correctly notes both sides are arguing to move a lever the user's FIXED SIZING RULES already fixed: the trader's two $250 DAY limits at 1.05x/1.15x P *is* the full day-one allocation the rules permit — so aggressive's "use it all" changes nothing in practice, and conservative's "shrink it" would under-deploy relative to a mandate that is explicitly capped, not optional, at $500. Per the user's instruction, the aggressive push for more size is noted, not adopted. Genuine, multi-channel-corroborated demand plus hostile-but-already-reflected macro and unresolved lock-up/pricing-date gaps nets to the same conclusion the chain reached at every layer: proceed exactly as sized.

## Five-Tier Rating: **Overweight**

(Favorable outlook — real, multi-source demand signal — but not Buy-grade given confirmed macro headwinds and unresolved lock-up/pricing-date gaps.)

## Final Executable Plan (in terms of P = final IPO price, confirm after first print)

1. **Gate (mandatory):** First trade prints → if open > 1.30×P, **STAY IN CASH**, no orders, stop here.
2. **If open ≤ 1.30×P**, enter two DAY limit buys immediately: Order A BUY ANT LIMIT 1.05×P, ≈$250; Order B BUY ANT LIMIT 1.15×P, ≈$250 (round shares down). Total deployed ≤$500.
3. **Price alert** at 0.90×P — if it fires, cancel any unfilled Orders A/B, add nothing.
4. **Stop-limit** on fill(s): STOP = avg fill × 0.85, LIMIT = stop × 0.98, entered GTC once a fill confirms.
5. **Cash reserve:** ≥$1,500 held through the first full trading week, no step-ups this week regardless of price action or debate pressure to front-load.
6. **Week 2+:** at most $500 per step, only on a named positive trigger (confirmed oversubscription vs. primary filing, stable first week, softer rate-hike odds), limits ≤1.30× then-current price.
7. **Worst case:** stop working ≈ -$75 day one; gap-through-stop ≈ loss of most of the $500 deployed.

**Day-3 rerun — re-check:** (a) confirmed pricing/first-trade date (Nov 18/19 vs. "Thu/Fri" — still unconfirmed); (b) lock-up carve-out terms against primary S-1/A (10%-day-one / ~29%-at-180-days figures unverified); (c) whether any named positive trigger has actually fired (oversubscription confirmed against primary source, first-week stability, rate-cut-odds shift) before considering any step-up; (d) FRED/macro and retail-sales-date gaps, if now resolvable.
