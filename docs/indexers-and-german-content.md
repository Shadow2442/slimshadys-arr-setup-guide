# Indexers and German Content Strategy

<div class="doc-hero">
  <h2>Give each indexer the right job</h2>
  <p>The goal is not one magical source. The goal is a stack where broad indexers do the heavy lifting, German specialists stay preserved, and your quotas do not die in a dramatic bulk-search accident.</p>
  <div class="hero-badges">
    <span>German-friendly strategy</span>
    <span>Quota-aware priorities</span>
    <span>Usenet first</span>
    <span>Torrent fallback when useful</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/setup-checklist.html">✅ Checklist</a>
  <a href="/slimshadys-arr-setup-guide/docs/mdblist-import-lists.html">📚 MDBList</a>
  <a href="/slimshadys-arr-setup-guide/docs/quality-sizing-and-downgrades.html">💾 Quality & Sizes</a>
  <a href="/slimshadys-arr-setup-guide/">🏠 Home</a>
</div>
<div class="info-grid">
  <div class="info-card">
    <h3>Main idea</h3>
    <p>Use broad indexers for daily volume, stronger German sources for precision, and keep fragile grab caps reserved for the content that really needs them.</p>
  </div>
  <div class="info-card">
    <h3>Practical result</h3>
    <p>Better German coverage, fewer failed grabs, saner queue behavior, and a setup that does not burn premium sources on background busywork.</p>
  </div>
</div>

<div class="mini-grid">
  <div class="mini-card">
    <h4>Main takeaway</h4>
    <p>Broad sources should carry the traffic. Specialist German sources should stay preserved.</p>
  </div>
  <div class="mini-card">
    <h4>Priority rule</h4>
    <p>Lower number means higher priority, but indexer priority is still only a tiebreaker.</p>
  </div>
  <div class="mini-card">
    <h4>What to watch</h4>
    <p>429 errors, grab caps, noisy matches, and temporary ARR cooldowns on failed sources.</p>
  </div>
</div>

This page focuses on the practical role of each Usenet indexer in a German-friendly ARR setup that includes `Sonarr`, `Radarr`, and `Lidarr`.

## The Big Picture

Not all indexers are equally useful.

Some are broad generalists. Some are excellent for German content. Some are excellent but quota-fragile.

The trick is not to find one "perfect" indexer. It is to give each one the right job.

In a practical setup, this usually means:

- `Sonarr` and `Radarr` search across multiple indexers
- `Lidarr` can use the same broad Usenet layer for artists and albums
- the download client fetches the chosen release
- the ARR apps import it into the final library
- `Plex` exposes the finished movie and series result

So indexer strategy affects the entire rest of the stack, not just search results.

## Recommended Roles

### SceneNZBs

Best role:

- German specialist

Strengths:

- strongest German-specific content in this setup
- best for `German`, `German DL`, and German-dubbed releases

Weaknesses:

- strict grab cap
- easy to exhaust during bulk automation

Use it for:

- hard-to-find German content
- high-priority German replacements

Do not use it for:

- giant batch searches
- background downgrade waves

### NinjaCentral

Best role:

- daily Usenet workhorse

Strengths:

- large quota
- good broad coverage
- useful for `Sonarr`, `Radarr`, and potentially `Lidarr`

Weaknesses:

- not as German-specialized as SceneNZBs
- sometimes noisier on title matching

Use it for:

- daily automatic work
- broad search coverage
- quota-heavy tasks
- general library growth where German specificity is helpful but not everything

### NZBFinder

Best role:

- strong secondary generalist with real German value

Strengths:

- meaningful German coverage
- more German-useful than a plain generic fallback
- valuable addition to a German-friendly stack

Weaknesses:

- still not a replacement for SceneNZBs on German specialization

Use it for:

- normal automation
- additional German-friendly breadth
- secondary preferred source behind `NinjaCentral`
- another strong candidate for mixed movie, series, and music searches

### NZB.su

Best role:

- fallback generalist

Strengths:

- solid coverage
- useful backup source

Weaknesses:

- less strategically important once NinjaCentral and NZBFinder are present

Use it for:

- fallback breadth
- extra results when the first two do not find what you want

## Recommended Priority Order

In Servarr:

- `1` = highest priority
- `50` = lowest priority

Suggested order:

- `NinjaCentral = 15`
- `NZBFinder = 18`
- `NZB.su = 30`
- `SceneNZBs = 45`

Important:

- lower number = more preferred
- priority is only a tiebreaker
- all enabled indexers are still searched

## Why This Order Works

### Why NinjaCentral sits first

- high quota
- broad enough to carry daily work
- safer to spend than the specialist source

### Why NZBFinder sits second

- broad and German-useful
- stronger German value than a plain fallback source

### Why NZB.su sits third

- still useful
- but less strategically valuable than the first two

### Why SceneNZBs sits last

Not because it is worse.

It sits last because:

- it is too valuable to waste
- it has strict grab limits
- it should be preserved for the cases where German precision matters most

## Quota Strategy

If an indexer has low grab limits, treat it as:

- a premium reserve

not as:

- a bulk automation hammer

Good approach:

- let broad sources handle routine traffic
- let the German specialist handle important German releases

## What to Monitor

Watch for:

- repeated `429 Too Many Requests`
- temporary ARR health warnings for indexers
- suspicious category noise
- mismatched or irrelevant releases

If an indexer produces too much noise:

- test a few real titles manually
- compare result quality
- lower its priority if needed

## Useful External Guide

The following German Usenet guide aligns well with the practical experience behind this repository:

- [PCJones Usenet Guide](https://github.com/PCJones/usenet-guide#2-usenet-indexer)

Its main indexer ranking and German-content emphasis match this real-world ARR tuning surprisingly well.

