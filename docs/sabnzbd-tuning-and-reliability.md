# SABnzbd Tuning and Reliability

<div class="doc-hero">
  <h2>Make the downloader calmer, cleaner, and slightly faster</h2>
  <p>This page turns the SAB guidance from the rest of the guide into one practical playbook: what to enable, what to avoid, what improved stability in real testing, and how to squeeze a little more speed out without waking the goblins.</p>
  <div class="hero-badges">
    <span>Stability first</span>
    <span>Speed second</span>
    <span>Queue sanity</span>
    <span>Post-processing discipline</span>
  </div>
</div>

<div class="doc-nav">
  <a href="/slimshadys-arr-setup-guide/docs/setup-checklist.html">✅ Checklist</a>
  <a href="/slimshadys-arr-setup-guide/docs/indexers-and-german-content.html">🛰️ Indexers</a>
  <a href="/slimshadys-arr-setup-guide/docs/quality-sizing-and-downgrades.html">💾 Quality & Sizes</a>
  <a href="/slimshadys-arr-setup-guide/">🏠 Home</a>
</div>

<div class="info-grid">
  <div class="info-card">
    <h3>Best use</h3>
    <p>Use this page when SAB is stalling, unpacking badly, pausing in weird states, or simply not downloading as smoothly as the rest of the ARR stack deserves.</p>
  </div>
  <div class="info-card">
    <h3>Main outcome</h3>
    <p>A more reliable SAB setup with fewer post-processing jams, cleaner queue behavior, and a small but real speed improvement.</p>
  </div>
</div>

<div class="mini-grid">
  <div class="mini-card">
    <h4>Core lesson</h4>
    <p>Bad releases will always exist. The real win is configuring SAB so one cursed archive does not turn the whole warehouse into a hostage situation.</p>
  </div>
  <div class="mini-card">
    <h4>Safe speed rule</h4>
    <p>Use modest server tuning first. Slightly faster and still stable beats theoretically faster and dramatically broken.</p>
  </div>
  <div class="mini-card">
    <h4>Practical mindset</h4>
    <p>Treat downloader stability as part of the media pipeline, not as a separate little side quest that only matters when things catch fire.</p>
  </div>
</div>

## Known Good Baseline

The live setup behind this guide behaved better once SAB was tuned like this:

- `Direct Unpack = off`
- `Connections = 14`
- `Receive Threads = 4`
- `Server Timeout = 45`
- `Ignore samples = enabled`
- `Cleanup List = nfo, sfv, srr, txt, jpg, jpeg, png, url`
- executable blacklist enabled for at least:
  - `exe`
  - `com`
  - `cmd`
  - `bat`
  - `scr`
  - `pif`

This was not theoretical tuning. It came from watching real ARR downgrade waves behave better after the changes.

## What Improved Reliability

### Turn Direct Unpack Off

This was the single clearest stability improvement.

With `Direct Unpack` on:

- SAB tries to unpack while the download is still running
- more things overlap
- weird or broken releases create more post-processing drama

With `Direct Unpack` off:

- SAB finishes the download first
- then does the normal repair/unpack/post-processing path
- slightly slower on paper
- noticeably calmer in real use

Important:

- turning it off does **not** mean SAB stops unpacking
- it just unpacks after the download completes instead of trying to be clever mid-flight

## Safe Speed Tuning

### Connections

For the live setup behind this guide, the safest useful bump was:

- from `10` connections
- to `12`
- then to `14`

That gave a small but real throughput improvement without making SAB unstable again.

Recommended approach:

1. start around `10-12`
2. verify stability
3. move to `14` if the server and machine stay happy
4. only go higher after a clean real-world test

### Receive Threads

The live setup now uses:

- `receive_threads = 4`

That is a reasonable tuning value for a normal strong Usenet server and a modern machine.

There was no need to get theatrical with it.

### Timeout

The old setup used:

- `timeout = 60`

That turned out to be a bit generous.

The live setup now uses:

- `timeout = 45`

Why:

- it is a little less patient with hanging article fetches
- it does not become as twitchy as dropping straight to `30`

This is a cleanup tweak, not a magic anti-corruption spell.

## Why Some Jobs Still Fail

A lot of SAB pain is not actually a SAB configuration problem.

Common real causes:

- `Corrupt RAR file`
- `Repair failed, not enough repair blocks`
- `Not on your server(s)`
- passworded or sketchy reposts
- old incomplete Usenet posts

In other words:

- sometimes the downloader is fine
- the release itself is just cursed

## What the Typical Failure Messages Mean

### `Aborted, cannot be completed`

Usually means:

- too many articles were missing on the server path
- the release could not be fully assembled

### `Repair failed, not enough repair blocks`

Usually means:

- the post is damaged beyond what the PAR files can fix

### `Corrupt RAR file`

Usually means:

- the release itself is broken
- not just mildly incomplete

### `Ghost downloading` rows in ARR

Usually means:

- SAB finished or mostly finished the download
- but post-processing or history state did not cleanly hand the job back
- `Radarr` or `Sonarr` keeps showing `00:00:00` fake-download rows

That got much better after `Direct Unpack` was turned off and the queue pressure was reduced.

## Batch Size Matters More Than People Want

Large downgrade waves amplify every weakness:

- bad releases
- post-processing jams
- queue confusion
- indexer quota pain

Recommended batch sizes:

- movies: `10-20`
- episodes: `5-10`

This is not timid. It is the size that worked best in real testing.

## What To Do When SAB Looks Stalled

Check these in order:

1. Is SAB actually paused?
2. Is there an active `Extracting`, `Repairing`, or `Verifying` job?
3. Is a single corrupt archive blocking post-processing?
4. Is the queue empty but ARR still shows ghost downloads?

If the problem is a clearly broken job:

- remove the obviously dead history item
- then refresh monitored downloads in ARR

Do **not** immediately nuke the whole queue unless you truly enjoy rebuilding context from smoke.

## Recommended Operating Pattern

For this kind of ARR stack:

- use broad indexers for daily traffic
- preserve specialist sources for high-value German grabs
- keep downgrade batches controlled
- let SAB stay a downloader, not an experimental performance-art engine

That combination ended up:

- faster enough
- more reliable
- and much easier to trust

Which is about the nicest thing one can say about home-media automation.
