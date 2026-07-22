# Plex ARR Connect Template

Configure Plex in each ARR app under:

```text
Settings -> Connect -> Plex Media Server
```

| ARR app | Plex library | Recommended triggers |
| --- | --- | --- |
| Sonarr | TV / Series | Import, upgrade, rename, delete |
| Radarr | Movies | Import, upgrade, rename, delete |
| Lidarr | Music | Import, upgrade, rename |

Rules:

- ARR manages files.
- Plex scans final libraries.
- ARR uses the Plex API only to trigger updates.
- Test every connection before scaling.
- Treat Plex tokens like passwords.
