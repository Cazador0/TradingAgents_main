# ANT News Analyst — 2026-11-12 (pre-trading, run 2)

## Reasoning
Repo tools worked this run (unlike the prior run, where yfinance was unavailable): `get_news('ANT', 2026-11-05, 2026-11-12)` and `get_global_news('2026-11-12', 7, 10)` both returned real Yahoo/Investing.com headlines. `get_macro_indicators` failed for all four indicators tried (fed_funds_rate, 10y_treasury, cpi, yield_curve) — `FRED_API_KEY` is not set; this is an explicit `DATA_UNAVAILABLE`, not a fabricated value. `get_prediction_markets('Anthropic IPO', 15)` worked (Polymarket, keyless). Used all 5 allotted WebSearch calls (standard mode) on: lock-up terms, the Jensen Huang/Nvidia headline that appeared in the repo news feed, the oversubscription claim, October CPI / December Fed odds, and pricing-date confirmation. All search summaries are secondary sourcing, not primary filings or exchange data — flagged below.

## Report
**Deal facts.** S-1 filed Oct 26; an S-1/A amendment set the range at $70-$78 on 825M Class A shares (consistent with the task brief). Sources disagree on amendment dates (one cites Nov 2, another Nov 10) — unresolved, check EDGAR (CIK 2130357) directly. Goldman Sachs and Morgan Stanley lead; ~22 underwriters reported previously, not re-verified this run.

**Lock-up terms (new this run — resolves a prior gap, partially).** Reports describe a staggered structure, not a flat 180 days: non-founder directors/officers/certain employees and consultants may sell up to 10% of locked-up shares on day one; roughly 29% of locked-up shares across holders may become eligible around the 180-day mark; the seven co-founders face a longer lock-up, with remaining founder shares reportedly saleable after ~1 year. A separate S-1/A reportedly grants holders of up to 8.5B shares demand registration rights, subject to lock-ups where applicable. Class N shares from the concurrent private-placement (compute-supplier) tranche are **not** subject to lock-up — consistent with the prior run's flag that this demand is supplier-linked, not public-market demand. All of this is secondary-source summary of the filing, not a direct EDGAR read; treat specifics as provisional.

**Demand signals.** CNBC (Nov 10, unnamed sources): book "already covered" at the $70-$78 range on an allocable basis. A Bloomberg headline (relayed secondhand) says orders "exceed available shares," and the repo's own `get_news` pull independently surfaced an Investing.com/Bloomberg item with the same claim — two independent paths converging on the same fact, which raises confidence it's real reporting, not a single echoed source. No oversubscription **multiple** (e.g., "covered 3x") was found anywhere; do not infer one.

**Financials.** `get_news` corroborates the prior run's H1 2026 figures: revenue ~$16.3B (vs. ~$1.16B a year earlier). Valuation ambition has visibly declined over the roadshow: Bloomberg reporting (via secondary pickup) shows discussion moving from an earlier ~$1.5T-$2T target down to ~$1.3T, which lines up with the amended $70-$78 range implying roughly $1.3-$1.4T — i.e., the current range looks like the result of real investor pushback after the early-November tech selloff, not an arbitrary reset.

**Macro backdrop — conflict to flag explicitly.** The repo's `get_global_news` pull returned a Yahoo Finance headline today (Nov 12) reading "S&P 500, Nasdaq fall as Nvidia CEO exit, rising bond yields roil markets." A targeted WebSearch found **no confirmation of a Huang resignation**: Nvidia's board opened an investigation on Nov 8 after Huang admitted to an extramarital affair, a separate thread alleges a foreign-intelligence angle (China disputes it), and a company spokesperson is quoted saying Huang remains CEO without interruption. One low-reliability source cites a Polymarket "Huang resigns by Dec 31" contract that spiked above 75% before settling near 17%. **Net: treat "Nvidia CEO exit" as unconfirmed** — the Yahoo headline may be using "exit" loosely (e.g., referring to stock/investor exits, or overstating the investigation) rather than reporting an actual resignation. Either way, Nvidia-linked volatility is a live headwind for AI-sector sentiment into ANT's pricing week, via the circular-financing/compute-supplier angle (Nvidia is adjacent to several of ANT's compute partners).
- October CPI (released Nov 10, no YoY figure due to the 2025 shutdown data gap): headline +0.4% m/m, core +0.3% m/m, both above expectations. December FOMC (Dec 8-9) odds per CME FedWatch-style sourcing: ~85% on a 25bp **hike**, with some wagering on 50bp — up from ~77-80% in the prior run's read. This is a tightening, risk-off macro backdrop for a record-size IPO pricing the following week.
- 10-year/2-year Treasury levels and a direct FRED read: **not retrieved** (`FRED_API_KEY` unset) — same gap as the prior run.

**Polymarket (live, keyless).** IPO-by-Nov-30: 99% (+26.2pp/week); IPO-by-Nov-15: 0% (consistent with pricing being next week, not this week). IPO-day market-cap brackets, 1-week shift: <$1.25T 18% (+5.6pp), $1.25-1.5T 36% (+20.4pp), $1.5-1.75T 27% (+3.3pp), $1.75-2.0T 11% (-11.5pp), $2.0-2.25T 5% (-10.9pp), $2.25T+ ~2%. The clear migration of probability mass into the $1.25-1.75T band (from the $1.75T+ brackets) mirrors the valuation-reset narrative above — the market is pricing a debut near or modestly above the top of the $70-$78 range, not a blowout pop into $2T.

**Gaps/conflicts carried or newly flagged:** S-1/A amendment date (Nov 2 vs Nov 10); oversubscription multiple; Nvidia "CEO exit" headline vs. no-resignation reporting; FRED macro series unavailable; exact lock-up percentages are secondary-source paraphrase, not a primary-filing read.

| Item | Finding | Confidence |
|---|---|---|
| Range / size | $70-$78, 825M shares | High (matches task brief + corroborated) |
| Timing | Price Nov 18, trade Nov 19 | Medium (multiple outlets, still "reported plans") |
| Demand | Book covered; orders exceed shares | Medium (2 independent pickups, no multiple given) |
| Lock-up structure | Staggered: 10% day-1 (non-founders), ~29% at 180d, founders ~1yr; Class N exempt | Medium (secondary paraphrase of filing) |
| H1 revenue | ~$16.3B | Medium-high |
| Valuation trajectory | Fell from ~$1.5-2T target to ~$1.3-1.4T | Medium-high |
| Nvidia "CEO exit" | Unconfirmed / likely overstated; investigation ongoing, no resignation | Low-medium — flagged conflict |
| Oct CPI | +0.4% m/m headline, +0.3% core, hot | Medium-high |
| Dec Fed hike odds | ~85% | Medium |
| Polymarket IPO-day cap | $1.25-1.75T now most likely combined (~63%) | Medium (thin-ish volume, directionally consistent) |
| FRED macro series | Not retrieved (no API key) | N/A |

## Sources
- `get_news('ANT', ...)` and `get_global_news(...)` via `tradingagents.agents.utils.news_data_tools` (Yahoo Finance / Investing.com items, queried 2026-11-12)
- `get_prediction_markets('Anthropic IPO', 15)` via `tradingagents.agents.utils.prediction_markets_tools` (Polymarket, queried 2026-11-12)
- [Anthropic IPO Explained: 5 Steps From S-1 to 180-Day Lockup (FourWeekMBA)](https://fourweekmba.com/ai-anthropic-ipo-explained-5-steps-from-s-1-to-180-day-lockup/)
- [Anthropic's lock-up can last a year for some shareholders (Augment)](https://augment.market/pulse/anthropics-lock-up-can-last-a-year-for-some-shareholders)
- [Holders of 65% of Anthropic Can Demand Registered Resales (FourWeekMBA)](https://fourweekmba.com/ai-holders-of-65-of-anthropic-can-demand-registered-resales/)
- [Anthropic's $64B IPO Book Said to Be Covered on Day One (FourWeekMBA)](https://fourweekmba.com/ai-anthropics-64b-ipo-book-said-to-be-covered-on-day-one/)
- [Nvidia board opens investigation into CEO Jensen Huang after affair admission (KeenGamer)](https://www.keengamer.com/articles/news/nvidia-board-opens-investigation-into-ceo-jensen-huang-after-affair-admission/)
- [Nvidia power built around Jensen Huang; scandal testing formula (Fortune)](https://fortune.com/2026/11/09/nvidia-power-built-around-jensen-huang-scandal-testing-formula/)
- [CPI comes in hot, raising odds of a bigger-than-expected December rate hike (InvestmentNews)](https://www.investmentnews.com/equities/october-cpi-comes-in-hot-raising-odds-of-a-bigger-than-expected-rate-hike/268961)
- [US CPI preview: 43-day shutdown leaves no official annual rate (InvestingLive)](https://investinglive.com/news/us-cpi-preview-43-day-shutdown-leaves-no-official-annual-rate-as-monthly-pace-seen-easing/)
- [WSJ: Anthropic targets Nasdaq debut next week under ticker ANT despite tech selloff (InvestingLive)](https://investinglive.com/stock-market-update/wsj-anthropic-targets-nasdaq-debut-next-week-under-ticker-ant-despite-tech-selloff/)
- [IPOX IPO Calendar — Anthropic](https://www.ipox.com/ipo-calendar/anthropic)
