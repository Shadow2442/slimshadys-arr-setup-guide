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
  <h2>Better quality rules, less storage nonsense</h2>
  <p>This is where you decide what ARR is allowed to accept, how large files may get, and how to save space without replacing good files with worse and larger ones by accident.</p>
  <div class="hero-badges">
    <span>Compact 1080p movies</span>
    <span>720p-first series</span>
    <span>Codec-aware downgrades</span>
    <span>Safer storage control</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/setup-checklist.html">✅ Checklist</a>
  <a href="/slimshadys-arr-setup-guide/docs/sonarr-setup-and-workflows.html">📺 Sonarr</a>
  <a href="/slimshadys-arr-setup-guide/docs/radarr-setup-and-workflows.html">🎬 Radarr</a>
  <a href="/slimshadys-arr-setup-guide/docs/sabnzbd-tuning-and-reliability.html">⚙️ SAB</a>
  <a href="/slimshadys-arr-setup-guide/docs/mdblist-import-lists.html">📚 MDBList</a>
  <a href="/slimshadys-arr-setup-guide/docs/indexers-and-german-content.html">🛰️ Indexers</a>
  <a href="/slimshadys-arr-setup-guide/">🏠 Home</a>
</div>
<div class="info-grid">
  <div class="info-card">
    <h3>Best use</h3>
    <p>Set realistic size caps, keep movies sharp without letting them balloon, and build downgrade lanes that save space for real instead of performing clown magic.</p>
  </div>
  <div class="info-card">
    <h3>Key lesson</h3>
    <p>Resolution alone is not enough. Codec, bitrate, runtime, and audio tracks matter just as much when you are trying to control quality and disk usage.</p>
  </div>
</div>

<div class="mini-grid">
  <div class="mini-card">
    <h4>Movie rule</h4>
    <p>Prefer compact 1080p by default and keep giant premium versions manual.</p>
  </div>
  <div class="mini-card">
    <h4>Series rule</h4>
    <p>Prefer 720p for everyday TV, with 1080p allowed as a fallback when needed.</p>
  </div>
  <div class="mini-card">
    <h4>Downgrade rule</h4>
    <p>Never trust resolution alone. Codec and actual file size matter just as much.</p>
  </div>
</div>

<div class="info-grid">
  <div class="info-card">
    <h3>Latest live tuning</h3>
    <p><code>SABnzbd</code> ran more reliably with <code>Direct Unpack</code> turned off, a modest server bump to <code>14</code> connections, <code>receive_threads = 4</code>, and a slightly tighter server timeout of <code>45</code>.</p>
  </div>
  <div class="info-card">
    <h3>Practical result</h3>
    <p>The stack became calmer, queue handling became cleaner, and overall download behavior got a little faster without dragging SAB back into clown mode.</p>
  </div>
</div>

<div class="edition-layout">
  <section class="edition-card accent-green">
    <span class="section-kicker">Release ladder</span>
    <h3>Availability first, archive second</h3>
    <div class="flow-grid">
      <div class="flow-card"><em>1</em><strong>No file</strong><span>Accept the best safe available release.</span></div>
      <div class="flow-card"><em>2</em><strong>German/Multi</strong><span>Replace English with German/Multi as soon as it appears.</span></div>
      <div class="flow-card"><em>3</em><strong>Compact keeper</strong><span>Prefer compact final files over giant temporary wins.</span></div>
      <div class="flow-card"><em>4</em><strong>Unmonitor</strong><span>Stop scanning once the final state is verified.</span></div>
    </div>
  </section>

  <section class="edition-card">
    <span class="section-kicker">Quality decisions</span>
    <h3>Use size rules as steering, not handcuffs</h3>
    <div class="rule-grid">
      <div class="rule-card"><strong>Movies</strong><span>Compact <code>1080p</code> German/Multi is the normal final target.</span></div>
      <div class="rule-card"><strong>Series</strong><span>German/Multi <code>1080p</code> can be a bridge; compact <code>720p</code> can be final.</span></div>
      <div class="rule-card"><strong>Anime</strong><span>Original-language plus subtitles can beat a bad dub or blocked-language file.</span></div>
      <div class="rule-card"><strong>Small BDRips</strong><span>Efficient <code>x265</code> releases should not be rejected just for being small.</span></div>
    </div>
  </section>
</div>

This page focuses on quality profiles, size limits, and how to downgrade safely without accidentally downloading worse and larger files.

These settings sit in the middle of the automation chain:

- import lists or manual additions decide what gets monitored
- indexers decide what can be found
- quality and size settings decide what gets accepted
- the downloader fetches it
- `Sonarr` / `Radarr` / `Lidarr` imports it
- `Plex` surfaces the final movie and series result while your music app of choice handles the audio library

So if quality or size rules are wrong, the whole automation pipeline can still work perfectly and produce the wrong media. That is why these settings deserve real attention.

## Core Principle

Do not optimize by resolution alone.

Always think in terms of:

- resolution
- codec
- bitrate
- audio tracks
- runtime

This matters because:

- `1080p x265` can be smaller than `720p x264`

## Release-Ladder Principle

The current automation model is a release ladder, not a single hard quality profile.

The important rule is:

- fallback files are allowed to make something watchable
- German/Multi files are the upgrade target
- compact verified final files should be unmonitored

That prevents two bad extremes:

- strict German-only profiles that miss new movies and episodes for days
- loose fallback profiles that later replace good German files with English or blocked-language releases

## Movie Philosophy

Recommended default:

- normal movies in compact `1080p`
- occasional premium giant version downloaded manually when actually wanted

The current movie language strategy is:

- normal movies use compact `1080p` or `720p` with `German` preferred
- `English` is allowed as a fallback only when no file exists or no German/Multi candidate is available
- later German releases should score high enough to replace English fallback files
- anime movies may also allow `Japanese` as a third fallback
- German/Multi should not be replaced by English-only files just because the English release has a higher source tier

### Radarr Main Profile

Good defaults:

- allow `1080p`
- disable `Remux-1080p`
- keep `2160p` only if you intentionally want it in a separate profile

### Radarr Movie Size Targets

Recommended:

`1080p`

- preferred `50`
- max `60`

`720p`

- `HDTV-720p = preferred 18, max 35`
- `WEBDL-720p = preferred 18, max 35`
- `WEBRip-720p = preferred 20, max 35`
- `Bluray-720p = preferred 20, max 35`

Later live testing justified a slightly looser movie `720p` ceiling:

- `HDTV-720p = preferred 18, max 45`
- `WEBDL-720p = preferred 18, max 45`
- `WEBRip-720p = preferred 20, max 45`
- `Bluray-720p = preferred 20, max 45`

That kept the storage philosophy intact while allowing reasonable long-movie `720p` files to pass.

The compact custom-format caps currently used for fallback matching are:

- `1080p compact = max 4.8 GB` in the tighter compact reference setup
- `720p compact = max 5 GB`

Those caps are useful as scored custom formats because they encourage compact releases without turning the whole profile into a brittle hard filter.

For compact `1080p` BluRay and BDRip releases, keep the lower bound permissive enough for real compact encodes. Good German/Multi `1080p` releases can sit around `1.7-2.1 GB`, especially with efficient codecs.

### Radarr Language Scoring Guardrails

Do not let Radarr treat every language hint as equally trustworthy.

Recommended guardrails:

- keep built-in profile language as `Any`
- avoid hard release-profile requirements such as `must contain german`
- let English fallback pass the minimum custom-format score
- set the German upgrade cutoff higher than English fallback
- keep generic parser-only German signals at `0`
- do not reward bare `DUBBED` as German
- do not reward generic `MULTi` without explicit German evidence

This allows a movie to download in English today and still upgrade to German later without letting weak parser guesses hijack the queue.

## Series Philosophy

Recommended default:

- everyday `720p`
- `1080p` fallback if `720p` does not appear

One extra real-world refinement is worth calling out:

- if a finished season already has good German files, do not let Sonarr replace them with larger or English-only releases just because the source tier looks shinier

That is where a stricter per-series profile and selective unmonitoring become more useful than endless theoretical scoring arguments.

The current series language strategy is:

- normal active series use German-preferred `720p`
- English can remain a fallback when German is not available
- German/Multi `1080p` can be accepted as a bridge for speed
- compact German/Multi `720p` is the normal final archival target
- completed final-state episodes and seasons should be unmonitored
- anime, Korean, and Chinese titles get scoped original-language fallback behavior instead of inheriting normal TV rules

### Sonarr Series Profile

Recommended:

- put `720p` above `1080p`
- leave `1080p` enabled as fallback and German/Multi bridge
- use a delay profile for `720p-first` series if you want to give smaller releases time to appear
- avoid creating many one-off strict profiles; keep standard profiles readable and let scoring plus automation guard the language ladder

The standard behavior should be:

- English fills an empty slot when no German/Multi candidate exists
- German/Multi beats English regardless of source-tier glamour
- German/Multi `1080p` remains monitored as a bridge
- compact German/Multi `720p` becomes final and can be unmonitored

For anime:

- German dub or German plus original-language multi-audio is best
- English dub plus original audio is usually better than weak German-subbed-only releases
- German-subbed original audio is acceptable
- best Japanese original is acceptable when no clear German subtitle proof exists

For Korean and Chinese:

- original audio with English subtitles is the first fallback
- English dub is the next fallback
- German dub or German/Multi is the final upgrade target

Keep these regional fallbacks scoped. Do not let Korean, Japanese, or Chinese fallback rules apply to unrelated normal TV.

### Sonarr TV Size Targets

Recommended:

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

## Music Philosophy

`Lidarr` is different from `Sonarr` and `Radarr`.

You are not usually tuning music by `720p` or `1080p` style size limits. Instead, the practical guidance is:

- decide whether you want lossless, lossy, or a mixed library
- use `Lidarr` quality profiles to keep that consistent
- let `Lidarr` handle artist monitoring, album grabs, and metadata organization
- keep downloader categories separate, for example `music`

For a beginner-friendly stack, the important thing is not overcomplicating music on day one. Get the movie and TV logic stable first, then expand cleanly into albums and artists.

## Safe Downgrade Strategy

Use a dedicated downgrade profile.

Do not turn your main profile into a downgrade profile.

### Radarr Downgrade Profile

Create:

- `HD 720p downgrade`
- optional stricter old-cinema profile: `SD 480p downgrade`

Use it for:

- oversized existing movies
- test batches
- lower-priority titles

Workflow:

1. assign the downgrade profile
2. search a small batch
3. inspect imports
4. keep only what actually saves space sensibly

Real-world update:

- `720p downgrade` works well as the semi-automated bulk lane
- `480p downgrade` is better used as a curated/manual lane for older films
- once you deliberately keep a compact `480p`, `DVD`, or other small old-title result, unmonitoring that movie is the safest way to stop ARR from replacing it again later

### Sonarr Downgrade Profile

If you create a `720p downgrade` path for series, make it codec-aware.

### Why codec-aware matters

Naive downgrade logic can fail like this:

- existing file = compact `1080p x265`
- replacement = bloated `720p x264`
- result = lower resolution and larger size

That is not a downgrade.
That is performance art.

### Recommended Sonarr downgrade extras

- `Codec - HEVC x265 Bonus = +2000`
- `Codec - AVC x264 Penalty = -2000`
- `minFormatScore = 1700`

This biases downgrade searches toward actually space-saving candidates.

## What Stargate Taught Us

`Stargate SG-1` was the perfect test case.

It exposed the exact downgrade trap:

- old files were already compact `1080p x265`
- many available `720p` replacements were larger `x264` encodes

Lesson:

- never assume a lower resolution is automatically an upgrade in storage efficiency

## Batch Safety

Recommended batch sizes:

- movies: `10-20`
- episodes: `5-10`

For large fallback-search waves, use chunking even when the API can accept more.

The live Radarr pass used:

- dry-run inventory first
- profile assignment in chunks
- search commands in chunks
- SAB queue checks during the run
- immediate cancellation of false-positive grabs

That pattern is slower than one giant search blast, but much easier to trust.

After live testing, that advice got stronger rather than weaker:

- small waves keep SAB calmer
- smaller waves expose bad releases earlier
- giant downgrade pushes create more queue drama than value
- daily automation should respect a realistic external API budget, such as a maximum around `800` indexer hits per day

Why:

- easier to review
- easier on quotas
- easier to undo if something weird happens

## What to Reject Quickly

Be cautious with releases that look like:

- `Part 1`
- `Teil 1`
- `CD1`
- `Disc 1`
- `VFQ`
- `VFF`
- `TRUEFRENCH`
- `EN-TR`
- `TR-EN`
- `TURG`
- Turkish-only or Hebrew-only title markers when those languages are not part of the intended original-language lane

These often create manual-import headaches, especially for movies.

## Import Validation and Cleanup

The automation should not blindly trust the release listing after a download finishes.

For completed warning or import-pending jobs:

- inspect the ARR manual-import parse result
- compare actual parsed language against the intended ladder
- remove and blocklist blocked-language grabs before they replace a good file
- only delete an old English file after the new German/Multi file has been verified as a safe import
- rescan and rename after import so Plex sees the normal ARR-managed path

This catches cases where an indexer title looked like `German` or `MULTi`, but Sonarr or Radarr parsed the actual release as English plus French, Turkish, Hebrew, or another blocked language.

## When to Stop Tightening

If you push max sizes too low:

- good releases disappear
- ARR starts missing perfectly normal files
- you save space by not downloading anything, which is technically efficient but emotionally rude

So tune size caps in measured steps.



