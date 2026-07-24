<div class="doc-hero">
  <h2>Optional Companion Apps And Finishing Touches</h2>
  <p>The core stack is Plex, Sonarr, Radarr, Lidarr, SABnzbd, Jackett or Prowlarr, and Seerr. This page explains what to add after that, what to skip for now, and how to keep the setup friendly instead of turning it into a second job.</p>
  <div class="hero-badges">
    <span>Optional apps</span>
    <span>Dashboards</span>
    <span>Subtitles</span>
    <span>Monitoring</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/plex-ecosystem-guide.html">Plex Ecosystem</a>
  <a href="/slimshadys-arr-setup-guide/docs/deployment-options.html">Deployment Options</a>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-08-reference.html">Reference</a>
  <a href="/slimshadys-arr-setup-guide/docs/index.html">All docs</a>
  <a href="/slimshadys-arr-setup-guide/">Home</a>
</div>

<div class="cinema-note">
  <strong>Rule of thumb:</strong>
  Do not add companion apps because a stack diagram looks impressive. Add them when they solve a real pain: subtitles are missing, family users need a request page, you want one dashboard, remote playback is hard to diagnose, or you need profile settings to stay consistent.
</div>

<div class="edition-layout">
  <section class="edition-card accent-green">
    <span class="section-kicker">Add first</span>
    <h3>The useful finishing layer</h3>
    <div class="rule-grid">
      <div class="rule-card"><strong>Dashboard</strong><span>Use Homepage or Homarr when the stack has too many tabs.</span></div>
      <div class="rule-card"><strong>Bazarr</strong><span>Add subtitle management if original audio and family playback depend on good subtitles.</span></div>
      <div class="rule-card"><strong>Tautulli</strong><span>Add Plex monitoring when remote playback, users, or watch history matter.</span></div>
      <div class="rule-card"><strong>Prowlarr</strong><span>Consider it for fresh setups that want indexers managed inside the ARR style.</span></div>
    </div>
  </section>

  <section class="edition-card">
    <span class="section-kicker">Add later</span>
    <h3>Good tools, but not day one</h3>
    <div class="rule-grid">
      <div class="rule-card"><strong>Kometa</strong><span>Use it after Plex is stable if you want collections, overlays, playlists, and metadata polish.</span></div>
      <div class="rule-card"><strong>Recyclarr</strong><span>Use carefully if you want TRaSH-style sync without manually copying profiles forever.</span></div>
      <div class="rule-card"><strong>Uptime tools</strong><span>Add Uptime Kuma, Gotify, ntfy, or Notifiarr when silent failures become annoying.</span></div>
      <div class="rule-card"><strong>Transcoding tools</strong><span>Keep Tdarr or Unmanic advanced-only unless you understand codec and storage tradeoffs.</span></div>
    </div>
  </section>
</div>

## Companion App Decision Matrix

| App or area | What it solves | When to add it | When to skip it |
| --- | --- | --- | --- |
| Homepage | One clean dashboard for Plex, ARR apps, downloaders, indexers, and status widgets. | You want a modern admin cockpit and are comfortable editing simple config. | You only have one admin and browser bookmarks are enough. |
| Homarr | A friendly visual dashboard with common media-server integrations. | You want a quicker, more visual dashboard setup. | You prefer simple text config or already use Homepage. |
| Organizr | A tabbed portal around many media apps. | You like the older portal style and want apps grouped in one browser shell. | You want the simplest modern dashboard. |
| Bazarr | Subtitle management for Sonarr and Radarr media. | You watch original audio, anime, Korean/Chinese media, or need German/English subtitles to be more predictable. | You only keep files with proven embedded subtitles or never use subtitles. |
| Tautulli | Plex monitoring, watch history, playback details, and notifications. | Remote users, transcoding, or family usage become hard to understand from Plex alone. | You only use Plex locally and do not care about statistics. |
| Prowlarr | Central indexer management for ARR apps. | You are starting fresh or want indexers synced cleanly across Sonarr, Radarr, and Lidarr. | Your Jackett setup already works and you do not want to migrate. |
| Recyclarr | Sync TRaSH Guide quality profiles, custom formats, naming, and sizes into ARR apps. | You want repeatable profile maintenance and understand what it will change. | You are still learning profiles or have custom German/Multi scoring you do not want overwritten. |
| Kometa | Plex collections, playlists, overlays, and metadata automation. | Plex works and you want a polished library front end. | Matching, naming, and playback are still unstable. |
| Uptime Kuma / ntfy / Gotify / Notifiarr | Health checks and notifications. | You want to know when Plex, ARR, indexers, or storage mounts are down. | You already check the stack manually and alerts would become noise. |
| Tdarr / Unmanic | Library-wide transcoding or codec conversion. | You have a clear reason, tested settings, and backups. | You just want Plex working. These can waste time or damage quality if used blindly. |

## Recommended Add Order

Add optional tools in this order:

1. Keep the core stack stable first: Plex, Sonarr, Radarr, Lidarr, SABnzbd, Jackett/Prowlarr, and Seerr.
2. Add a dashboard if daily use feels scattered.
3. Add Bazarr if subtitle gaps are visible in Plex.
4. Add Tautulli if you need playback and user visibility.
5. Add Prowlarr only if indexer management is becoming annoying or you are starting fresh.
6. Add Kometa after metadata and matching are already clean.
7. Add Recyclarr only after your custom German/Multi rules are backed up and understood.
8. Add uptime/notification tools when the setup is important enough that silent failures matter.

That order keeps the guide practical: make playback work, make requests safe, make admin easier, then polish.

## Dashboard Choice

Dashboards are quality-of-life tools. They should make the stack calmer, not expose private admin apps to everyone.

| Pick | Best fit | Simple layout |
| --- | --- | --- |
| Browser bookmarks | Smallest possible admin setup. | Plex, Seerr, Sonarr, Radarr, SABnzbd, Jackett/Prowlarr. |
| Homepage | Modern widget dashboard with many media integrations. | Watch, Requests, Movies, Series, Downloads, Indexers, Maintenance. |
| Homarr | Friendly visual dashboard for media apps. | Plex and Seerr first, admin tools grouped below. |
| Organizr | Portal/tab style for larger stacks. | One tab group for Plex/request tools, one for admin-only tools. |
| Dashy / Homer / Heimdall | Lightweight launchpads. | Good when you only want links, not rich widgets. |

Keep dashboards private unless you deliberately design authentication. Family users usually need only Plex and Seerr. They do not need Sonarr, Radarr, Lidarr, SABnzbd, Jackett, Prowlarr, or qBittorrent.

## Subtitles With Bazarr

Bazarr is the most natural missing companion for this guide because the library goal is not just "German only." The goal is German-friendly plus original-language friendly.

Use Bazarr when:

- original audio matters
- German or English subtitles make family playback easier
- anime or non-English media needs better subtitle coverage
- embedded subtitles are inconsistent
- you want subtitles to be managed after Sonarr/Radarr imports

Keep the setup simple:

1. Connect Bazarr to Sonarr and Radarr.
2. Choose subtitle languages that match the library goal, usually German and English.
3. Start with manual or conservative automatic searches.
4. Test one movie and one series.
5. Confirm Plex sees the subtitle track correctly.
6. Only then enable wider automatic subtitle searches.

Do not use Bazarr to hide bad release choices. If a file has the wrong audio, bad quality, or misleading language tags, fix the ARR profile or replacement rule first.

## Plex Monitoring With Tautulli

Tautulli is useful once other people use the server or once remote playback becomes difficult to explain.

Use it to answer:

- who is watching
- whether playback direct plays or transcodes
- which client causes problems
- whether remote streams buffer because of bandwidth, subtitles, or transcoding
- which recently added items people actually watch

This is optional for a small local-only setup. It becomes valuable when Plex is a shared family service and you need facts instead of guessing.

## Prowlarr, Jackett, And Indexers

Jackett is fine if it already works. Do not migrate just because another app exists.

Prowlarr is worth considering when:

- you are starting fresh
- you want indexers managed in one ARR-style interface
- you use Sonarr, Radarr, and Lidarr together
- you want indexer sync across apps

Keep the same safety rule either way: indexers contain search capability and often sensitive account details. Keep Jackett or Prowlarr private, not public.

## Recyclarr And Guide Sync

Recyclarr and TRaSH Guide Sync can reduce profile maintenance work, but they should be treated as advanced tools in this guide.

Good use:

- keep standard TRaSH-style custom formats updated
- make profile setup repeatable
- reduce manual copying between Radarr and Sonarr

Risky use:

- blindly overwrite working German/Multi rules
- apply someone else's quality goals without understanding them
- sync before backing up current profiles

Before using sync tools, export or screenshot the current profiles, custom formats, and quality definitions. Then apply changes to one app or one test profile first.

## Kometa For Plex Polish

Kometa is for the library presentation layer: collections, playlists, overlays, and metadata automation. It can make Plex feel curated instead of just sorted.

Add it only after:

- Plex matching is stable
- folder naming is clean
- libraries are separated correctly
- users can already find and play media

Good first Kometa ideas:

- simple collections by genre, year, franchise, or mood
- seasonal collections
- language or original-version collections
- watchlist-style discovery collections

Skip overlays and heavy metadata automation until the base collection logic is understandable.

## What Not To Add Yet

These tools can be good, but they are not beginner defaults:

| Area | Why to wait |
| --- | --- |
| Tdarr / Unmanic | Bulk transcoding can waste time, reduce quality, or create huge cleanup work if settings are wrong. |
| Complex reverse proxy plus SSO | Useful for advanced remote setups, but unnecessary for a simple home LAN stack. |
| Public dashboards | A dashboard can expose too much if auth and app permissions are weak. |
| Cloud mounts as first storage | Great when planned, painful when imports, deletes, or rate limits are not understood. |
| Automated profile sync | Useful after profile rules are understood, risky before then. |
| Too many notification tools | Alerts are helpful only if they stay actionable. Noise gets ignored. |

## Reference Links

| Topic | Source |
| --- | --- |
| Homepage dashboard | [Homepage](https://gethomepage.dev/) |
| Homarr dashboard | [Homarr](https://homarr.dev/) |
| Organizr dashboard | [Organizr](https://organizr.org/) |
| Bazarr subtitles | [Bazarr](https://www.bazarr.media/) |
| Tautulli Plex monitoring | [Tautulli](https://tautulli.com/) |
| Prowlarr and Servarr apps | [Servarr Wiki](https://wiki.servarr.com/) |
| Recyclarr | [Recyclarr](https://recyclarr.dev/) |
| TRaSH Guide Sync | [TRaSH Guide Sync](https://trash-guides.info/Guide-Sync/) |
| Kometa metadata and collections | [Kometa Wiki](https://kometa.wiki/) |

<div class="chapter-next">
  <span>Continue</span>
  <a href="/slimshadys-arr-setup-guide/docs/plex-ecosystem-guide.html">Back to the Plex Ecosystem Guide</a>
</div>
