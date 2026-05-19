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

<div class="intro-box">
  <h3>Introduction</h3>
  <p>This page is your guided Sonarr walkthrough. It starts with what Sonarr is for, then shows you how to install it, how to do the first safe configuration, and only after that how to apply the stronger quality, language, and downgrade ideas used in this project.</p>
  <p>If you are new to ARR tools, treat this page like a sequence, not a buffet. Get the downloader, folders, and one clean profile working first. The more advanced tuning is only helpful once that foundation exists.</p>
</div>

## What Sonarr Is and Why You Need It

`Sonarr` is the ARR app for television, anime series, and ongoing episodic content.

In a healthy stack, Sonarr should:

- monitor shows you care about
- search for new episodes automatically
- send downloads to your downloader
- import and rename finished episodes cleanly
- keep quality and language decisions consistent over time

What Sonarr should not be is a random episode collector that grabs anything with the right season number and then hopes for forgiveness later.

## Download Sonarr

- Official site: [sonarr.tv](https://sonarr.tv/)
- Direct download page: [sonarr.tv/#download](https://sonarr.tv/#download)

If you are on Windows, the normal installer is the easiest starting point.

## Install Sonarr Step by Step

1. Download the current Sonarr installer from the official site.
2. Run the installer and allow it to install the app and service.
3. Open Sonarr in your browser, usually on `http://localhost:8989`.
4. Make sure the app loads and the main dashboard opens without errors.
5. Do not start importing hundreds of shows yet. First get the boring wiring right.

If you want the shortest safe order, do this before any deeper tuning:

- create your final TV library folder
- create your downloader category for TV, such as `tv`
- connect Sonarr to the downloader
- connect Sonarr to your indexers

## Basic Configuration First

Before you care about advanced profiles, get these basics working:

- root folder for series
- downloader connection
- indexer connection
- media management naming
- one sane default quality profile

Recommended basic folder idea:

- final library: `F:\media\series`
- temporary downloads live elsewhere and are handled by your downloader

Recommended base category:

- `tv`

That separation matters. Sonarr should import into the final library, not live forever inside your download folder like a raccoon with admin access.

## Base Settings I Recommend

### Media Management

Set Sonarr up so it:

- renames episodes on import
- creates season folders
- keeps the final library clean and predictable

The goal is simple:

- Sonarr should own TV naming
- Plex should only scan the final organized library

### Download Client

Connect Sonarr to your downloader and verify:

- host and port are correct
- category is `tv`
- test passes

If the test does not pass, do not move on to refinements yet. Fix the pipe before decorating the bathroom.

### Indexers

Add only the sources you actually want.

The app needs:

- usable Usenet or torrent indexers
- sensible priorities
- no giant pile of decorative dead sites

If you want the optional regional language strategy used in this project, keep that logic on the dedicated page:

- [Indexers and German Content Strategy](/slimshadys-arr-setup-guide/docs/indexers-and-german-content.html)

## Recommended Philosophy

For a compact and reliable TV setup, the main Sonarr rule used in this guide is:

- prefer `720p`
- allow `1080p` as fallback

Why:

- everyday TV usually does not need giant `1080p` encodes
- `720p` is a strong quality-to-size compromise
- fallback keeps the library moving when smaller releases do not exist

That gives you smaller day-to-day downloads without forcing the library into a stubborn `720p or nothing` ideology.

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

Once the base setup works, apply the compact TV size limits.

Recommended limits:

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

These are much more practical than the loose defaults if the goal is a compact library instead of quiet file-size inflation.

## Language and Custom Format Strategy

Build Sonarr around custom formats instead of trusting parser labels on faith.

The general principle is:

- use custom formats for the audio and subtitle combinations you actually care about
- keep the main profile logic simple
- let scoring handle the nuance

This makes Sonarr much less gullible when release names look convincing but the actual content is less honest.

## Import Lists and Discovery

In this guide, Sonarr pairs well with:

- `MDBList` for shows and anime discovery
- normal RSS sync for ongoing releases

Live setup timing used for this guide:

- `Import List Sync = every 5 minutes`
- `RSS Sync = every 15 minutes`

That is frequent enough to feel responsive without turning discovery into constant traffic noise.

## Delay and Search Behavior

For a `720p-first` series workflow, use a scoped delay profile rather than a global blunt instrument.

Recommended delay example:

- `Usenet delay = 120 minutes`
- `Torrent delay = 180 minutes`

Apply it only to the shows that should wait for smaller releases.

## Recommended Refinements and Enhancements

Once the base app is working, these are the refinements that made the biggest difference in real testing:

- `720p` first with `1080p` fallback
- compact TV size caps
- language-aware custom formats
- codec-aware downgrade logic
- scoped delay profiles instead of global waiting

Those are the changes that make Sonarr feel intentional instead of merely operational.

## Real-World Example: Preventing English Overwrites

One of the best live examples from this setup came from `Lucifer`.

The existing season files were already good:

- `German + English dual-audio`
- compact `x265`
- `WEBRip-1080p`

Later, Sonarr found English-only `Bluray-1080p` releases and tried to queue them as upgrades.

Why this happened:

- `Bluray-1080p` is treated as a higher source tier than `WEBRip-1080p`
- the normal profile still allowed upgrades
- custom format scoring expressed a strong German preference, but it did not act as a hard lock by itself

So Sonarr did the very Sonarr thing of seeing a shinier source and temporarily forgetting that the current German files were already the right answer.

The fix used here was:

- create a stricter profile such as `HD-720p (German lock)`
- set `minFormatScore = 1500`
- keep a modest `Codec - HEVC x265 Bonus`
- do **not** use a codec penalty so harsh that valid German `x264` releases are locked out
- unmonitor finished seasons you want to preserve exactly as they are

That combination gives you the useful behavior:

- weak English-only releases stop qualifying
- compact `x265` releases are still preferred
- valid German `x264` releases still remain possible when they are the best realistic option

This is the practical pattern to copy whenever a finished German season keeps attracting flashy but worse English upgrades.

## Downgrade Workflow

If you create a Sonarr downgrade lane, make it codec-aware.

This matters because a naive downgrade can do this:

- existing file = compact `1080p x265`
- replacement = bloated `720p x264`
- result = lower resolution and larger size

That is not a downgrade. That is sabotage wearing a tidy profile name.

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

## Common Mistakes

Watch out for:

- trusting parser language labels too much
- forcing huge downgrade waves
- skipping the basic downloader and folder setup
- letting a weak `720p` replacement replace a compact `1080p x265`
- assuming lower resolution automatically means better storage efficiency

If a setting sounds too clever, test it on a real series before giving it a season pack and a megaphone.

## Recommended Step-by-Step

1. Download and install Sonarr.
2. Create the final TV library folder.
3. Connect the downloader and confirm the `tv` category works.
4. Add indexers and test them.
5. Turn on clean media management and naming.
6. Set the main profile to `720p` first with `1080p` fallback.
7. Apply the compact TV size caps.
8. Add language-aware custom formats.
9. Add delay logic only where it actually helps.
10. Use codec-aware downgrade logic only after the normal workflow behaves properly.

That order keeps Sonarr understandable and makes the final behavior much easier to trust.
