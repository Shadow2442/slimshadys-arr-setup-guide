<div class="guide-banner-frame">
  <img class="guide-banner-image" src="/slimshadys-arr-setup-guide/docs/assets/guide-banner.png" alt="SlimShady's ARR Setup Guide banner">
</div>

<div class="doc-hero">
  <h2>Chapter 1: Start Here</h2>
  <p>This chapter explains the goal of the setup, the moving parts, and the order you should follow before touching advanced language or archive rules.</p>
  <div class="hero-badges">
    <span>Big picture first</span>
    <span>Beginner path</span>
    <span>Advanced path</span>
    <span>Stack map</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/">Home</a>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-02-base-setup.html">Next chapter</a>
  <a href="/slimshadys-arr-setup-guide/docs/index.html">All docs</a>
</div>

## What This Setup Is

This guide builds a home-media automation stack around:

- `Sonarr` for TV and anime series
- `Radarr` for movies and anime movies
- `Lidarr` for music
- `SABnzbd` as the main Usenet downloader
- `Jackett` as optional torrent fallback
- `Plex` as the final playback library
- `Seerr` as an optional request and discovery frontend

The goal is not just “download things automatically.”

The goal is:

- clean folders
- predictable imports
- German-friendly language behavior
- compact archive files
- safe fallback when German is not available yet
- fewer bad surprises from parser guesses, wrong titles, and weird language releases

## The Reader Path

Use this order:

1. Build the base stack.
2. Confirm one movie and one episode can download, import, rename, and appear in Plex.
3. Add discovery and request tools.
4. Apply German-friendly and multi-language rules.
5. Apply archive and size rules.
6. Add the daily release-ladder automation.
7. Use the app reference pages when a specific tool needs fixing.

Do not begin with the clever parts. A sharp language profile on top of broken download folders is still broken, just wearing a nicer hat.

## Stack Flow

```mermaid
flowchart LR
    A["Discovery<br/>MDBList / Seerr / Manual Add"] --> B["ARR Apps<br/>Sonarr / Radarr / Lidarr"]
    B --> C["Search<br/>Usenet Indexers / Jackett"]
    C --> D["Download<br/>SABnzbd / qBittorrent"]
    D --> E["Import<br/>Rename / Organize / Validate"]
    E --> F["Plex<br/>Scan / Match / Play"]
    G["Daily Release Ladder"] --> B
    G --> E
```

## Core Rules

- Let ARR own naming and importing.
- Let Plex scan final library folders only.
- Use English fallback as a temporary bridge, not a final winner.
- Let German/Multi replace English even across normal quality-tier boundaries.
- Keep original-language lanes scoped to anime, Korean, and Chinese content.
- Unmonitor verified final-state keepers.
- Keep request approval manual for large requests.

## Continue

Next: [Chapter 2: Base Setup Step by Step](/slimshadys-arr-setup-guide/docs/chapter-02-base-setup.html)
