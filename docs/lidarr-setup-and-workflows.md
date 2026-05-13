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
  <h2>Music automation without pretending music works like movies</h2>
  <p>This page covers the practical role of <code>Lidarr</code> in the stack: what it should do, how it differs from Sonarr and Radarr, how to think about artist and album monitoring, and how to keep its workflow clean instead of forcing music into video-style habits.</p>
  <div class="hero-badges">
    <span>Artists and albums</span>
    <span>Music-specific import lists</span>
    <span>Separate categories</span>
    <span>Metadata-friendly workflow</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/setup-checklist.html">Checklist</a>
  <a href="/slimshadys-arr-setup-guide/docs/sonarr-setup-and-workflows.html">Sonarr</a>
  <a href="/slimshadys-arr-setup-guide/docs/radarr-setup-and-workflows.html">Radarr</a>
  <a href="/slimshadys-arr-setup-guide/docs/sabnzbd-tuning-and-reliability.html">SAB</a>
  <a href="/slimshadys-arr-setup-guide/docs/plex-setup-and-workflows.html">Plex</a>
  <a href="/slimshadys-arr-setup-guide/">Home</a>
</div>

<div class="info-grid">
  <div class="info-card">
    <h3>Main outcome</h3>
    <p>A cleaner music workflow where artists and albums are monitored properly, metadata stays sane, and music does not get jammed into movie-style logic just because the apps share the same family name.</p>
  </div>
  <div class="info-card">
    <h3>Core idea</h3>
    <p>Use Lidarr for music only, keep its downloader category separate, and let music-specific discovery sources drive what gets added.</p>
  </div>
</div>

<div class="mini-grid">
  <div class="mini-card">
    <h4>Best use</h4>
    <p>Use this page when adding music automation to the stack or when you want a clear explanation of what Lidarr should and should not try to do.</p>
  </div>
  <div class="mini-card">
    <h4>Main risk avoided</h4>
    <p>Forcing music into the same logic as TV and movies, or building a discovery flow that looks clever but constantly imports the wrong kind of chaos.</p>
  </div>
  <div class="mini-card">
    <h4>Cross-link</h4>
    <p>Pair this with the SAB page for downloader stability and the checklist page for folder and category basics.</p>
  </div>
</div>

<div class="intro-box">
  <h3>Introduction</h3>
  <p>This page explains Lidarr as its own kind of tool, not as a weird cousin of the movie and TV apps. Read it from top to bottom if you are new: what it does, how to install it, how to organize the music side properly, and only then how to refine the workflow.</p>
  <p>The goal is to get one clean music lane running without accidentally dragging music into your movie logic or drowning in metadata chaos on day one.</p>
</div>

## What Lidarr Is and Why You Need It

`Lidarr` is the ARR app for music.

In a healthy stack, Lidarr should:

- monitor artists and albums
- search for wanted albums
- send downloads to the downloader
- import and organize music cleanly
- keep music metadata and folder structure consistent

Its role is not to imitate Sonarr or Radarr. Music has different discovery patterns, different quality decisions, and a very different relationship to metadata.

## Download Lidarr

- Official site: [lidarr.audio](https://lidarr.audio/)
- Direct download page: [lidarr.audio/#download](https://lidarr.audio/#download)

For Windows, the standard installer is the easiest place to begin.

## Install Lidarr Step by Step

1. Download the current installer from the Lidarr site.
2. Run the installer and let it install the app and service.
3. Open Lidarr in your browser, usually on `http://localhost:8686`.
4. Confirm the dashboard loads cleanly.
5. Before adding a giant artist wishlist, get the base folders and category right.

The safe order is:

- create the final music library folder
- create a separate downloader category for music
- connect Lidarr to the downloader
- connect Lidarr to the sources you want to use

## Basic Configuration First

Before you worry about perfect quality philosophy, get these basics in place:

- final music root folder
- downloader connection
- music category
- naming and metadata settings

Recommended final library idea:

- final library: `F:\media\music`

Recommended downloader category:

- `music`

Keep music isolated from TV and movie categories. That sounds obvious, but mixed categories are how automation starts dressing albums like season packs.

## Base Settings I Recommend

### Media Management

Let Lidarr handle:

- artist folders
- album folders
- track naming
- metadata cleanup

The point is to end up with a music library that your player understands immediately.

### Download Client

Connect Lidarr to your downloader and verify:

- host and port are correct
- category is `music`
- test passes

If the test fails, fix that before you spend any time on artist monitoring or list imports.

### Sources and Discovery

Unlike movies and shows, `MDBList` is not the right discovery layer here.

For music, use music-oriented sources like:

- `Last.fm`
- `Headphones`

That keeps discovery aligned with the type of library you are actually building.

## Recommended Philosophy

The simplest working Lidarr philosophy is:

- keep music in its own download category
- let Lidarr manage naming and metadata
- avoid overcomplicating quality rules on day one

Music automation becomes much easier once you stop trying to make it behave like episodic video automation.

## Quality Approach

Lidarr is not about `720p` versus `1080p`.

The practical decision is usually:

- lossless
- lossy
- or a mixed library

For a beginner-friendly stack:

- choose one clear music-quality philosophy
- keep it simple at first
- let Lidarr enforce it instead of improvising manually forever

## Recommended Refinements and Enhancements

Once the basic setup works, the most useful refinements are:

- keeping music in its own category
- using music-specific discovery sources
- letting Lidarr own metadata and naming
- resisting the temptation to overbuild quality rules before the workflow is stable

This page is intentionally less aggressive than the Sonarr and Radarr pages because music automation gets messy fast when you try to be too clever too early.

## Folder and Library Layout

Recommended final layout:

```text
F:\
  media\
    music\
      Artist Name\
        Album Title\
          01 - Track Name.ext
```

Keep temporary downloads outside the final music library. Lidarr should import into the final path only after the download is actually ready.

## Common Mistakes

Watch out for:

- mixing music into the TV or movie category
- expecting `MDBList` to solve music discovery
- skipping metadata cleanup and naming
- overcomplicating quality logic before the basic flow works

Music libraries go weird in quieter ways than movie libraries, but they absolutely still go weird.

## Recommended Step-by-Step

1. Download and install Lidarr.
2. Create the final music library root.
3. Create the `music` category in the downloader.
4. Connect Lidarr to the downloader and test it.
5. Turn on clean naming and metadata handling.
6. Choose a simple quality philosophy.
7. Add artists manually or from music-specific discovery sources.
8. Let Lidarr own organization instead of doing it by hand.

That is enough to get a practical music lane online without turning the setup into a side project inside the side project.


