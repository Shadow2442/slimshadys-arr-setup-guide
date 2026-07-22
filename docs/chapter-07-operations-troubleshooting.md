<div class="doc-hero">
  <h2>Chapter 7: Operations and Troubleshooting</h2>
  <p>When the stack misbehaves, troubleshoot by lane: downloader, queue, ARR import, indexer health, language validation, and Plex matching.</p>
  <div class="hero-badges">
    <span>SAB</span>
    <span>qBittorrent</span>
    <span>Imports</span>
    <span>Plex</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/chapter-06-archive-size.html">Previous</a>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-08-reference.html">Next</a>
  <a href="/slimshadys-arr-setup-guide/">Home</a>
</div>

<div class="edition-layout">
  <section class="edition-card accent-green">
    <span class="section-kicker">Triage map</span>
    <h3>Find the failing layer first</h3>
    <table>
      <thead><tr><th>Symptom</th><th>Check first</th><th>Likely fix</th></tr></thead>
      <tbody>
        <tr><td>Download stuck</td><td>SAB/qBittorrent queue</td><td>Pause, retry, remove dead jobs, or fix category.</td></tr>
        <tr><td>Completed but not imported</td><td>ARR queue and manual import</td><td>Validate path, category, file name, and language parse.</td></tr>
        <tr><td>Wrong language</td><td>Release title and parsed import language</td><td>Blocklist bad release and strengthen markers.</td></tr>
        <tr><td>Indexer health warning</td><td>Indexer direct search and top-feed behavior</td><td>Disable until healthy, then re-enable narrowly.</td></tr>
        <tr><td>Plex mismatch</td><td>Final folder, file name, match, split, trash state</td><td>Rename/move safely, rescan, split or fix match.</td></tr>
      </tbody>
    </table>
  </section>

  <section class="edition-card">
    <span class="section-kicker">Downloader lane</span>
    <h3>SAB and qBittorrent</h3>
    <div class="rule-grid">
      <div class="rule-card"><strong>SAB queue</strong><span>Watch unpacking, orphaned jobs, categories, and post-processing failures.</span></div>
      <div class="rule-card"><strong>qBittorrent</strong><span>Check stalled metadata, completed seeds, category, and save path.</span></div>
      <div class="rule-card"><strong>Do not delete too early</strong><span>If ARR still has no file, the download may still be needed.</span></div>
      <div class="rule-card"><strong>Verify final path</strong><span>Imported files should land in the ARR-managed library folder.</span></div>
    </div>
  </section>

  <section class="edition-card accent-gold">
    <span class="section-kicker">Bad language cleanup</span>
    <h3>When ARR grabs the wrong thing</h3>
    <div class="flow-grid">
      <div class="flow-card"><em>1</em><strong>Pause if active</strong><span>Stop the queue from getting worse.</span></div>
      <div class="flow-card"><em>2</em><strong>Inspect why it passed</strong><span>Title term, parser signal, indexer category, or profile scoring.</span></div>
      <div class="flow-card"><em>3</em><strong>Remove and blocklist</strong><span>Prevent the same bad release from returning.</span></div>
      <div class="flow-card"><em>4</em><strong>Strengthen the rule</strong><span>Add marker blocks or adjust scoring.</span></div>
      <div class="flow-card"><em>5</em><strong>Search again</strong><span>Prefer German/Multi, then valid fallback.</span></div>
    </div>
  </section>

  <section class="edition-card">
    <span class="section-kicker">Reference pages</span>
    <h3>Where to go next</h3>
    <div class="reference-grid">
      <a class="reference-card" href="/slimshadys-arr-setup-guide/docs/sabnzbd-tuning-and-reliability.html"><strong>SABnzbd</strong><span>Queue and downloader reliability.</span></a>
      <a class="reference-card" href="/slimshadys-arr-setup-guide/docs/jackett-setup-and-workflows.html"><strong>Jackett</strong><span>Tracker health and torrent fallback.</span></a>
      <a class="reference-card" href="/slimshadys-arr-setup-guide/docs/plex-setup-and-workflows.html"><strong>Plex</strong><span>Matching, splitting, scanning, playback.</span></a>
    </div>
  </section>
</div>

<div class="chapter-next">
  <span>Continue</span>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-08-reference.html">Chapter 8: Reference Appendix</a>
</div>
