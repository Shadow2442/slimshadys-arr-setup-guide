# SlimShady's ARR Setup Guide

This is a practical beginner guide for setting up `Sonarr`, `Radarr`, `Lidarr`, `SABnzbd`, `Jackett`, and `Plex` for a reliable home-media workflow without letting the system turn into a noisy pile of half-matched downloads.

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

## Latest Language and Fallback Notes

The setup behind this guide was refined further after live `Sonarr` and `Radarr` language testing.

The most useful real-world improvements were:

- `Sonarr` normal TV now prefers German `720p`, with English fallback only where it is still useful
- `Sonarr` anime now uses separate `DE` and `JAP/subbed` `720p` profiles
- completed German `720p` seasons can be unmonitored once they reach final state
- `Radarr` normal movies now use compact `DE/EN` fallback profiles
- `Radarr` anime movies get separate compact `DE/EN/JP` fallback profiles
- hard Radarr release-profile language locks are replaced by custom-format scoring
- parser-only German, generic `MULTi`, and bare `DUBBED` no longer count as proof of German audio

That combination made the live setup:

- better at downloading English when German is not available yet
- better at replacing English fallback with German later
- safer for anime original-language workflows
- less likely to grab releases that only look correct because of weak title parsing

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
- `Jellyseerr` or similar request or discovery frontends
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

- `Sonarr`: prefer German `720p` for normal TV, allow English fallback where useful, and use separate `DE` and `JAP/subbed` anime profiles
- `Radarr`: prefer compact `1080p`, use `DE/EN` fallback for normal movies, and use `DE/EN/JP` fallback only for anime movies
- `Lidarr`: use it for artists and albums, with its own quality and metadata flow
- `SABnzbd`: enable `Ignore samples`, clean junk files, blacklist executable extensions, keep `Direct Unpack` off, and use modestly tuned server settings
- use broad, healthy providers for daily work
- keep specialist or low-quota providers as selective backups

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

This repository is split into clear app and topic pages:

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

## Recommended Reading Order

1. [Setup Checklist](docs/setup-checklist.md)
2. [Sonarr Setup and Workflows](docs/sonarr-setup-and-workflows.md)
3. [Radarr Setup and Workflows](docs/radarr-setup-and-workflows.md)
4. [Lidarr Setup and Workflows](docs/lidarr-setup-and-workflows.md)
5. [SABnzbd Tuning and Reliability](docs/sabnzbd-tuning-and-reliability.md)
6. [Jackett Setup and Workflows](docs/jackett-setup-and-workflows.md)
7. [Plex Setup and Workflows](docs/plex-setup-and-workflows.md)
8. [MDBList Import Lists](docs/mdblist-import-lists.md)
9. [Indexers and German Content Strategy](docs/indexers-and-german-content.md)
10. [Quality, Sizes, and Downgrades](docs/quality-sizing-and-downgrades.md)

## Core Principles

- Keep downloads and final libraries on the same drive if you want hardlinks to work efficiently
- Use categories that match each ARR app cleanly
- Let the ARR apps handle naming and importing
- Let `Plex` handle scraping, library presentation, and playback
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
