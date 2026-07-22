# Example only. Review and adapt before use.
# Purpose: test indexer health without exposing API keys.

param(
  [string]$ConfigPath = ".\config.private.json",
  [switch]$DryRun = $true
)

Write-Host "Indexer health check example"

# Suggested workflow:
# - Check ARR health endpoints.
# - Test important indexers through ARR or indexer manager.
# - Detect rate limits, auth failures, and repeated feed failures.
# - Disable noisy/broken sources only after confirming the failure.
# - Re-enable only after direct tests pass.

throw "Template only. Add local indexer API calls."
