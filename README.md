# ARR Setup Guide for German-Friendly Automation

This is a practical beginner guide for setting up `Sonarr`, `Radarr`, and `SABnzbd` for a German-friendly media workflow without letting the system turn into a chaos goblin.

It focuses on:

- `Sonarr` for series and anime
- `Radarr` for movies and anime movies
- `SABnzbd` for Usenet downloads
- indexer strategy for German content
- language preference scoring
- file-size control
- safe downgrade workflows

This guide is based on a real-world setup that was tuned and tested live, not just copied from disconnected wiki pages.

## Quick Start

If you only want the short version:

- `Sonarr`: prefer `720p`, allow `1080p` fallback, use compact TV size limits
- `Radarr`: prefer compact `1080p`, disable `1080p remux` in the main profile
- `SABnzbd`: enable `Ignore samples`, clean junk files, blacklist executable extensions
- `NinjaCentral`: daily Usenet workhorse
- `NZBFinder`: strong secondary source with meaningful German coverage
- `NZB.su`: solid fallback
- `SceneNZBs`: German specialist, but preserve its quota

## Use Codex as a Setup Copilot

If you do not want to work through all of this manually, you can use `OpenAI Codex` to help with the configuration and implementation.

Practical use cases:

- inspect your current `Sonarr`, `Radarr`, and `SABnzbd` configuration
- compare your setup against this guide
- apply recommended changes step by step
- test indexers and priorities
- tune language scoring, size caps, and downgrade workflows
- troubleshoot strange ARR behavior

In other words:

- you can use this guide as the blueprint
- and use `Codex` to implement the setup into your own `Sonarr` and `Radarr` environment accordingly

That is often much easier than manually clicking through every ARR screen and hoping you did not accidentally teach your indexers to download interpretive nonsense.

## Repository Guide

This repository is split into a few simple pages:

- [Main Guide](README.md)
- [Setup Checklist](docs/setup-checklist.md)
- [Indexers and German Content Strategy](docs/indexers-and-german-content.md)
- [Quality, Sizes, and Downgrades](docs/quality-sizing-and-downgrades.md)

## Table of Contents

1. [First Principles](#1-first-principles)
2. [German Content Strategy](#2-german-content-strategy)
3. [Recommended Usenet Indexer Priority](#3-recommended-usenet-indexer-priority)
4. [SABnzbd Settings Worth Enabling](#4-sabnzbd-settings-worth-enabling)
5. [Sonarr Language Preference Setup](#5-sonarr-language-preference-setup)
6. [Radarr Language Preference Setup](#6-radarr-language-preference-setup)
7. [Prefer 720p for Series, 1080p for Movies](#7-prefer-720p-for-series-1080p-for-movies)
8. [Size Limits That Actually Make Sense](#8-size-limits-that-actually-make-sense)
9. [Safe Downgrade Workflow](#9-safe-downgrade-workflow)
10. [What We Learned from Testing Stargate](#10-what-we-learned-from-testing-stargate)
11. [Bulk Search and Quota Safety](#11-bulk-search-and-quota-safety)
12. [What to Watch For](#12-what-to-watch-for)
13. [Recommended Beginner Setup](#13-recommended-beginner-setup)
14. [Final Advice](#14-final-advice)

## 1. First Principles

- Use `Sonarr` for `TV series` and `anime series`
- Use `Radarr` for `movies` and `anime movies`
- Use `SABnzbd` as the primary downloader for Usenet
- Use torrents only as a fallback if needed
- Keep your library and completed download folders on the same drive if you want hardlinks to work efficiently

Recommended path philosophy:

- downloads and imports on the same filesystem
- separate categories for each ARR app
- avoid mixing library folders with download folders

Example categories:

- `tv` for `Sonarr`
- `movies` for `Radarr`

## 2. German Content Strategy

For German-friendly setups, not all indexers are equal.

### Practical indexer roles

- `SceneNZBs`: strongest specialist for German releases, but limited by a strict daily/rolling grab quota
- `NZBFinder`: very good broad indexer with meaningful German coverage
- `NinjaCentral`: strong broad workhorse with a high quota, but less German-specialized
- `NZB.su`: solid fallback indexer with broad coverage

### Recommended indexer mindset

Use broad indexers for normal traffic.

Reserve the German specialist for releases where it really matters.

That means:

- use `NinjaCentral` and `NZBFinder` as your main daily search sources
- let `NZB.su` act as fallback
- keep `SceneNZBs` available for German-specific wins, but do not burn its quota on bulk jobs

## 3. Recommended Usenet Indexer Priority

In Servarr apps, indexer priority uses:

- `1` = highest priority
- `50` = lowest priority

Important:

- priority is only a tiebreaker
- all enabled indexers are still searched

### Suggested priority order

For `Sonarr` and `Radarr`:

- `NinjaCentral = 15`
- `NZBFinder = 18`
- `NZB.su = 30`
- `SceneNZBs = 45`

Why:

- `NinjaCentral` has high quota and good breadth
- `NZBFinder` has better German usefulness than a generic broad source
- `NZB.su` is still useful, but less important once the first two are present
- `SceneNZBs` is too valuable to waste on high-volume background work

## 4. SABnzbd Settings Worth Enabling

Best immediate settings:

- `Ignore samples = enabled`
- `Cleanup List = nfo, sfv, srr, txt, jpg, jpeg, png, url`
- `Unwanted extensions = exe, com, cmd, bat, scr, pif`
- `Unwanted extensions mode = blacklist`

Why:

- sample files can interfere with manual imports and clutter
- junk metadata files add no value to media libraries
- executable files in media downloads are at best useless and at worst suspicious

## 5. Sonarr Language Preference Setup

Do not trust `MULTi` alone as proof of German audio.

`MULTi` is only a weak signal.

### Recommended preference order

For the universal `Sonarr` setup used here:

1. confirmed `German + Japanese` proven multi-audio
2. confirmed `German audio`
3. `English audio`
4. weak `multi-audio`
5. `Japanese audio + German subtitles`
6. other fallbacks

### Important principle

Do not rely on Sonarr’s parser language label alone for scoring.

Use custom formats and title logic instead.

### Recommended Sonarr custom formats

- `Language - German Parser Signal`
- `Language - German Title Terms`
- `Language - Dual Multi Audio`
- `Language - English Audio Fallback`
- `Language - Original Audio Fallback`
- `Language - Japanese Audio Fallback`
- `Subs - German Subtitles`
- `Subs - English Subtitles`
- `Language - German Japanese Proven Multi Audio`

### Suggested Sonarr scores

- `German Parser Signal = 0`
- `German Title Terms = 1600`
- `German Japanese Proven Multi Audio = 600`
- `English Audio Fallback = 500`
- `Dual Multi Audio = 300`
- `German Subtitles = 180`
- `English Subtitles = 120`
- `Japanese Audio Fallback = 50`
- `Original Audio Fallback = 75`

### Sonarr profile rules

Apply to all quality profiles:

- `upgradeAllowed = true`
- `minFormatScore = 0`
- `cutoffFormatScore = 1000`
- `minUpgradeFormatScore = 1`

## 6. Radarr Language Preference Setup

Use the same philosophy in `Radarr` as in `Sonarr`.

Recommended order:

1. confirmed `German + Japanese` proven multi-audio
2. confirmed `German audio`
3. `English audio`
4. weak `multi-audio`
5. `Japanese + German subtitles`

### Important Radarr rule

Set the built-in profile language to:

- `Any`

This prevents false trust in parser guesses like:

- `MULTi` accidentally being treated as confirmed `German`

## 7. Prefer 720p for Series, 1080p for Movies

Recommended default philosophy:

- `Series`: prefer `720p`, allow `1080p` fallback
- `Movies`: prefer compact `1080p`

### Sonarr profile behavior

For a normal series profile:

- put `720p` above `1080p`
- keep `1080p` checked as fallback
- use a delay profile if you want to wait for `720p` before grabbing `1080p`

Recommended delay for `720p-first` shows:

- `Usenet delay = 120 minutes`
- `Torrent delay = 180 minutes`

Apply only to tagged `720p-first` series, not globally.

## 8. Size Limits That Actually Make Sense

### Radarr movie sizes

Goal:

- good-looking `1080p`
- not giant remuxes
- manual exceptions for very large premium releases

Recommended:

- disable `Remux-1080p` in main movie profile

`1080p`:

- `preferred = 50`
- `max = 60`

`720p`:

- `HDTV-720p = preferred 18, max 35`
- `WEBDL-720p = preferred 18, max 35`
- `WEBRip-720p = preferred 20, max 35`
- `Bluray-720p = preferred 20, max 35`

### Sonarr episode sizes

Recommended:

`720p`:

- `HDTV-720p = preferred 14, max 28`
- `WEBDL-720p = preferred 14, max 28`
- `WEBRip-720p = preferred 16, max 30`
- `Bluray-720p = preferred 16, max 30`

`1080p`:

- `HDTV-1080p = preferred 22, max 38`
- `WEBDL-1080p = preferred 22, max 38`
- `WEBRip-1080p = preferred 24, max 42`
- `Bluray-1080p = preferred 24, max 42`

These values are much more realistic than the loose defaults if your goal is compact files.

## 9. Safe Downgrade Workflow

Downgrading is where people usually manage to save disk space and accidentally create a fresh new mess.

### Radarr downgrade workflow

Create a separate profile:

- `HD 720p downgrade`

Rules:

- prefer `720p`
- allow `1080p` fallback
- do not use it as your main profile

Use it only for:

- oversized existing movies
- low-priority or non-favorite titles
- small test batches first

Recommended workflow:

1. assign `HD 720p downgrade` to a small batch
2. run `Search Selected`
3. review imports
4. repeat if the results look good

### Sonarr downgrade workflow

If you create a `720p downgrade` lane in Sonarr, make it codec-aware.

Why:

- naive `1080p -> 720p` downgrades can increase size if the old file is compact `x265` and the new one is bloated `x264`

Recommended Sonarr downgrade extras:

- `Codec - HEVC x265 Bonus`
- `Codec - AVC x264 Penalty`

Suggested scores:

- `HEVC x265 Bonus = +2000`
- `AVC x264 Penalty = -2000`
- `minFormatScore = 1700`

This makes the downgrade profile behave more like:

- “save space”

and less like:

- “download lower resolution but somehow larger files”

## 10. What We Learned from Testing Stargate

`Stargate SG-1` was a great test case.

It showed that:

- `720p` does not always save space
- codec matters as much as resolution
- some old `1080p x265` files are already more compact than many `720p x264` replacements

Lesson:

- do not assume `720p` automatically means smaller
- always think in terms of `resolution + codec + bitrate + audio tracks`

## 11. Bulk Search and Quota Safety

Do not bulk-search everything at once unless you enjoy fighting with rate limits for sport.

### Good batch sizes

For movies:

- `10-20` at a time

For TV episodes:

- `5-10` at a time

### Why this matters

Some indexers, especially German specialists, have strict rolling-grab limits.

If you burn those limits in one burst:

- searches still work
- grabs fail with `429 Too Many Requests`
- Sonarr/Radarr temporarily disable the indexer

That is not a bug.

That is the indexer telling you to calm down.

## 12. What to Watch For

### Sample files

Use SAB’s `Ignore samples`.

### Split or multipart movie releases

Avoid releases with:

- `Teil 1`
- `Part 1`
- `CD1`
- `Disc 1`

These often trigger manual import headaches.

### Suspicious broad matches

If an indexer starts returning weird or irrelevant matches:

- test a few representative titles manually
- compare against your other indexers
- lower its priority if it adds more noise than value

## 13. Recommended Beginner Setup

If you want a simple starting point:

### Sonarr

- profile: `720p-first, 1080p fallback`
- German-aware custom format scoring
- delay profile for `720p-first` shows
- compact episode size caps

### Radarr

- profile: compact `1080p`
- `Remux-1080p` disabled
- German-aware custom format scoring
- separate `720p downgrade` profile for oversized movies only

### SABnzbd

- ignore samples
- clean junk files
- block executable extensions

### Indexers

- `NinjaCentral` for daily work
- `NZBFinder` as broad secondary source with decent German value
- `NZB.su` as fallback
- `SceneNZBs` for German-specialist coverage

## 14. Final Advice

Do not optimize everything at once.

The best ARR setups are built like this:

1. change one thing
2. test real titles
3. look at actual imports
4. then tune again

That is slower than random checkbox enthusiasm, but much less likely to end with your server downloading worse files more expensively.

## Sources and Inspiration

- [PCJones Usenet Guide](https://github.com/PCJones/usenet-guide#2-usenet-indexer)
- Servarr docs for `Sonarr`, `Radarr`, and indexer priorities
- real-world ARR tuning and live testing
