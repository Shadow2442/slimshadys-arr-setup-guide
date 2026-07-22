<div class="doc-hero">
  <h2>Chapter 4: German-Friendly Setup</h2>
  <p>German-friendly does not mean German-only. It means German/Multi wins when available, English can bridge gaps, and misleading language markers are treated with suspicion.</p>
  <div class="hero-badges">
    <span>German first</span>
    <span>English bridge</span>
    <span>Blocked languages</span>
    <span>Indexer strategy</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/chapter-03-download-pipeline.html">Previous</a>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-05-multilanguage-original-language.html">Next</a>
  <a href="/slimshadys-arr-setup-guide/">Home</a>
</div>

<div class="edition-layout">
  <section class="edition-card accent-green">
    <span class="section-kicker">Language ladder</span>
    <h3>The normal German-friendly order</h3>
    <div class="flow-grid">
      <div class="flow-card"><em>1</em><strong>German/Multi</strong><span>Best default: German plus English or German plus original audio.</span></div>
      <div class="flow-card"><em>2</em><strong>German audio</strong><span>Strong single-language target when Multi is not available.</span></div>
      <div class="flow-card"><em>3</em><strong>English bridge</strong><span>Allowed only when no German/Multi candidate exists yet.</span></div>
      <div class="flow-card"><em>4</em><strong>German replacement</strong><span>Later German/Multi replaces English fallback.</span></div>
      <div class="flow-card"><em>5</em><strong>Final keeper</strong><span>Verified compact final files are unmonitored.</span></div>
    </div>
  </section>

  <section class="edition-card">
    <span class="section-kicker">Evidence</span>
    <h3>What should count as German</h3>
    <table>
      <thead><tr><th>Signal</th><th>Trust level</th><th>How to treat it</th></tr></thead>
      <tbody>
        <tr><td><code>German</code>, <code>Deutsch</code>, <code>GER</code>, <code>DEU</code></td><td>Strong</td><td>Reward clearly.</td></tr>
        <tr><td>Real <code>DL</code> audio marker</td><td>Strong, if not <code>WEB-DL</code></td><td>Reward as dual-language evidence.</td></tr>
        <tr><td>Generic <code>MULTi</code></td><td>Weak alone</td><td>Do not let it beat explicit proof.</td></tr>
        <tr><td>Parser-only German</td><td>Weak alone</td><td>Useful only with stronger context.</td></tr>
        <tr><td>Bare <code>DUBBED</code></td><td>Too vague</td><td>Do not treat as German by itself.</td></tr>
      </tbody>
    </table>
  </section>

  <section class="edition-card accent-gold">
    <span class="section-kicker">Blocklist</span>
    <h3>Markers that should not sneak through</h3>
    <div class="rule-grid">
      <div class="rule-card"><strong>French markers</strong><span><code>VFQ</code>, <code>VFF</code>, <code>TRUEFRENCH</code>, <code>FRENCH</code></span></div>
      <div class="rule-card"><strong>Turkish markers</strong><span><code>EN-TR</code>, <code>TR-EN</code>, <code>TURG</code>, Turkish-only title terms.</span></div>
      <div class="rule-card"><strong>Hebrew markers</strong><span>Hebrew-only releases unless the title itself belongs in a scoped original-language lane.</span></div>
      <div class="rule-card"><strong>Generic Multi traps</strong><span>Multi labels that do not prove German audio.</span></div>
    </div>
  </section>

  <section class="edition-card">
    <span class="section-kicker">Sources</span>
    <h3>Use indexers according to their job</h3>
    <div class="rule-grid">
      <div class="rule-card"><strong>Broad workhorses</strong><span>Handle daily search traffic and common releases.</span></div>
      <div class="rule-card"><strong>German specialists</strong><span>Save quota for hard German replacements and rare content.</span></div>
      <div class="rule-card"><strong>Jackett fallback</strong><span>Useful when Usenet misses, but keep trackers selective.</span></div>
      <div class="rule-card"><strong>Health checks</strong><span>Disable failing sources until searches and top-feed behavior recover.</span></div>
    </div>
    <div class="source-chips">
      <a href="/slimshadys-arr-setup-guide/docs/indexers-and-german-content.html">Indexer strategy page</a>
    </div>
  </section>
</div>

## Why German-Friendly Is Not German-Only

German-only sounds clean, but it creates a bad availability problem. Some titles appear in English first, then German or German/Multi later. If you block English completely, new content may stay missing even when a watchable bridge release exists.

The better model is a ladder:

1. Prefer German/Multi.
2. Accept German-only if Multi is not available.
3. Accept English only when no file exists and no German candidate is available.
4. Replace English with German/Multi later.
5. Unmonitor once the final keeper is verified.

## How Sonarr and Radarr Decide

ARR chooses releases from a mix of quality, custom format score, size limits, language parsing, release title, indexer, and cutoff rules. That means a German release can lose if its score is too low, its size is outside the allowed range, or the existing English file has already met the cutoff.

The setup must make German/Multi obviously better than English, while still allowing English to fill empty slots.

## What To Configure

| Configuration | Purpose |
| --- | --- |
| German title-term bonus | Rewards clear title proof such as `German`, `Deutsch`, `GER`, or `DEU`. |
| German parser bonus | Rewards ARR's parsed German signal, but should not be the only proof. |
| Multi-audio bonus | Rewards real dual-language evidence such as German plus English/original audio. |
| English fallback rule | Allows English only when no useful file exists or no German candidate is available. |
| Blocked-language penalties | Prevents French, Turkish, Hebrew, and other unwanted normal-lane releases. |
| Size and quality limits | Avoids rejecting good compact German releases by accident. |

## Examples

| Release title | Likely decision | Why |
| --- | --- | --- |
| `Movie.2026.German.DL.1080p.WEB.h264` | Prefer | Clear German dual-language signal. |
| `Movie.2026.MULTi.1080p.WEB` | Cautious | Multi alone does not prove German. |
| `Movie.2026.TRUEFRENCH.1080p.WEB` | Reject | French marker in a normal German/English lane. |
| `Movie.2026.English.1080p.WEB` | Bridge only | Accept only if no German/Multi file exists. |

## How To Verify

Use interactive search on a known title with German and English candidates. The German/Multi release should have a clearly higher score than the English release. If it does not, fix the custom format scores before trusting automation.

Then test a missing title where only English exists. English should be allowed as a temporary bridge, but it should not prevent a later German/Multi replacement.

<div class="chapter-next">
  <span>Continue</span>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-05-multilanguage-original-language.html">Chapter 5: Multi-Language and Original-Language Setup</a>
</div>
