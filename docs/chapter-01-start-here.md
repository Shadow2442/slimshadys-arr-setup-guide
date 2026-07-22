<div class="guide-banner-frame">
  <img class="guide-banner-image" src="/slimshadys-arr-setup-guide/docs/assets/guide-banner.png" alt="SlimShady's ARR Setup Guide banner">
</div>

<div class="doc-hero">
  <h2>Chapter 1: Start Here</h2>
  <p>This is the orientation layer: what the stack is for, why the language rules exist, and how to move through the guide without turning setup day into a tiny private IT incident.</p>
  <div class="hero-badges">
    <span>Big picture first</span>
    <span>Swiss private use</span>
    <span>Original versions</span>
    <span>Family playback</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/">Home</a>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-02-base-setup.html">Next chapter</a>
  <a href="/slimshadys-arr-setup-guide/docs/index.html">All docs</a>
</div>

<div class="edition-layout">
  <section class="edition-card accent-green">
    <span class="section-kicker">The premise</span>
    <h3>A Swiss movie-lover's automation stack</h3>
    <p>This guide is written from the perspective of a Swiss movie aficionado who wants two things at once: preserve original versions and original audio where they matter, while making movies and series easy for family to watch in their native language.</p>
    <p>The result is not a generic "download whatever" setup. It is a language-aware, archive-aware, family-friendly media workflow.</p>
  </section>

  <section class="edition-card">
    <span class="section-kicker">The stack</span>
    <h3>What the tools do</h3>
    <div class="rule-grid">
      <div class="rule-card"><strong>Sonarr</strong><span>TV and anime series automation.</span></div>
      <div class="rule-card"><strong>Radarr</strong><span>Movies and anime movie automation.</span></div>
      <div class="rule-card"><strong>Lidarr</strong><span>Music, artists, albums, and metadata flow.</span></div>
      <div class="rule-card"><strong>SABnzbd</strong><span>Main Usenet downloader and unpacking engine.</span></div>
      <div class="rule-card"><strong>Jackett</strong><span>Optional torrent fallback when Usenet is not enough.</span></div>
      <div class="rule-card"><strong>Plex</strong><span>Final library scan, matching, and playback.</span></div>
      <div class="rule-card"><strong>Seerr</strong><span>Optional request front door for family and discovery.</span></div>
    </div>
  </section>

  <section class="edition-card accent-gold">
    <span class="section-kicker">Swiss context</span>
    <h3>Private use, not public distribution</h3>
    <p>This guide assumes Swiss private use: personal media organization, original-version preservation, and family viewing. It is not a guide for uploading, public redistribution, commercial sharing, or running an open media service.</p>
    <p>The Swiss Federal Institute of Intellectual Property explains that downloading or streaming works for private use is allowed, including from illegal sources, while uploading or making works available online is not allowed. Article 19 of the Swiss Copyright Act defines private use to include personal use and use within a circle of closely connected people such as relatives or friends.</p>
    <div class="source-chips">
      <a href="https://www.ige.ch/en/protecting-your-ip/copyright/using-a-work/copyright-on-the-internet">Swiss IPI source</a>
      <a href="https://www.fedlex.admin.ch/eli/cc/1993/1798_1798_1798/en">Fedlex Art. 19</a>
    </div>
  </section>

  <section class="edition-card">
    <span class="section-kicker">Reading path</span>
    <h3>Follow the chapters in this order</h3>
    <div class="flow-grid">
      <div class="flow-card"><em>1</em><strong>Build the base stack</strong><span>Folders, categories, ARR apps, downloader, and Plex first.</span></div>
      <div class="flow-card"><em>2</em><strong>Prove the pipeline</strong><span>One movie and one episode should download, import, rename, and appear in Plex.</span></div>
      <div class="flow-card"><em>3</em><strong>Add discovery</strong><span>MDBList and Seerr come after the base rules are sane.</span></div>
      <div class="flow-card"><em>4</em><strong>Add language rules</strong><span>German-friendly, Multi, anime, Korean, and Chinese logic.</span></div>
      <div class="flow-card"><em>5</em><strong>Add archive behavior</strong><span>Compact keepers, bridge files, and final-state unmonitoring.</span></div>
      <div class="flow-card"><em>6</em><strong>Automate carefully</strong><span>Daily release ladder, catch-up checks, import cleanup, and quota limits.</span></div>
    </div>
  </section>

  <section class="edition-card accent-green">
    <span class="section-kicker">Core rules</span>
    <h3>The whole guide in seven rules</h3>
    <div class="rule-grid">
      <div class="rule-card"><strong>ARR owns imports</strong><span>Let Sonarr, Radarr, and Lidarr handle naming and final paths.</span></div>
      <div class="rule-card"><strong>Plex scans finals</strong><span>Plex should see clean library folders, not temporary download chaos.</span></div>
      <div class="rule-card"><strong>English is a bridge</strong><span>It fills gaps but should not beat German/Multi later.</span></div>
      <div class="rule-card"><strong>German/Multi wins</strong><span>Language beats shiny source-tier upgrades when family playback matters.</span></div>
      <div class="rule-card"><strong>Original lanes are scoped</strong><span>Anime, Korean, and Chinese rules stay in their lanes.</span></div>
      <div class="rule-card"><strong>Final means unmonitored</strong><span>Verified keepers should stop attracting unnecessary replacements.</span></div>
      <div class="rule-card"><strong>Requests need brakes</strong><span>Keep large Seerr requests manually approved.</span></div>
    </div>
  </section>
</div>

## Why This Guide Exists

Most ARR setups explain how to install apps, but they often skip the part that matters later: why one release should win over another. That missing reasoning is where wrong-language downloads, giant files, bad Plex matches, and surprise full-season grabs usually come from.

This guide is opinionated because the target library is opinionated. The goal is not maximum downloads. The goal is a home media library that feels deliberate:

- original audio is preserved when it matters
- German audio and subtitles make family playback easy
- English can bridge availability gaps
- German/Multi replaces English when it becomes available
- compact final files stop being touched once they are verified

## How the Stack Thinks

ARR apps do not watch videos or listen to audio like a person. They make decisions from metadata: title terms, indexer language, quality, custom format score, size limits, monitored state, and whether a better release is allowed to replace the current file.

That means the setup has to make the desired outcome obvious to the apps. If German/Multi is the final target, the profiles and custom formats must reward it. If French or Turkish releases are never wanted in normal lanes, they need strong penalties or blocks. If a file is already the final keeper, monitoring should be turned off so it does not get reconsidered.

## What You Configure Later

| Area | Why it matters | Where it is covered |
| --- | --- | --- |
| Folders and categories | Keeps downloads, imports, and Plex libraries separated. | Chapter 2 |
| Profiles and custom formats | Teaches Sonarr and Radarr which releases should win. | Chapters 4-6 |
| Discovery and automation | Finds missing files and upgrades English bridge files later. | Chapter 3 |
| Original-language lanes | Prevents anime, Korean, and Chinese logic from leaking into normal media. | Chapter 5 |
| Operations | Gives you a recovery path when queues, imports, or Plex matching fail. | Chapter 7 |

## First Sanity Check

Before changing scores or adding lists, make sure you can explain the flow in one sentence: "A title enters ARR, ARR chooses a release, the downloader finishes it, ARR imports and renames it, Plex scans the final folder."

If any part of that sentence is not working yet, stay in the base setup chapter before adding smarter language rules.

<div class="chapter-next">
  <span>Continue</span>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-02-base-setup.html">Chapter 2: Base Setup Step by Step</a>
</div>
