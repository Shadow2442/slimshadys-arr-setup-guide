<div class="guide-banner-frame">
  <img class="guide-banner-image" src="/slimshadys-arr-setup-guide/docs/assets/guide-banner.png" alt="SlimShady's ARR Setup Guide banner">
</div>

<section class="home-hero">
  <div class="home-hero-copy">
    <p class="home-kicker">Swiss private-use media automation guide - how to completely automate your home media library with ARR and Plex</p>
    <h2>SlimShady's ARR Setup Guide</h2>
    <p class="home-lede">Build a reliable home-media stack with <code>Sonarr</code>, <code>Radarr</code>, <code>Lidarr</code>, <code>SABnzbd</code>, <code>Jackett</code>, <code>Seerr</code>, and <code>Plex</code>, without letting automation turn your library into a noisy pile of half-matched downloads.</p>
    <p>This guide is written from the perspective of a Swiss movie aficionado: keep original versions and original audio where they matter, but make movies and series comfortable for family to watch in their native language.</p>
    <div class="home-hero-actions">
      <a class="primary-link" href="/slimshadys-arr-setup-guide/docs/chapter-01-start-here.html">Start Chapter 1</a>
      <a class="secondary-link" href="/slimshadys-arr-setup-guide/docs/index.html">Browse All Docs</a>
    </div>
  </div>

  <aside class="home-hero-panel">
    <div class="home-panel-card">
      <strong>Legal frame</strong>
      <span>Swiss private use, original-version preservation, and family viewing. Not public redistribution, uploading, or an open media service.</span>
    </div>
    <div class="home-panel-card">
      <strong>Core promise</strong>
      <span>English can fill a gap. German/Multi wins when available. Final verified keepers are unmonitored.</span>
    </div>
    <div class="home-source-row">
      <a href="https://www.ige.ch/en/protecting-your-ip/copyright/using-a-work/copyright-on-the-internet">Swiss IPI</a>
      <a href="https://www.fedlex.admin.ch/eli/cc/1993/1798_1798_1798/en">Copyright Act Art. 19</a>
    </div>
    <div class="hero-meta">
      <span class="hero-meta-label">Guide traffic:</span>
      <img class="visitor-counter-badge" src="https://visitor-badge.laobi.icu/badge?page_id=Shadow2442.slimshadys-arr-setup-guide&left_text=visitors" alt="Visitor counter">
    </div>
  </aside>
</section>

## Latest Guide Updates

<table class="update-ledger">
  <thead>
    <tr>
      <th>Date</th>
      <th>Update</th>
      <th>Start Here</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>2026-07-22</code></td>
      <td><strong>Chapter rebuild.</strong> Homepage, docs index, and the full guide path were rebuilt around proper setup chapters.</td>
      <td><a href="/slimshadys-arr-setup-guide/docs/index.html">Docs index</a></td>
    </tr>
    <tr>
      <td><code>2026-07-22</code></td>
      <td><strong>Release ladder.</strong> Added English bridge logic, German/Multi replacement rules, Seerr safety, Jackett recovery, and archive behavior.</td>
      <td><a href="/slimshadys-arr-setup-guide/docs/chapter-03-download-pipeline.html">Automation</a></td>
    </tr>
    <tr>
      <td><code>2026-06-06</code></td>
      <td><strong>German-friendly rules.</strong> Added Sonarr/Radarr fallback strategy, compact profiles, parser guardrails, and bulk fallback-search notes.</td>
      <td><a href="/slimshadys-arr-setup-guide/docs/chapter-04-german-friendly.html">German setup</a></td>
    </tr>
    <tr>
      <td><code>2026-05-20</code></td>
      <td><strong>Language protection.</strong> Added the Lucifer case study and safer German season preservation guidance.</td>
      <td><a href="/slimshadys-arr-setup-guide/docs/sonarr-setup-and-workflows.html">Sonarr</a></td>
    </tr>
    <tr>
      <td><code>2026-05-19</code></td>
      <td><strong>Beginner polish.</strong> Expanded app pages with clearer introductions, install guidance, and setup flow.</td>
      <td><a href="https://github.com/Shadow2442/slimshadys-arr-setup-guide/blob/main/CHANGELOG.md">Changelog</a></td>
    </tr>
  </tbody>
</table>

## Chapter Index

<div class="chapter-grid">
  <a class="chapter-card" href="/slimshadys-arr-setup-guide/docs/chapter-01-start-here.html">
    <span class="chapter-number">01</span>
    <span class="chapter-label">Orientation</span>
    <strong>Start Here</strong>
    <span>The stack goal, reader path, architecture flow, Swiss private-use context, and core rules.</span>
    <em>Open chapter</em>
  </a>
  <a class="chapter-card" href="/slimshadys-arr-setup-guide/docs/chapter-02-base-setup.html">
    <span class="chapter-number">02</span>
    <span class="chapter-label">Foundation</span>
    <strong>Base Setup Step by Step</strong>
    <span>Folders, categories, SABnzbd, Sonarr, Radarr, Lidarr, Plex, Jackett, and Seerr request safety.</span>
    <em>Open chapter</em>
  </a>
  <a class="chapter-card" href="/slimshadys-arr-setup-guide/docs/chapter-03-download-pipeline.html">
    <span class="chapter-number">03</span>
    <span class="chapter-label">Automation</span>
    <strong>Download Pipeline and Daily Automation</strong>
    <span>Import lists, RSS, queues, imports, Plex scans, release-ladder runs, and API-conscious batches.</span>
    <em>Open chapter</em>
  </a>
  <a class="chapter-card" href="/slimshadys-arr-setup-guide/docs/chapter-04-german-friendly.html">
    <span class="chapter-number">04</span>
    <span class="chapter-label">Language</span>
    <strong>German-Friendly Setup</strong>
    <span>German/Multi preference, English bridge fallback, blocked languages, title markers, and indexer strategy.</span>
    <em>Open chapter</em>
  </a>
  <a class="chapter-card" href="/slimshadys-arr-setup-guide/docs/chapter-05-multilanguage-original-language.html">
    <span class="chapter-number">05</span>
    <span class="chapter-label">Original versions</span>
    <strong>Multi-Language and Original-Language Setup</strong>
    <span>German/English dual audio, anime, Japanese, Korean, Chinese, subtitle fallback, and import validation.</span>
    <em>Open chapter</em>
  </a>
  <a class="chapter-card" href="/slimshadys-arr-setup-guide/docs/chapter-06-archive-size.html">
    <span class="chapter-number">06</span>
    <span class="chapter-label">Archive</span>
    <strong>Archive and Size Strategy</strong>
    <span>Compact movies, 720p series finals, 1080p bridge files, codec-aware sizing, and final-state unmonitoring.</span>
    <em>Open chapter</em>
  </a>
  <a class="chapter-card" href="/slimshadys-arr-setup-guide/docs/chapter-07-operations-troubleshooting.html">
    <span class="chapter-number">07</span>
    <span class="chapter-label">Maintenance</span>
    <strong>Operations and Troubleshooting</strong>
    <span>SAB, qBittorrent, failed imports, Jackett health, Plex matching, bad-language cleanup, and stuck queues.</span>
    <em>Open chapter</em>
  </a>
  <a class="chapter-card" href="/slimshadys-arr-setup-guide/docs/chapter-08-reference.html">
    <span class="chapter-number">08</span>
    <span class="chapter-label">Lookup</span>
    <strong>Reference Appendix</strong>
    <span>App-by-app pages, specialist references, changelog links, and quick lookup material.</span>
    <em>Open chapter</em>
  </a>
</div>

## Operating Model

| Rule Area | Practical Rule | Why It Exists |
| --- | --- | --- |
| Language fallback | English is a bridge, not a final winner. | Keeps new content watchable without locking the library into English-only files. |
| German/Multi upgrade | German/Multi should replace English when available. | Family-friendly playback and original-version preservation can coexist. |
| TV archive | German/Multi `1080p` can be a bridge; compact German/Multi `720p` is the normal final target. | Fast availability first, sane long-term storage later. |
| Movie archive | Compact German/Multi `1080p` is the normal movie target. | Good quality without giant files unless manually chosen. |
| Original-language media | Anime, Korean, and Chinese titles get scoped fallback lanes. | Original versions matter, but rules must not leak into unrelated shows. |
| Safety | `VFQ`, `VFF`, `TRUEFRENCH`, `EN-TR`, `TR-EN`, and `TURG` are blocked or heavily penalized. | Prevents misleading releases from slipping through as fake Multi/German matches. |
| Final state | Verified keepers are unmonitored. | Done means done; ARR does not need to keep poking finished work. |

## How to Use This Guide

<div class="mini-grid">
  <div class="mini-card">
    <h4>New setup</h4>
    <p>Read chapters 1 through 3 first. Add German-friendly, multi-language, and archive rules only after the base stack works.</p>
  </div>
  <div class="mini-card">
    <h4>Existing setup</h4>
    <p>Jump to the chapter matching the problem: German rules, original-language media, archive sizing, automation, or troubleshooting.</p>
  </div>
  <div class="mini-card">
    <h4>Reference mode</h4>
    <p>Use chapter 8 when you need app-specific pages for Sonarr, Radarr, Lidarr, SABnzbd, Jackett, Plex, MDBList, or quality settings.</p>
  </div>
</div>

## Project Links

- [All Docs](/slimshadys-arr-setup-guide/docs/index.html)
- [GitHub Repository](https://github.com/Shadow2442/slimshadys-arr-setup-guide)
- [Changelog](https://github.com/Shadow2442/slimshadys-arr-setup-guide/blob/main/CHANGELOG.md)
