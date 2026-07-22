<div class="doc-hero">
  <h2>Chapter 7: Operations and Troubleshooting</h2>
  <p>Use this chapter when the stack is installed but something is stuck, mismatched, importing badly, or downloading nonsense.</p>
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

## SABnzbd

Check:

- stalled queue
- unpacking jobs
- orphaned jobs
- category mismatch
- failed post-processing
- ARR import warnings after completion

Detailed page:

- [SABnzbd Tuning and Reliability](/slimshadys-arr-setup-guide/docs/sabnzbd-tuning-and-reliability.html)

## qBittorrent

Check:

- stalled metadata torrents
- completed torrents that ARR still needs
- seeding jobs already imported by Radarr or Sonarr
- wrong category or save path

Do not remove a torrent that ARR still has no file for.

## Jackett and Indexers

If ARR reports indexer failures:

- test the indexer directly
- check rate limits
- check Cloudflare or anti-bot failures
- test normal search and no-query/top-feed behavior
- disable noisy trackers until healthy

Detailed page:

- [Jackett Setup and Workflows](/slimshadys-arr-setup-guide/docs/jackett-setup-and-workflows.html)

## Plex

Use Plex for final playback, not temporary folders.

For mismatch issues:

- confirm the file is in the final library folder
- use clear folder and file names
- split wrong matches when needed
- empty trash only when you intentionally removed the old path
- rescan after ARR imports or manual file moves

Detailed page:

- [Plex Setup and Workflows](/slimshadys-arr-setup-guide/docs/plex-setup-and-workflows.html)

## Bad Language Imports

If ARR downloads a blocked-language file:

1. pause or stop the bad download if still active
2. inspect why it passed scoring
3. remove and blocklist it
4. strengthen the marker block or scoring rule
5. search again for German/Multi or valid fallback

## Continue

Next: [Chapter 8: Reference Appendix](/slimshadys-arr-setup-guide/docs/chapter-08-reference.html)
