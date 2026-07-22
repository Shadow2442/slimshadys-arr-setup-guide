# SABnzbd Categories Example

Create one category per ARR app.

| Category | App | Completed path example |
| --- | --- | --- |
| `movies` | Radarr | `DOWNLOAD_DRIVE:\downloads\complete\movies` |
| `tv` | Sonarr | `DOWNLOAD_DRIVE:\downloads\complete\tv` |
| `music` | Lidarr | `DOWNLOAD_DRIVE:\downloads\complete\music` |

Recommended behavior:

- keep temporary and complete folders outside Plex libraries
- enable sample/junk cleanup where appropriate
- keep categories stable once ARR apps are connected
- test one movie, one episode, and one album before scaling
