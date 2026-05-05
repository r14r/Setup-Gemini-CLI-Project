#!/usr/bin/env bash
set -euo pipefail

echo "🔍 Searching for .code-workspace file..."

WORKSPACE_FILE=$(ls *.code-workspace 2>/dev/null | head -n 1 || true)

if [ -n "${WORKSPACE_FILE}" ]; then
  TARGET_FILE="${WORKSPACE_FILE}"
  MODE="workspace"
  echo "✅ Found workspace file: ${TARGET_FILE}"
else
  mkdir -p .vscode
  TARGET_FILE=".vscode/settings.json"
  MODE="settings"

  if [ ! -f "${TARGET_FILE}" ]; then
    echo "{}" > "${TARGET_FILE}"
  fi

  echo "➡️ Using ${TARGET_FILE}"
fi

python3 <<PY
from __future__ import annotations

import json
import re
from pathlib import Path

path = Path("${TARGET_FILE}")
mode = "${MODE}"

text = path.read_text(encoding="utf-8")

# Remove simple JSONC comments
text = re.sub(r"//.*", "", text)
text = re.sub(r"/\\*.*?\\*/", "", text, flags=re.S)

# Remove trailing commas before } or ]
text = re.sub(r",\\s*([}\\]])", r"\\1", text)

try:
    data = json.loads(text or "{}")
except json.JSONDecodeError as e:
    print(f"❌ Could not parse {path}")
    print(f"   Line {e.lineno}, column {e.colno}: {e.msg}")
    raise SystemExit(1)

if mode == "workspace":
    data.setdefault("settings", {})
    data["settings"]["password-store"] = "keychain"
else:
    data["password-store"] = "keychain"

path.write_text(
    json.dumps(data, indent=2, ensure_ascii=False) + "\\n",
    encoding="utf-8",
)

print(f"✅ Updated {path}")
PY

echo ""
echo "🚀 Done. Restart VSCode completely."