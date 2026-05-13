# Lidarr Setup and Workflows

<div class="doc-hero">
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

## What Lidarr Should Do in This Stack

In this setup, `Lidarr` is responsible for:

- artists
- albums
- music-library imports
- music-specific metadata flow
- music-oriented import lists

Its role is not to imitate `Sonarr` or `Radarr`.

Its role is to:

- monitor artists and albums cleanly
- keep music downloads in a separate category
- organize the library in a way your music player understands

## Recommended Philosophy

The simplest working Lidarr philosophy is:

- keep music in its own download category, such as `music`
- let Lidarr manage music naming and metadata
- avoid overcomplicating quality rules on day one

Music automation becomes much easier once you stop trying to make it behave like episodic video automation.

## Quality Approach

Lidarr is not about `720p` vs `1080p`.

The practical decision is usually:

- lossless
- lossy
- or a mixed library

For a beginner-friendly stack:

- choose a consistent music-quality philosophy
- keep it simple at first
- let Lidarr enforce it rather than improvising manually forever

## Import Lists and Discovery

`MDBList` is not the right discovery layer for `Lidarr`.

For music, use music-oriented sources like:

- `Last.fm`
- `Headphones`

That keeps discovery aligned with the type of library you are actually building.

## Categories and Paths

Keep the downloader category separate:

- `music`

And keep the final library path separate from:

- temporary downloads
- TV folders
- movie folders

This avoids crossover clutter and keeps import logic sane.

## Recommended Step-by-Step

1. Create the `music` category in the downloader.
2. Point Lidarr at the correct final music library root.
3. Choose a simple quality philosophy.
4. Add artists or import lists from music-specific sources.
5. Let Lidarr handle naming and organization instead of doing it by hand.

That is enough to get a practical music lane online without turning the setup into a side project inside the side project.
