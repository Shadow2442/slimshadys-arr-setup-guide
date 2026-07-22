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

## Why Original-Language Lanes Need Boundaries

Multi-language files are the best outcome when they contain the right tracks. The danger is that generic "Multi" can also hide the wrong language mix. A French/Japanese file is technically multi-language, but it is not useful if the goal is German plus original audio.

That is why this guide treats original-language logic as scoped lanes. Anime, Korean, and Chinese media can have different fallback rules, but those rules should apply only when the title actually belongs in that lane.

## The Preferred Language Orders

| Lane | First target | Bridge target | Final target |
| --- | --- | --- | --- |
| Normal movies and TV | German plus original/English audio | English if empty | German/Multi compact keeper |
| Anime | German dub plus Japanese, or English dub plus Japanese | Japanese with useful subtitles | German/Multi or chosen original-language keeper |
| Korean | Korean audio with English subtitles | English dub if needed | German dub or German/Multi |
| Chinese | Chinese audio with English subtitles | English dub if needed | German dub or German/Multi |

The key is intent. Original audio is good when it belongs to the title. It is bad when it is just an unwanted language slipping through a vague release name.

## What To Configure

- Keep normal movie and TV profiles German/English focused.
- Add original-language bonuses only to scoped anime/Korean/Chinese logic.
- Penalize or block suspicious markers such as `VFQ`, `VFF`, `TRUEFRENCH`, `EN-TR`, `TR-EN`, and `TURG`.
- Reward real German/Multi evidence more than vague `MULTi`.
- Use import validation before deleting an existing good file.

## How Import Validation Works

The release title is only a promise. The import parse is closer to the truth. When ARR imports, it can often show parsed language, quality, and release group. If the imported file does not match the intended lane, the safe workflow is:

1. Do not let it replace a better existing file.
2. Remove or blocklist the bad release.
3. Strengthen the custom format or marker rule that allowed it.
4. Search again for the correct lane.

## How To Test It

Pick one normal TV episode, one anime episode, and one Korean or Chinese title if available.

| Test | Expected result |
| --- | --- |
| Normal TV with English and German candidates | German/Multi beats English. |
| Anime with no German dub | English dub plus Japanese or Japanese with subtitles can be valid. |
| Korean title with Korean/English-sub release | Korean original lane can accept it. |
| French/Japanese "Multi" for anime movie | Reject unless it also solves the intended language target. |

## Common Failure Modes

| Problem | What usually went wrong |
| --- | --- |
| French/Japanese anime file imported | Multi was rewarded without checking whether German or useful subtitles exist. |
| Normal TV grabs Turkish/English | Blocked-language markers are incomplete. |
| Good Japanese original rejected | Anime lane is using normal German-only assumptions. |
| English replaces German/Multi | Language downgrade guard is missing or too weak. |

<div class="chapter-next">
  <span>Continue</span>
  <a href="/slimshadys-arr-setup-guide/docs/chapter-06-archive-size.html">Chapter 6: Archive and Size Strategy</a>
</div>
