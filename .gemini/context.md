# Project Context

This folder is configured for project-local Gemini CLI usage.

Important files:

- `.gemini/settings.json` — project-specific Gemini CLI settings.
- `.gemini/.env` — optional local secrets and environment variables.
- `GEMINI.md` — persistent project instruction file.
- `.geminiignore` — excludes files from Gemini context.
- `bin/gemini-start` — starts Gemini from the project root.
- `bin/gemini-plan` — starts Gemini in read-only planning mode.
- `bin/gemini-yolo-sandbox` — starts Gemini with sandboxing enabled for higher automation.

Architecture assumption:

- Use project root as the workspace.
- Use `.gemini/` for Gemini-specific settings, prompts, and local environment.
- Keep secrets out of Git.
