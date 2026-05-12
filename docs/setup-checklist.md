# ARR Setup Checklist

Use this as the short, practical checklist after installation.

This checklist is meant for people who are willing to configure things properly, but who do not want to become ARR archaeologists in the process.

## 1. Core Apps

- Install `SABnzbd`
- Install `Sonarr`
- Install `Radarr`
- Install `Plex`
- Install `Jackett` if you want torrent sources as well
- Keep downloads and libraries on the same drive if you want hardlinks

Optional:

- install `FlareSolverr` if some Jackett-backed torrent sites require challenge solving

## 1a. Understand the Flow

The normal end-to-end process is:

1. movie or series gets added manually or by `Import List`
2. `Sonarr` / `Radarr` searches the configured indexers
3. matching release is sent to `SABnzbd` or the torrent client
4. download completes and is unpacked
5. `Sonarr` / `Radarr` imports and renames the media
6. `Plex` scans the library and makes it available to watch

That is the full automation loop this guide is trying to support.

## 2. Categories

Create separate download categories:

- `tv` for `Sonarr`
- `movies` for `Radarr`

Make sure those categories point to folders that the ARR apps can access.

Also make sure Plex points to the final library folders, not the incomplete or temporary download paths.

## 3. SABnzbd

Enable:

- `Ignore samples`
- executable blacklist: `exe, com, cmd, bat, scr, pif`
- cleanup list: `nfo, sfv, srr, txt, jpg, jpeg, png, url`

## 4. Sonarr

Recommended default philosophy:

- prefer `720p`
- allow `1080p` fallback
- use compact TV size limits

Recommended extra settings:

- `Completed Download Handling = enabled`
- `Episode Title Required = never`
- delay profile for `720p-first` shows only

## 5. Radarr

Recommended default philosophy:

- compact `1080p`
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
- custom watchlists

The benefit:

- items are added automatically
- `Sonarr` and `Radarr` apply your rules automatically
- completed files land in the library automatically
- `Plex` picks them up automatically

## 7. Indexers

Recommended order for this German-friendly setup:

- `NinjaCentral`
- `NZBFinder`
- `NZB.su`
- `SceneNZBs`

Suggested priorities:

- `NinjaCentral = 15`
- `NZBFinder = 18`
- `NZB.su = 30`
- `SceneNZBs = 45`

Remember:

- lower number = higher priority
- priority is only a tiebreaker
- all enabled indexers are still searched

## 8. Language Strategy

Recommended universal preference:

1. proven `German + Japanese` multi-audio
2. confirmed `German audio`
3. `English audio`
4. weak `multi-audio`
5. `Japanese + German subtitles`

Important:

- do not trust `MULTi` alone as proof of German
- use custom formats and title logic instead

## 9. Movie Size Targets

Recommended:

`1080p`

- preferred `50`
- max `60`

`720p`

- `HDTV-720p = preferred 18, max 35`
- `WEBDL-720p = preferred 18, max 35`
- `WEBRip-720p = preferred 20, max 35`
- `Bluray-720p = preferred 20, max 35`

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
