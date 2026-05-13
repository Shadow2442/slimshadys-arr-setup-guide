<div class="doc-hero">
  <h2>Series automation that prefers smaller files without becoming weird</h2>
  <p>This page covers the practical Sonarr setup used in this guide: language-aware scoring, 720p-first quality logic, compact TV sizing, safe downgrade rules, and the specific lessons learned from real queue and import testing.</p>
  <div class="hero-badges">
    <span>720p-first TV</span>
    <span>German-aware scoring</span>
    <span>Anime-safe fallback</span>
    <span>Codec-aware downgrades</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/setup-checklist.html">âœ… Checklist</a>
  <a href="/slimshadys-arr-setup-guide/docs/sabnzbd-tuning-and-reliability.html">âš™ï¸ SAB</a>
  <a href="/slimshadys-arr-setup-guide/docs/indexers-and-german-content.html">ðŸ›°ï¸ Indexers</a>
  <a href="/slimshadys-arr-setup-guide/docs/radarr-setup-and-workflows.html">ðŸŽ¬ Radarr</a>
  <a href="/slimshadys-arr-setup-guide/">ðŸ  Home</a>
</div>

<div class="info-grid">
  <div class="info-card">
    <h3>Main outcome</h3>
    <p>Smaller day-to-day TV grabs, better German logic, saner anime handling, and fewer cases where Sonarr downloads something technically valid but spiritually unhelpful.</p>
  </div>
  <div class="info-card">
    <h3>Core idea</h3>
    <p>Let series prefer <code>720p</code>, allow <code>1080p</code> as fallback, and use custom formats so language and codec decisions are smarter than the parser alone.</p>
  </div>
</div>

<div class="mini-grid">
  <div class="mini-card">
    <h4>Best use</h4>
    <p>Use this when setting up Sonarr from scratch or when your existing Sonarr feels too loose, too bloated, or too trusting of <code>MULTi</code>.</p>
  </div>
  <div class="mini-card">
    <h4>Main risk avoided</h4>
    <p>Downloading larger â€œdowngrades,â€ weakly matched language results, and queue chaos from overly aggressive bulk work.</p>
  </div>
  <div class="mini-card">
    <h4>Cross-link</h4>
    <p>The downloader side matters too. Pair this page with the SAB tuning page if Sonarr results are stalling after they leave search.</p>
  </div>
</div>

## What Sonarr Should Do in This Stack

In this setup, `Sonarr` is responsible for:

- TV series
- anime series
- ongoing episode monitoring
- import-list-driven show discovery
- quality and language decisions for episodic content

Its job is not just to download episodes. Its job is to:

- pick sane releases
- keep the library compact
- preserve German preferences where possible
- and avoid replacing good files with larger nonsense

## Recommended Philosophy

The default Sonarr rule used in this guide is:

- prefer `720p`
- allow `1080p` fallback

Why:

- everyday TV usually does not need giant `1080p` encodes
- `720p` is a good default balance for size and quality
- `1080p` stays available when `720p` never appears

That gives you smaller day-to-day downloads without forcing the library into a stubborn â€œ720p or nothingâ€ ideology.

## Language Strategy

Do not trust `MULTi` alone as proof of German audio.

In the live setup used for this guide, the more reliable approach was:

1. proven `German + Japanese` multi-audio
2. confirmed `German audio`
3. `English audio`
4. weak `multi-audio`
5. `Japanese audio + German subtitles`
6. other fallbacks

That keeps Sonarr from treating every shiny `MULTi` release as if it automatically understood your actual language intent.

## Recommended Sonarr Custom Formats

The practical Sonarr custom-format set used here includes:

- `Language - German Parser Signal`
- `Language - German Title Terms`
- `Language - Dual Multi Audio`
- `Language - English Audio Fallback`
- `Language - Original Audio Fallback`
- `Language - Japanese Audio Fallback`
- `Subs - German Subtitles`
- `Subs - English Subtitles`
- `Language - German Japanese Proven Multi Audio`

Suggested scoring:

- `German Parser Signal = 0`
- `German Title Terms = 1600`
- `German Japanese Proven Multi Audio = 600`
- `English Audio Fallback = 500`
- `Dual Multi Audio = 300`
- `German Subtitles = 180`
- `English Subtitles = 120`
- `Japanese Audio Fallback = 50`
- `Original Audio Fallback = 75`

## Quality Profiles

Recommended main profile behavior:

- put `720p` above `1080p`
- keep `1080p` enabled as fallback

Recommended profile flags:

- `upgradeAllowed = true`
- `minFormatScore = 0`
- `cutoffFormatScore = 1000`
- `minUpgradeFormatScore = 1`

That lets Sonarr improve releases over time without forcing bizarre all-or-nothing behavior.

## Size Limits

Recommended compact TV size limits:

`720p`

- `HDTV-720p = preferred 14, max 28`
- `WEBDL-720p = preferred 14, max 28`
- `WEBRip-720p = preferred 16, max 30`
- `Bluray-720p = preferred 16, max 30`

`1080p`

- `HDTV-1080p = preferred 22, max 38`
- `WEBDL-1080p = preferred 22, max 38`
- `WEBRip-1080p = preferred 24, max 42`
- `Bluray-1080p = preferred 24, max 42`

These values are much more practical than the loose defaults if the goal is a compact library instead of quiet file-size inflation.

## Delay and Search Behavior

For a `720p-first` series workflow, use a scoped delay profile rather than a global blunt instrument.

Recommended delay example:

- `Usenet delay = 120 minutes`
- `Torrent delay = 180 minutes`

Apply it only to the shows that should wait for smaller releases.

## Import Lists and Discovery

In this guide, `Sonarr` pairs well with:

- `MDBList` for shows and anime discovery
- normal RSS sync for ongoing releases

Live setup timing used for this guide:

- `Import List Sync = every 5 minutes`
- `RSS Sync = every 15 minutes`

That is frequent enough to feel responsive without turning discovery into constant traffic noise.

## Downgrade Workflow

If you create a Sonarr downgrade lane, make it codec-aware.

This matters because a naive downgrade can do this:

- existing file = compact `1080p x265`
- replacement = bloated `720p x264`
- result = lower resolution and larger size

That is not a downgrade.

Recommended downgrade extras:

- `Codec - HEVC x265 Bonus = +2000`
- `Codec - AVC x264 Penalty = -2000`
- `minFormatScore = 1700`

That biases Sonarr toward replacements that actually save space.

## What Stargate Taught Us

`Stargate SG-1` was the perfect warning shot.

It proved:

- lower resolution is not automatically smaller
- codec matters as much as resolution
- old compact `1080p x265` files can beat many `720p x264` replacements on storage efficiency

That test is why the downgrade logic in this guide is codec-aware now instead of naively worshipping lower numbers.

## Batch Strategy

For Sonarr, safe batch sizes are smaller than people want:

- `5-10` episodes at a time

Why:

- easier to review
- easier on specialist indexer quotas
- easier on SAB post-processing
- much easier to understand when something fails

## Common Mistakes

Watch out for:

- trusting parser language labels too much
- trusting `MULTi` as if it always means German
- forcing huge downgrade waves
- letting a weak `720p` replacement replace a compact `1080p x265`

If a setting sounds too clever, test it on a real series before giving it a season pack and a megaphone.

## Recommended Step-by-Step

1. Build or review the language custom formats.
2. Set the main profile to `720p` first with `1080p` fallback.
3. Apply the compact TV size caps.
4. Add the scoped delay profile only where it makes sense.
5. Keep downgrade logic codec-aware.
6. Test on a few real shows before searching broadly.

That order keeps Sonarr understandable and makes the final behavior much easier to trust.

