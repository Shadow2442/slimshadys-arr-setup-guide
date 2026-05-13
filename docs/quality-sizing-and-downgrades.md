# Quality, Sizing, and Downgrades

<div class="doc-hero">
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

## Movie Philosophy

Recommended default:

- normal movies in compact `1080p`
- occasional premium giant version downloaded manually when actually wanted

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

## Series Philosophy

Recommended default:

- everyday `720p`
- `1080p` fallback if `720p` does not appear

### Sonarr Series Profile

Recommended:

- put `720p` above `1080p`
- leave `1080p` enabled as fallback
- use a delay profile for `720p-first` series if you want to give smaller releases time to appear

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

After live testing, that advice got stronger rather than weaker:

- small waves keep SAB calmer
- smaller waves expose bad releases earlier
- giant downgrade pushes create more queue drama than value

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

These often create manual-import headaches, especially for movies.

## When to Stop Tightening

If you push max sizes too low:

- good releases disappear
- ARR starts missing perfectly normal files
- you save space by not downloading anything, which is technically efficient but emotionally rude

So tune size caps in measured steps.

