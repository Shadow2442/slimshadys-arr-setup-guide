<div class="doc-hero">
  <h2>Deployment Options</h2>
  <p>Choose how the stack is exposed and operated. The main guide is Windows/private-home first, but the same ARR/Plex boundaries can be adapted to Docker, remote servers, dashboards, and mounted storage.</p>
  <div class="hero-badges">
    <span>Local LAN</span>
    <span>Docker</span>
    <span>Remote server</span>
    <span>Mounted storage</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/quick-start-installation.html">Quick Start</a>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-02-base-setup.html">Base setup</a>
  <a href="/slimshadys-arr-setup-guide/docs/index.html">All docs</a>
</div>

## Pick The Deployment Style First

The app logic stays similar across setups, but paths, security, and access change a lot. Pick the closest pattern before copying examples.

| Style | Good for | Main caution |
| --- | --- | --- |
| Simple Windows LAN | A home PC or home server with local drives and normal Plex access. | Do not expose ARR apps directly to the internet. |
| Docker on Linux | Cleaner app isolation, easier upgrades, repeatable compose files. | Path mappings must be consistent across containers. |
| Dockserver-style hosted stack | Remote server, domain, reverse proxy, and managed app deployment. | Security and identity become part of the setup, not an optional extra. |
| Reverse proxy with domain | Nice URLs, one entry point, TLS, and optional SSO. | Needs careful authentication; ARR apps are not public websites. |
| Cloudflare Tunnel | Remote access without opening ports at home. | Only publish what should actually be reachable. |
| Mounted storage / WebDAV / rclone / unionfs | Small local disks with large remote or merged libraries. | Imports, deletes, scans, and hardlinks behave differently than local disks. |

## Recommended For This Guide

<div class="rule-grid">
  <div class="rule-card"><strong>Beginner default</strong><span>Use the simple Windows/private LAN path until the core pipeline works.</span></div>
  <div class="rule-card"><strong>Public access</strong><span>Expose Plex carefully; keep ARR apps private or behind strong authentication.</span></div>
  <div class="rule-card"><strong>Dashboard</strong><span>Use a dashboard or browser shortcuts so you do not live in ten localhost tabs forever.</span></div>
  <div class="rule-card"><strong>Advanced storage</strong><span>Use mounted/cloud storage only after you understand import paths and delete behavior.</span></div>
</div>

## Dashboard And Local Shortcuts

A normal home setup does not need a full reverse proxy on day one, but it should still be pleasant to use.

| Option | What it gives you | Example |
| --- | --- | --- |
| Browser bookmarks | Lowest effort, good enough for one user. | Bookmarks for Plex, Sonarr, Radarr, SABnzbd, Seerr. |
| Local dashboard | One landing page for the stack. | Homepage, Organizr-style dashboard, or another self-hosted dashboard. |
| Hosts/DNS shortcuts | Type app names instead of ports. | `http://radarr`, `http://sonarr`, `http://sabnzbd`. |
| Reverse proxy | Clean URLs and central authentication. | `https://radarr.example.tld` behind SSO/VPN/access policy. |

Do not publish ARR apps directly without protection. If family users only need requests, expose Seerr or Plex, not every admin tool.

## How This Changes The Setup Steps

| Area | Local Windows | Docker / remote / mounted storage |
| --- | --- | --- |
| Paths | Use normal drive and folder paths. | Use container paths, mounted paths, and remote path mappings consistently. |
| Hardlinks | Keep downloads and libraries on the same filesystem when possible. | Confirm hardlinks work inside the container/storage layout. |
| Plex scans | Plex watches local final folders. | Plex must see the same final media path that ARR imports to. |
| Security | Local-only admin apps are acceptable. | Use SSO, VPN, tunnel policies, or reverse-proxy auth. |
| Backups | Back up configs and databases. | Back up compose files, env files, app configs, and persistent volumes. |

## What Not To Do

- Do not copy someone else's drive letters or mount names.
- Do not expose Sonarr, Radarr, Lidarr, SABnzbd, Jackett, or qBittorrent directly to the public internet.
- Do not add request automation before default profiles are safe.
- Do not combine remote storage with automatic deletes until you have tested recovery.
- Do not assume Docker paths and Windows paths mean the same thing.

<div class="chapter-next">
  <span>Continue</span>
  <a href="/slimshadys-arr-setup-guide/docs/quick-start-installation.html">Back to Quick Start Installation</a>
</div>
