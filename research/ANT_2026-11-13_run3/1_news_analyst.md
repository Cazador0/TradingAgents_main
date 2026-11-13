# ANT (Anthropic) — News Analyst Report
2026-11-06 to 2026-11-13, forward look to Nov 16–20

## Reasoning

**Used:** `get_news("ANT", "2026-11-06", "2026-11-13")` (yfinance vendor, configured default — worked) for ticker-specific headlines; `get_global_news` (yfinance) for macro/market tape, which this cycle returned mostly non-relevant content (GTA VI pre-order coverage, Take-Two earnings) — included only the two genuinely macro-relevant items (10Y yield spike on hot inflation read; Nvidia CEO-exit headline risk) and discarded the rest as noise. `get_prediction_markets("Anthropic IPO")` and `get_prediction_markets("Fed rate cut December")` (Polymarket, no key required — worked, live data). 5 WebSearch calls used (lock-up/share structure, pricing/first-trade date, Nov 16–20 economic calendar, underwriters, price-range/valuation mechanics).

**Failed:** `get_macro_indicators` — FRED vendor configured but **`FRED_API_KEY` is not set**; the tool returned a clean `DATA_UNAVAILABLE`, no values were fabricated. This is a real gap: no FRED-sourced rate/inflation series could be pulled directly. Macro context below leans on WebSearch secondary reporting and Polymarket's rate-cut market instead, which is weaker than a direct FRED pull.

**Conflicts found and how weighted:** Reporting on lock-up terms, final share count, and fully-diluted valuation conflicts across outlets (see below) — each conflict is flagged rather than resolved, since none of the search results are the primary S-1/A text itself. Where Yahoo/yfinance news (closer to primary wire reporting) and independent secondary blogs disagreed, yfinance-sourced wire content was weighted higher.

## Report

**Deal terms (amended S-1, filed Nov 10, 2026):** 825M total shares offered — ~801.4M from Anthropic, ~23.6M from selling stockholders — at $70–$78/share, which could raise up to ~$64.4B. This range is itself a *correction*: an earlier $70–$80 draft was circulated to banks and then withdrawn after a pricing error was identified. Headline valuation varies sharply by method: ~$1.02T at the top of the range on ~13.07B shares outstanding post-IPO, rising to ~$1.24T–$1.4T fully diluted (employee options/RSUs included) — treat any single "$X trillion" headline as method-dependent, not a settled number.

**Structure:** Public benefit corporation; a Long-Term Benefit Trust elects a board majority; a single Class F share held by an entity owned by the 7 co-founders carries 50.1% of voting power — founder control is structurally locked in regardless of share price. Separately, 7 compute/cloud partners have committed a combined $26B to non-voting Class N stock at the IPO price (a related-party, non-market demand component worth distinguishing from open-market retail/institutional demand).

**Demand:** Multiple wire reports (via yfinance) cite the order book at roughly **6x oversubscribed**, and CNBC reportedly said the book is "covered" at the proposed range — consistent, repeated signal of strong institutional demand, not a single unconfirmed report.

**Geopolitical:** Investors from mainland China and Hong Kong are reportedly excluded from the offering — framed in coverage as a US-China tech-tension signal, not a demand problem.

**Lock-up — unresolved conflict, flag for the trading desk:** Sources agree on a baseline 180-day lock-up from the prospectus date (not yet fixed, since pricing isn't final), but diverge on exceptions: some reporting says non-founder officers/employees/consultants may sell up to 10% of locked shares on day one of trading, with up to 29% of locked shares across that group becoming eligible around the 180-day mark; the 7 co-founders reportedly face a longer lock-up, with remaining founder shares freeing up around the one-year mark. Class N shares (the $26B compute-partner placement) are reportedly **not** subject to the standard lock-up. None of this is confirmed against the primary S-1/A text in this pass — worth verifying before assuming low early supply overhang.

**Underwriters:** Morgan Stanley and Goldman Sachs are named as leads across every source found (Morgan Stanley reportedly "lead left," Goldman likely stabilization agent); JPMorgan is in the syndicate; total syndicate size reported around 22 banks.

**Timing:** CNBC and Bloomberg (via secondary reporting) both point to pricing the evening of **Nov 18** and first trade on Nasdaq as **ANT** on **Nov 19** — consistent with the user's stated plan, but this is reported by "people familiar with the deal," not an Anthropic press release; one WSJ-sourced report hedges to "Thursday or Friday" (Nov 19 or 20). **Not company-confirmed.**

**Prediction markets (Polymarket, live):** "Will Anthropic IPO by Nov 30, 2026?" — 98% Yes. On IPO-day market cap: <$1.25T = 22%, $1.5T–$1.75T = 24%, $1.75T–$2T = 11%, >$2T = 2% (a $1.25T–$1.75T band is where the crowd's mass sits — i.e., Polymarket is pricing the *low-to-mid* part of the plausible range, not a blowout). Separately, "Fed rate cut by Dec 2026 meeting" is priced at just **1% Yes** — no near-term rate-cut tailwind for risk assets into the listing window.

**Macro backdrop, Nov 16–20:** A hot inflation read already pushed the 10-year Treasury yield up and Nvidia stock down in the past week (yfinance). Nvidia earnings reportedly land Tuesday after the close in this window (per cross-referenced social chatter, not independently confirmed via get_news). Retail sales (October, Census Bureau) is reported for Tue Nov 17 by one calendar source, but a second source gives Nov 25 — **conflicting, unresolved**; FOMC minutes are named as a headline event for the week with no confirmed date found. Net: a data-dense, rate-sensitive week with no FRED-sourced confirmation available (see gap above) and no rate-cut tailwind priced in.

| Theme | Status | Source type |
|---|---|---|
| Price range | $70–$78/share, 825M shares, up to $64.4B raise | Wire (yfinance) + WebSearch, consistent |
| Valuation | $1.02T–$1.4T, method-dependent | Conflicting, flagged |
| Demand | ~6x oversubscribed, book "covered" | Wire, consistent |
| China/HK exclusion | Confirmed by multiple outlets | Wire, consistent |
| Lock-up terms | 180-day baseline + complex carve-outs | Conflicting, unresolved vs. primary S-1/A |
| Underwriters | Morgan Stanley + Goldman Sachs lead, ~22-bank syndicate | WebSearch, consistent |
| Pricing/first trade | Nov 18 price / Nov 19 trade (reported, not confirmed) | WebSearch, reported-not-official |
| Fed rate cut (Dec) | 1% Yes | Polymarket, live |
| FRED macro data | Unavailable (no API key) | **Gap — flagged** |
| Retail sales date (Nov 17 vs. 25) | Conflicting | **Gap — flagged** |

## Sources
- [Anthropic IPO Explained: 5 Steps From S-1 to 180-Day Lockup](https://fourweekmba.com/ai-anthropic-ipo-explained-5-steps-from-s-1-to-180-day-lockup/)
- [Holders of 65% of Anthropic Can Demand Registered Resales](https://fourweekmba.com/ai-holders-of-65-of-anthropic-can-demand-registered-resales/)
- [Anthropic's lock-up can last a year for some shareholders](https://augment.market/pulse/anthropics-lock-up-can-last-a-year-for-some-shareholders)
- [WSJ: Anthropic targets Nasdaq debut next week under ticker ANT despite tech selloff](https://investinglive.com/stock-market-update/wsj-anthropic-targets-nasdaq-debut-next-week-under-ticker-ant-despite-tech-selloff/)
- [Renaissance Capital: Anthropic sets terms for $61 billion IPO targeting a $1.2 trillion market cap](https://www.renaissancecapital.com/IPO-Center/News/122657/anthropic-sets-terms-for-61-billion-ipo-targeting-a-1.2-trillion-market-cap)
- [Anthropic picks Morgan Stanley and Goldman Sachs to lead its IPO](https://www.shopifreaks.com/anthropic-picks-morgan-stanley-and-goldman-sachs-to-lead-its-ipo-racing-openai-to-be-the-first-ai-lab-to-go-public/)
- [Anthropic taps Morgan Stanley, Goldman Sachs for IPO lead (Bloomberg via Cryptobriefing)](https://cryptobriefing.com/anthropic-taps-morgan-stanley-goldman-sachs-for-ipo-lead-bloomberg/)
- [Anthropic seeks $70 to $78 a share in new IPO filing (ABC News)](https://abc13.com/story/anthropic-seeks-70-78-share-new-ipo-filing-values-13-trillion/20029820/)
- [Anthropic IPO Draft: Up to $64.4B on 825M Shares at $70-$78 (FourWeekMBA)](https://fourweekmba.com/ai-anthropic-ipo-draft-up-to-64-4b-on-825m-shares-at-70-78/)
- [Anthropic sets IPO price range at $70 to $78, valuing company at up to $1.4 trillion (Decrypt)](https://decrypt.co/382939/anthropic-sets-ipo-price-range-at-70-to-78-valuing-company-at-up-to-1-4-trillion)
- [What to Expect in Markets This Week: Jobs Report, Inflation Data, Earnings (Yahoo Finance)](https://finance.yahoo.com/news/expect-markets-week-jobs-report-100000936.html)
- [Monthly release schedule — November 2026 (fedratecalc.com)](https://fedratecalc.com/us-economic-calendar/november-2026/)
- Polymarket Gamma API (live query, no article URL): "Anthropic IPO" and "Fed rate cut December" topic searches, queried 2026-11-13
- yfinance news vendor (`get_news`/`get_global_news`, in-repo), queried 2026-11-13 for 2026-11-06 to 2026-11-13
