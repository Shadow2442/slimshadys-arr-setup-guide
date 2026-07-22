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

<div class="intro-box">
  <h3>Introduction</h3>
  <p>This page is the final-library guide. It explains what Plex should do, how to install it, how to point it at the right folders, and how to avoid mixing final media libraries with temporary download paths.</p>
  <p>The main idea is simple: ARR apps should prepare and organize the media first, and Plex should then present and play it. If those roles stay clean, Plex becomes one of the easiest parts of the whole setup.</p>
</div>

<div class="edition-layout">
  <section class="edition-card accent-green">
    <span class="section-kicker">Plex operating model</span>
    <h3>Presentation, not file management</h3>
    <div class="rule-grid">
      <div class="rule-card"><strong>Final folders only</strong><span>Plex should scan ARR-managed library paths, not temporary download folders.</span></div>
      <div class="rule-card"><strong>Clean names</strong><span>Radarr and Sonarr naming conventions make Plex matching easier.</span></div>
      <div class="rule-card"><strong>Split carefully</strong><span>When Plex merges similar titles, split first, then fix the match.</span></div>
      <div class="rule-card"><strong>Trash discipline</strong><span>Empty trash only when you intentionally want Plex to forget a removed item.</span></div>
    </div>
  </section>

  <section class="edition-card">
    <span class="section-kicker">Mismatch workflow</span>
    <h3>When Plex picks the wrong movie</h3>
    <div class="flow-grid">
      <div class="flow-card"><em>1</em><strong>Verify file</strong><span>Confirm folder, year, edition, and actual media are correct.</span></div>
      <div class="flow-card"><em>2</em><strong>Split or move</strong><span>Separate the item without destroying the good file.</span></div>
      <div class="flow-card"><em>3</em><strong>Fix match</strong><span>Use the correct title/year and rescan after the path is stable.</span></div>
    </div>
  </section>

  <section class="edition-card accent-gold">
    <span class="section-kicker">ARR Connect</span>
    <h3>Use the Plex API as a scan trigger</h3>
    <div class="rule-grid">
      <div class="rule-card"><strong>Sonarr</strong><span>Notify Plex after episode import, upgrade, rename, or delete.</span></div>
      <div class="rule-card"><strong>Radarr</strong><span>Notify Plex after movie import, upgrade, rename, or delete.</span></div>
      <div class="rule-card"><strong>Lidarr</strong><span>Notify Plex after album import or library changes.</span></div>
      <div class="rule-card"><strong>Boundary</strong><span>The API triggers scans; it does not make Plex responsible for file management.</span></div>
    </div>
  </section>
</div>

## What Plex Is and Why You Need It

`Plex` is the final playback and presentation layer in this stack.

Its job is to:

- watch the final movie, series, and music libraries
- scrape metadata
- organize the viewing experience
- stream or play the media to your devices

Its role is not to:

- manage temporary downloads
- guess around bad importer behavior
- clean up folders the ARR apps should already have organized

## Download Plex

- Official download page: [plex.tv/media-server-downloads](https://www.plex.tv/media-server-downloads/)

For Windows, install the Plex Media Server package.

## Install Plex Step by Step

1. Download Plex Media Server from the official site.
2. Install it on the machine that holds or can access your library.
3. Sign in with your Plex account.
4. Open the Plex web interface and confirm the server is visible.
5. Do not point it at your download folders. That way lies comedy.

## Basic Configuration First

Before you worry about posters and polish, get the structure right:

- final movies folder
- final series folder
- final music folder
- no temporary download paths inside Plex libraries

Plex should only ever see finished, ARR-managed media.

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

## Base Settings I Recommend

For a clean first configuration:

- create separate Plex libraries for movies, TV, and music
- point each one only at the final ARR-managed folder
- enable normal metadata matching and scanning
- verify the first few titles match correctly before you call it done

This is intentionally boring. Boring is excellent here.

## Plex API Integration for ARR Apps

`Sonarr`, `Radarr`, and `Lidarr` can talk to Plex through their `Connect` settings. This is useful because ARR knows exactly when a file was imported, upgraded, renamed, or deleted. Instead of waiting for Plex to eventually notice a folder change, ARR can tell Plex to update the relevant library.

This is not a replacement for clean folder structure. It is a notification layer on top of clean folder structure.

## What the Plex Connection Does

| Event | What ARR does | What Plex should do |
| --- | --- | --- |
| Import | ARR moves and renames the finished file. | Scan/update the matching Plex library. |
| Upgrade | ARR replaces the old file with a better file. | Refresh the item so Plex points at the new file. |
| Rename | ARR changes folders or filenames. | Update paths and metadata references. |
| Delete | ARR removes a file intentionally. | Refresh so stale items can disappear or be trashed intentionally. |

## How To Configure ARR to Notify Plex

In each ARR app, use:

1. Open `Settings -> Connect`.
2. Add `Plex Media Server`.
3. Authenticate or provide the Plex connection details.
4. Select the correct Plex server.
5. Select the matching Plex library: movies for Radarr, TV for Sonarr, music for Lidarr.
6. Enable useful triggers such as import, upgrade, rename, and delete.
7. Test the connection.
8. Save only after the test succeeds.

Use one Plex connection per ARR app. Do not point Radarr at the TV library or Sonarr at the movie library. This sounds obvious until a bad connection quietly makes Plex refresh the wrong place.

## Plex Token and Authentication

ARR needs permission to talk to Plex. Depending on the ARR version and Plex setup, that can happen through a sign-in flow or through a Plex token/session. Treat the token like a password: do not publish it, paste it into screenshots, or commit it into documentation.

If a Plex connection suddenly stops working, the token/session may have expired, the server URL may have changed, or Plex may no longer be reachable from the machine running the ARR app.

## Auto-Scan vs ARR Connect

| Method | Strength | Weakness |
| --- | --- | --- |
| Plex automatic library scan | Simple and works without ARR integration. | Can lag, miss edge cases, or scan too broadly. |
| ARR Plex Connect | Precise trigger after import, upgrade, rename, or delete. | Needs a working Plex API connection. |
| Manual Plex scan | Good for repairs and verification. | Not automation. |

The best setup usually uses both: Plex watches the final folders, and ARR also tells Plex when it has changed something important.

## Troubleshooting Plex Connect

| Symptom | Likely cause | Fix |
| --- | --- | --- |
| Test fails in ARR | Wrong Plex URL, token/session issue, or server not reachable. | Re-authenticate, check the server address, and test from the ARR machine. |
| Plex scans but item is missing | ARR imported to a folder outside the Plex library. | Fix root folders and Plex library paths. |
| Wrong library updates | ARR connection points at the wrong Plex library. | Select the correct Plex library in the connection. |
| Plex keeps stale items | Trash was not emptied or delete event did not refresh. | Refresh the library, inspect trash behavior, and empty trash only when intentional. |
| Duplicate items appear | Plex sees both temporary and final folders. | Remove temporary paths from Plex libraries. |

## Why This Matters

When ARR handles naming and organization correctly:

- Plex metadata matching is cleaner
- duplicate confusion is lower
- playback feels smoother
- the whole stack becomes more boring in the healthy way

That boringness is a compliment.

## Recommended Refinements and Enhancements

Once the base Plex setup works, the refinements that matter most are:

- keeping library roots clean and stable
- letting ARR handle naming first
- checking metadata matches on the first few imports
- resisting the urge to aim Plex at staging folders just because the files are “there already”

These are not glamorous settings, but they are the difference between a library and an evidence locker.

## Recommended Step-by-Step

1. Download and install Plex Media Server.
2. Sign in and verify the server starts correctly.
3. Create the final archival library roots for movies, series, and music on the HDD.
4. Keep temporary and incomplete download paths outside those final library roots.
5. Let `Sonarr`, `Radarr`, and `Lidarr` own the import and rename logic.
6. In Plex, create separate libraries for movies, series, and music.
7. Point each Plex library only at its final ARR-managed folder.
8. Add Plex as a `Connect` integration in Sonarr, Radarr, and Lidarr.
9. Test each ARR Plex connection and confirm it targets the correct Plex library.
10. Run a first scan and verify metadata matching on a few known-good imports.
11. Check that Plex is not indexing temporary folders, samples, failed downloads, or staging leftovers.
12. Only after that, treat the library structure as production-ready.

If those basics are clean, Plex usually becomes the easiest part of the whole stack.


