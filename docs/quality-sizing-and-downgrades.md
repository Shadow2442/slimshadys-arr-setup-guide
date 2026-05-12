# Quality, Sizing, and Downgrades

This page focuses on quality profiles, size limits, and how to downgrade safely without accidentally downloading worse and larger files.

These settings sit in the middle of the automation chain:

- import lists or manual additions decide what gets monitored
- indexers decide what can be found
- quality and size settings decide what gets accepted
- the downloader fetches it
- `Sonarr` / `Radarr` imports it
- `Plex` surfaces the final result

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

## Safe Downgrade Strategy

Use a dedicated downgrade profile.

Do not turn your main profile into a downgrade profile.

### Radarr Downgrade Profile

Create:

- `HD 720p downgrade`

Use it for:

- oversized existing movies
- test batches
- lower-priority titles

Workflow:

1. assign the downgrade profile
2. search a small batch
3. inspect imports
4. keep only what actually saves space sensibly

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
