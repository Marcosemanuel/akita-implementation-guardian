#!/bin/bash
# run_lint.sh — Roda lint do projeto
# Detecta automaticamente o linter disponível

set -euo pipefail

echo "[akita] Running lint..."

if [ -f "biome.json" ]; then
    npx biome check .
elif [ -f ".eslintrc" ] || [ -f ".eslintrc.js" ] || [ -f ".eslintrc.json" ]; then
    npx eslint .
elif [ -f "pyproject.toml" ] && grep -q "ruff" pyproject.toml 2>/dev/null; then
    ruff check .
elif [ -f ".flake8" ] || ([ -f "pyproject.toml" ] && grep -q "flake8" pyproject.toml 2>/dev/null); then
    flake8 .
else
    echo "[akita] No linter detected. Skipping."
    exit 0
fi

echo "[akita] Lint completed."
