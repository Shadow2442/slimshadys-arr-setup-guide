<div class="guide-banner-frame">
  <img class="guide-banner-image" src="/slimshadys-arr-setup-guide/docs/assets/guide-banner.png" alt="SlimShady's ARR Setup Guide banner">
</div>
<div class="guide-stats">
  <div class="guide-stat-card">
    <span class="guide-stat-value">6</span>
    <span class="guide-stat-label">Core apps in the stack</span>
  </div>
  <div class="guide-stat-card">
    <span class="guide-stat-value">10</span>
    <span class="guide-stat-label">Deep-dive guide sections</span>
  </div>
  <div class="guide-stat-card">
    <span class="guide-stat-value">14</span>
    <span class="guide-stat-label">SAB connections tuned</span>
  </div>
  <div class="guide-stat-card">
    <span class="guide-stat-value">45s</span>
    <span class="guide-stat-label">Downloader timeout baseline</span>
  </div>
</div><div class="doc-hero">
  <h2>Series automation that prefers smaller files without becoming weird</h2>
  <p>This page covers the practical Sonarr setup used in this guide: language-aware scoring, 720p-first quality logic, compact TV sizing, safe downgrade rules, and the specific lessons learned from real queue and import testing.</p>
  <div class="hero-badges">
    <span>720p-first TV</span>
    <span>Language-aware scoring</span>
    <span>Anime-safe fallback</span>
    <span>Codec-aware downgrades</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/setup-checklist.html">Checklist</a>
  <a href="/slimshadys-arr-setup-guide/docs/sabnzbd-tuning-and-reliability.html">SAB</a>
  <a href="/slimshadys-arr-setup-guide/docs/indexers-and-german-content.html">German strategy</a>
  <a href="/slimshadys-arr-setup-guide/docs/radarr-setup-and-workflows.html">Radarr</a>
  <a href="/slimshadys-arr-setup-guide/">Home</a>
</div>

<div class="info-grid">
  <div class="info-card">
    <h3>Main outcome</h3>
    <p>Smaller day-to-day TV grabs, cleaner language logic, saner anime handling, and fewer cases where Sonarr downloads something technically valid but spiritually unhelpful.</p>
  </div>
  <div class="info-card">
    <h3>Core idea</h3>
    <p>Let series prefer <code>720p</code>, allow <code>1080p</code> as fallback, and use custom formats so audio, subtitle, and codec decisions are smarter than the parser alone.</p>
  </div>
</div>

<div class="mini-grid">
  <div class="mini-card">
    <h4>Best use</h4>
    <p>Use this when setting up Sonarr from scratch or when your existing Sonarr feels too loose, too bloated, or too trusting of parser guesses.</p>
  </div>
  <div class="mini-card">
    <h4>Main risk avoided</h4>
    <p>Downloading larger downgrades, weakly matched language results, and queue chaos from overly aggressive bulk work.</p>
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
- preserve your actual language preferences where possible
- and avoid replacing good files with larger nonsense

## Recommended Philosophy

The default Sonarr rule used in this guide is:

- prefer `720p`
- allow `1080p` fallback

Why:

- everyday TV usually does not need giant `1080p` encodes
- `720p` is a good default balance for size and quality
- `1080p` stays available when `720p` never appears

That gives you smaller day-to-day downloads without forcing the library into a stubborn `720p or nothing` ideology.

## Language Strategy

Build `Sonarr` around language-aware custom formats instead of trusting parser labels on faith.

The general principle is:

- use custom formats for the audio and subtitle combinations you actually care about
- keep the main profile logic simple
- let scoring handle the nuance

If you want the exact German-friendly scoring model used in this project, including the custom-format ideas and example scores, use:

- [Indexers and German Content Strategy](/slimshadys-arr-setup-guide/docs/indexers-and-german-content.html)

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
- forcing huge downgrade waves
- letting a weak `720p` replacement replace a compact `1080p x265`
- assuming lower resolution automatically means better storage efficiency

If a setting sounds too clever, test it on a real series before giving it a season pack and a megaphone.

## Recommended Step-by-Step

1. Build or review the language custom formats.
2. Set the main profile to `720p` first with `1080p` fallback.
3. Apply the compact TV size caps.
4. Add the scoped delay profile only where it makes sense.
5. Keep downgrade logic codec-aware.
6. Use the dedicated German strategy page only if you actually need that regional setup.

That order keeps Sonarr understandable and makes the final behavior much easier to trust.
