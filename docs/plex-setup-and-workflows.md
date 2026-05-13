<div class="doc-hero">
  <h2>The final library layer that should feel boring in the best way</h2>
  <p>This page covers the practical role of <code>Plex</code> in the stack: where it sits, what it should do, what ARR should do instead, and how to keep the final playback library clean and dependable.</p>
  <div class="hero-badges">
    <span>Final library layer</span>
    <span>Metadata and playback</span>
    <span>Clean folder boundaries</span>
    <span>ARR handles imports first</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/setup-checklist.html">Checklist</a>
  <a href="/slimshadys-arr-setup-guide/docs/radarr-setup-and-workflows.html">Radarr</a>
  <a href="/slimshadys-arr-setup-guide/docs/sonarr-setup-and-workflows.html">Sonarr</a>
  <a href="/slimshadys-arr-setup-guide/docs/lidarr-setup-and-workflows.html">Lidarr</a>
  <a href="/slimshadys-arr-setup-guide/">Home</a>
</div>

<div class="info-grid">
  <div class="info-card">
    <h3>Main outcome</h3>
    <p>Plex watches the right final library folders, scrapes clean metadata, and stays focused on presentation and playback instead of becoming a reluctant file-management assistant.</p>
  </div>
  <div class="info-card">
    <h3>Core idea</h3>
    <p>Let ARR apps import, rename, and organize. Let Plex scan, present, and play. When those roles stay separate, the whole stack behaves much more politely.</p>
  </div>
</div>

<div class="mini-grid">
  <div class="mini-card">
    <h4>Best use</h4>
    <p>Use this page when wiring Plex into the stack or when your library folders and scan behavior need a sanity check.</p>
  </div>
  <div class="mini-card">
    <h4>Main risk avoided</h4>
    <p>Pointing Plex at temporary download folders, mixing staging paths with final libraries, or letting the playback layer inherit downloader chaos.</p>
  </div>
  <div class="mini-card">
    <h4>Cross-link</h4>
    <p>Pair this with the checklist and the Sonarr, Radarr, and Lidarr pages so the file flow into Plex stays clean from the start.</p>
  </div>
</div>

## What Plex Should Do in This Stack

In this setup, `Plex` should:

- watch the final movie, series, and music libraries
- scrape metadata
- present the media cleanly
- provide playback

Its role is not to:

- manage temporary downloads
- guess around bad importer behavior
- clean up folders the ARR apps should already have organized

## Recommended Philosophy

Use Plex as the final presentation and playback layer.

That means:

- `Sonarr`, `Radarr`, and `Lidarr` import and rename first
- `Plex` scans the finished library second

That division of labor is one of the simplest ways to keep the whole stack understandable.

## Recommended Archival HDD Layout

For an archival HDD setup, keep the final library simple, boring, and separate from every temporary path.

A practical example looks like this:

```text
F:\
  media\
    movies\
      Movie Title (Year)\
        Movie Title (Year).ext
    series\
      Series Title\
        Season 01\
          Series Title - S01E01.ext
    music\
      Artist Name\
        Album Title\
          01 - Track Name.ext
  downloads-temporary\
    incomplete\
    complete\
```

The important rule is:

- `Plex` points only at `F:\media\movies`, `F:\media\series`, and `F:\media\music`
- `SABnzbd` and any torrent client use the temporary download side
- `Sonarr`, `Radarr`, and `Lidarr` move files from temporary paths into the final library

That keeps the archival drive tidy and makes future migrations, backups, and sanity checks much less annoying.

## Folder Boundaries

Plex should point at:

- final movie library folders
- final TV library folders
- final music library folders

Plex should **not** point at:

- temporary download folders
- incomplete paths
- staging or repair folders

If you point Plex at a messy downloader path, Plex will loyally index your bad decisions with great enthusiasm.

## Why This Matters

When ARR handles naming and organization correctly:

- Plex metadata matching is cleaner
- duplicate confusion is lower
- playback feels smoother
- the whole stack becomes more boring in the healthy way

That boringness is a compliment.

## Recommended Step-by-Step

1. Create the final archival library roots for movies, series, and music on the HDD.
2. Keep temporary and incomplete download paths outside those final library roots.
3. Let `Sonarr`, `Radarr`, and `Lidarr` own the import and rename logic.
4. In Plex, create separate libraries for movies, series, and music.
5. Point each Plex library only at its final ARR-managed folder.
6. Run a first scan and verify metadata matching on a few known-good imports.
7. Check that Plex is not indexing temporary folders, samples, failed downloads, or staging leftovers.
8. Only after that, treat the library structure as production-ready.

If those basics are clean, Plex usually becomes the easiest part of the whole stack.

