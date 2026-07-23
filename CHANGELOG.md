# Changelog

All notable guide updates for `SlimShady's ARR Setup Guide` are tracked here.

## 2026-07-23

### Changed

- Added a mobile readability pass for the GitHub Pages guide after Reddit feedback.
- Tightened mobile spacing, converted dense grids to one-column layouts on small screens, wrapped code safely, and made tables stack into readable mobile cards.
- Added the mobile readability pass to the latest guide updates on the homepage.
- Added a related-guides section explaining how this practical setup guide fits next to TRaSH Guides and PCJones' German Usenet guide.
- Added TRaSH and PCJones positioning to the reference appendix and README so readers can quickly understand what to use each guide for.

## 2026-07-22

### Added

- Rebuilt the website around a proper chapter structure:
  - Chapter 1: Start Here
  - Chapter 2: Base Setup Step by Step
  - Chapter 3: Download Pipeline and Daily Automation
  - Chapter 4: German-Friendly Setup
  - Chapter 5: Multi-Language and Original-Language Setup
  - Chapter 6: Archive and Size Strategy
  - Chapter 7: Operations and Troubleshooting
  - Chapter 8: Reference Appendix
- Added explicit chapter coverage for Seerr request safety, Jackett tracker recovery, release-ladder automation, original-language lanes, archive targets, and bad-language cleanup.
- Added Chapter 9 for Codex-assisted setup, including a master prompt, safe download package, templates, and example automation scripts.
- Added a public GitHub guide feedback form for project questions, unclear guide sections, broken links, and suggestions, with a safety reminder not to post secrets or private details.
- Added a homepage AI setup copilot prompt so readers can give Codex or another on-machine AI the guide URL and be walked through the full setup step by step.

### Changed

- Reworked the homepage into a short introduction and chapter index instead of a long mixed landing page.
- Reworked the docs index into a chapter-first navigation hub with app-specific reference pages kept as secondary lookup material.
- Updated the GitHub Pages description to match the broader setup-guide scope.
- Expanded all eight setup chapters with practical background sections covering why each decision exists, how the stack behaves, what to configure, how to test it, and which failure modes to watch for.
- Added Plex API integration guidance for `Sonarr`, `Radarr`, and `Lidarr` using ARR `Connect` settings to trigger Plex library updates after imports, upgrades, renames, and deletes.
- Added a `downloads/` package area with setup templates, example scripts, placeholder config files, and a package manifest that explains what is safe to ship.

## 2026-06-06

### Added

- Added the current Sonarr language policy for normal TV, anime dubbed profiles, anime original-language/subbed profiles, and completed-season unmonitoring.
- Added the current Radarr compact fallback profile strategy:
  - `1080p compact DE/EN fallback`
  - `720p compact DE/EN fallback`
  - `1080p compact anime DE/EN/JP fallback`
  - `720p compact anime DE/EN/JP fallback`
- Added the bulk Radarr fallback-search workflow for released movies with no German or English file.
- Added shared quality-guide notes for English fallback, German replacement upgrades, anime Japanese fallback, and safe search chunking.

### Changed

- Documented why hard Radarr release-profile language locks should be disabled in favor of custom-format scoring.
- Documented the tightened German title-term logic so generic `DUBBED`, generic `MULTi`, and parser-only German signals do not falsely qualify weak releases.
- Documented the current compact Radarr caps of `8 GB` for `1080p` and `5 GB` for `720p` custom-format matching.
- Updated the README, homepage, and docs hub so the June language and fallback policy replaces the older May stability notes as the visible current guidance.

## 2026-05-20

### Added

- Added a real-world `Lucifer` case study to the Sonarr guide showing how a good German season can still get targeted by worse English-only source upgrades.
- Added documentation for a safer per-series `German lock` profile strategy in Sonarr.
- Added a homepage update table that shows what changed, when it changed, and which page to read for the updated guidance.

### Changed

- Clarified that compact `x265` releases should be preferred without accidentally locking out valid German `x264` releases.
- Added a cross-reference in the quality and downgrade guide so the language-protection lesson is easier to find from the storage-tuning side too.

## 2026-05-19

### Added

- Added explicit introduction boxes to the homepage and all main application guides.
- Expanded the app pages so they work better for non-technical readers, including download links, install guidance, basic setup flow, and deeper refinement sections.

### Changed

- Replaced the temporary banner confusion with the correct site banner and tightened the homepage top layout.
- Added guide counters, restored the homepage hero flow, and improved the overall landing-page presentation.

## 2026-05-18

### Added

- Added dedicated guide pages for `Sonarr`, `Radarr`, `Lidarr`, `Jackett`, `Plex`, and `SABnzbd`.
- Added a dedicated `German-friendly indexer strategy` section so regional logic can live in one place instead of leaking through the whole guide.

### Changed

- Reworked the docs landing page into a cleaner navigation hub with in-page guide links.
- Removed duplicate theme navigation and duplicate title clutter from the docs layout.
- Improved `Plex` documentation with clearer archival HDD library structure and setup guidance.

## 2026-05-17

### Added

- Added MDBList screenshots and clearer sample-list wording so the discovery setup reads as a recommended pattern rather than a personal dashboard dump.
- Added more polished visual treatment across the docs, including icons, framed content blocks, and better section rhythm.

### Fixed

- Fixed remaining raw markdown links so guide navigation points to rendered HTML pages instead of text-file trapdoors.
- Corrected the wording around `MDBList` so it is clearly described as a movie/show discovery tool rather than a music-discovery layer for `Lidarr`.

## 2026-05-16

### Changed

- Updated the guide with live-tested `SABnzbd` tuning that proved more stable in practice:
  - `Direct Unpack = off`
  - `connections = 14`
  - `receive_threads = 4`
  - `timeout = 45`
- Documented the practical ARR lessons from real queue and downgrade testing:
  - smaller downgrade waves are safer
  - `720p` bulk downgrades work well
  - `480p` is better as a curated/manual old-movie lane
  - compact keepers should often be unmonitored once you are happy with them

## 2026-05-15

### Changed

- Performed a final guide sanity pass to make the wording more consistent and less tied to one personal setup voice.
- Simplified the Pages configuration and removed redundant configuration clutter.

### Fixed

- Fixed remaining wording mismatches around live setup references and guide framing.

## 2026-05-14

### Added

- Added stronger homepage and subpage visual polish, including improved cards, flow sections, and decorative content blocks.

### Fixed

- Fixed remaining broken or stale internal documentation links.
