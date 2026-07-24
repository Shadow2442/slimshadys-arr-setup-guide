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

| Style | Good for | Main caution | My take |
| --- | --- | --- | --- |
| Windows 11 home server | A normal home PC/server with local disks, simple app installs, and normal Plex remote access. | Windows services, drive letters, permissions, and updates need care. | Best beginner path for this guide. |
| Windows 11 plus dashboard | Same as above, but with one clean landing page for all apps. | Dashboard does not replace app security. | Best quality-of-life upgrade. |
| Docker on Linux | Cleaner app isolation, easier upgrades, repeatable compose files. | Path mappings must be consistent across containers. | Best long-term homelab path if you are comfortable with Linux. |
| Dockserver-style hosted stack | Remote server, domain, reverse proxy, and managed app deployment. | Security and identity become part of the setup, not an optional extra. | Powerful, but not the beginner default. |
| Reverse proxy with domain | Nice URLs, TLS, central routing, optional SSO. | ARR apps are admin tools, not public websites. | Use with strong auth or private access. |
| Cloudflare Tunnel / Zero Trust style access | Remote access without opening ports at home. | Be careful with streaming terms, bandwidth, and what you expose. | Good for admin apps if locked down; think twice for heavy Plex traffic. |
| WebDAV mount | Lightweight remote storage or NAS-like access. | File locking, latency, and rename/delete behavior can be awkward. | Fine for advanced users; test imports before trusting it. |
| Google Drive / Dropbox / cloud mount | Large remote library, small local server disk. | API limits, upload delays, mount reliability, and delete behavior matter. | Use local download/import cache plus a planned upload/move workflow. |
| unionfs / mergerfs / rclone hybrid | Local writes with remote/cloud library presentation. | More moving parts and more ways paths can disagree. | Strong advanced option when local disk is small. |

## Recommended For This Guide

<div class="rule-grid">
  <div class="rule-card"><strong>Beginner default</strong><span>Use the simple Windows/private LAN path until the core pipeline works.</span></div>
  <div class="rule-card"><strong>Public access</strong><span>Expose Plex carefully; keep ARR apps private or behind strong authentication.</span></div>
  <div class="rule-card"><strong>Dashboard</strong><span>Use a dashboard or browser shortcuts so you do not live in ten localhost tabs forever.</span></div>
  <div class="rule-card"><strong>Advanced storage</strong><span>Use mounted/cloud storage only after you understand import paths and delete behavior.</span></div>
</div>

## Storage Options

The storage choice decides how painful imports, scans, deletes, and upgrades become. Local storage is easiest. Cloud or mounted storage can be great, but it needs a stricter workflow.

| Storage option | What it means | Good fit | Watch out for |
| --- | --- | --- | --- |
| Local HDD/SSD/NAS share | ARR imports directly into final folders Plex can scan. | Most home users. | Keep downloads and final folders on compatible storage if you want hardlinks. |
| Windows storage spaces / pooled disks | Several local disks presented as one pool. | Growing home libraries without Docker complexity. | Backups and drive failure planning are still your problem. |
| WebDAV mount | Remote storage mounted like a folder. | Lightweight remote storage and manual archives. | Latency and rename/delete semantics can confuse ARR imports. |
| Google Drive / Dropbox via rclone | Cloud storage mounted or synced into the server. | Huge libraries with little local disk. | API limits, upload delays, and direct-write reliability. |
| Local cache plus cloud upload | Downloads/imports happen locally, then a sync job moves finished media. | Cloud-backed libraries that still need stable imports. | Requires clear sync rules and delete discipline. |
| mergerfs / unionfs plus rclone | Local and cloud paths appear as one merged library. | Advanced Linux stacks. | Path consistency and mount health become critical. |

For cloud-backed setups, the safer model is usually: download locally, import locally, verify locally, then move or sync to cloud. Directly downloading or importing into a cloud mount can work, but it is less forgiving when the provider rate-limits, disconnects, or delays file operations.

## Dashboard And Local Shortcuts

A normal home setup does not need a full reverse proxy on day one, but it should still be pleasant to use.

| Option | What it gives you | Best for |
| --- | --- | --- |
| Browser bookmarks | Lowest effort, good enough for one user. | First setup day. |
| Hosts/DNS shortcuts | Type app names instead of ports. | Simple LAN setups: `http://radarr`, `http://sonarr`, `http://sabnzbd`. |
| Homepage | Modern service dashboard with widgets and service status. | A clean ARR/Plex cockpit for most homelabs. |
| Homarr | Polished app dashboard with integrations and easy visual grouping. | Users who want a friendly UI and quick setup. |
| Organizr | Tabbed dashboard with stronger multi-user/access-control style. | Larger stacks and people who want one browser shell around many apps. |
| Dashy / Homer / Heimdall | Lightweight dashboard choices with different levels of visual polish and config style. | People who want a simple launchpad. |
| Reverse proxy dashboard | Clean URLs and central authentication. | Remote/domain setups with SSO, VPN, or tunnel policies. |

Do not publish ARR apps directly without protection. If family users only need requests, expose Seerr or Plex, not every admin tool.

### Suggested Dashboard Layout

Keep the dashboard simple. It should reduce tab chaos, not become another hobby project unless you want it to.

| Group | Apps |
| --- | --- |
| Watch | Plex, Seerr |
| Movies | Radarr, movie request queue, movie library stats |
| Series | Sonarr, series request queue, calendar |
| Downloads | SABnzbd, qBittorrent if used |
| Indexers | Jackett, indexer status links |
| Maintenance | ARR health pages, logs, automation reports, backups |

For family users, expose only Plex and Seerr. Keep Radarr, Sonarr, Lidarr, SABnzbd, Jackett, and qBittorrent as admin-only tools.

## Example Setup Choices

| Persona | Recommended stack |
| --- | --- |
| I want the easiest setup | Windows 11 server, local disks, SABnzbd, ARR apps, Plex, Seerr, bookmarks or Homepage. |
| I want one nice cockpit | Windows 11 or Docker, Homepage/Homarr, app widgets, local-only admin access. |
| I want a serious hosted server | Ubuntu/Docker, Traefik or another reverse proxy, SSO/auth layer, domain, strict backups. |
| I have small local storage | Local download/import cache, rclone sync/mount, careful delete rules, Plex scans final merged path. |
| I want family requests only | Plex plus Seerr exposed safely; ARR/download/indexer apps hidden from normal users. |

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
