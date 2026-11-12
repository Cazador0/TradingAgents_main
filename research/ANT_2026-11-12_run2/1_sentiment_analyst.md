# ANT Sentiment Analyst (2026-11-12, run 2)

## Reasoning
- Role prompt (`sentiment_analyst.py`) read: output = overall_band, overall_score (0-10), confidence, narrative with source breakdown + table. Task scope for this run limits data collection to the two named repo fetchers only (StockTwits + Reddit); the news-block pull the live agent code also does is covered separately by the News Analyst in this run.
- **StockTwits** (`fetch_stocktwits_messages('ANT', 30)`): worked, returned the 30 most-recent messages, all stamped 2026-11-12 (14:40Z-19:39Z) — same-day, pre-trade chatter only. Fetcher's own label count: Bullish 10 (33%), Bearish 3 (10%), Unlabeled 17 (57%).
- **Filtering to Anthropic-IPO content**: of the 30, ~6 are off-topic or too ambiguous to score (`$TEM` healthcare-AI post with only an incidental `$ANT` tag; a ticker-only post with no body text; a "Nav is still at ~$34" fragment with no clear referent; two posts that tag `$ANT` alongside `$MSFT` moves with no IPO content). The remaining ~24 are genuinely about the IPO (allocation, pricing, demand, skepticism) and drive this read.
- **Reddit** (`fetch_reddit_posts('ANT')`): failed outright — HTTP 403 on all three subreddits (wallstreetbets, stocks, investing) via the RSS fallback. This is a fetch/WAF failure, not evidence of silence; last run hit a mix of 429/403 on the same three subs, so this looks like a recurring access problem, not a one-off. No Reddit read is offered this run either.
- One mislabeled data point: `@prka`'s post ("Where is all needed liquidity for $ANT IPO going to come from?") is tagged **Bullish** by StockTwits' own sentiment field despite reading as a skeptical/concerned question — a reminder that the platform's self-reported tags are noisy and shouldn't be taken at face value.
- Weighting: StockTwits is the only quantitative source available; Reddit contributes nothing. Compared with the prior run (same day, different fetch window), the bullish share of labeled posts is lower (10:3 ≈ 77% bullish-of-labeled here vs. 11:2 ≈ 85% previously) and more explicit skepticism/risk commentary appears (profitability doubt, "ridiculous restrictions," circular-financing concern, a macro-debt warning). Score and band are nudged down slightly from the prior run on that basis.

## Report
**overall_band: Mildly Bullish | overall_score: 5.5/10 | confidence: low**

**StockTwits (retail, opinion).** Labeled split 10 Bullish : 3 Bearish of 30 total (13 labeled, 17 unlabeled) — bullish-leaning but thin (n=13) and with a lower bullish share than the equivalent StockTwits read on 2026-11-12 from an earlier fetch this same day (11:2). Dominant theme is **allocation-chasing**: "request 500 from fidelity... prob get 10," "Get your $ANT tickets here," "saving... for $ANT IPO... better get a decent allocation... to flip for a good profit," "$ANT First!" This is enthusiasm about *obtaining shares*, not necessarily about where the stock trades after listing.

**Bearish/skeptical voices (more numerous than last fetch).** "$ANT dogsheit"; "$ANT Ridiculous restrictions"; "Is $ANT profitable?"; a circular-financing concern ("circular financing/backstopping may not be so expansive without Jensen" — linking Nvidia-leadership turmoil to AI-financing risk); a broader AI-capex/debt-sustainability warning tagging $ANT incidentally; and a view that equity markets are being propped up only until the IPO prints, "after that... curtains."

**Rotation narrative (cuts both ways).** Multiple posts describe money moving *out of* $NVDA/$QQQ and *into* the IPO ("Money rotation moving to $ANT," "all the liquidity... is on the sidelines," "buy or wait for $ANT ipo?"). Bulls read this as capital waiting to deploy into ANT; bears read the same flow as a liquidity drain that could cap mega-cap upside and makes the IPO itself a near-term overhang on the broader tape.

**Informational/non-sentiment posts.** A roadshow-video quote about Anthropic's AMD-chip onboarding, and posts noting Google's/Amazon's pre-IPO equity stakes (~$100B+ each, cited informally) — useful context, not sentiment signal.

**Reddit.** No data (403 on all three target subreddits; fetch failure, not silence).

**Divergence.** Retail chatter is still net-positive but noticeably more hedged than the prior same-day read — skepticism about profitability, restrictions, and macro/liquidity risk is more visible this time, even though the headline label ratio is still bullish-leaning.

**Catalysts/risks already visible in the stream:** pricing/debut timing ("next week"), NVDA-related turmoil bleeding into AI-financing sentiment, and the recurring allocation-scarcity framing. Not predictive of post-listing price action.

| Signal | Source | Direction | Evidence |
|---|---|---|---|
| Labeled retail split | StockTwits (n=13 labeled of 30) | Bullish, weaker than prior fetch | 10 bull / 3 bear |
| Allocation FOMO | StockTwits | Bullish | "request 500... prob get 10"; "tickets here" |
| Liquidity/rotation | StockTwits | Mixed | funds moving NVDA/QQQ → ANT, read both ways |
| Profitability/restrictions doubt | StockTwits | Bearish | "Is $ANT profitable?"; "Ridiculous restrictions" |
| Mislabeled tag | StockTwits | Caution flag | @prka's concern tagged "Bullish" |
| Reddit | n/a | No data | 403 across r/wallstreetbets, r/stocks, r/investing |

## Sources
- [StockTwits $ANT stream via repo fetcher](https://stocktwits.com/symbol/ANT) (fetched 2026-11-12, `fetch_stocktwits_messages`)
- Reddit via repo fetcher (`fetch_reddit_posts`) — attempted, 403 on all three subreddits, no usable data
