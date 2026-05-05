# Gemini CLI Project Template

This is a sample project for using Gemini CLI with a project-local `.gemini/` folder.

## Why this structure works

Gemini CLI reads project settings from `./.gemini/settings.json` when launched from the project root. It also supports project-local environment files and persistent context files such as `GEMINI.md`.

## Install Gemini CLI

```bash
npm install -g @google/gemini-cli
# or
brew install gemini-cli
```

Check:

```bash
gemini --version
```

## Setup secrets

```bash
cp .gemini/.env.example .gemini/.env
code .gemini/.env
```

Do not commit `.gemini/.env`.

## Start Gemini

```bash
./bin/gemini-start
```

Pass regular Gemini CLI args through the wrapper:

```bash
./bin/gemini-start --model gemini-2.5-pro
```

## Read-only planning mode

```bash
./bin/gemini-plan
```

## Sandbox automation mode

```bash
./bin/gemini-yolo-sandbox
```

Use this carefully. It enables sandboxing and auto-approval.

## Install this setup into another project

Copy `gemini-cli-setup` into the project root and run:

```bash
chmod +x gemini-cli-setup
./gemini-cli-setup
```

Overwrite existing generated files:

```bash
GEMINI_SETUP_FORCE=1 ./gemini-cli-setup
```

## File map

```text
.gemini/
├── settings.json
├── .env.example
├── context.md
└── prompts/
    ├── debug.md
    └── refactor.md
bin/
├── gemini-start
├── gemini-plan
└── gemini-yolo-sandbox
.vscode/
└── tasks.json
GEMINI.md
.geminiignore
.gitignore
gemini-cli-setup
```
