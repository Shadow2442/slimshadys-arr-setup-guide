<div class="guide-banner-frame">
  <img class="guide-banner-image" src="/slimshadys-arr-setup-guide/docs/assets/guide-banner.png" alt="SlimShady's ARR Setup Guide banner">
</div>

<section class="home-hero">
  <div class="home-hero-copy">
    <p class="home-kicker">How to completely automate your home media library with ARR and Plex</p>
    <h2>SlimShady's ARR Setup Guide</h2>
    <p class="home-lede">Build a reliable Plex ecosystem with <code>Sonarr</code>, <code>Radarr</code>, <code>Lidarr</code>, <code>SABnzbd</code>, <code>Jackett</code>, <code>Seerr</code>, storage, dashboards, request safety, playback sanity, and daily automation, without letting the stack turn your library into a noisy pile of half-matched downloads.</p>
    <p>This guide is written from the perspective of a Swiss movie aficionado: keep original versions and original audio where they matter, but make movies and series comfortable for family to watch in their native language.</p>
    <p><strong>Built from months of real-world setup work.</strong> This guide grew out of months of tuning, breaking, fixing, resetting, and rebuilding my own ARR and Plex stack. More recently I brought Codex into the process as a setup copilot: it helped me audit the messy parts, turn hard-earned lessons into cleaner rules, automate repeat checks, and rebuild the setup with much more confidence instead of starting from scratch blindly again.</p>
    <div class="home-hero-actions">
      <a class="primary-link" href="/slimshadys-arr-setup-guide/docs/plex-ecosystem-guide.html">Explore Plex Ecosystem</a>
      <a class="primary-link" href="/slimshadys-arr-setup-guide/docs/quick-start-installation.html">Start Quick Setup</a>
      <a class="secondary-link" href="/slimshadys-arr-setup-guide/docs/chapter-01-start-here.html">Read Chapter 1</a>
      <a class="secondary-link" href="/slimshadys-arr-setup-guide/docs/index.html">Browse All Docs</a>
    </div>
  </div>

  <aside class="home-hero-panel">
    <div class="home-panel-card">
      <strong>Core promise</strong>
      <span>I built this for my own home library: I prefer keeping films and shows as multi-language files with the original audio, a German audio track, and useful subtitles. That way I can still switch to the original version when I want the real thing, while my family can simply press play and watch in German.</span>
    </div>
    <div class="home-panel-card">
      <strong>Legal notice</strong>
      <span>This setup is written from my Swiss private-use perspective, where my personal use case is legal. That may not be true where you live. Please respect your local laws, service rules, copyright rules, and common sense; do not use this as a public redistribution setup.</span>
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

<div class="cinema-note">
  <strong>Questions or feedback?</strong>
  If something in the guide is unclear, missing, or broken, open a public GitHub feedback issue. Keep it project-related and do not include API keys, Plex tokens, private server URLs, personal media lists, or anything else sensitive.
  <div class="source-chips">
    <a href="https://github.com/Shadow2442/slimshadys-arr-setup-guide/issues/new/choose">Send feedback on GitHub</a>
    <a href="https://github.com/Shadow2442/slimshadys-arr-setup-guide/issues">View open feedback</a>
  </div>
</div>

<div class="cinema-note ai-copilot-note">
  <strong>Want an AI to walk you through the setup?</strong>
  If you use Codex or another on-machine AI assistant, give it this guide and ask it to act as your setup copilot. It can read the chapters, ask for your local paths and app URLs when needed, adapt the templates, configure one app at a time, and verify each step before moving on.
  <br><br>
  <strong>Starter prompt:</strong>
  <pre><code>Use https://shadow2442.github.io/slimshadys-arr-setup-guide/ as the setup guide for my ARR and Plex home media stack. Walk me through it step by step. Start by reading the guide, then ask me for my OS, folders, app URLs, API keys, Plex token, downloader, indexers, and media goals only when needed. Do not print secrets. Inspect before changing anything. Help me configure Sonarr, Radarr, Lidarr, SABnzbd, Plex, Jackett, Seerr, language rules, downloads, and daily automation. Test each stage before moving on.</code></pre>
  <div class="source-chips">
    <a href="/slimshadys-arr-setup-guide/docs/chapter-09-codex-assisted-setup.html">Open the AI setup chapter</a>
    <a href="/slimshadys-arr-setup-guide/downloads/examples/codex-master-setup-prompt.md">Download the master prompt</a>
  </div>
</div>

<section class="comparison-panel">
  <span class="section-kicker">Related guides</span>
  <h3>How this guide fits next to TRaSH and PCJones</h3>
  <p>I see this guide as a practical companion, not a replacement for the big reference projects. <a href="https://trash-guides.info/">TRaSH Guides</a> are still the deep technical reference for profiles, custom formats, and scoring. <a href="https://github.com/PCJones/usenet-guide">PCJones' Usenet Guide</a> is a strong German/DL Usenet foundation. This site focuses on the messy home-library layer around them: how the parts connect, why the rules exist, how English fallback gets replaced later, how German/Multi becomes the keeper, and how to keep Plex, Seerr, ARR apps, download clients, and daily checks working together.</p>
  <div class="comparison-grid">
    <div class="comparison-card">
      <strong>Use TRaSH for</strong>
      <span>Detailed custom-format concepts, quality-profile mechanics, and advanced ARR scoring background.</span>
    </div>
    <div class="comparison-card">
      <strong>Use PCJones for</strong>
      <span>German Usenet orientation, indexer/provider context, and a proven dual-language starting point.</span>
    </div>
    <div class="comparison-card">
      <strong>Use this guide for</strong>
      <span>A full Swiss private-use Plex/ARR setup with German-friendly rules, original-language lanes, request safety, compact archive targets, runbooks, and Codex-assisted automation.</span>
    </div>
  </div>
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
      <td><code>2026-07-24</code></td>
      <td><strong>Optional companion apps.</strong> Added a final roadmap for dashboards, Bazarr subtitles, Tautulli monitoring, Prowlarr, Recyclarr, Kometa, notifications, and what to skip until later.</td>
      <td><a href="/slimshadys-arr-setup-guide/docs/optional-companion-apps.html">Companion apps</a></td>
    </tr>
    <tr>
      <td><code>2026-07-24</code></td>
      <td><strong>Quality modes and AI guardrails.</strong> Added archive-first, availability-first, and cinema-first guidance, clearer bridge-vs-keeper storage rules, and stricter AI verification behavior.</td>
      <td><a href="/slimshadys-arr-setup-guide/docs/quality-sizing-and-downgrades.html">Quality modes</a></td>
    </tr>
    <tr>
      <td><code>2026-07-24</code></td>
      <td><strong>Plex ecosystem map.</strong> Added the broader guide backbone covering server choices, storage, playback, metadata, users, dashboards, security, operations, and migration.</td>
      <td><a href="/slimshadys-arr-setup-guide/docs/plex-ecosystem-guide.html">Plex ecosystem</a></td>
    </tr>
    <tr>
      <td><code>2026-07-24</code></td>
      <td><strong>Quick Start setup path.</strong> Added concrete setup steps, customization warnings, collapsible explanations, and deployment choices for non-Windows or remote setups.</td>
      <td><a href="/slimshadys-arr-setup-guide/docs/quick-start-installation.html">Quick Start</a></td>
    </tr>
    <tr>
      <td><code>2026-07-23</code></td>
      <td><strong>Related guide positioning.</strong> Added a clear explanation of how this practical setup guide relates to TRaSH Guides and PCJones' German Usenet guide.</td>
      <td><a href="/slimshadys-arr-setup-guide/docs/chapter-08-reference.html">Reference</a></td>
    </tr>
  </tbody>
</table>

## Chapter Index

<div class="chapter-grid">
  <a class="chapter-card" href="/slimshadys-arr-setup-guide/docs/plex-ecosystem-guide.html">
    <span class="chapter-number">MAP</span>
    <span class="chapter-label">Whole system</span>
    <strong>Plex Ecosystem Guide</strong>
    <span>The umbrella map for Plex server design, storage, ARR automation, requests, dashboards, metadata, playback, security, operations, and migration.</span>
    <em>Open guide</em>
  </a>
  <a class="chapter-card" href="/slimshadys-arr-setup-guide/docs/quick-start-installation.html">
    <span class="chapter-number">00</span>
    <span class="chapter-label">Quick path</span>
    <strong>Quick Start Installation</strong>
    <span>The concrete first-run path: folders, install order, safe profiles, tests, and what to customize before scaling.</span>
    <em>Open chapter</em>
  </a>
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
  <a class="chapter-card" href="/slimshadys-arr-setup-guide/docs/chapter-09-codex-assisted-setup.html">
    <span class="chapter-number">09</span>
    <span class="chapter-label">Copilot</span>
    <strong>Codex-Assisted Setup and Downloads</strong>
    <span>Master prompt, safe templates, example scripts, package manifest, and fully guided setup order.</span>
    <em>Open chapter</em>
  </a>
  <a class="chapter-card" href="/slimshadys-arr-setup-guide/docs/optional-companion-apps.html">
    <span class="chapter-number">ADD</span>
    <span class="chapter-label">Finishing layer</span>
    <strong>Optional Companion Apps</strong>
    <span>Dashboards, Bazarr subtitles, Tautulli monitoring, Prowlarr, Recyclarr, Kometa, health alerts, and tools to skip until later.</span>
    <em>Open roadmap</em>
  </a>
</div>

<details class="full-index-panel">
  <summary>
    <span>Open full text index</span>
    <small>All chapters, detail pages, downloads, and references in one compact list.</small>
  </summary>
  <div class="full-index-grid">
    <section>
      <h3>Core Setup Path</h3>
      <ul>
        <li><a href="/slimshadys-arr-setup-guide/docs/plex-ecosystem-guide.html">Plex Ecosystem Guide</a> - the whole-system map for Plex, ARR, requests, storage, playback, dashboards, security, and operations.</li>
        <li><a href="/slimshadys-arr-setup-guide/docs/quick-start-installation.html">Quick Start Installation</a> - the first-run path for folders, apps, profiles, checks, and safe defaults.</li>
        <li><a href="/slimshadys-arr-setup-guide/docs/chapter-01-start-here.html">Chapter 1: Start Here</a> - goals, legal context, architecture, and basic rules.</li>
        <li><a href="/slimshadys-arr-setup-guide/docs/chapter-02-base-setup.html">Chapter 2: Base Setup Step by Step</a> - install order, folders, apps, categories, and request safety.</li>
        <li><a href="/slimshadys-arr-setup-guide/docs/chapter-03-download-pipeline.html">Chapter 3: Download Pipeline and Daily Automation</a> - import lists, queues, scans, release-ladder logic, and daily checks.</li>
      </ul>
    </section>
    <section>
      <h3>Language And Quality</h3>
      <ul>
        <li><a href="/slimshadys-arr-setup-guide/docs/chapter-04-german-friendly.html">Chapter 4: German-Friendly Setup</a> - German/Multi preference, English bridge fallback, blocked markers, and indexer strategy.</li>
        <li><a href="/slimshadys-arr-setup-guide/docs/chapter-05-multilanguage-original-language.html">Chapter 5: Multi-Language And Original-Language Setup</a> - original audio, subtitles, anime, Korean, Chinese, and scoped fallback lanes.</li>
        <li><a href="/slimshadys-arr-setup-guide/docs/chapter-06-archive-size.html">Chapter 6: Archive And Size Strategy</a> - compact keepers, bridge files, size caps, codecs, and final-state unmonitoring.</li>
        <li><a href="/slimshadys-arr-setup-guide/docs/quality-sizing-and-downgrades.html">Quality, Sizes, And Downgrades</a> - quality modes, release markers, size targets, downgrade guards, and storage sanity.</li>
        <li><a href="/slimshadys-arr-setup-guide/docs/indexers-and-german-content.html">Indexers And German Content</a> - finding German/Multi releases and keeping misleading language tags out.</li>
      </ul>
    </section>
    <section>
      <h3>App Deep Dives</h3>
      <ul>
        <li><a href="/slimshadys-arr-setup-guide/docs/sonarr-setup-and-workflows.html">Sonarr Setup And Workflows</a> - series profiles, monitoring, imports, episode handling, and language replacement.</li>
        <li><a href="/slimshadys-arr-setup-guide/docs/radarr-setup-and-workflows.html">Radarr Setup And Workflows</a> - movie profiles, compact targets, fallback behavior, and premium manual copies.</li>
        <li><a href="/slimshadys-arr-setup-guide/docs/lidarr-setup-and-workflows.html">Lidarr Setup And Workflows</a> - music imports, album matching, metadata, and library cleanup.</li>
        <li><a href="/slimshadys-arr-setup-guide/docs/sabnzbd-tuning-and-reliability.html">SABnzbd Tuning And Reliability</a> - categories, connection tuning, unpack behavior, queue health, and failure recovery.</li>
        <li><a href="/slimshadys-arr-setup-guide/docs/jackett-setup-and-workflows.html">Jackett Setup And Workflows</a> - indexer setup, category mapping, failed searches, Cloudflare checks, and tracker recovery.</li>
        <li><a href="/slimshadys-arr-setup-guide/docs/plex-setup-and-workflows.html">Plex Setup And Workflows</a> - libraries, matching, playback, users, scans, and server behavior.</li>
        <li><a href="/slimshadys-arr-setup-guide/docs/mdblist-import-lists.html">MDBList Import Lists</a> - list import patterns, source filtering, and automation inputs.</li>
      </ul>
    </section>
    <section>
      <h3>Operations And Reference</h3>
      <ul>
        <li><a href="/slimshadys-arr-setup-guide/docs/chapter-07-operations-troubleshooting.html">Chapter 7: Operations And Troubleshooting</a> - stuck queues, failed imports, bad files, Plex issues, and recovery flows.</li>
        <li><a href="/slimshadys-arr-setup-guide/docs/chapter-08-reference.html">Chapter 8: Reference Appendix</a> - specialist guide positioning, app references, and lookup links.</li>
        <li><a href="/slimshadys-arr-setup-guide/docs/chapter-09-codex-assisted-setup.html">Chapter 9: Codex-Assisted Setup And Downloads</a> - AI setup prompt, guardrails, templates, and example automation scripts.</li>
        <li><a href="/slimshadys-arr-setup-guide/docs/optional-companion-apps.html">Optional Companion Apps And Finishing Touches</a> - dashboards, subtitles, monitoring, metadata polish, profile sync, notifications, and what to skip.</li>
        <li><a href="/slimshadys-arr-setup-guide/docs/deployment-options.html">Deployment Options</a> - Windows 11, Docker, hosted servers, reverse proxies, dashboards, WebDAV, cloud mounts, and storage roles.</li>
        <li><a href="/slimshadys-arr-setup-guide/docs/setup-checklist.html">Setup Checklist</a> - a practical checklist for install, configuration, testing, and handoff.</li>
        <li><a href="/slimshadys-arr-setup-guide/docs/downloads.html">Downloads And Templates</a> - safe public templates, example scripts, prompt files, and package notes.</li>
        <li><a href="/slimshadys-arr-setup-guide/docs/index.html">All Docs Page</a> - the normal documentation landing page.</li>
      </ul>
    </section>
  </div>
</details>

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
- [Downloads and Templates](/slimshadys-arr-setup-guide/docs/downloads.html)
- [GitHub Repository](https://github.com/Shadow2442/slimshadys-arr-setup-guide)
- [Changelog](https://github.com/Shadow2442/slimshadys-arr-setup-guide/blob/main/CHANGELOG.md)
