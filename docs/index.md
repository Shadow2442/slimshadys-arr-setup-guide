# Guide Map

<div class="doc-hero">
  <h2>The supporting-docs front door</h2>
  <p>This page is the quick map for the full guide system. The homepage is the polished introduction, while this page is the fast route for readers who want the docs structure directly.</p>
  <div class="hero-badges">
    <span>Clear reading order</span>
    <span>App-by-app docs</span>
    <span>German-friendly setup</span>
    <span>Real tested advice</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/setup-checklist.html">Checklist</a>
  <a href="/slimshadys-arr-setup-guide/docs/sonarr-setup-and-workflows.html">Sonarr</a>
  <a href="/slimshadys-arr-setup-guide/docs/radarr-setup-and-workflows.html">Radarr</a>
  <a href="/slimshadys-arr-setup-guide/docs/sabnzbd-tuning-and-reliability.html">SAB</a>
  <a href="/slimshadys-arr-setup-guide/">Home</a>
</div>

<div class="info-grid">
  <div class="info-card">
    <h3>Best use</h3>
    <p>Use this page when you want the shortest route to the specific part of the stack you are configuring, fixing, or trying not to accidentally weaponize.</p>
  </div>
  <div class="info-card">
    <h3>Main outcome</h3>
    <p>A clearer reading order, cleaner topic separation, and easier handoff to Codex or another human without sending them into a documentation hedge maze.</p>
  </div>
</div>

<div class="mini-grid">
  <div class="mini-card">
    <h4>Start here</h4>
    <p>Use the checklist first if you are building the stack from scratch or doing a major reset.</p>
  </div>
  <div class="mini-card">
    <h4>Then split by app</h4>
    <p>Read the dedicated Sonarr, Radarr, and SAB pages when you want practical app-by-app tuning.</p>
  </div>
  <div class="mini-card">
    <h4>Keep the rest nearby</h4>
    <p>Use the indexer, MDBList, and quality pages as shared strategy references across the whole stack.</p>
  </div>
</div>

## Start Here

- [Full Guide on GitHub](https://github.com/Shadow2442/slimshadys-arr-setup-guide#readme)
- [Setup Checklist](/slimshadys-arr-setup-guide/docs/setup-checklist.html)
- [Sonarr Setup and Workflows](/slimshadys-arr-setup-guide/docs/sonarr-setup-and-workflows.html)
- [Radarr Setup and Workflows](/slimshadys-arr-setup-guide/docs/radarr-setup-and-workflows.html)
- [SABnzbd Tuning and Reliability](/slimshadys-arr-setup-guide/docs/sabnzbd-tuning-and-reliability.html)
- [MDBList Import Lists](/slimshadys-arr-setup-guide/docs/mdblist-import-lists.html)
- [Indexers and German Content Strategy](/slimshadys-arr-setup-guide/docs/indexers-and-german-content.html)
- [Quality, Sizes, and Downgrades](/slimshadys-arr-setup-guide/docs/quality-sizing-and-downgrades.html)

## What This Guide Covers

- general ARR setup order
- dedicated `Sonarr` workflow guidance
- dedicated `Radarr` workflow guidance
- dedicated `SABnzbd` tuning and reliability guidance
- German-friendly indexer strategy
- `MDBList` discovery workflows
- compact quality and sizing rules
- safer downgrade workflows
- practical lessons from live testing

## Recommended Reading Order

1. [Setup Checklist](/slimshadys-arr-setup-guide/docs/setup-checklist.html)
2. [Sonarr Setup and Workflows](/slimshadys-arr-setup-guide/docs/sonarr-setup-and-workflows.html)
3. [Radarr Setup and Workflows](/slimshadys-arr-setup-guide/docs/radarr-setup-and-workflows.html)
4. [SABnzbd Tuning and Reliability](/slimshadys-arr-setup-guide/docs/sabnzbd-tuning-and-reliability.html)
5. [Indexers and German Content Strategy](/slimshadys-arr-setup-guide/docs/indexers-and-german-content.html)
6. [MDBList Import Lists](/slimshadys-arr-setup-guide/docs/mdblist-import-lists.html)
7. [Quality, Sizes, and Downgrades](/slimshadys-arr-setup-guide/docs/quality-sizing-and-downgrades.html)
8. [Full Guide on GitHub](https://github.com/Shadow2442/slimshadys-arr-setup-guide#readme)

## Quick Philosophy

- Use broad indexers for daily work.
- Preserve specialist German sources for when they really matter.
- Prefer `720p` for series and compact `1080p` for movies.
- Treat `480p` as a curated old-movie lane rather than a magical bulk shortcut.
- Let `Lidarr` handle music with its own sources and workflow.

If a setting sounds too clever, test it on a few titles before unleashing it on the whole library. Your hard drive will thank you, and SAB might stop composing little tragedies. 
