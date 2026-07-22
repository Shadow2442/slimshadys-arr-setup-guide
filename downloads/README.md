# Downloads README

This folder contains safe companion files for SlimShady's ARR Setup Guide.

The files are examples, not ready-made live configuration exports. They are designed to help a user or Codex set up a home media stack step by step without exposing secrets or copying machine-specific settings.

Use this order:

1. Read `package-manifest.md`.
2. Fill in the templates under `templates/`.
3. Copy `examples/env.example` to a private local `.env`.
4. Copy `examples/config.example.json` to a private local config file.
5. Review scripts under `scripts/`.
6. Run only small dry-run tests first.

To build a curated ZIP from a local checkout, run:

```powershell
.\downloads\scripts\build-safe-guide-package.ps1
```

Never publish real API keys, Plex tokens, ARR databases, downloader history, logs, or personal backup files.
