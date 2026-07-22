<div class="doc-hero">
  <h2>Downloads, Templates, and Example Scripts</h2>
  <p>This page collects the safe files that go with the guide: setup templates, example automation scripts, a master Codex prompt, and a package manifest.</p>
  <div class="hero-badges">
    <span>Safe templates</span>
    <span>Example scripts</span>
    <span>Master prompt</span>
    <span>No secrets</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/chapter-09-codex-assisted-setup.html">Chapter 9</a>
  <a href="/slimshadys-arr-setup-guide/docs/index.html">All docs</a>
  <a href="/slimshadys-arr-setup-guide/">Home</a>
</div>

<div class="edition-layout">
  <section class="edition-card accent-green">
    <span class="section-kicker">Download package</span>
    <h3>Use the curated files first</h3>
    <p>The repository ZIP contains the public website, docs, templates, and examples. The manifest explains what belongs in a safe package and what should stay private.</p>
    <div class="source-chips">
      <a href="https://github.com/Shadow2442/slimshadys-arr-setup-guide/archive/refs/heads/main.zip">Download repository ZIP</a>
      <a href="/slimshadys-arr-setup-guide/downloads/package-manifest.md">Package manifest</a>
      <a href="/slimshadys-arr-setup-guide/downloads/README.md">Downloads README</a>
    </div>
  </section>

  <section class="edition-card">
    <span class="section-kicker">Safety rule</span>
    <h3>Examples are not live configs</h3>
    <p>Every file here uses placeholders. Replace values locally, keep API keys private, review scripts before running them, and test in small batches before turning anything into a daily automation.</p>
  </section>
</div>

## Setup Templates

| Order | Template | Purpose |
| --- | --- | --- |
| 1 | [Folder layout example](/slimshadys-arr-setup-guide/downloads/templates/folder-layout-example.md) | Plan final libraries, temporary downloads, and Plex boundaries. |
| 2 | [SABnzbd categories example](/slimshadys-arr-setup-guide/downloads/templates/sabnzbd-categories-example.md) | Create `movies`, `tv`, and `music` downloader lanes. |
| 3 | [Sonarr profile template](/slimshadys-arr-setup-guide/downloads/templates/sonarr-profile-template.md) | German/Multi TV profile model with English bridge behavior. |
| 4 | [Radarr profile template](/slimshadys-arr-setup-guide/downloads/templates/radarr-profile-template.md) | Compact German/Multi movie profile model with English fallback. |
| 5 | [Blocked language markers](/slimshadys-arr-setup-guide/downloads/templates/blocked-language-markers-template.md) | French, Turkish, Hebrew, and suspicious marker guardrails. |
| 6 | [Plex ARR Connect template](/slimshadys-arr-setup-guide/downloads/templates/plex-arr-connect-template.md) | Plex API scan triggers for Sonarr, Radarr, and Lidarr. |
| 7 | [Seerr request defaults](/slimshadys-arr-setup-guide/downloads/templates/seerr-request-defaults-template.md) | Safer request-frontend defaults. |

## Codex Files

| File | Purpose |
| --- | --- |
| [Master setup prompt](/slimshadys-arr-setup-guide/downloads/examples/codex-master-setup-prompt.md) | Paste this into Codex to start a careful guided setup. |
| [Environment example](/slimshadys-arr-setup-guide/downloads/examples/env.example) | Placeholder API URLs and keys. |
| [Config example](/slimshadys-arr-setup-guide/downloads/examples/config.example.json) | Structured placeholder configuration for scripts. |

## Example Automation Scripts

| Script | Purpose |
| --- | --- |
| [ARR release ladder example](/slimshadys-arr-setup-guide/downloads/scripts/arr-release-ladder.example.ps1) | Skeleton for missing-file checks and German/Multi upgrades. |
| [ARR queue health example](/slimshadys-arr-setup-guide/downloads/scripts/arr-queue-health.example.ps1) | Skeleton for SAB/qBittorrent/ARR queue checks. |
| [ARR language downgrade guard example](/slimshadys-arr-setup-guide/downloads/scripts/arr-language-downgrade-guard.example.ps1) | Skeleton for detecting English or blocked-language downgrades. |
| [Previous episode catch-up example](/slimshadys-arr-setup-guide/downloads/scripts/arr-previous-episode-catchup.example.ps1) | Skeleton for checking older episodes when a new German episode appears. |
| [Plex refresh after import example](/slimshadys-arr-setup-guide/downloads/scripts/plex-refresh-after-import.example.ps1) | Skeleton for Plex library refreshes through the Plex API. |
| [Indexer health check example](/slimshadys-arr-setup-guide/downloads/scripts/indexer-health-check.example.ps1) | Skeleton for checking source health without printing API keys. |
| [API budget report example](/slimshadys-arr-setup-guide/downloads/scripts/arr-api-budget-report.example.ps1) | Skeleton for estimating daily search/API usage. |
| [Safe package builder](/slimshadys-arr-setup-guide/downloads/scripts/build-safe-guide-package.ps1) | Creates a curated ZIP from public guide files and excludes private/local file patterns. |

## What Is Intentionally Excluded

- real ARR databases
- real Plex tokens
- real API keys
- local logs and audit output
- downloader history
- machine-specific paths
- private backups

Those files belong on the user's own machine only.
