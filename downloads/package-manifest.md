# Package Manifest

This package is meant to include public, safe files only.

## Included

- public guide pages
- `README.md`
- `CHANGELOG.md`
- safe website assets
- setup templates
- example PowerShell scripts
- example environment/config files
- master Codex setup prompt

## Excluded

- Radarr, Sonarr, Lidarr, Plex, SABnzbd, or Ombi databases
- API keys, Plex tokens, passwords, cookies, or sessions
- local backups
- logs, audit output, downloader history, and queue exports
- machine-specific paths
- downloaded media files

## Why

The goal is to help people reproduce the setup logic, not to copy a private server. Every user should adapt templates to their own folders, laws, indexers, accounts, and hardware.

## Recommended Public ZIP

The safest default download is the public GitHub repository ZIP:

https://github.com/Shadow2442/slimshadys-arr-setup-guide/archive/refs/heads/main.zip

## Curated Local Package

From a local checkout, run:

```powershell
.\downloads\scripts\build-safe-guide-package.ps1
```

The script includes only public guide/docs/download files and removes common private file patterns such as `.env`, `env.txt`, databases, backups, logs, local files, and secret files.
