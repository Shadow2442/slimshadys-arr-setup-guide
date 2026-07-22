<div class="doc-hero">
  <h2>Chapter 2: Base Setup Step by Step</h2>
  <p>Install and connect the boring foundations first: folders, categories, download clients, ARR apps, Plex, Jackett, and Seerr.</p>
  <div class="hero-badges">
    <span>Folders</span>
    <span>Categories</span>
    <span>ARR apps</span>
    <span>Plex</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/chapter-01-start-here.html">Previous</a>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-03-download-pipeline.html">Next</a>
  <a href="/slimshadys-arr-setup-guide/">Home</a>
</div>

## Install Order

Use this order for the least confusion:

1. Create final library folders.
2. Install `SABnzbd`.
3. Install `Sonarr`, `Radarr`, and `Lidarr`.
4. Install `Plex`.
5. Add `Jackett` only if you want torrent fallback.
6. Add `Seerr` only after ARR profiles are sane.

## Folder and Category Basics

Keep temporary downloads separate from final libraries.

Recommended categories:

- `tv` for Sonarr
- `movies` for Radarr
- `music` for Lidarr

Recommended principle:

- downloader category folders are temporary work areas
- ARR imports into final library folders
- Plex watches final library folders

## Base App Setup

Use the app reference pages for details:

- [Sonarr Setup and Workflows](/slimshadys-arr-setup-guide/docs/sonarr-setup-and-workflows.html)
- [Radarr Setup and Workflows](/slimshadys-arr-setup-guide/docs/radarr-setup-and-workflows.html)
- [Lidarr Setup and Workflows](/slimshadys-arr-setup-guide/docs/lidarr-setup-and-workflows.html)
- [SABnzbd Tuning and Reliability](/slimshadys-arr-setup-guide/docs/sabnzbd-tuning-and-reliability.html)
- [Plex Setup and Workflows](/slimshadys-arr-setup-guide/docs/plex-setup-and-workflows.html)
- [Jackett Setup and Workflows](/slimshadys-arr-setup-guide/docs/jackett-setup-and-workflows.html)

## Seerr Request Frontend

Use `Jellyseerr`, `Overseerr`, or a similar tool as the request frontend.

Recommended:

- disable broad user auto-approval
- manually approve full-show or large requests
- avoid auto-monitoring every season by default
- send approved movies and series into the current standard profiles
- let Sonarr and Radarr still control search, language, import, rename, and upgrades

This prevents a friendly request from becoming hundreds of surprise queue items.

## Before Moving On

Confirm:

- one movie can download, import, rename, and appear in Plex
- one TV episode can download, import, rename, and appear in Plex
- Lidarr can import one album cleanly if you use music automation
- SAB categories are correct
- ARR apps do not import from incomplete folders

Next: [Chapter 3: Download Pipeline and Daily Automation](/slimshadys-arr-setup-guide/docs/chapter-03-download-pipeline.html)
