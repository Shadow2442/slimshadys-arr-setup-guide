<div class="doc-hero">
  <h2>Chapter 3: Download Pipeline and Daily Automation</h2>
  <p>This chapter explains how discovery, search, downloads, imports, Plex scans, and the daily release ladder fit together.</p>
  <div class="hero-badges">
    <span>Import lists</span>
    <span>RSS</span>
    <span>Queue flow</span>
    <span>Release ladder</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/chapter-02-base-setup.html">Previous</a>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-04-german-friendly.html">Next</a>
  <a href="/slimshadys-arr-setup-guide/">Home</a>
</div>

## Normal Flow

The daily stack works like this:

1. A title is added manually, through `MDBList`, or through Seerr.
2. Sonarr, Radarr, or Lidarr applies the correct root folder and profile.
3. RSS or manual search finds a candidate.
4. SABnzbd or qBittorrent downloads it.
5. ARR imports and renames it.
6. Plex scans the final library folder.

## Discovery Sources

Use:

- `MDBList` for movie and series discovery
- Seerr for user requests
- manual adds for special cases
- Lidarr-native lists for music

Read more:

- [MDBList Import Lists](/slimshadys-arr-setup-guide/docs/mdblist-import-lists.html)

## Daily Release-Ladder Automation

The daily automation checks released monitored items and existing fallback files.

It should:

- find missing released movies and episodes
- find English fallback files that can now be upgraded
- search in quota-aware batches
- choose German/Multi over English when available
- validate imports before replacing existing files
- clean blocked-language downloads
- unmonitor final-state compact keepers

Recommended external API budget:

- stay around `800` indexer hits per day unless you intentionally run a special batch

## Queue and Import Monitoring

The automation should monitor:

- SAB queue state
- qBittorrent stuck or completed jobs
- ARR import warnings
- completed downloads that ARR did not import
- bad language imports

If a job is complete but not imported, inspect ARR manual import before deleting anything.

## Continue

Next: [Chapter 4: German-Friendly Setup](/slimshadys-arr-setup-guide/docs/chapter-04-german-friendly.html)
