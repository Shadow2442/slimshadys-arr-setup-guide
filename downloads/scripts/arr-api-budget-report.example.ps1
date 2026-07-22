# Example only. Review and adapt before use.
# Purpose: estimate daily search/API budget.

param(
  [int]$MoviesPerRun = 100,
  [int]$EpisodesPerRun = 200,
  [int]$EstimatedIndexers = 3,
  [int]$DailyBudget = 800
)

$estimatedHits = ($MoviesPerRun + $EpisodesPerRun) * $EstimatedIndexers

[pscustomobject]@{
  MoviesPerRun = $MoviesPerRun
  EpisodesPerRun = $EpisodesPerRun
  EstimatedIndexers = $EstimatedIndexers
  EstimatedHits = $estimatedHits
  DailyBudget = $DailyBudget
  OverBudget = $estimatedHits -gt $DailyBudget
} | Format-Table -AutoSize

if ($estimatedHits -gt $DailyBudget) {
  Write-Warning "Estimated hits exceed budget. Reduce batch size or indexer count."
}
