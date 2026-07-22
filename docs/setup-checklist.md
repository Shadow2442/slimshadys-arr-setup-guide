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
  <h2>Build the stack in the right order</h2>
  <p>This is the short operational checklist for getting the full ARR setup online without wandering into five side quests before the downloader even works.</p>
  <div class="hero-badges">
    <span>Core apps first</span>
    <span>Categories next</span>
    <span>Import and naming flow</span>
    <span>Quota-safe automation</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/sonarr-setup-and-workflows.html">Sonarr</a>
  <a href="/slimshadys-arr-setup-guide/docs/radarr-setup-and-workflows.html">Radarr</a>
  <a href="/slimshadys-arr-setup-guide/docs/sabnzbd-tuning-and-reliability.html">SAB</a>
  <a href="/slimshadys-arr-setup-guide/docs/mdblist-import-lists.html">MDBList</a>
  <a href="/slimshadys-arr-setup-guide/docs/indexers-and-german-content.html">German strategy</a>
  <a href="/slimshadys-arr-setup-guide/docs/quality-sizing-and-downgrades.html">Quality & Sizes</a>
  <a href="/slimshadys-arr-setup-guide/">Home</a>
</div>

Use this as the short, practical checklist after installation.

This checklist is meant for people who are willing to configure things properly, but who do not want to become ARR archaeologists in the process.

<div class="info-grid">
  <div class="info-card">
    <h3>Start here if</h3>
    <p>You want the cleanest order of operations for <code>Sonarr</code>, <code>Radarr</code>, <code>Lidarr</code>, <code>SABnzbd</code>, <code>Jackett</code>, and <code>Plex</code>.</p>
  </div>
  <div class="info-card">
    <h3>Main outcome</h3>
    <p>Working categories, correct import paths, sane quality defaults, and a setup that behaves predictably instead of improvising in production.</p>
  </div>
</div>

<div class="mini-grid">
  <div class="mini-card">
    <h4>Best use</h4>
    <p>Follow this page in order when you install or reset the stack.</p>
  </div>
  <div class="mini-card">
    <h4>Main risk avoided</h4>
    <p>Broken categories, wrong folders, and ARR apps fighting each other.</p>
  </div>
  <div class="mini-card">
    <h4>Ideal helper</h4>
    <p>Use Codex step by step if you do not want to configure everything manually.</p>
  </div>
</div>

## 1. Core Apps

- Install `SABnzbd`
- Install `Sonarr`
- Install `Radarr`
- Install `Lidarr`
- Install `Plex`
- Install `Jackett` if you want torrent sources as well
- Keep downloads and libraries on the same drive if you want hardlinks

Optional:

- install `FlareSolverr` if some Jackett-backed torrent sites require challenge solving
- install `Jellyseerr` or `Overseerr` if you want a request and discovery frontend
- use `OpenAI Codex` if you want a practical setup assistant instead of configuring everything by hand

Useful downloads:

- `Sonarr`: [sonarr.tv](https://sonarr.tv/#download)
- `Radarr`: [radarr.video](https://radarr.video/#download)
- `Lidarr`: [lidarr.audio](https://lidarr.audio/#download)
- `SABnzbd`: [sabnzbd.org/downloads](https://sabnzbd.org/downloads)
- `Jackett`: [GitHub Releases](https://github.com/Jackett/Jackett/releases)
- `Plex`: [plex.tv/media-server-downloads](https://www.plex.tv/media-server-downloads/)
- `FlareSolverr`: [GitHub Releases](https://github.com/FlareSolverr/FlareSolverr/releases)
- `Jellyseerr`: [GitHub](https://github.com/Fallenbagel/jellyseerr)
- `OpenAI Codex`: [OpenAI Academy](https://openai.com/academy/codex/)

## 1a. Understand the Flow

The normal end-to-end process is:

1. movie, series, artist, or album gets added manually or by `Import List`
2. the ARR app searches the configured indexers
3. matching release is sent to `SABnzbd` or the torrent client
4. download completes and is unpacked
5. the ARR app imports and renames the media
6. `Plex` scans the library and makes it available to watch or listen to

That is the full automation loop this guide is trying to support.

## 2. Categories

Create separate download categories:

- `tv` for `Sonarr`
- `movies` for `Radarr`
- `music` for `Lidarr`

Make sure those categories point to folders that the ARR apps can access.

Also make sure Plex points to the final library folders, not the incomplete or temporary download paths.

## 3. SABnzbd

Enable:

- `Ignore samples`
- executable blacklist: `exe, com, cmd, bat, scr, pif`
- cleanup list: `nfo, sfv, srr, txt, jpg, jpeg, png, url`
- `Direct Unpack = off`
- `Connections = 14` on the main server as a safe tuned starting point
- `Receive Threads = 4`
- `Server Timeout = 45`

If you want the deeper reasoning and troubleshooting flow, read the dedicated page:

- [SABnzbd Tuning and Reliability](/slimshadys-arr-setup-guide/docs/sabnzbd-tuning-and-reliability.html)

## 4. Sonarr

Recommended default philosophy:

- use English fallback only as a temporary bridge
- prefer German/Multi upgrades over English-only releases
- allow German/Multi `1080p` as a fast bridge
- keep compact German/Multi `720p` as the final archival target
- use compact TV size limits

Recommended extra settings:

- `Completed Download Handling = enabled`
- `Episode Title Required = never`
- delay profile for `720p-first` shows only

## 5. Radarr

Recommended default philosophy:

- compact German/Multi `1080p`
- English fallback only when no file exists or no German/Multi candidate is available
- strict title matching for same-year or similar-title releases
- manual exceptions for giant premium releases

Recommended extra settings:

- `Completed Download Handling = enabled`
- built-in profile language = `Any`
- disable `Remux-1080p` in main profile

## 6. Import Lists

Set up `Import Lists` if you want automatic discovery and monitoring.

Examples:

- latest movies
- new and ongoing TV series
- seasonal anime
- artists and albums where supported
- custom watchlists

The benefit:

- items are added automatically
- the ARR apps apply your rules automatically
- completed files land in the library automatically
- `Plex` picks them up automatically

### Recommended simple list source: MDBList

If you want the easiest practical way to create dynamic import lists, use `mdblist.com`.

Why:

- it is simple to build movie and show lists from ratings, popularity, anticipation, streaming sources, anime filters, and more
- both `Radarr` and `Sonarr` can use MDBList list URLs directly
- it keeps discovery separate from downloading, which is exactly what you want

For `Lidarr`, use music-oriented import-list sources instead.

## 7. Indexers

Recommended general rule:

- use broad healthy providers for daily work
- keep quota-limited or specialist providers as selective backups
- use the dedicated German strategy page only if you actually want that regional setup

Remember:

- lower number = higher priority
- priority is only a tiebreaker
- all enabled indexers are still searched

### Jackett torrent fallback

If you use `Jackett`, keep it selective.

Recommended policy:

- add only trackers you actually use
- test each tracker inside Jackett before adding it to ARR
- use tracker-specific Torznab feeds, not broad all-source noise
- keep categories scoped to the ARR app, such as movie/video categories for Radarr
- disable trackers that produce repeated failures, Cloudflare errors, rate limits, or bad results
- re-enable a failed tracker only after both a normal search and a no-query/top-feed test are healthy

Jackett is best as a fallback bridge next to Usenet, not as the center of the whole system.

## 8. Language Strategy

Recommended universal rule:

- build language-aware custom formats for the audio and subtitle combinations you actually care about
- do not trust parser labels on faith
- block suspicious non-target markers such as `VFQ`, `VFF`, `TRUEFRENCH`, `EN-TR`, `TR-EN`, and `TURG`
- use scoped original-language fallback lanes for anime, Korean, and Chinese titles
- unmonitor verified final-state compact German/Multi files
- keep the regional or German-specific model on the dedicated specialist page

## 8a. Seerr Request Frontend

Use `Jellyseerr`, `Overseerr`, or a similar request frontend as a discovery and approval layer, not as a way around ARR rules.

Recommended policy:

- disable broad user auto-approval
- manually approve large requests
- avoid auto-monitoring every season for newly requested shows unless you truly want the whole show
- send approved movies to the current standard Radarr profile
- send approved series to the current standard Sonarr profile
- let ARR handle search, download, import, rename, quality, and language replacement

This prevents one request from adding a massive full-series queue by accident.

## 9. Movie Size Targets

Recommended:

`1080p`

- preferred `50`
- max `60`

`720p`

- `HDTV-720p = preferred 18, max 45`
- `WEBDL-720p = preferred 18, max 45`
- `WEBRip-720p = preferred 20, max 45`
- `Bluray-720p = preferred 20, max 45`

## 10. TV Size Targets

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

## 11. Safe Testing Rules

- change one thing at a time
- test on a few real titles
- do not bulk-search huge libraries immediately
- use small batches:
  - movies: `10-20`
  - episodes: `5-10`

That is not just theory. In the live setup, smaller batches were a major stability upgrade for both ARR apps and SAB.

## 12. Downgrade Warnings

Never assume:

- `720p` automatically means smaller

Always consider:

- resolution
- codec
- bitrate
- audio tracks

Compact `1080p x265` files can be smaller than bloated `720p x264` replacements.

## 13. If You Want Help Automating This

If you do not want to apply all settings manually, you can use `OpenAI Codex` to help configure your ARR stack.

Useful prompts include:

- audit my current Sonarr and Radarr setup against this guide
- implement the recommended indexer priorities
- add the custom formats and scoring from this guide
- tune movie and TV size limits
- create a safe downgrade workflow

This guide can be used directly as the configuration reference for Codex.

## 14. Where This Checklist Came From

This checklist is based on:

- official Servarr behavior
- practical indexer testing
- quota-limit debugging
- language scoring work
- real import and downgrade troubleshooting

It was built from actual setup experience, with the support of `OpenAI Codex`, not just copied from generic default settings.

## 15. If You Are Non-Technical

That is fine.

The best way to use this checklist is:

1. work through it one section at a time
2. ask `OpenAI Codex` to explain each step in plain English
3. let `Codex` help apply or verify that step
4. do not rush into changing everything at once

This setup is much easier when treated like a guided walkthrough instead of a one-night speedrun against six different apps.
