# Radarr Profile Template

Goal: compact German/Multi movies with English fallback only when necessary.

## Language Order

1. German/Multi with original or English audio
2. German audio
3. English bridge only when no German/Multi exists
4. German/Multi replacement later
5. Verified compact keeper, then unmonitor

## Quality and Size Ideas

| Lane | Target |
| --- | --- |
| Normal movies | Compact German/Multi `1080p` |
| Temporary bridge | English `1080p` only when no German exists |
| Manual premium | `2160p`, Remux, or giant files only by choice |
| Old curated titles | Manual judgment, sometimes `720p`, `480p`, DVD, or compact BluRay |

## Guardrails

- Same-year similar titles need strict title checks.
- Good compact BDRips should not be rejected only for being efficient.
- French/Turkish/Hebrew markers should not pass normal movie lanes.
