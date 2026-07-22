<div class="doc-hero">
  <h2>Chapter 3: Download Pipeline and Daily Automation</h2>
  <p>This is the automation map: how titles enter the system, how ARR searches, how downloads import, and how the daily release ladder keeps improving language and archive state.</p>
  <div class="hero-badges">
    <span>Import lists</span>
    <span>RSS</span>
    <span>Queue flow</span>
    <span>Release ladder</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/chapter-02-base-setup.html">Previous</a>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-04-german-friendly.html">Next</a>
  <a href="/slimshadys-arr-setup-guide/">Home</a>
</div>

<div class="edition-layout">
  <section class="edition-card accent-green">
    <span class="section-kicker">Pipeline</span>
    <h3>The normal end-to-end flow</h3>
    <div class="flow-grid">
      <div class="flow-card"><em>1</em><strong>Discovery</strong><span>Manual add, MDBList, Seerr, or a music import list.</span></div>
      <div class="flow-card"><em>2</em><strong>ARR rules</strong><span>Profile, language score, root folder, monitored state.</span></div>
      <div class="flow-card"><em>3</em><strong>Search</strong><span>RSS, automatic search, or manual interactive search.</span></div>
      <div class="flow-card"><em>4</em><strong>Download</strong><span>SABnzbd or qBittorrent receives the chosen release.</span></div>
      <div class="flow-card"><em>5</em><strong>Import</strong><span>ARR validates, imports, renames, and organizes.</span></div>
      <div class="flow-card"><em>6</em><strong>Plex</strong><span>Plex scans the final folder and makes it watchable.</span></div>
    </div>
  </section>

  <section class="edition-card">
    <span class="section-kicker">Discovery inputs</span>
    <h3>What is allowed to feed ARR</h3>
    <div class="rule-grid">
      <div class="rule-card"><strong>MDBList</strong><span>Dynamic movie, series, and anime discovery.</span></div>
      <div class="rule-card"><strong>Seerr</strong><span>Family and personal requests with manual approval for large items.</span></div>
      <div class="rule-card"><strong>Manual adds</strong><span>Special cases, edge titles, and personal curation.</span></div>
      <div class="rule-card"><strong>Lidarr lists</strong><span>Music discovery should stay music-native.</span></div>
    </div>
  </section>

  <section class="edition-card accent-gold">
    <span class="section-kicker">Daily release ladder</span>
    <h3>The automation that keeps improving files</h3>
    <table>
      <thead><tr><th>Lane</th><th>What it checks</th><th>Result</th></tr></thead>
      <tbody>
        <tr><td>Missing released items</td><td>Movies and episodes with past release dates and no file.</td><td>Find German/Multi first, English only if needed.</td></tr>
        <tr><td>English fallback files</td><td>Existing English files that can now be upgraded.</td><td>Replace with German/Multi when available.</td></tr>
        <tr><td>Imports</td><td>Completed downloads and ARR import warnings.</td><td>Validate language before replacing old files.</td></tr>
        <tr><td>Final state</td><td>Compact verified German/Multi keepers.</td><td>Unmonitor so ARR stops poking finished work.</td></tr>
      </tbody>
    </table>
  </section>

  <section class="edition-card">
    <span class="section-kicker">Safety rails</span>
    <h3>Automation should be useful, not hungry</h3>
    <div class="rule-grid">
      <div class="rule-card"><strong>Batch searches</strong><span>Small batches expose bad releases before queues explode.</span></div>
      <div class="rule-card"><strong>API budget</strong><span>Stay around <code>800</code> external indexer hits per day unless intentionally running a special batch.</span></div>
      <div class="rule-card"><strong>Import validation</strong><span>Manual-import parsing beats indexer title optimism.</span></div>
      <div class="rule-card"><strong>Queue monitoring</strong><span>SAB and qBittorrent should be checked for stuck or completed-but-not-imported jobs.</span></div>
    </div>
  </section>
</div>

## Why Built-In RSS Is Not Enough

RSS is great for new releases, but it is not a complete quality-control system. It sees what appears now. It does not reliably revisit older English bridge files, missing past releases, stalled imports, or titles where German/Multi arrives days later.

That is why this guide uses a daily release-ladder automation on top of normal ARR behavior. ARR still owns the real decisions, imports, and file management. The automation helps ARR look again at the right items.

## Search Types Explained

| Search type | What it does | Best use |
| --- | --- | --- |
| RSS sync | Watches newly posted releases from indexers. | New episodes and movies as they appear. |
| Automatic search | Lets ARR choose the best acceptable release now. | Missing files and normal upgrades. |
| Interactive search | Shows candidates and rejection reasons. | Debugging scoring, language, and title problems. |
| Daily automation search | Checks selected missing or upgrade candidates in batches. | Backlog cleanup and German/Multi replacements. |

## What the Daily Automation Should Check

The daily run should focus on high-value candidates instead of hammering every indexer forever.

| Candidate | Why it is checked |
| --- | --- |
| Released movies with no file | If German exists, grab it; if only English exists, use English as a bridge. |
| Released episodes with no file | Same logic, with extra care for running series. |
| Existing English files | German/Multi may now be available and should replace the bridge file. |
| New German episode finds | Previous episodes in the same season may now also have German releases. |
| Queue and import warnings | Completed downloads are useless if ARR never imports them. |

## What To Configure

- Keep ARR profiles and custom formats as the source of truth.
- Keep daily automation batches limited so indexer API limits survive.
- Use separate cooldowns for new/running media and older backlog.
- Validate imports before deleting old files.
- Unmonitor final verified keepers after the release ladder reaches the final state.

## How To Test It

Pick a small batch, not the whole library:

1. Find 5-10 released titles with no file or English-only files.
2. Run automatic search or the daily automation test mode.
3. Check why each candidate was accepted or rejected.
4. Confirm downloads use the right category.
5. Confirm imports do not downgrade language.
6. Confirm final German/Multi keepers get unmonitored.

## Failure Modes

| Symptom | What to inspect |
| --- | --- |
| "No downloads found" but manual search finds releases | Scoring, quality cutoff, size limits, or indexer categories are too strict. |
| Wrong language downloads | Blocked-language custom formats or title markers are incomplete. |
| Indexer API limits | Batch size or retry behavior is too aggressive. |
| Queue fills with old English files | English fallback is allowed even when German candidates exist. |
| Completed downloads sit forever | Import path, category, unpacking, or manual import parsing failed. |

<div class="chapter-next">
  <span>Continue</span>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-04-german-friendly.html">Chapter 4: German-Friendly Setup</a>
</div>
