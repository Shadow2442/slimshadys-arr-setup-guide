<div class="guide-banner-frame">
  <img class="guide-banner-image" src="/slimshadys-arr-setup-guide/docs/assets/guide-banner.png" alt="SlimShady's ARR Setup Guide banner">
</div>

<div class="hero-intro">
  <h2>SlimShady's ARR Setup Guide</h2>
  <p>A practical step-by-step guide for building a reliable home-media automation stack with <code>Sonarr</code>, <code>Radarr</code>, <code>Lidarr</code>, <code>SABnzbd</code>, <code>Jackett</code>, <code>Seerr</code>, and <code>Plex</code>.</p>
  <p>The guide is organized like a setup manual: start with the base stack, then add discovery, German-friendly language rules, multi-language and original-language logic, archive sizing, automation scripts, and troubleshooting.</p>
  <p>If you are new, read the chapters in order. If you already have a working stack, jump directly to the specialist chapter that matches the thing you are fixing.</p>
  <div class="hero-meta">
    <span class="hero-meta-label">Guide traffic:</span>
    <img class="visitor-counter-badge" src="https://visitor-badge.laobi.icu/badge?page_id=Shadow2442.slimshadys-arr-setup-guide&left_text=visitors" alt="Visitor counter">
  </div>
</div>

## Chapter Index

<div class="hub-link-grid">
  <a class="hub-link-card" href="/slimshadys-arr-setup-guide/docs/chapter-01-start-here.html">
    <strong>1. Start Here</strong>
    <span>The stack goal, reader path, architecture flow, and the core rules before you touch advanced settings.</span>
  </a>
  <a class="hub-link-card" href="/slimshadys-arr-setup-guide/docs/chapter-02-base-setup.html">
    <strong>2. Base Setup Step by Step</strong>
    <span>Folders, categories, SABnzbd, Sonarr, Radarr, Lidarr, Plex, Jackett, and Seerr request safety.</span>
  </a>
  <a class="hub-link-card" href="/slimshadys-arr-setup-guide/docs/chapter-03-download-pipeline.html">
    <strong>3. Download Pipeline and Daily Automation</strong>
    <span>Import lists, RSS, queues, imports, Plex scans, release-ladder runs, and API-conscious batches.</span>
  </a>
  <a class="hub-link-card" href="/slimshadys-arr-setup-guide/docs/chapter-04-german-friendly.html">
    <strong>4. German-Friendly Setup</strong>
    <span>German/Multi preference, English bridge fallback, blocked languages, title markers, and indexer strategy.</span>
  </a>
  <a class="hub-link-card" href="/slimshadys-arr-setup-guide/docs/chapter-05-multilanguage-original-language.html">
    <strong>5. Multi-Language and Original-Language Setup</strong>
    <span>German/English dual audio, anime, Japanese, Korean, Chinese, subtitle fallback, and import validation.</span>
  </a>
  <a class="hub-link-card" href="/slimshadys-arr-setup-guide/docs/chapter-06-archive-size.html">
    <strong>6. Archive and Size Strategy</strong>
    <span>Compact movies, 720p series finals, 1080p bridge files, codec-aware sizing, and final-state unmonitoring.</span>
  </a>
  <a class="hub-link-card" href="/slimshadys-arr-setup-guide/docs/chapter-07-operations-troubleshooting.html">
    <strong>7. Operations and Troubleshooting</strong>
    <span>SAB, qBittorrent, failed imports, Jackett health, Plex matching, bad-language cleanup, and stuck queues.</span>
  </a>
  <a class="hub-link-card" href="/slimshadys-arr-setup-guide/docs/chapter-08-reference.html">
    <strong>8. Reference Appendix</strong>
    <span>App-by-app pages, specialist references, changelog links, and quick lookup material.</span>
  </a>
</div>

## How to Use This Guide

<div class="mini-grid">
  <div class="mini-card">
    <h4>New setup</h4>
    <p>Read chapters 1 through 3 first. Only add German-friendly, multi-language, and archive logic after the base stack works.</p>
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

## Current Operating Model

- English fallback is a bridge, not a final winner.
- German/Multi should replace English when available.
- German/Multi `1080p` TV can be used as a fast bridge.
- Compact German/Multi `720p` is the normal final TV archive target.
- Compact German/Multi `1080p` is the normal movie archive target.
- Anime, Korean, and Chinese titles get scoped original-language fallback lanes.
- Suspicious markers such as `VFQ`, `VFF`, `TRUEFRENCH`, `EN-TR`, `TR-EN`, and `TURG` are blocked or heavily penalized.
- Final verified keepers are unmonitored.

## Project Links

- [All Docs](/slimshadys-arr-setup-guide/docs/index.html)
- [GitHub Repository](https://github.com/Shadow2442/slimshadys-arr-setup-guide)
- [Changelog](https://github.com/Shadow2442/slimshadys-arr-setup-guide/blob/main/CHANGELOG.md)
