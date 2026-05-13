<div class="guide-banner-frame">
  <img class="guide-banner-image" src="/slimshadys-arr-setup-guide/docs/assets/guide-banner.png" alt="SlimShady's ARR Setup Guide banner">
</div>
<div class="guide-stats">
  <div class="guide-stat-card">
    <span class="guide-stat-value">6</span>
    <span class="guide-stat-label">Core apps in the stack</span>
  </div>
  <div class="guide-stat-card">
    <span class="guide-stat-value">10</span>
    <span class="guide-stat-label">Deep-dive guide sections</span>
  </div>
  <div class="guide-stat-card">
    <span class="guide-stat-value">14</span>
    <span class="guide-stat-label">SAB connections tuned</span>
  </div>
  <div class="guide-stat-card">
    <span class="guide-stat-value">45s</span>
    <span class="guide-stat-label">Downloader timeout baseline</span>
  </div>
</div><div class="doc-hero">
  <h2>German-friendly indexer and language strategy</h2>
  <p>This page is the specialist lane for readers who want stronger German coverage. It collects the German-specific provider roles, custom-format ideas, scoring philosophy, and quota-aware priorities in one place so the rest of the guide can stay broadly useful.</p>
  <div class="hero-badges">
    <span>German-friendly strategy</span>
    <span>Quota-aware priorities</span>
    <span>Language scoring model</span>
    <span>Usenet first</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/setup-checklist.html">Checklist</a>
  <a href="/slimshadys-arr-setup-guide/docs/sonarr-setup-and-workflows.html">Sonarr</a>
  <a href="/slimshadys-arr-setup-guide/docs/radarr-setup-and-workflows.html">Radarr</a>
  <a href="/slimshadys-arr-setup-guide/docs/sabnzbd-tuning-and-reliability.html">SAB</a>
  <a href="/slimshadys-arr-setup-guide/docs/mdblist-import-lists.html">MDBList</a>
  <a href="/slimshadys-arr-setup-guide/docs/quality-sizing-and-downgrades.html">Quality & Sizes</a>
  <a href="/slimshadys-arr-setup-guide/">Home</a>
</div>
<div class="info-grid">
  <div class="info-card">
    <h3>Who this page is for</h3>
    <p>Use this page if your stack cares specifically about German audio, German title terms, German-friendly indexers, or mixed German plus anime workflows.</p>
  </div>
  <div class="info-card">
    <h3>Main outcome</h3>
    <p>Better German coverage, fewer weak <code>MULTi</code> mistakes, and a cleaner way to preserve specialist sources without wasting their quotas on background busywork.</p>
  </div>
</div>

<div class="mini-grid">
  <div class="mini-card">
    <h4>Main takeaway</h4>
    <p>Broad sources should carry the traffic. Specialist German sources should stay preserved for the content that truly needs them.</p>
  </div>
  <div class="mini-card">
    <h4>Language rule</h4>
    <p>Do not trust parser language guesses alone. Use title logic, audio signals, and custom formats to score what you actually want.</p>
  </div>
  <div class="mini-card">
    <h4>What to watch</h4>
    <p>429 errors, grab caps, and releases that look German in the title but never receive a useful score.</p>
  </div>
</div>

This page focuses on the practical German-specific layer for `Sonarr`, `Radarr`, and indexer strategy.

## When to Use This Page

Use the main app pages for the general setup first.

Then use this page when you want to tune:

- German audio preference
- German-friendly source priorities
- German plus anime multi-audio handling
- title-term and parser-signal logic
- quota-safe use of specialist German indexers

## The Big Picture

Not all indexers are equally useful.

Some are broad generalists. Some are excellent for German content. Some are excellent but quota-fragile.

The trick is not to find one perfect indexer. It is to give each one the right job.

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

Suggested order used in this project:

- `NinjaCentral = 15`
- `NZBFinder = 18`
- `NZB.su = 30`
- `SceneNZBs = 45`

Important:

- lower number = more preferred
- priority is only a tiebreaker
- all enabled indexers are still searched

## German Language Scoring Philosophy

The core rule is simple:

- do not trust `MULTi` alone as proof of German audio

A better German-friendly preference order is:

1. proven `German + Japanese` multi-audio
2. confirmed `German audio`
3. `English audio`
4. weak `multi-audio`
5. `Japanese audio + German subtitles`
6. other fallbacks

That keeps the stack from treating every shiny `MULTi` release as if it magically matches your real preference.

## Suggested Custom Formats for German-Friendly Setups

Useful building blocks:

- `Language - German Parser Signal`
- `Language - German Title Terms`
- `Language - Dual Multi Audio`
- `Language - English Audio Fallback`
- `Language - Original Audio Fallback`
- `Language - Japanese Audio Fallback`
- `Subs - German Subtitles`
- `Subs - English Subtitles`
- `Language - German Japanese Proven Multi Audio`

Example scoring model from the live setup behind this guide:

- `German Parser Signal = 0`
- `German Title Terms = 1600`
- `German Japanese Proven Multi Audio = 600`
- `English Audio Fallback = 500`
- `Dual Multi Audio = 300`
- `German Subtitles = 180`
- `English Subtitles = 120`
- `Japanese Audio Fallback = 50`
- `Original Audio Fallback = 75`

Treat those values as a strong sample, not religious law.

## Sonarr Notes

For `Sonarr`, this German-friendly strategy works best when paired with:

- `720p` first, `1080p` fallback
- compact TV size caps
- codec-aware downgrade logic if you use a downgrade lane

The German-specific part lives in the custom formats and scoring, not in trying to force every parser label to be honest.

## Radarr Notes

For `Radarr`, pair this German-friendly strategy with:

- a compact `1080p` main profile
- built-in profile language set to `Any`
- downgrade lanes that stay size-aware instead of blindly chasing lower resolutions

That keeps the language layer and the quality layer separated cleanly.

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
- German-looking titles that never receive a usable score

If an indexer produces too much noise:

- test a few real titles manually
- compare result quality
- lower its priority if needed

## Useful External Guide

The following German Usenet guide aligns well with the practical experience behind this repository:

- [PCJones Usenet Guide](https://github.com/PCJones/usenet-guide#2-usenet-indexer)

Its main indexer ranking and German-content emphasis match this real-world ARR tuning surprisingly well.
