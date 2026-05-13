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
  <h2>Movie automation that stays compact without losing the plot</h2>
  <p>This page covers the practical Radarr setup used in this guide: compact movie profiles, interactive filtering, 720p and 480p downgrade lanes, and the workflow lessons learned from real search, import, and queue testing.</p>
  <div class="hero-badges">
    <span>Compact 1080p</span>
    <span>Language-aware scoring</span>
    <span>720p downgrade lane</span>
    <span>Curated 480p old-movie lane</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/setup-checklist.html">Checklist</a>
  <a href="/slimshadys-arr-setup-guide/docs/sabnzbd-tuning-and-reliability.html">SAB</a>
  <a href="/slimshadys-arr-setup-guide/docs/indexers-and-german-content.html">German strategy</a>
  <a href="/slimshadys-arr-setup-guide/docs/sonarr-setup-and-workflows.html">Sonarr</a>
  <a href="/slimshadys-arr-setup-guide/">Home</a>
</div>

<div class="info-grid">
  <div class="info-card">
    <h3>Main outcome</h3>
    <p>Movies stay compact, language-aware logic works more consistently, and downgrade workflows save real space instead of turning into accidental nonsense theatre.</p>
  </div>
  <div class="info-card">
    <h3>Core idea</h3>
    <p>Use compact <code>1080p</code> as the normal movie lane, keep targeted downgrade profiles for special use, and treat older low-res curation as a deliberate workflow rather than a bulk search fantasy.</p>
  </div>
</div>

<div class="mini-grid">
  <div class="mini-card">
    <h4>Best use</h4>
    <p>Use this when building a compact Radarr setup or when existing movie automation is too large, too noisy, or too trusting of misleading release metadata.</p>
  </div>
  <div class="mini-card">
    <h4>Main risk avoided</h4>
    <p>Needlessly giant files, weak language matches, and downgrade lanes that replace good files with smaller-looking but worse outcomes.</p>
  </div>
  <div class="mini-card">
    <h4>Cross-link</h4>
    <p>The downloader still matters. Pair this page with the SAB page if searches succeed but queues behave like a haunted post office.</p>
  </div>
</div>

## What Radarr Is and Why You Need It

`Radarr` is the ARR app for movies and anime movies.

In a healthy stack, Radarr should:

- monitor the movies you want
- search automatically or on demand
- send the chosen release to your downloader
- import and rename the final file correctly
- make future upgrades or replacements predictable

Its job is not just to download a movie somehow. Its job is to prefer sensible file sizes, preserve your real preferences where possible, and stop the movie library from slowly turning into an obese storage museum.

## Download Radarr

- Official site: [radarr.video](https://radarr.video/)
- Direct download page: [radarr.video/#download](https://radarr.video/#download)

For Windows, the standard installer is the easiest place to start.

## Install Radarr Step by Step

1. Download the current installer from the official Radarr site.
2. Run the installer and let it install the app and service.
3. Open Radarr in your browser, usually on `http://localhost:7878`.
4. Confirm the dashboard opens cleanly.
5. Before you start importing large movie lists, wire up the boring basics first.

The safe order is:

- create the final movie library folder
- create the downloader category for movies, such as `movies`
- connect Radarr to the downloader
- connect Radarr to your indexers

## Basic Configuration First

Get these four things right before you chase advanced tuning:

- root movie folder
- downloader connection
- indexer connection
- media management naming and import behavior

Recommended final library idea:

- final library: `F:\media\movies`

Recommended downloader category:

- `movies`

The final library and the temporary download folder should stay separate. Radarr should move finished movies into the clean library, not ask Plex to sort through a crime scene later.

## Base Settings I Recommend

### Media Management

Set Radarr up so it:

- renames movies on import
- uses clear folder naming
- keeps the final movie library consistent

That makes future scanning, backups, and manual review much easier.

### Download Client

Connect Radarr to your downloader and verify:

- host and port are correct
- category is `movies`
- test passes

If the test fails, stop there and fix that first. Advanced profile tuning on top of a broken download path is just decorative suffering.

### Indexers

Add only the sources you actually want.

The goal is:

- a few reliable broad providers
- optional specialist sources when you need them
- no giant pile of junk that only exists to waste search time

If you want the regional language-specific logic used in this project, keep that part on the dedicated page:

- [Indexers and German Content Strategy](/slimshadys-arr-setup-guide/docs/indexers-and-german-content.html)

## Recommended Philosophy

The default Radarr rule in this guide is:

- compact `1080p` for normal movies
- giant premium versions only when manually wanted

That means:

- use `1080p` as the practical everyday target
- disable `Remux-1080p` in the main profile
- treat downgrade profiles as special-purpose tools, not as the main profile

This keeps the normal movie lane practical while leaving room for manual exceptions when you genuinely want a huge premium release.

## Main Quality Profile

Recommended default:

- compact `1080p`
- `Remux-1080p` disabled

One especially useful Radarr rule from this setup is:

- set the built-in profile language to `Any`

That keeps Radarr from over-trusting weak parser signals and lets custom formats do the real language work.

## Movie Size Limits

Once the base setup works, apply the practical size rules.

Recommended compact movie defaults:

`1080p`

- `preferred = 50`
- `max = 60`

`720p`

- `HDTV-720p = preferred 18, max 45`
- `WEBDL-720p = preferred 18, max 45`
- `WEBRip-720p = preferred 20, max 45`
- `Bluray-720p = preferred 20, max 45`

Those `720p` values are the later live-tested version. The looser ceiling was needed because some perfectly reasonable long-movie `720p` releases were getting rejected.

## Language and Custom Format Strategy

Use the same language-aware philosophy as Sonarr:

- keep the built-in profile language broad
- use custom formats to express your real audio and subtitle preferences
- avoid treating parser guesses as truth

This gives you much more control than relying on title text and hope.

## Recommended Refinements and Enhancements

Once the basic app is working, these are the improvements that mattered most in real use:

- compact `1080p` as the default movie lane
- practical `720p` caps
- interactive search filters that match real questions
- a dedicated `720p` downgrade profile
- a stricter curated `480p` lane for old movies
- unmonitoring curated low-res keepers

Those are the changes that turn Radarr from “movie downloader” into “movie workflow with a brain.”

## 720p Downgrade Workflow

Create a dedicated profile:

- `HD 720p downgrade`

Rules:

- prefer `720p`
- allow `1080p` fallback
- use it only for targeted batches

This profile works well for:

- oversized existing movies
- storage-saving waves
- lower-priority or non-favorite titles

Practical workflow:

1. assign the profile to a small batch
2. run `Search Selected`
3. review the imports
4. repeat only if the results are actually saving space sensibly

## 480p Old-Movie Workflow

The stricter older-movie lane used in this guide is:

- `SD 480p downgrade`

What live testing showed:

- `480p` is too sparse to treat like a normal mass automation lane
- `480p` works better as a curated or manual lane for older movies
- a strict profile makes sense here when the goal is actually low-res vintage-appropriate results

That makes `480p` different from `720p`:

- `720p downgrade` = semi-automated bulk lane
- `480p downgrade` = curated old-cinema lane

## Interactive Search and Filtering

Radarr's interactive search becomes far more useful when filters match real workflow questions instead of decorative title text.

Useful filter ideas from this setup:

- compact accepted results under a size cap
- accepted `720p` results for targeted downgrade work
- compact accepted results regardless of resolution
- downgrade-profile library views
- older-movie candidate lists

This matters because sometimes a compact `1080p x265` is more useful than a technically lower-resolution but bloated `720p` file.

## When Radarr Will Not Auto-Grab Your Favorite Manual Pick

Radarr does not automatically think:

- `smaller file = better file`

It thinks in terms of:

- quality tier
- cutoff
- upgrade path
- revision
- custom-format score

So if the current file already meets cutoff, Radarr may refuse to auto-grab a different same-tier release even if you personally like it better.

That is normal behavior, not a broken setup.

## Unmonitoring Keepers

If you manually curate a compact low-res result and want to keep it, unmonitor it.

This is especially useful for:

- curated `480p`
- `DVD`
- intentionally tiny old-movie replacements

Otherwise Radarr may eventually improve the movie again under normal monitoring logic.

## Common Mistakes

Watch out for:

- treating lower resolution as automatically smaller
- trusting misleading parser language behavior
- skipping the basic folder and downloader setup
- letting downgrade profiles become the default for the whole library
- assuming automatic search can replace curation for older sparse `480p` titles

If the profile sounds clever enough to save the universe, test it on ten movies first.

## Recommended Step-by-Step

1. Download and install Radarr.
2. Create the final movie library folder.
3. Connect the downloader and confirm the `movies` category works.
4. Add indexers and test them.
5. Turn on clean media management and naming.
6. Set the main movie profile to compact `1080p`.
7. Apply your language-aware custom-format logic.
8. Use the newer `720p` size caps.
9. Build the `HD 720p downgrade` lane for controlled space-saving waves.
10. Build the stricter `SD 480p downgrade` lane only for curated older-movie work.
11. Unmonitor manual low-res keepers once you are happy with them.

That order matches how the setup became more reliable in live testing instead of more decorative.
