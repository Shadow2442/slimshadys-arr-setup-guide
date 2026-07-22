# Example only. Review and adapt before use.
# Purpose: demonstrate Plex library refresh concepts.

param(
  [string]$PlexUrl = "http://localhost:32400",
  [string]$PlexToken = "replace_with_private_token",
  [string]$SectionId = "replace_with_library_section_id",
  [switch]$DryRun = $true
)

Write-Host "Plex refresh example"
Write-Host "Plex URL: $PlexUrl"
Write-Host "Section: $SectionId"
Write-Host "Dry run: $DryRun"

if ($DryRun) {
  Write-Host "Would call Plex library refresh endpoint. Not running in dry-run mode."
  exit 0
}

# Do not print PlexToken.
$uri = "$PlexUrl/library/sections/$SectionId/refresh?X-Plex-Token=$PlexToken"
Invoke-RestMethod -Method Get -Uri $uri | Out-Null
Write-Host "Refresh requested."
