<div class="doc-hero">
  <h2>Quick Start: Build The Stack First</h2>
  <p>The short, practical setup path. Use this when you want to know what to do first, what to customize, and when it is safe to move into the deeper language and archive chapters.</p>
  <div class="hero-badges">
    <span>Start here</span>
    <span>Windows-first</span>
    <span>Customize paths</span>
    <span>Verify before scaling</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/">Home</a>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-01-start-here.html">Chapter 1</a>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-02-base-setup.html">Base setup</a>
  <a href="/slimshadys-arr-setup-guide/docs/index.html">All docs</a>
</div>

<div class="quickstart-warning">
  <strong>Do not copy my paths blindly.</strong>
  The examples below use neutral placeholder names. Replace drive letters, folder names, ports, hostnames, quality goals, and language preferences with your own setup. If your server uses Docker, unionfs, rclone, WebDAV, cloud storage, or remote storage, keep the logic but adapt the paths. See <a href="/slimshadys-arr-setup-guide/docs/deployment-options.html">Deployment Options</a> before choosing that path.
</div>

## The Public-Friendly Setup Path

This guide has a lot of reasoning because language automation gets weird fast. The quick path below is the part you actually follow first. The deeper chapters explain why each decision exists.

<div class="setup-steps">
  <section class="setup-step-card">
    <span>1</span>
    <h3>Choose your edition</h3>
    <p>Pick the closest path before touching settings.</p>
    <table>
      <thead>
        <tr><th>Edition</th><th>Use it when</th><th>Start with</th></tr>
      </thead>
      <tbody>
        <tr>
          <td><strong>Simple Windows LAN</strong></td>
          <td>You run the apps on a Windows PC/server and Plex is mostly local or normal Plex remote access.</td>
          <td>This quick start plus Chapter 2.</td>
        </tr>
        <tr>
          <td><strong>Docker / remote server</strong></td>
          <td>You use Ubuntu, Docker, Dockserver-style stacks, Traefik, Authelia, Cloudflare, or a hosted server.</td>
          <td>Use this logic, then adapt deployment in the advanced notes.</td>
        </tr>
        <tr>
          <td><strong>Storage-light / mounted media</strong></td>
          <td>You use rclone, WebDAV, unionfs, cloud storage, or streamed placeholder libraries.</td>
          <td>Keep ARR/Plex boundaries, but adapt folders and imports carefully.</td>
        </tr>
      </tbody>
    </table>
  </section>

  <section class="setup-step-card">
    <span>2</span>
    <h3>Create the folder model</h3>
    <p>Make downloads temporary and libraries final. Do this before connecting apps.</p>
    <pre><code>Media/
  Movies/
  TV/
  Music/
Downloads/
  incomplete/
  complete/
    movies/
    tv/
    music/</code></pre>
    <details>
      <summary>Why this matters</summary>
      <p>ARR apps need predictable handoff folders. Plex should scan final library folders only, never temporary download folders. This prevents duplicates, bad names, and half-imported files from appearing in Plex.</p>
    </details>
    <details>
      <summary>Alternative names are fine</summary>
      <p>Your folders can be called <code>Filme</code>, <code>Serien</code>, <code>unionfs</code>, or anything else. The important part is consistency: use the same names in SABnzbd, Sonarr, Radarr, Lidarr, and Plex.</p>
    </details>
  </section>

  <section class="setup-step-card">
    <span>3</span>
    <h3>Install and wire the core apps</h3>
    <p>Install in this order and test each app before adding lists or family requests.</p>
    <table>
      <thead>
        <tr><th>Order</th><th>App</th><th>Minimum setup</th></tr>
      </thead>
      <tbody>
        <tr><td>1</td><td>SABnzbd</td><td>Server, temporary folder, completed folder, categories.</td></tr>
        <tr><td>2</td><td>Radarr</td><td>Movie root folder, SAB connection, <code>movies</code> category.</td></tr>
        <tr><td>3</td><td>Sonarr</td><td>Series root folder, SAB connection, <code>tv</code> category.</td></tr>
        <tr><td>4</td><td>Lidarr</td><td>Music root folder, SAB connection, <code>music</code> category.</td></tr>
        <tr><td>5</td><td>Plex</td><td>Libraries point only at final ARR-managed folders.</td></tr>
        <tr><td>6</td><td>Seerr</td><td>Default profiles and approvals after Radarr/Sonarr are safe.</td></tr>
      </tbody>
    </table>
  </section>

  <section class="setup-step-card">
    <span>4</span>
    <h3>Use safe first profiles</h3>
    <p>Start simple. Make sure the pipeline works before adding all custom formats.</p>
    <table>
      <thead>
        <tr><th>App</th><th>First safe profile</th><th>Important language rule</th></tr>
      </thead>
      <tbody>
        <tr>
          <td>Radarr</td>
          <td><code>1080p compact DE/EN fallback</code></td>
          <td>If using language custom formats, set language to <code>Any</code> and let scores decide.</td>
        </tr>
        <tr>
          <td>Sonarr</td>
          <td><code>HD/1080p-720p DE/EN fallback</code></td>
          <td>English is only a bridge when no German/Multi file exists.</td>
        </tr>
        <tr>
          <td>Anime</td>
          <td><code>Anime original-language lane</code></td>
          <td>Prefer German dub when available; otherwise Japanese/Chinese/Korean original audio with useful subtitles.</td>
        </tr>
      </tbody>
    </table>
    <details>
      <summary>Why not hard-lock everything to German?</summary>
      <p>Hard language locks look tidy but often fail in real life: release titles are inconsistent, parser language can be weak, and German dual-language files may be reported as Multi or undefined. Custom-format scoring gives German/Multi a strong win while still allowing controlled fallback.</p>
    </details>
  </section>

  <section class="setup-step-card">
    <span>5</span>
    <h3>Add custom formats and scoring</h3>
    <p>Use the established references for raw ARR mechanics, then apply this guide's home-library policy.</p>
    <table>
      <thead>
        <tr><th>Goal</th><th>Rule</th><th>Reference</th></tr>
      </thead>
      <tbody>
        <tr><td>German/Multi wins</td><td>Reward German DL / German/Multi strongly.</td><td>TRaSH and PCJones concepts, rewritten for this setup.</td></tr>
        <tr><td>Bad languages lose</td><td>Penalize or block non-target languages such as French-only, Turkish-only, Hebrew-only, and misleading title markers.</td><td>This guide's language chapters.</td></tr>
        <tr><td>English bridge</td><td>Allow English only when no acceptable file exists yet.</td><td>This guide's release ladder.</td></tr>
        <tr><td>Compact archive</td><td>Prefer sensible final sizes after availability is solved.</td><td>Archive chapter.</td></tr>
      </tbody>
    </table>
  </section>

  <section class="setup-step-card">
    <span>6</span>
    <h3>Prove the pipeline with three test items</h3>
    <p>Do not add lists, watchlists, or 200 movies until these pass.</p>
    <div class="checklist-grid">
      <label><input type="checkbox"> One movie downloads through Radarr.</label>
      <label><input type="checkbox"> One episode downloads through Sonarr.</label>
      <label><input type="checkbox"> One album imports through Lidarr, if you use music.</label>
      <label><input type="checkbox"> SAB categories match the right ARR app.</label>
      <label><input type="checkbox"> ARR imports and renames the finished file.</label>
      <label><input type="checkbox"> Plex sees only the final renamed file.</label>
      <label><input type="checkbox"> Bad-language releases are rejected or heavily penalized.</label>
      <label><input type="checkbox"> A verified final keeper can be unmonitored.</label>
    </div>
  </section>

  <section class="setup-step-card">
    <span>7</span>
    <h3>Add request and discovery tools last</h3>
    <p>Seerr, Plex watchlists, and MDBList are powerful only after the default profiles are safe.</p>
    <details>
      <summary>Recommended request safety</summary>
      <p>Allow normal requests, but be careful with watchlist auto-request and full-show auto-approval. A single watchlist click can otherwise add decades of episodes. Keep big requests reviewable until your profiles and category paths are proven.</p>
    </details>
  </section>
</div>

## What This Guide Does Differently

| Source style | What it is best at | How this guide uses it |
| --- | --- | --- |
| TRaSH Guides | Deep ARR profile and custom-format mechanics. | Treat as the technical reference, then apply a German/Multi plus compact-archive policy. |
| PCJones German dual-language guide | German DL logic and German/English language preference. | Treat as a strong German-language starting point, then extend into Plex, Seerr, archive, and automation behavior. |
| Dockserver-style stacks | Remote Docker server, Traefik, Authelia, Cloudflare, and domain-based access. | Treat as an advanced deployment option, not the default Windows home path. |
| Config/template tools | Repeatable profile/config definitions. | Use public templates as safer starting points, never as blind copy-paste secrets. |

## Continue

Once this quick start makes sense, go to the full base setup chapter.

<div class="chapter-next">
  <span>Continue</span>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-02-base-setup.html">Chapter 2: Base Setup Step by Step</a>
</div>
