<div class="doc-hero">
  <h2>Chapter 2: Base Setup Step by Step</h2>
  <p>The foundation chapter: folders, categories, downloader wiring, ARR apps, Plex, Jackett, and Seerr. Get this boring layer right and the clever parts become much less dramatic.</p>
  <div class="hero-badges">
    <span>Folders</span>
    <span>Categories</span>
    <span>ARR wiring</span>
    <span>Request safety</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/chapter-01-start-here.html">Previous</a>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-03-download-pipeline.html">Next</a>
  <a href="/slimshadys-arr-setup-guide/">Home</a>
</div>

<div class="edition-layout">
  <section class="edition-card accent-green">
    <span class="section-kicker">Install order</span>
    <h3>Build the plumbing before decorating the cinema</h3>
    <div class="flow-grid">
      <div class="flow-card"><em>1</em><strong>Create library folders</strong><span>Movies, series, music, and any separate anime lanes you actually need.</span></div>
      <div class="flow-card"><em>2</em><strong>Install SABnzbd</strong><span>Get the main downloader stable before adding many rules.</span></div>
      <div class="flow-card"><em>3</em><strong>Install ARR apps</strong><span>Sonarr, Radarr, and Lidarr should each own their own category.</span></div>
      <div class="flow-card"><em>4</em><strong>Install Plex</strong><span>Plex watches final library folders only.</span></div>
      <div class="flow-card"><em>5</em><strong>Add Jackett if needed</strong><span>Torrent fallback is optional and should stay selective.</span></div>
      <div class="flow-card"><em>6</em><strong>Add Seerr last</strong><span>Requests are useful only after profiles are safe.</span></div>
    </div>
  </section>

  <section class="edition-card">
    <span class="section-kicker">Categories</span>
    <h3>Keep the lanes clean</h3>
    <table>
      <thead><tr><th>ARR app</th><th>Downloader category</th><th>Final owner</th></tr></thead>
      <tbody>
        <tr><td><code>Sonarr</code></td><td><code>tv</code></td><td>Series library folder</td></tr>
        <tr><td><code>Radarr</code></td><td><code>movies</code></td><td>Movie library folder</td></tr>
        <tr><td><code>Lidarr</code></td><td><code>music</code></td><td>Music library folder</td></tr>
      </tbody>
    </table>
    <p>Downloader folders are work areas. ARR imports into final libraries. Plex watches the final libraries. That separation is the difference between automation and a folder soup tasting menu.</p>
  </section>

  <section class="edition-card accent-gold">
    <span class="section-kicker">Request safety</span>
    <h3>Seerr is the front door, not the steering wheel</h3>
    <div class="rule-grid">
      <div class="rule-card"><strong>Disable broad auto-approval</strong><span>Large requests should not instantly become large queues.</span></div>
      <div class="rule-card"><strong>Approve full shows manually</strong><span>A single family request should not download decades of episodes by accident.</span></div>
      <div class="rule-card"><strong>Use standard profiles</strong><span>Approved items should enter the current Sonarr/Radarr defaults.</span></div>
      <div class="rule-card"><strong>Let ARR decide</strong><span>Search, import, rename, language, and upgrades stay with ARR.</span></div>
    </div>
  </section>

  <section class="edition-card">
    <span class="section-kicker">Reference pages</span>
    <h3>Deep setup pages</h3>
    <div class="reference-grid">
      <a class="reference-card" href="/slimshadys-arr-setup-guide/docs/sonarr-setup-and-workflows.html"><strong>Sonarr</strong><span>Series and anime setup.</span></a>
      <a class="reference-card" href="/slimshadys-arr-setup-guide/docs/radarr-setup-and-workflows.html"><strong>Radarr</strong><span>Movie and anime movie setup.</span></a>
      <a class="reference-card" href="/slimshadys-arr-setup-guide/docs/lidarr-setup-and-workflows.html"><strong>Lidarr</strong><span>Music and album setup.</span></a>
      <a class="reference-card" href="/slimshadys-arr-setup-guide/docs/sabnzbd-tuning-and-reliability.html"><strong>SABnzbd</strong><span>Downloader stability.</span></a>
      <a class="reference-card" href="/slimshadys-arr-setup-guide/docs/jackett-setup-and-workflows.html"><strong>Jackett</strong><span>Torrent fallback hygiene.</span></a>
      <a class="reference-card" href="/slimshadys-arr-setup-guide/docs/plex-setup-and-workflows.html"><strong>Plex</strong><span>Final library playback.</span></a>
    </div>
  </section>

  <section class="edition-card accent-green">
    <span class="section-kicker">Exit criteria</span>
    <h3>Do not move on until this works</h3>
    <div class="rule-grid">
      <div class="rule-card"><strong>One movie imports</strong><span>Radarr downloads, imports, renames, and Plex sees it.</span></div>
      <div class="rule-card"><strong>One episode imports</strong><span>Sonarr downloads, imports, renames, and Plex sees it.</span></div>
      <div class="rule-card"><strong>Categories are clean</strong><span>No app is stealing another app's downloads.</span></div>
      <div class="rule-card"><strong>Music is separate</strong><span>Lidarr uses music logic, not movie or series logic.</span></div>
    </div>
  </section>
</div>

## Why the Base Setup Matters

Almost every later problem looks like a language or quality problem at first, but many start with boring wiring: the wrong category, the wrong root folder, Plex watching a temporary path, or a request tool adding too much at once.

The base setup makes the pipeline predictable. Each app should know exactly which downloads belong to it, where finished files should land, and which folder Plex should scan.

## Folder and Category Model

Use one clear final library folder per media type, and one matching downloader category per ARR app.

| Layer | Example | Purpose |
| --- | --- | --- |
| SAB temporary folder | `Downloads/incomplete` | Work area while data is still downloading or unpacking. |
| SAB completed folder | `Downloads/complete` | Handoff area for finished jobs. |
| Sonarr category | `tv` | Lets Sonarr see only series jobs that belong to it. |
| Radarr category | `movies` | Lets Radarr see only movie jobs that belong to it. |
| Lidarr category | `music` | Keeps albums away from video imports. |
| Plex library folder | `Media/Movies`, `Media/TV`, `Media/Music` | Final scanned library only. |

The important rule is simple: download folders are temporary; library folders are final. Plex should not watch temporary folders.

## What To Configure

| App | Minimum configuration before moving on |
| --- | --- |
| SABnzbd | Temporary folder, completed folder, server, API key, categories. |
| Sonarr | Root folder, downloader connection, `tv` category, one safe profile. |
| Radarr | Root folder, downloader connection, `movies` category, one safe profile. |
| Lidarr | Music root folder, downloader connection, `music` category. |
| Plex | Libraries pointed only at final ARR-managed folders. |
| Seerr | Default profiles and approvals set conservatively. |

## Test Before Scaling

Do not import hundreds of titles yet. Test one item per lane:

1. Add one movie in Radarr and search it.
2. Add one episode in Sonarr and search it.
3. Add one album in Lidarr if you use music automation.
4. Confirm SAB/qBittorrent receives the correct category.
5. Confirm ARR imports and renames the finished file.
6. Confirm Plex sees only the final renamed file.

## Common Early Mistakes

| Symptom | Likely cause | Fix |
| --- | --- | --- |
| Download finishes but ARR does not import | Wrong category or completed path. | Check downloader category and ARR download client settings. |
| Plex shows duplicate or ugly items | Plex watches temporary folders or bad names. | Point Plex only at final libraries and let ARR rename. |
| A request downloads too much | Seerr auto-approval is too broad. | Require manual approval for full shows and large requests. |
| Apps fight over downloads | Shared categories. | Give each app its own category. |

<div class="chapter-next">
  <span>Continue</span>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-03-download-pipeline.html">Chapter 3: Download Pipeline and Daily Automation</a>
</div>
