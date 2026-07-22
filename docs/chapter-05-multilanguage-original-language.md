<div class="doc-hero">
  <h2>Chapter 5: Multi-Language and Original-Language Setup</h2>
  <p>Handle German/English dual audio, anime, Korean titles, Chinese titles, subtitles, and original-language fallbacks without mixing every rule into one giant profile.</p>
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

## Normal Movie and TV Ladder

For normal non-anime, non-Korean, non-Chinese titles:

1. German plus English multi-audio
2. German audio
3. English fallback only if no German/Multi candidate exists

English should fill empty slots. It should not replace German/Multi.

## Anime Ladder

Recommended anime order:

1. German dub or German plus original-language multi-audio
2. English dub plus original audio
3. German-subbed original audio
4. best Japanese original when no clear German subtitle proof exists

This matches real anime availability better than forcing every show through normal TV rules.

## Korean Ladder

Recommended Korean order:

1. Korean original audio plus English subtitles
2. English dub
3. German dub or German/Multi

German remains the final upgrade target when available, but Korean original with English subtitles is a valid bridge.

## Chinese Ladder

Recommended Chinese order:

1. Chinese original audio plus English subtitles
2. English dub
3. German dub or German/Multi

Keep this scoped to Chinese titles. Do not let Chinese fallback rules make unrelated normal TV releases pass.

## Import Validation

For any suspicious `MULTi` release:

- inspect ARR manual-import parsing
- verify actual language before replacing an existing file
- blocklist bad imports
- re-search if the release is French, Turkish, Hebrew, or otherwise outside the intended lane

## Continue

Next: [Chapter 6: Archive and Size Strategy](/slimshadys-arr-setup-guide/docs/chapter-06-archive-size.html)
