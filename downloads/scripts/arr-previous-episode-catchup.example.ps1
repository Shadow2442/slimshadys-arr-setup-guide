# Example only. Review and adapt before use.
# Purpose: when a new German episode is found, check earlier episodes in the same season.

param(
  [string]$SeriesTitle,
  [int]$SeasonNumber,
  [switch]$DryRun = $true
)

Write-Host "Previous episode catch-up example"
Write-Host "Series: $SeriesTitle"
Write-Host "Season: $SeasonNumber"

# Suggested workflow:
# - Find previous episodes in the same season.
# - Identify English-only or missing files.
# - Search only those episodes.
# - Prefer German/Multi replacements.
# - Keep bridge files monitored until final state.

throw "Template only. Add Sonarr API calls locally."
