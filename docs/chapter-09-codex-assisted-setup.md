<div class="doc-hero">
  <h2>Chapter 9: Codex-Assisted Setup and Downloads</h2>
  <p>This chapter shows how to use Codex as a careful setup copilot: give it the guide, give it the safe templates, let it inspect one thing at a time, and make it verify before it changes anything important.</p>
  <div class="hero-badges">
    <span>Codex copilot</span>
    <span>Master prompt</span>
    <span>Safe templates</span>
    <span>Example scripts</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/chapter-08-reference.html">Previous</a>
  <a href="/slimshadys-arr-setup-guide/docs/downloads.html">Downloads</a>
  <a href="/slimshadys-arr-setup-guide/">Home</a>
</div>

<div class="edition-layout">
  <section class="edition-card accent-green">
    <span class="section-kicker">Codex role</span>
    <h3>Use Codex as an assistant, not as a blind installer</h3>
    <div class="rule-grid">
      <div class="rule-card"><strong>Inspect first</strong><span>Codex should read current settings before proposing changes.</span></div>
      <div class="rule-card"><strong>Use templates</strong><span>Start from safe examples, then adapt to the real machine.</span></div>
      <div class="rule-card"><strong>Verify every lane</strong><span>Movie, TV, music, downloader, and Plex tests should pass separately.</span></div>
      <div class="rule-card"><strong>Keep secrets local</strong><span>API keys, tokens, paths, and databases should never be published.</span></div>
    </div>
  </section>

  <section class="edition-card">
    <span class="section-kicker">Setup flow</span>
    <h3>The safe automated order</h3>
    <div class="flow-grid">
      <div class="flow-card"><em>1</em><strong>Read the guide</strong><span>Use chapters 1-3 to understand the base stack.</span></div>
      <div class="flow-card"><em>2</em><strong>Fill examples</strong><span>Copy placeholder templates into local private config files.</span></div>
      <div class="flow-card"><em>3</em><strong>Configure apps</strong><span>Apply folders, categories, profiles, Connect settings, and request safety.</span></div>
      <div class="flow-card"><em>4</em><strong>Run tests</strong><span>One movie, one episode, one album, one Plex scan, one queue check.</span></div>
      <div class="flow-card"><em>5</em><strong>Add automation</strong><span>Only after the base imports and Plex updates are proven.</span></div>
    </div>
  </section>
</div>

## Why Add Codex To This Guide

ARR setup is not difficult because any single setting is hard. It is difficult because many small settings must agree with each other: folders, categories, profiles, custom formats, download clients, Plex libraries, request defaults, and API connections.

Codex is useful because it can hold that whole map in working memory, compare settings, explain the consequence of a change, and write small helper scripts. It should still work slowly and visibly. A home media stack is not the place for mysterious automation theatre.

## What Codex Should Be Allowed To Do

| Task | Good Codex behavior |
| --- | --- |
| Read configs | Inspect local settings and summarize what it found without printing secrets. |
| Apply templates | Adapt example profiles, categories, or scripts to the user's real paths. |
| Test connections | Check ARR, SAB, qBittorrent, Plex, and indexers without exposing API keys. |
| Run small batches | Test one or a few titles before scaling to daily automation. |
| Write docs | Record what changed and why. |

## What Codex Should Not Do Blindly

- publish API keys, Plex tokens, database backups, logs, or local paths
- bulk delete files before confirming the destination has a better file
- import hundreds of movies or shows before the base pipeline is tested
- overwrite working custom formats without comparing the existing setup
- turn examples into live automation without a dry run

## Master Prompt

Use the master prompt as the first message when asking Codex to configure a fresh setup or audit an existing one:

<div class="source-chips">
  <a href="/slimshadys-arr-setup-guide/downloads/examples/codex-master-setup-prompt.md">Download the master prompt</a>
</div>

The prompt tells Codex to:

- read the guide first
- protect secrets
- inspect before changing
- configure the stack in the correct order
- test each media lane
- document every change

## Download Package

The download package is a curated set of safe files. It includes the public guide, templates, example scripts, and example configuration files. It intentionally excludes live databases, local backups, API keys, tokens, and personal logs.

<div class="reference-grid">
  <a class="reference-card" href="/slimshadys-arr-setup-guide/docs/downloads.html"><strong>Downloads Page</strong><span>See every template, script, and example file in setup order.</span></a>
  <a class="reference-card" href="https://github.com/Shadow2442/slimshadys-arr-setup-guide/archive/refs/heads/main.zip"><strong>Repository ZIP</strong><span>Download the complete public repository from GitHub.</span></a>
  <a class="reference-card" href="/slimshadys-arr-setup-guide/downloads/package-manifest.md"><strong>Package Manifest</strong><span>What is included, what is excluded, and why.</span></a>
</div>

## Direct Downloads

<div class="edition-layout">
  <section class="edition-card accent-green">
    <span class="section-kicker">Start here</span>
    <h3>Codex and package files</h3>
    <div class="source-chips">
      <a href="/slimshadys-arr-setup-guide/downloads/examples/codex-master-setup-prompt.md">Master setup prompt</a>
      <a href="/slimshadys-arr-setup-guide/downloads/README.md">Downloads README</a>
      <a href="/slimshadys-arr-setup-guide/downloads/package-manifest.md">Package manifest</a>
      <a href="https://github.com/Shadow2442/slimshadys-arr-setup-guide/archive/refs/heads/main.zip">Repository ZIP</a>
    </div>
  </section>

  <section class="edition-card">
    <span class="section-kicker">Templates</span>
    <h3>Safe setup templates</h3>
    <div class="source-chips">
      <a href="/slimshadys-arr-setup-guide/downloads/templates/folder-layout-example.md">Folder layout</a>
      <a href="/slimshadys-arr-setup-guide/downloads/templates/sabnzbd-categories-example.md">SAB categories</a>
      <a href="/slimshadys-arr-setup-guide/downloads/templates/sonarr-profile-template.md">Sonarr profile</a>
      <a href="/slimshadys-arr-setup-guide/downloads/templates/radarr-profile-template.md">Radarr profile</a>
      <a href="/slimshadys-arr-setup-guide/downloads/templates/blocked-language-markers-template.md">Blocked markers</a>
      <a href="/slimshadys-arr-setup-guide/downloads/templates/plex-arr-connect-template.md">Plex Connect</a>
      <a href="/slimshadys-arr-setup-guide/downloads/templates/seerr-request-defaults-template.md">Seerr defaults</a>
    </div>
  </section>

  <section class="edition-card accent-gold">
    <span class="section-kicker">Automation examples</span>
    <h3>Scripts to review before use</h3>
    <div class="source-chips">
      <a href="/slimshadys-arr-setup-guide/downloads/examples/env.example">Environment example</a>
      <a href="/slimshadys-arr-setup-guide/downloads/examples/config.example.json">Config example</a>
      <a href="/slimshadys-arr-setup-guide/downloads/scripts/arr-release-ladder.example.ps1">Release ladder</a>
      <a href="/slimshadys-arr-setup-guide/downloads/scripts/arr-queue-health.example.ps1">Queue health</a>
      <a href="/slimshadys-arr-setup-guide/downloads/scripts/arr-language-downgrade-guard.example.ps1">Language guard</a>
      <a href="/slimshadys-arr-setup-guide/downloads/scripts/arr-previous-episode-catchup.example.ps1">Previous episode catch-up</a>
      <a href="/slimshadys-arr-setup-guide/downloads/scripts/plex-refresh-after-import.example.ps1">Plex refresh</a>
      <a href="/slimshadys-arr-setup-guide/downloads/scripts/indexer-health-check.example.ps1">Indexer health</a>
      <a href="/slimshadys-arr-setup-guide/downloads/scripts/arr-api-budget-report.example.ps1">API budget</a>
      <a href="/slimshadys-arr-setup-guide/downloads/scripts/build-safe-guide-package.ps1">Package builder</a>
    </div>
  </section>
</div>

## Recommended Setup Order With Downloads

| Step | File | Use it for |
| --- | --- | --- |
| 1 | [folder-layout-example.md](/slimshadys-arr-setup-guide/downloads/templates/folder-layout-example.md) | Decide final media folders and temporary download folders. |
| 2 | [sabnzbd-categories-example.md](/slimshadys-arr-setup-guide/downloads/templates/sabnzbd-categories-example.md) | Create matching downloader categories. |
| 3 | [sonarr-profile-template.md](/slimshadys-arr-setup-guide/downloads/templates/sonarr-profile-template.md) | Build the TV language ladder. |
| 4 | [radarr-profile-template.md](/slimshadys-arr-setup-guide/downloads/templates/radarr-profile-template.md) | Build the compact movie language ladder. |
| 5 | [blocked-language-markers-template.md](/slimshadys-arr-setup-guide/downloads/templates/blocked-language-markers-template.md) | Add protection against wrong-language grabs. |
| 6 | [plex-arr-connect-template.md](/slimshadys-arr-setup-guide/downloads/templates/plex-arr-connect-template.md) | Connect ARR apps to Plex scan triggers. |
| 7 | [seerr-request-defaults-template.md](/slimshadys-arr-setup-guide/downloads/templates/seerr-request-defaults-template.md) | Keep family requests safe. |
| 8 | [config.example.json](/slimshadys-arr-setup-guide/downloads/examples/config.example.json) and [env.example](/slimshadys-arr-setup-guide/downloads/examples/env.example) | Create private local automation config. |
| 9 | [example scripts](/slimshadys-arr-setup-guide/docs/downloads.html#example-automation-scripts) | Review, adapt, dry-run, then automate carefully. |

## Final Verification

Before calling the setup done, Codex should verify:

- one Radarr movie imports and appears in Plex
- one Sonarr episode imports and appears in Plex
- one Lidarr album imports and groups correctly in Plex
- ARR `Connect -> Plex` tests pass
- SAB/qBittorrent categories are separated
- English fallback does not replace German/Multi
- final verified keepers can be unmonitored

<div class="chapter-next">
  <span>Continue</span>
  <a href="/slimshadys-arr-setup-guide/docs/downloads.html">Downloads and Templates</a>
</div>
