#!/usr/bin/env bash
# gear-codex.sh — terminal gearbox for OpenAI Codex CLI (macOS / Linux / Git Bash).
# Codex's real "gear" is reasoning effort, so the gears shift effort; the model
# stays gpt-5.4 by default and can be overridden.
#
#   ./gear-codex.sh              interactive menu
#   ./gear-codex.sh 3            gear 3 (medium)
#   ./gear-codex.sh 4 gpt-5.4    gear 4 (high) on an explicit model
#
# Codex shows context-remaining + 5h/weekly limits in its own status line
# (set `status_line` in ~/.codex/config.toml), so there's no fuel gauge here.

set -euo pipefail

MODEL_DEFAULT="gpt-5.4"

names=("minimal (feather)" "low (light)" "medium (cruising)" "high (full power)")
efforts=("minimal" "low" "medium" "high")

g="${1:-}"
if [[ -z "$g" ]]; then
  printf '\n  CODEX GEARBOX  (reasoning effort)\n'
  for i in "${!names[@]}"; do printf '  [%d] %s\n' "$((i+1))" "${names[$i]}"; done
  printf '\n  shift into gear: '
  read -r g
fi

if ! [[ "$g" =~ ^[1-4]$ ]]; then
  echo "  no such gear: $g" >&2
  exit 1
fi

effort="${efforts[$((g-1))]}"
model="${2:-$MODEL_DEFAULT}"
echo "  >> ${names[$((g-1))]} · $model"

exec codex -m "$model" -c "model_reasoning_effort=\"$effort\""
