# Folder Layout Example

Use separate temporary download folders and final Plex library folders.

```text
MEDIA_DRIVE:\
  media\
    movies\
      Movie Title (Year)\
        Movie Title (Year).ext
    series\
      Series Title\
        Season 01\
          Series Title - S01E01.ext
    music\
      Artist\
        Album\
          01 - Track.ext

DOWNLOAD_DRIVE:\
  downloads\
    incomplete\
    complete\
```

Rules:

- Plex points only at final folders under `media`.
- SAB/qBittorrent use `downloads`.
- Sonarr, Radarr, and Lidarr import from downloads into final media folders.
- Do not put temporary folders inside Plex libraries.
