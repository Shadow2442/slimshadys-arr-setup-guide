<div class="doc-hero">
  <h2>Chapter 6: Archive and Size Strategy</h2>
  <p>Keep files compact without replacing good media with worse files just because a number got smaller.</p>
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

## Core Principle

Do not optimize by resolution alone.

Think in terms of:

- resolution
- codec
- bitrate
- runtime
- audio tracks
- final language state

Compact `1080p x265` can be smaller and better than bloated `720p x264`.

## Movie Archive Target

Normal movies:

- compact German/Multi `1080p`
- avoid remux and `2160p` unless manually wanted
- allow English fallback only when no German/Multi candidate exists
- unmonitor final verified compact German/Multi files

## Series Archive Target

Normal TV:

- English fallback can fill an empty slot
- German/Multi `1080p` is a speed bridge
- compact German/Multi `720p` is the final archive target
- final-state episodes and seasons can be unmonitored

## Size Rules

Use size caps as scored preferences, not as global hammers.

Reference ideas:

- Radarr compact `1080p` custom-format max around `4.8 GB`
- Radarr compact `720p` max around `5 GB`
- Sonarr `720p` first, with `1080p` enabled for fallback and German bridge behavior
- allow small good `1080p` BDRips around `1.7-2.1 GB` when language and codec are right

Read more:

- [Quality, Sizes, and Downgrades](/slimshadys-arr-setup-guide/docs/quality-sizing-and-downgrades.html)

## Continue

Next: [Chapter 7: Operations and Troubleshooting](/slimshadys-arr-setup-guide/docs/chapter-07-operations-troubleshooting.html)
