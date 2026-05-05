# Project Instructions for Gemini CLI

You are working in a local software project.

## Behavior

- Be precise and implementation-oriented.
- Prefer small, reviewable patches.
- Explain assumptions before modifying architecture.
- Never commit, stage, or push Git changes unless explicitly asked.
- Before destructive commands, explain the impact and ask for approval.
- When generating code, include typing, basic error handling, and tests where useful.

## Project Workflow

1. Inspect relevant files first.
2. Propose a short plan.
3. Apply focused changes.
4. Run lightweight validation commands.
5. Report changed files and remaining risks.

## Local Commands

Useful commands:

```bash
./bin/gemini-start
./bin/gemini-plan
./bin/gemini-yolo-sandbox
```
