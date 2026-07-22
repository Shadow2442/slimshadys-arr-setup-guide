# Builds a curated public ZIP from this repository.
# It intentionally includes only guide/docs/download companion files.

param(
  [string]$OutputPath = ".\slimshadys-arr-setup-guide-package.zip"
)

$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..\..")
$staging = Join-Path ([System.IO.Path]::GetTempPath()) ("slimshadys-arr-guide-package-" + [guid]::NewGuid().ToString("N"))
$packageRoot = Join-Path $staging "slimshadys-arr-setup-guide-package"

New-Item -ItemType Directory -Path $packageRoot | Out-Null

$includePaths = @(
  "README.md",
  "CHANGELOG.md",
  "index.md",
  "_config.yml",
  "assets",
  "docs",
  "downloads"
)

foreach ($relative in $includePaths) {
  $source = Join-Path $repoRoot $relative
  if (-not (Test-Path $source)) {
    continue
  }

  $destination = Join-Path $packageRoot $relative
  $parent = Split-Path $destination -Parent
  New-Item -ItemType Directory -Path $parent -Force | Out-Null

  if ((Get-Item $source).PSIsContainer) {
    Copy-Item -Path $source -Destination $destination -Recurse
  } else {
    Copy-Item -Path $source -Destination $destination
  }
}

$blockedPatterns = @(
  "*.db",
  "*.backup*",
  "*.log",
  "*.secret",
  "*.local",
  ".env",
  "env.txt"
)

foreach ($pattern in $blockedPatterns) {
  Get-ChildItem -Path $packageRoot -Recurse -Force -Filter $pattern | Remove-Item -Force -Recurse
}

$resolvedOutput = if ([System.IO.Path]::IsPathRooted($OutputPath)) {
  $OutputPath
} else {
  Join-Path $repoRoot $OutputPath
}

if (Test-Path $resolvedOutput) {
  Remove-Item $resolvedOutput -Force
}

Compress-Archive -Path $packageRoot -DestinationPath $resolvedOutput -Force
Remove-Item $staging -Recurse -Force

Write-Host "Created package: $resolvedOutput"
