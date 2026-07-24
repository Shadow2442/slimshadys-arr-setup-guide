<div class="doc-hero">
  <h2>Chapter 8: Reference Appendix</h2>
  <p>The reference shelf: app-specific pages, specialist topics, changelog, and source links for quick lookup after the guided chapters.</p>
  <div class="hero-badges">
    <span>App pages</span>
    <span>Special topics</span>
    <span>Changelog</span>
    <span>Quick lookup</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/chapter-07-operations-troubleshooting.html">Previous</a>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-09-codex-assisted-setup.html">Next</a>
  <a href="/slimshadys-arr-setup-guide/">Home</a>
  <a href="/slimshadys-arr-setup-guide/docs/index.html">All docs</a>
</div>

<div class="edition-layout">
  <section class="edition-card accent-green">
    <span class="section-kicker">App references</span>
    <h3>Tool-specific deep dives</h3>
    <div class="reference-grid">
      <a class="reference-card" href="/slimshadys-arr-setup-guide/docs/sonarr-setup-and-workflows.html"><strong>Sonarr</strong><span>Series, anime, language, profile, and queue behavior.</span></a>
      <a class="reference-card" href="/slimshadys-arr-setup-guide/docs/radarr-setup-and-workflows.html"><strong>Radarr</strong><span>Movies, compact profiles, title protection, and fallback search.</span></a>
      <a class="reference-card" href="/slimshadys-arr-setup-guide/docs/lidarr-setup-and-workflows.html"><strong>Lidarr</strong><span>Music, artists, albums, metadata, and monitoring.</span></a>
      <a class="reference-card" href="/slimshadys-arr-setup-guide/docs/sabnzbd-tuning-and-reliability.html"><strong>SABnzbd</strong><span>Downloader reliability and queue tuning.</span></a>
      <a class="reference-card" href="/slimshadys-arr-setup-guide/docs/jackett-setup-and-workflows.html"><strong>Jackett</strong><span>Torrent fallback and tracker health.</span></a>
      <a class="reference-card" href="/slimshadys-arr-setup-guide/docs/plex-setup-and-workflows.html"><strong>Plex</strong><span>Library scan, match, split, and playback.</span></a>
    </div>
  </section>

  <section class="edition-card">
    <span class="section-kicker">Special topics</span>
    <h3>Rules and strategy references</h3>
    <div class="reference-grid">
      <a class="reference-card" href="/slimshadys-arr-setup-guide/docs/plex-ecosystem-guide.html"><strong>Plex Ecosystem</strong><span>Server choices, storage, playback, users, dashboards, security, operations, and migration.</span></a>
      <a class="reference-card" href="/slimshadys-arr-setup-guide/docs/setup-checklist.html"><strong>Setup Checklist</strong><span>Compact operational setup and sanity checks.</span></a>
      <a class="reference-card" href="/slimshadys-arr-setup-guide/docs/mdblist-import-lists.html"><strong>MDBList</strong><span>Movie, series, and anime discovery lists.</span></a>
      <a class="reference-card" href="/slimshadys-arr-setup-guide/docs/indexers-and-german-content.html"><strong>German Indexers</strong><span>Provider roles, scoring, quotas, and original-language lanes.</span></a>
      <a class="reference-card" href="/slimshadys-arr-setup-guide/docs/quality-sizing-and-downgrades.html"><strong>Quality and Sizes</strong><span>Release ladder, size caps, compact keepers, and cleanup.</span></a>
      <a class="reference-card" href="/slimshadys-arr-setup-guide/docs/deployment-options.html"><strong>Deployment Options</strong><span>Windows LAN, Docker, reverse proxy, dashboards, and mounted storage choices.</span></a>
      <a class="reference-card" href="/slimshadys-arr-setup-guide/docs/downloads.html"><strong>Downloads</strong><span>Templates, example scripts, master prompt, and package manifest.</span></a>
    </div>
  </section>

  <section class="edition-card accent-gold">
    <span class="section-kicker">Latest update trail</span>
    <h3>Recent guide history</h3>
    <table>
      <thead><tr><th>Date</th><th>Change</th></tr></thead>
      <tbody>
        <tr><td><code>2026-07-24</code></td><td>Added the Plex ecosystem map so readers can orient around server design, storage, playback, metadata, users, dashboards, security, operations, and migration before diving into ARR tuning.</td></tr>
        <tr><td><code>2026-07-22</code></td><td>Added the AI setup copilot prompt so readers can give Codex or another on-machine AI the guide URL and be walked through the full setup step by step.</td></tr>
        <tr><td><code>2026-07-22</code></td><td>Chapter structure, release ladder, Seerr safety, Jackett recovery, original-language lanes, archive targets, and bad-language cleanup.</td></tr>
        <tr><td><code>2026-06-06</code></td><td>German-friendly Sonarr and Radarr language profile policy.</td></tr>
        <tr><td><code>2026-05-18</code></td><td>Dedicated app pages for the main stack.</td></tr>
      </tbody>
    </table>
  </section>

  <section class="edition-card">
    <span class="section-kicker">Repository</span>
    <h3>Project links</h3>
    <div class="source-chips">
      <a href="https://github.com/Shadow2442/slimshadys-arr-setup-guide">Open the repository</a>
      <a href="https://github.com/Shadow2442/slimshadys-arr-setup-guide/blob/main/CHANGELOG.md">Read the changelog</a>
    </div>
  </section>
</div>

## How To Use This Appendix

The chapters explain the workflow. The reference pages are where you look up a specific tool or rule once the overall model makes sense.

Use this appendix when you already know the area of the problem:

| Need | Go here |
| --- | --- |
| A series or anime rule is wrong | Sonarr reference |
| A movie profile, title match, or compact release is wrong | Radarr reference |
| Albums, artists, or track metadata are wrong | Lidarr reference |
| Jobs are stuck, unpacking, or orphaned | SABnzbd reference |
| Torrent fallback or tracker health is wrong | Jackett reference |
| Plex matching, split, trash, or playback is wrong | Plex reference |
| Discovery lists are not adding items | MDBList reference |
| German indexer priority or language scoring is unclear | German indexer reference |
| File sizes and downgrade logic are unclear | Quality and size reference |
| You want the whole Plex ecosystem map | Plex Ecosystem Guide |
| Your setup uses Docker, reverse proxy, hosted servers, or mounted storage | Deployment options |
| You want Codex to help configure the stack | Chapter 9 and Downloads |

## Related Guides And What This One Adds

There are already excellent ARR resources, and this guide is not trying to pretend they do not exist. The difference is focus.

<div class="comparison-panel compact-panel">
  <div class="comparison-grid">
    <div class="comparison-card">
      <strong>TRaSH Guides</strong>
      <span>Best for deep ARR concepts: quality profiles, custom formats, scoring, naming, and the technical logic behind upgrades.</span>
      <a href="https://trash-guides.info/">Open TRaSH Guides</a>
    </div>
    <div class="comparison-card">
      <strong>PCJones Usenet Guide</strong>
      <span>Best for German Usenet orientation: providers, indexers, German/DL basics, and the regional download ecosystem.</span>
      <a href="https://github.com/PCJones/usenet-guide">Open PCJones guide</a>
    </div>
    <div class="comparison-card">
      <strong>This guide</strong>
      <span>Best for an opinionated end-to-end home-library setup: German/Multi targets, English bridge behavior, anime/Korean/Chinese lanes, Seerr safety, Plex integration, queue cleanup, daily automation, and Codex-assisted runbooks.</span>
      <a href="/slimshadys-arr-setup-guide/docs/chapter-01-start-here.html">Start the setup path</a>
    </div>
  </div>
</div>

Use the big reference projects when you want to understand the raw ARR building blocks. Use this guide when you want a practical path through the whole system and the maintenance rules that keep a family Plex library pleasant after the first setup excitement wears off.

## Terms Used Throughout The Guide

| Term | Meaning |
| --- | --- |
| Bridge file | A temporary acceptable file, often English, used until a better target exists. |
| Final keeper | A verified file that has reached the intended language, quality, and size state. |
| German/Multi | A release that includes German audio plus another useful language, ideally original audio or English. |
| Original-language lane | Scoped logic for anime, Korean, or Chinese content where original audio is intentional. |
| Blocked marker | A title or language signal that should reject or heavily penalize a release. |
| Cutoff | The point where ARR considers a profile good enough and may stop upgrading. |
| Unmonitor | Stop ARR from searching for more replacements for an item. |

## Minimum Reference Setup

| Area | Minimum expectation |
| --- | --- |
| Sonarr/Radarr profiles | English bridge allowed only when useful; German/Multi wins later. |
| Custom formats | Strong German proof, Multi proof, blocked-language penalties, codec/size signals. |
| Download clients | Separate categories and healthy import paths. |
| Plex | Final library folders only. |
| Seerr | Conservative approval and safe default profiles. |
| Automation | Daily batches, API budget, queue/import checks, final-state unmonitoring. |

## Updating The Guide

Future changes should keep the same structure:

- explain why the decision exists
- show how the apps actually make the decision
- list what needs to be configured
- include a small test or verification step
- preserve the current card, table, and flow-block design language

<div class="chapter-next">
  <span>Continue</span>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-09-codex-assisted-setup.html">Chapter 9: Codex-Assisted Setup and Downloads</a>
</div>
