# Sonarr Profile Template

Goal: German/Multi series library with English as a bridge only.

## Language Order

1. German/Multi, ideally German plus original or English audio
2. German audio
3. English bridge only when no file exists and no German candidate is available
4. German/Multi replacement when available later
5. Compact final keeper, then unmonitor

## Quality Order

| State | Recommended behavior |
| --- | --- |
| Empty episode | Accept safe English or German/Multi. |
| German `1080p` appears | Accept as a fast availability bridge. |
| Compact German/Multi `720p` appears | Prefer as final archive state for normal TV. |

## Guardrails

- English should not replace German/Multi.
- Block suspicious language markers.
- Anime, Korean, and Chinese lanes need scoped exceptions.
- Test with interactive search before trusting automation.
