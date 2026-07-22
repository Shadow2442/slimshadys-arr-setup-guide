# Seerr Request Defaults Template

Use request frontends as a safe front door, not as a bypass around ARR rules.

Recommended defaults:

- disable broad auto-approval
- manually approve full shows and large requests
- use the standard Radarr profile for movies
- use the standard Sonarr profile for series
- avoid monitoring every season automatically unless intentional
- confirm approved requests use the correct root folder
- let Sonarr and Radarr handle search, import, rename, and language logic

Reason:

A friendly request should not become 37 surprise seasons or hundreds of downloads before profiles are verified.
