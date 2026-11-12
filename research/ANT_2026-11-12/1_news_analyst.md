# ANT News Analyst - 2026-11-12 (pre-trading)

## Reasoning
yfinance is not installed, so get_news/get_global_news returned nothing (and ANT has no ticker history yet). Polymarket (keyless repo module) worked. FRED tool not tried. Used 3 web searches (standard). Most sources are secondary press, not EDGAR; figures are flagged accordingly. Search results gave no coverage of the Nov 16-20 week, and one snippet's "Friday close" date is ambiguous relative to today (Nov 12), so market-level data may be stale.

## Report
**Deal facts (reported)**
- Amended S-1 range $70-$78; 825M Class A shares; up to ~$64.4B raised; greenshoe 123.75M shares. Implied valuation ~$1.3T-$1.4T (sources differ, likely whether options/equity-plan shares are counted).
- An earlier term sheet ($70-$80, $69.3B max) was circulated to banks and withdrawn after a pricing error, then replaced by the $70-$78 amendment. Small execution-quality flag.
- Timing: price Nov 18, trade Nov 19 (Nasdaq, ANT). Unconfirmed by company; sourced to CNBC via Decrypt. Retail allocation target ~20%.
- Lead banks: Goldman Sachs, Morgan Stanley (stabilization agent); J.P. Morgan reported as lead in one source; ~22 underwriters total.
- Concurrent private placement: seven compute suppliers buy $26B of non-voting Class N stock at the IPO price, not subject to the usual lock-up. This is supplier-linked, circular-financing-style demand; it should not be read as organic public demand. Standard lock-up terms for other holders: NOT FOUND.

**Demand signals**
- CNBC (secondhand, anonymous sources): the book is already covered at the proposed range. No company confirmation, no multiple-times-oversubscribed figure found.
- Polymarket: IPO by Nov 30 at 98% (+33.8pp in a week); by Dec 31 at 99%. IPO-day market cap markets: <$1.25T 18%, $1.75-2.0T 11%, $2.0-2.25T 5%. The bracket moves (-11pp on the upper brackets, +5.6pp on the lower) show traders lowering first-day expectations after the range reset. The remaining brackets were not shown, so the full distribution is a GAP; thin volume (~$1M per market).

**Financials (S-1 filed Oct 26, covers six months to Jun 30, 2026)**
- H1 2026 revenue about $16.3B versus $1.16B a year earlier. Q2 growth of ~1,368% year over year is reported, and the company warned growth may slow.
- Net loss about $80.7B. BusinessDay says it is largely from higher fair value of convertible bonds. One low-quality blog claims $72.0B (89%) is non-cash fair-value revaluation. This is NOT verified against EDGAR. Operating loss for 2025 was about $8B versus a ~$42B 2025 net loss. Do not conflate the two (operating loss versus net loss). The non-cash share of the loss is probable but unconfirmed.
- Reported spending commitments of ~$518B (cryptobriefing; low-quality source, unverified).

**Comparable first-day performance:** NOT RETRIEVED (no search budget used on this). Do not assume a pop. At ~$1.3T+ and $64B raised this is the largest IPO ever by a wide margin, so there are no true comparables; a smaller-float scale argument does not apply.

**Macro backdrop (secondary sources, some date ambiguity)**
- Fed held at 3.75-4.00% on Oct 28 (10-2 vote). Markets price roughly a 77-80% chance of a December HIKE; Polymarket puts "no Fed cuts in 2026" at 99%.
- 10-year yield 4.84% (Fed release, per a search summary); 2-year 4.51%.
- Early-November tech selloff; S&P 500 had its worst week since April 2025 (-2.7%, close 7,376.86); the Nasdaq fell 2.86% the prior week. Oct CPI was due Nov 10; the result was not retrieved (GAP).
- Implication: a rising-rate, risk-off tape is a headwind for a long-duration, record-size IPO. The retail allocation and strong book offset this.

**Gaps/conflicts:** valuation $1.3T vs $1.4T; lead-bank list; fair-value split; lock-up terms; oversubscription multiple; Oct CPI; FRED data; any Nov 16-20 week-ahead coverage.

| Item | Finding | Confidence |
|---|---|---|
| Range / size | $70-$78, 825M shares, ~$64.4B | High |
| Timing | Price Nov 18, trade Nov 19 | Medium (press, unconfirmed) |
| Demand | Book covered (CNBC, anonymous) | Medium-low |
| Supplier placement | $26B Class N, no lock-up | Medium |
| H1 revenue | ~$16.3B | Medium-high |
| H1 net loss | ~$80.7B, mostly fair-value | Medium (split unverified) |
| Fed | Hold 3.75-4.00%, Dec hike ~77-80% | Medium |
| 10y yield | 4.84% | Medium |
| Polymarket IPO-day cap | <$1.25T 18% | Low-medium (thin) |

## Sources
- [Anthropic targets $64.4B in IPO (StockAnalysis)](https://stockanalysis.com/news/anthropic-ipo-targets-64-billion/)
- [Anthropic sets IPO price range (Decrypt)](https://decrypt.co/382939/anthropic-sets-ipo-price-range-at-70-to-78-valuing-company-at-up-to-1-4-trillion)
- [Anthropic seeks $70 to $78 a share (ABC11)](https://abc11.com/story/anthropic-seeks-70-78-share-new-ipo-filing-values-13-trillion/20029820/)
- [Anthropic files for Nasdaq IPO (PPC Land)](https://ppc.land/anthropic-files-for-nasdaq-ipo-with-16-3bn-in-first-half-revenue/)
- [BusinessDay, Oct 26 2026](https://www.businessday.co.za/world/international-companies/2026-10-26-anthropic-files-for-ipo-as-ai-race-heats-up/)
- [Syntax and Signal S-1 summary (low quality)](https://syntaxandsignal.tech/blog/anthropic-files-form-s1-nasdaq-ipo-ticker-ant-2026/)
- [Crypto Briefing, S-1 loss/spending (low quality)](https://cryptobriefing.com/anthropic-ipo-42b-loss-spending-plans/)
- [SiliconANGLE leaked S-1](https://siliconangle.com/2026/09/29/leaked-anthropic-ipo-filing-reveals-8b-operating-loss-rapid-revenue-growth/)
- [Week ahead Nov 9, 2026](https://www.regardsofwallstreet.com/news/stock-market-week-ahead-november-9-2026)
- [Wall St Week Ahead: tech swoon (Khaleej Times)](https://www.khaleejtimes.com/wall-st-week-ahead-as-tech-swoon-roils-market-us-inflation-data-on-tap-3)
- Polymarket via tradingagents/dataflows/polymarket.py (queried 2026-11-12)
