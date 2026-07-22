<div class="doc-hero">
  <h2>Chapter 6: Archive and Size Strategy</h2>
  <p>Storage strategy is not "smaller number good." It is codec, bitrate, runtime, language state, and whether the file has actually reached its final purpose.</p>
  <div class="hero-badges">
    <span>Compact movies</span>
    <span>720p series final</span>
    <span>1080p bridge</span>
    <span>Unmonitor keepers</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/chapter-05-multilanguage-original-language.html">Previous</a>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-07-operations-troubleshooting.html">Next</a>
  <a href="/slimshadys-arr-setup-guide/">Home</a>
</div>

<div class="edition-layout">
  <section class="edition-card accent-green">
    <span class="section-kicker">Archive principle</span>
    <h3>Resolution alone is a trap</h3>
    <div class="rule-grid">
      <div class="rule-card"><strong>Codec matters</strong><span>Compact <code>1080p x265</code> can beat bloated <code>720p x264</code>.</span></div>
      <div class="rule-card"><strong>Runtime matters</strong><span>Long movies and short episodes need different expectations.</span></div>
      <div class="rule-card"><strong>Audio matters</strong><span>Multi-audio files are allowed to be larger when they solve language needs.</span></div>
      <div class="rule-card"><strong>Final state matters</strong><span>Do not keep upgrading files that are already exactly what you wanted.</span></div>
    </div>
  </section>

  <section class="edition-card">
    <span class="section-kicker">Targets</span>
    <h3>The practical archive matrix</h3>
    <table>
      <thead><tr><th>Media</th><th>Bridge</th><th>Final archive target</th></tr></thead>
      <tbody>
        <tr><td>Normal TV</td><td>English if empty; German/Multi <code>1080p</code> for speed.</td><td>Compact German/Multi <code>720p</code>.</td></tr>
        <tr><td>Movies</td><td>English only when no German/Multi exists.</td><td>Compact German/Multi <code>1080p</code>.</td></tr>
        <tr><td>Anime</td><td>Original-language or English-dub bridge when appropriate.</td><td>German/Multi or chosen original-language final.</td></tr>
        <tr><td>Old curated titles</td><td>Manual judgment.</td><td>Compact <code>720p</code>, <code>480p</code>, DVD, or whatever you intentionally keep.</td></tr>
      </tbody>
    </table>
  </section>

  <section class="edition-card accent-gold">
    <span class="section-kicker">Size tuning</span>
    <h3>Caps should guide, not strangle</h3>
    <div class="rule-grid">
      <div class="rule-card"><strong>Radarr compact 1080p</strong><span>A scored max around <code>4.8 GB</code> keeps movies sane.</span></div>
      <div class="rule-card"><strong>Radarr compact 720p</strong><span>Around <code>5 GB</code> allows long or complex files.</span></div>
      <div class="rule-card"><strong>Small BDRips</strong><span>Good German/Multi <code>1080p</code> BDRips around <code>1.7-2.1 GB</code> can be valid.</span></div>
      <div class="rule-card"><strong>Remux and 2160p</strong><span>Keep them manual unless you deliberately want premium giant files.</span></div>
    </div>
  </section>

  <section class="edition-card">
    <span class="section-kicker">Unmonitoring</span>
    <h3>Done means done</h3>
    <p>Once a movie or episode is verified as a final compact German/Multi keeper, unmonitor it. Monitoring is useful while a file can improve. Once it has reached the goal, monitoring becomes an invitation for ARR to rethink a solved problem.</p>
    <div class="source-chips">
      <a href="/slimshadys-arr-setup-guide/docs/quality-sizing-and-downgrades.html">Quality and downgrade reference</a>
    </div>
  </section>
</div>

## Why Archive Rules Exist

Without archive rules, automation keeps chasing "better" forever. Better can mean larger, newer, higher resolution, or simply different. That is dangerous when the real goal is a compact, correct, watchable library.

The release ladder separates availability from archive quality. It is fine to accept a larger or less ideal bridge file when nothing else exists. It is not fine to keep upgrading a solved file forever.

## Resolution, Codec, and Size

Resolution is only one part of quality. A compact `1080p x265` file can be a better archive choice than a bloated `720p x264` file. A tiny file can also be too compressed. The goal is to use size rules as steering, not as blind rejection.

| Factor | Why it matters |
| --- | --- |
| Resolution | Sets the rough visual target, but not the whole story. |
| Codec | `x265/HEVC` can deliver smaller files at similar perceived quality. |
| Runtime | A long movie needs more space than a 22-minute episode. |
| Audio tracks | Multi-language files need room for more than one audio track. |
| Source | BluRay, WEB, DVD, and HDTV have different expectations. |

## What To Configure

| Media type | Recommended behavior |
| --- | --- |
| Normal TV | Allow German/Multi `1080p` for fast availability, prefer compact German/Multi `720p` as final. |
| Movies | Prefer compact German/Multi `1080p`; allow English bridge only when needed. |
| Anime | Use lane-specific language logic before applying archive assumptions. |
| Old curated media | Use manual judgment; older titles may have valid DVD, 480p, or compact 720p keepers. |

## Size Rules Should Not Block Good Releases

A good compact release can be below a strict size floor. If a German/Multi `1080p` BDRip is efficient, the rule should not reject it just because it is smaller than expected. Size caps and floors should catch obvious nonsense, not punish good encoding.

Use interactive search to inspect rejected releases. If the only rejection reason is size and the title, language, source, and codec are good, tune the size rule.

## Final-State Unmonitoring

Final state means:

- the file has the intended language tracks or subtitles
- the quality and size are acceptable for the lane
- Plex sees the right title and file
- ARR imported and named it correctly

Once those are true, unmonitor the item. Monitoring is for things that still need improvement. A verified keeper does not need daily reconsideration.

## How To Test It

Find one English bridge movie and one German/Multi compact candidate. The German/Multi compact file should win, even if the English file has a shiny quality label. Then verify the file in Plex and unmonitor it.

<div class="chapter-next">
  <span>Continue</span>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-07-operations-troubleshooting.html">Chapter 7: Operations and Troubleshooting</a>
</div>
