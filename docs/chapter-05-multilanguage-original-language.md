<div class="doc-hero">
  <h2>Chapter 5: Multi-Language and Original-Language Setup</h2>
  <p>This chapter keeps original-language media respectful without letting every non-German release sneak into the normal TV and movie lanes.</p>
  <div class="hero-badges">
    <span>Multi-audio</span>
    <span>Anime</span>
    <span>Korean</span>
    <span>Chinese</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/chapter-04-german-friendly.html">Previous</a>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-06-archive-size.html">Next</a>
  <a href="/slimshadys-arr-setup-guide/">Home</a>
</div>

<div class="edition-layout">
  <section class="edition-card accent-green">
    <span class="section-kicker">Normal media</span>
    <h3>Movies and TV that are not special language cases</h3>
    <div class="flow-grid">
      <div class="flow-card"><em>1</em><strong>German plus English</strong><span>Best family-friendly and original-friendly result.</span></div>
      <div class="flow-card"><em>2</em><strong>German audio</strong><span>Good target when Multi is not available.</span></div>
      <div class="flow-card"><em>3</em><strong>English fallback</strong><span>Only when no German/Multi candidate exists yet.</span></div>
    </div>
  </section>

  <section class="edition-card">
    <span class="section-kicker">Scoped original lanes</span>
    <h3>Different content needs different fallback logic</h3>
    <table>
      <thead><tr><th>Content type</th><th>Bridge order</th><th>Final target</th></tr></thead>
      <tbody>
        <tr><td>Anime</td><td>English dub + original, German-subbed original, then best Japanese original if subtitle proof is unclear.</td><td>German dub or German plus original multi-audio.</td></tr>
        <tr><td>Korean</td><td>Korean audio with English subtitles, then English dub.</td><td>German dub or German/Multi.</td></tr>
        <tr><td>Chinese</td><td>Chinese audio with English subtitles, then English dub.</td><td>German dub or German/Multi.</td></tr>
      </tbody>
    </table>
  </section>

  <section class="edition-card accent-gold">
    <span class="section-kicker">Import truth</span>
    <h3>Trust the parsed import, not the sales pitch</h3>
    <div class="rule-grid">
      <div class="rule-card"><strong>Indexer title</strong><span>Can be optimistic, incomplete, or just wrong.</span></div>
      <div class="rule-card"><strong>Manual import parse</strong><span>The safer place to verify actual language before replacing a file.</span></div>
      <div class="rule-card"><strong>Bad Multi</strong><span>If Multi parses as French/Turkish/Hebrew without target audio, blocklist it.</span></div>
      <div class="rule-card"><strong>Safe replacement</strong><span>Delete the old file only after the new file is verified.</span></div>
    </div>
  </section>

  <section class="edition-card">
    <span class="section-kicker">Boundaries</span>
    <h3>Do not let special rules leak</h3>
    <p>Japanese, Korean, and Chinese fallback behavior is valid only for titles where that original language actually belongs. A normal English or German show should not pass because it accidentally matches an anime or Korean fallback rule.</p>
  </section>
</div>

<div class="chapter-next">
  <span>Continue</span>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-06-archive-size.html">Chapter 6: Archive and Size Strategy</a>
</div>
