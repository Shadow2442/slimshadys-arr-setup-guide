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

<div class="chapter-next">
  <span>Continue</span>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-07-operations-troubleshooting.html">Chapter 7: Operations and Troubleshooting</a>
</div>
