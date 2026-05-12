# SlimShady's ARR Setup Guide

Welcome to the GitHub Pages version of this ARR setup guide.

This site is a practical beginner-friendly guide for:

- `Sonarr`
- `Radarr`
- `SABnzbd`
- German-friendly indexer strategy
- language-aware automation
- size control
- safe downgrade workflows

## Who This Is For

This guide is especially useful if:

- you are technical, but not an ARR specialist
- you work in IT, security, or adjacent technical areas
- you are comfortable learning systems
- but you do not want to spend days decoding every Sonarr and Radarr setting from scratch

It comes from real setup work done by someone with technical experience and a practical mindset, not from a “developer-only” perspective.

It was also built and refined with the support of `OpenAI Codex`, which helped inspect the live configuration, test ideas, compare indexers, and apply changes safely.

## Start Here

- [Main Guide](README.md)
- [Setup Checklist](docs/setup-checklist.md)
- [Indexers and German Content Strategy](docs/indexers-and-german-content.md)
- [Quality, Sizes, and Downgrades](docs/quality-sizing-and-downgrades.md)

## What This Guide Tries to Do

Most ARR guides explain features.

This one tries to answer:

- what should you actually enable
- what should you avoid
- how should you set priorities
- how do you keep German content quality high without burning through quotas
- how do you save disk space without downloading worse files by accident

## Want Help Applying It?

If you do not want to implement everything manually, you can use `OpenAI Codex` as a practical ARR setup copilot.

This guide works well as input for Codex, for example if you want help to:

- audit your current `Sonarr`, `Radarr`, and `SABnzbd` setup
- apply the recommended indexer priorities
- implement language-scoring rules
- tune quality profiles and size limits
- build safe downgrade workflows
- debug import or search issues

So yes, this guide is not only meant to be read by humans. It can also be handed to `Codex` so it can help implement the configuration in your own setup.

## Short Version

- use broad indexers for daily work
- preserve German specialist sources for when they matter
- prefer `720p` for series
- prefer compact `1080p` for movies
- treat downgrades as a controlled workflow, not a magic button

If a setting sounds too clever, test it on a few titles first. ARR tools are excellent at turning confidence into comedy.
