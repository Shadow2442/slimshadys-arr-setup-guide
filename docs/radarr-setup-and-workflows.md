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
  <p>This page covers the practical Radarr setup used in this guide: compact movie profiles, German-aware custom formats, interactive filtering, 720p and 480p downgrade lanes, and the specific workflow lessons learned from real search, import, and queue testing.</p>
  <div class="hero-badges">
    <span>Compact 1080p</span>
    <span>German-aware scoring</span>
    <span>720p downgrade lane</span>
    <span>Curated 480p old-movie lane</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/setup-checklist.html">âœ… Checklist</a>
  <a href="/slimshadys-arr-setup-guide/docs/sabnzbd-tuning-and-reliability.html">âš™ï¸ SAB</a>
  <a href="/slimshadys-arr-setup-guide/docs/indexers-and-german-content.html">ðŸ›°ï¸ Indexers</a>
  <a href="/slimshadys-arr-setup-guide/docs/sonarr-setup-and-workflows.html">ðŸ“º Sonarr</a>
  <a href="/slimshadys-arr-setup-guide/">ðŸ  Home</a>
</div>

<div class="info-grid">
  <div class="info-card">
    <h3>Main outcome</h3>
    <p>Movies stay compact, German-friendly logic works more consistently, and downgrade workflows save real space instead of turning into accidental nonsense theatre.</p>
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

## What Radarr Should Do in This Stack

In this setup, `Radarr` is responsible for:

- movies
- anime movies
- import-list-driven movie discovery
- interactive search curation
- file-size-aware replacement logic

Its job is not just â€œdownload a movie somehow.â€ Its job is to:

- prefer sensible file sizes
- preserve German-friendly logic
- allow manual premium exceptions
- and keep the movie library from slowly turning into an obese storage museum

## Recommended Philosophy

The default Radarr rule in this guide is:

- compact `1080p` for normal movies
- giant premium versions only when manually wanted

That means:

- use `1080p` as the practical everyday target
- disable `Remux-1080p` in the main profile
- treat downgrade profiles as special-purpose tools, not as the main profile

## Language Strategy

Use the same language philosophy as Sonarr, but with one important Radarr-specific rule:

- set the built-in profile language to `Any`

Why:

- it stops Radarr from placing too much trust in parser guesses
- especially around weak `MULTi` releases

Recommended language order:

1. proven `German + Japanese` multi-audio
2. confirmed `German audio`
3. `English audio`
4. weak `multi-audio`
5. `Japanese + German subtitles`

## Recommended Radarr Custom Formats

The same general custom-format logic used across the guide applies here:

- `Language - German Parser Signal`
- `Language - German Title Terms`
- `Language - Dual Multi Audio`
- `Language - English Audio Fallback`
- `Language - Original Audio Fallback`
- `Language - Japanese Audio Fallback`
- subtitle helpers where useful

The important principle is the same:

- do not trust parser language labels alone
- use title logic and custom formats to score what you actually want

## Main Quality Profile

Recommended default:

- compact `1080p`
- `Remux-1080p` disabled

This keeps the normal movie lane practical while leaving room for manual exceptions when you genuinely want a huge premium release.

## Movie Size Limits

Recommended compact movie defaults:

`1080p`

- `preferred = 50`
- `max = 60`

`720p`

- `HDTV-720p = preferred 18, max 45`
- `WEBDL-720p = preferred 18, max 45`
- `WEBRip-720p = preferred 20, max 45`
- `Bluray-720p = preferred 20, max 45`

Those `720p` values are the later live-tested version, not the original stricter ones. The looser ceiling was needed because some perfectly reasonable long-movie `720p` releases were getting rejected.

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
- `480p` works better as a curated/manual lane for older movies
- a strict profile makes sense here when the goal is actually low-res vintage-appropriate results

That makes `480p` different from `720p`:

- `720p downgrade` = semi-automated bulk lane
- `480p downgrade` = curated old-cinema lane

## Interactive Search and Filtering

Radarrâ€™s interactive search became much more useful once filters matched real workflow questions instead of decorative title text.

Useful filter ideas from this setup:

- compact German results under a size cap
- accepted German `720p`
- accepted compact German results regardless of resolution
- downgrade-profile library views
- older-movie candidate lists

The practical lesson:

- filters should reflect the real decision you are making
- not just whether the title string contains a pretty word

## When Radarr Will Not Auto-Grab Your Favorite Manual Pick

Radarr does not automatically think:

- â€œsmaller file = better fileâ€

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

Otherwise Radarr may eventually â€œimproveâ€ the movie again under normal monitoring logic.

## Batch Strategy

Recommended movie batch sizes:

- `10-20`

This became one of the clearest real-world lessons:

- smaller waves keep SAB calmer
- smaller waves expose bad releases sooner
- giant downgrade pushes create more queue pain than value

## Common Mistakes

Watch out for:

- treating lower resolution as automatically smaller
- trusting misleading `MULTi` behavior
- letting downgrade profiles become the default for the whole library
- assuming automatic search can replace curation for older sparse `480p` titles

If the profile sounds clever enough to save the universe, test it on ten movies first.

## Recommended Step-by-Step

1. Set the main movie profile to compact `1080p`.
2. Apply the German-aware custom-format logic.
3. Use the newer `720p` size caps.
4. Build the `HD 720p downgrade` lane for controlled space-saving waves.
5. Build the stricter `SD 480p downgrade` lane only for curated older-movie work.
6. Unmonitor manual low-res keepers once you are happy with them.

That order matches how the setup became more reliable in live testing instead of more decorative.


