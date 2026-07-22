# Example only. Review and adapt before use.
# Purpose: check ARR, SABnzbd, and qBittorrent queues for stuck jobs.

param(
  [string]$EnvPath = ".\.env",
  [switch]$DryRun = $true
)

Write-Host "ARR queue health example"
Write-Host "Env: $EnvPath"
Write-Host "Dry run: $DryRun"

# Suggested checks:
# - Radarr queue warnings
# - Sonarr queue warnings
# - SAB jobs stuck unpacking or orphaned
# - qBittorrent stalled metadata or completed-but-not-imported jobs
# - completed downloads that ARR still needs

throw "Template only. Add local API calls and never print secrets."
