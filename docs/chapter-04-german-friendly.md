<div class="doc-hero">
  <h2>Chapter 4: German-Friendly Setup</h2>
  <p>Build the German-first rules without making the library stall when German releases are late.</p>
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

## Rule Shape

The German-friendly setup is not German-only.

It is:

1. German/Multi when available.
2. English fallback only when no German/Multi candidate exists.
3. Later German/Multi replaces English.
4. Final compact German/Multi gets unmonitored.

## What Counts as Good

Strong evidence:

- explicit `German`
- explicit `Deutsch`
- `GER` or `DEU`
- real `DL` audio marker, not `WEB-DL`
- German plus English multi-audio
- German plus original-language multi-audio

Weak evidence:

- parser-only German
- generic `MULTi`
- bare `DUBBED`

Weak evidence should not beat explicit language proof.

## Blocked Languages

Block or heavily penalize non-target markers such as:

- `VFQ`
- `VFF`
- `TRUEFRENCH`
- `FRENCH`
- `EN-TR`
- `TR-EN`
- `TURG`
- Turkish-only
- Hebrew-only

Chinese, Japanese, and Korean are allowed only in scoped original-language lanes.

## Indexer Strategy

Use broad sources for daily work and preserve specialist German sources for the content that needs them.

Read the detailed page:

- [Indexers and German Content Strategy](/slimshadys-arr-setup-guide/docs/indexers-and-german-content.html)

## Continue

Next: [Chapter 5: Multi-Language and Original-Language Setup](/slimshadys-arr-setup-guide/docs/chapter-05-multilanguage-original-language.html)
