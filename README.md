# SlimShady's ARR Setup Guide

This is a practical chapter-based guide for setting up `Sonarr`, `Radarr`, `Lidarr`, `SABnzbd`, `Jackett`, `Seerr`, and `Plex` for a reliable home-media workflow without letting the system turn into a noisy pile of half-matched downloads.

It is written from the perspective of a Swiss movie aficionado who wants to preserve original versions of films while also making movies and series comfortable for family to watch in their native language.

It focuses on:

- `Sonarr` for series and anime
- `Radarr` for movies and anime movies
- `Lidarr` for music
- `SABnzbd` for Usenet downloads
- `Jackett` for optional torrent support
- `Plex` for final library playback
- language-aware automation
- file-size control
- safe downgrade workflows
- practical troubleshooting based on real testing

This guide is based on a real-world setup that was tuned and tested live, not just copied from disconnected wiki pages.

## Swiss Private-Use Context

This guide assumes Swiss private use: personal media organization, original-version preservation, and private family viewing.

Under Swiss copyright law, private use is treated differently from public distribution. The Swiss Federal Institute of Intellectual Property explains that downloading or streaming works for private use is allowed, including from illegal sources, while uploading or making works available online is not allowed. Article 19 of the Swiss Copyright Act defines private use to include personal use and use within a circle of closely connected people such as relatives or friends.

This guide is framed for private Swiss use, not public redistribution, commercial sharing, uploading, or running an open media service.

Sources:

- [Swiss Federal Institute of Intellectual Property: Copyright on the internet](https://www.ige.ch/en/protecting-your-ip/copyright/using-a-work/copyright-on-the-internet)
- [Fedlex: Federal Act on Copyright and Related Rights, Art. 19 Private use](https://www.fedlex.admin.ch/eli/cc/1993/1798_1798_1798/en)

## Latest Guide Updates

| Updated | What changed | Read it here |
| --- | --- | --- |
| `2026-07-22` | Rebuilt the website around a proper chapter structure: start here, base setup, download pipeline, German-friendly setup, multi-language/original-language setup, archive strategy, operations, and reference appendix. | [Docs Index](docs/index.md) |
| `2026-07-22` | Added the current daily ARR release-ladder automation: English bridge behavior, German/Multi replacement rules, anime and Korean/Chinese fallback lanes, blocked-language cleanup, and final-state unmonitoring. | [Quality, Sizes, and Downgrades](docs/quality-sizing-and-downgrades.md) |
| `2026-07-22` | Updated the `Sonarr` and `Radarr` profiles to document German `1080p` bridge releases, compact German final states, stricter language downgrade protection, and request-frontend safety. | [Sonarr Setup and Workflows](docs/sonarr-setup-and-workflows.md) |
| `2026-07-22` | Added explicit `Seerr` request safety and updated `Jackett` health/recovery guidance for torrent fallback sources. | [Setup Checklist](docs/setup-checklist.md) |
| `2026-07-22` | Added Jackett tracker recovery details for Cloudflare, rate limits, failed top-feed/no-query tests, and narrow ARR category mapping. | [Jackett Setup and Workflows](docs/jackett-setup-and-workflows.md) |

## Latest Language and Fallback Notes

The setup behind this guide was refined further after live `Sonarr` and `Radarr` language testing, including the daily release-ladder automation used in the reference setup.

The most useful real-world improvements were:

- `Sonarr` normal TV can use English only as a bridge when no German file exists yet
- German or German plus English multi-audio should beat English-only releases regardless of quality tier
- `Sonarr` may accept German `1080p` as a fast bridge, but compact German `720p` remains the archival target
- completed German/Multi final-state episodes and seasons can be unmonitored once verified
- `Radarr` normal movies now use compact `DE/EN` fallback profiles
- `Radarr` anime movies get separate compact `DE/EN/JP` fallback behavior
- hard Radarr release-profile language locks are replaced by custom-format scoring
- parser-only German, generic `MULTi`, and bare `DUBBED` no longer count as proof of German audio
- suspicious language markers such as `VFQ`, `VFF`, `TRUEFRENCH`, `EN-TR`, `TR-EN`, `TURG`, Turkish-only, Hebrew-only, and similar non-target signals should be blocked or heavily penalized

That combination made the live setup:

- better at downloading English when German is not available yet
- better at replacing English fallback with German later
- safer for anime original-language workflows
- less likely to grab releases that only look correct because of weak title parsing
- safer after import, because the automation checks actual parsed import language before replacing an existing file

## Background and Personal Experience

This guide was not written from the perspective of a full-time software developer trying to impress other developers.

It was built from the perspective of someone who:

- has technical experience
- works mainly in security
- is comfortable troubleshooting systems
- but does not live inside `Sonarr`, `Radarr`, `Lidarr`, `SABnzbd`, and indexer APIs every day

It was also refined with the support of `OpenAI Codex`, which helped inspect, compare, explain, test, and implement configuration changes step by step.

If you are non-technical or only lightly technical, the safest way to use this guide is:

- do it step by step
- use `OpenAI Codex` as your configuration assistant
- make one change at a time
- verify each change before moving on

## What This Setup Actually Includes

A practical home-media automation stack usually includes:

- `Sonarr` for series and anime series
- `Radarr` for movies and anime movies
- `Lidarr` for music and artist or album monitoring
- `SABnzbd` as the main Usenet downloader
- `Jackett` if you also want torrent indexers or mixed-source support
- one or more Usenet indexers for search and NZB retrieval
- `Plex` as the media server that watches the finished library and makes it available for playback

Optional but very useful additions:

- `Import Lists` in `Sonarr`, `Radarr`, and `Lidarr`
- `MDBList` as one of the easiest ways to build dynamic auto-import lists for movies and shows
- `Lidarr` import lists for music-oriented sources like `Last.fm` and `Headphones`
- `Jellyseerr`, `Overseerr`, or similar request and discovery frontends
- `FlareSolverr` if some torrent sites behind `Jackett` need anti-bot handling

## Download Links

Core apps used in this guide:

| App | Purpose | Download |
| --- | --- | --- |
| `Sonarr` | TV series and anime automation | [sonarr.tv](https://sonarr.tv/#download) |
| `Radarr` | Movie and anime movie automation | [radarr.video](https://radarr.video/#download) |
| `Lidarr` | Music automation | [lidarr.audio](https://lidarr.audio/#download) |
| `SABnzbd` | Main Usenet downloader | [sabnzbd.org/downloads](https://sabnzbd.org/downloads) |
| `Jackett` | Torrent indexer bridge | [GitHub Releases](https://github.com/Jackett/Jackett/releases) |
| `Plex` | Media server and playback | [plex.tv/media-server-downloads](https://www.plex.tv/media-server-downloads/) |
| `FlareSolverr` | Optional helper for protected torrent sites | [GitHub Releases](https://github.com/FlareSolverr/FlareSolverr/releases) |

Optional:

| App | Purpose | Download |
| --- | --- | --- |
| `OpenAI Codex` | Optional configuration assistant and implementation copilot | [Codex overview](https://openai.com/academy/codex/) |
| `Jellyseerr` | Requests and discovery frontend | [GitHub](https://github.com/Fallenbagel/jellyseerr) |
| `Prowlarr` | Central indexer management across ARR apps | [prowlarr.com](https://prowlarr.com/) |

## How the Full Automation Flow Works

At a high level, the process looks like this:

1. You add a movie, series, artist, or album manually, or it gets added through an `Import List`
2. `Sonarr`, `Radarr`, or `Lidarr` checks your profiles, custom formats, language scoring, and indexers
3. The ARR app searches your configured sources
4. A matching NZB or torrent is sent to the download client
5. `SABnzbd` or your torrent client downloads and unpacks the release
6. the ARR app imports the file into the final library folder according to your naming, quality, and upgrade rules
7. `Plex` scans the library folders, scrapes metadata, and updates the libraries
8. The media is ready to watch or listen to without further manual work

## Daily Release-Ladder Automation

The reference setup also uses a daily ARR maintenance run that checks monitored movies and episodes against the language ladder.

The automation does four jobs:

- find missing movies, episodes, and weak English fallback files that are already released
- search in throttled batches so indexer quotas are not burned in one noisy wave
- download the best currently available release according to the language ladder
- verify imports, clean bad blocked-language grabs, and unmonitor final compact German/Multi keepers

The current operating rules are:

- if no file exists, accept English only when no better German/Multi candidate exists
- if a German/Multi candidate exists, prefer it over English even when the English file has a higher quality tier
- for normal TV, use German/Multi `1080p` as a speed bridge, but keep compact German/Multi `720p` as the final archival state
- for movies, prefer compact German/Multi `1080p` and avoid `2160p`, remux, or wrong-title same-year traps unless chosen manually
- for anime, prefer German dub or German multi, then English dub plus original audio, then German-subbed original audio, then best original Japanese when no clear subtitle proof exists
- for Korean and Chinese titles, allow original audio with English subtitles as the fallback path, then English dub, then German dub or German/Multi as the final target
- when a new German episode is found, scan earlier episodes in the same show or season because German catch-up releases often arrive together
- once a file reaches its final verified state, unmonitor it so ARR does not keep poking a finished item

The automation should also self-heal important settings drift, including German parser/title scores, compact size caps, selected release-group bonuses such as `FuN`, profile cutoffs, and blocked-language markers.

## Seerr Request Frontend Safety

Request frontends such as `Jellyseerr` and `Overseerr` are useful, but they should not be allowed to bypass the careful ARR rules.

Recommended policy:

- disable broad user auto-approval
- manually approve large requests, especially full TV shows
- do not auto-monitor every season by default unless you really want the whole show
- route approved movies and series into the current standard ARR profiles
- let `Radarr` and `Sonarr` own the final download, import, rename, and language logic

This prevents one friendly request from becoming hundreds of surprise downloads, while still keeping Seerr useful as the front door for discovery.

## Jackett Health and Torrent Fallback

`Jackett` is covered in its own setup page, but the current live rule is worth repeating: keep it selective.

Use Jackett for torrent fallback, not as the primary search engine for everything. Test noisy or flaky trackers manually, disable sources that cause repeated ARR health warnings, and only re-enable them after both a normal search and a no-query/top-feed style test are healthy again.

For tracker categories, keep the categories narrow and relevant to the ARR app. For movie use, that usually means movie/video categories only, not every category a tracker exposes.

## Regional and Language-Specific Strategy

The core setup in this guide is intentionally general.

If you want a German-friendly stack with:

- German-focused provider roles
- language scoring ideas for `Sonarr` and `Radarr`
- quota-aware source priorities
- practical notes for German audio, multi-audio, and title matching

use the dedicated specialist page:

- [Indexers and German Content Strategy](docs/indexers-and-german-content.md)

That page holds the German-specific material so the rest of the guide can stay broadly useful for readers who are not building around German content.

## Quick Start

If you only want the short version:

- `Sonarr`: allow English only as a bridge, prefer German/Multi upgrades, allow German `1080p` bridge releases, and archive at compact German/Multi `720p`
- `Radarr`: prefer compact German/Multi `1080p`, allow English fallback only when no file or German candidate exists, and protect against wrong same-year title matches
- `Lidarr`: use it for artists and albums, with its own quality and metadata flow
- `SABnzbd`: enable `Ignore samples`, clean junk files, blacklist executable extensions, keep `Direct Unpack` off, and use modestly tuned server settings
- use broad, healthy providers for daily work
- keep specialist or low-quota providers as selective backups
- keep request frontends such as `Jellyseerr` on manual approval for large requests, especially full-series imports

## Use Codex as a Setup Copilot

If you do not want to work through all of this manually, you can use `OpenAI Codex` to help with the configuration and implementation.

Useful official links:

- [What is Codex?](https://openai.com/academy/what-is-codex)
- [Codex overview and getting started](https://openai.com/academy/codex/)
- [Introducing the Codex app](https://openai.com/index/introducing-the-codex-app/)

Practical use cases:

- inspect your current `Sonarr`, `Radarr`, `Lidarr`, and `SABnzbd` configuration
- compare your setup against this guide
- apply recommended changes step by step
- test indexers and priorities
- tune language scoring, size caps, and downgrade workflows
- troubleshoot strange ARR behavior

## Repository Guide

This repository is now organized in two layers:

- chapter pages for the main setup guide
- reference pages for individual apps and specialist topics

Recommended chapter path:

- [Chapter 1: Start Here](docs/chapter-01-start-here.md)
- [Chapter 2: Base Setup Step by Step](docs/chapter-02-base-setup.md)
- [Chapter 3: Download Pipeline and Daily Automation](docs/chapter-03-download-pipeline.md)
- [Chapter 4: German-Friendly Setup](docs/chapter-04-german-friendly.md)
- [Chapter 5: Multi-Language and Original-Language Setup](docs/chapter-05-multilanguage-original-language.md)
- [Chapter 6: Archive and Size Strategy](docs/chapter-06-archive-size.md)
- [Chapter 7: Operations and Troubleshooting](docs/chapter-07-operations-troubleshooting.md)
- [Chapter 8: Reference Appendix](docs/chapter-08-reference.md)

App and topic references:

- [Setup Checklist](docs/setup-checklist.md)
- [Sonarr Setup and Workflows](docs/sonarr-setup-and-workflows.md)
- [Radarr Setup and Workflows](docs/radarr-setup-and-workflows.md)
- [Lidarr Setup and Workflows](docs/lidarr-setup-and-workflows.md)
- [SABnzbd Tuning and Reliability](docs/sabnzbd-tuning-and-reliability.md)
- [Jackett Setup and Workflows](docs/jackett-setup-and-workflows.md)
- [Plex Setup and Workflows](docs/plex-setup-and-workflows.md)
- [MDBList Import Lists](docs/mdblist-import-lists.md)
- [Indexers and German Content Strategy](docs/indexers-and-german-content.md)
- [Quality, Sizes, and Downgrades](docs/quality-sizing-and-downgrades.md)
- request frontend safety is covered in this README and the setup checklist

## Recommended Reading Order

1. [Start Here](docs/chapter-01-start-here.md)
2. [Base Setup Step by Step](docs/chapter-02-base-setup.md)
3. [Download Pipeline and Daily Automation](docs/chapter-03-download-pipeline.md)
4. [German-Friendly Setup](docs/chapter-04-german-friendly.md)
5. [Multi-Language and Original-Language Setup](docs/chapter-05-multilanguage-original-language.md)
6. [Archive and Size Strategy](docs/chapter-06-archive-size.md)
7. [Operations and Troubleshooting](docs/chapter-07-operations-troubleshooting.md)
8. [Reference Appendix](docs/chapter-08-reference.md)

## Core Principles

- Keep downloads and final libraries on the same drive if you want hardlinks to work efficiently
- Use categories that match each ARR app cleanly
- Let the ARR apps handle naming and importing
- Let `Plex` handle scraping, library presentation, and playback
- Let fallback downloads be temporary bridges, not permanent winners
- Verify actual import language before deleting or replacing an existing good file
- Keep your main setup general, and add specialist language strategy only when you really need it
- Change one thing at a time and test on real titles before you declare victory

## Sources and Inspiration

- [PCJones Usenet Guide](https://github.com/PCJones/usenet-guide#2-usenet-indexer)
- Servarr docs for `Sonarr`, `Radarr`, `Lidarr`, and indexer priorities
- real-world ARR tuning and live testing
- practical debugging of quota limits, failed grabs, language mismatches, and import problems

In other words:

- part documentation
- part experimentation
- part cleanup after ARR tools did something technically logical and practically ridiculous
