# Example only. Review and adapt before use.
# Purpose: outline a daily ARR release-ladder workflow.

param(
  [string]$ConfigPath = ".\config.private.json",
  [switch]$DryRun = $true
)

Write-Host "ARR release ladder example"
Write-Host "Config: $ConfigPath"
Write-Host "Dry run: $DryRun"

# Suggested workflow:
# 1. Load private config and API keys from local files.
# 2. Query Radarr/Sonarr for monitored released items.
# 3. Prioritize missing files and English bridge files.
# 4. Search in small batches within the daily API budget.
# 5. Prefer German/Multi, then scoped original-language fallbacks, then English bridge.
# 6. Queue safe downloads.
# 7. Verify imports before deleting or replacing files.
# 8. Unmonitor final verified keepers.

throw "Template only. Fill in private API calls and test with -DryRun first."
