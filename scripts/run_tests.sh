#!/bin/bash
# run_tests.sh — Roda testes do projeto
# Detecta automaticamente o test runner disponível
# Prioriza runners específicos sobre script "test" genérico

set -euo pipefail

echo "[akita] Running tests..."

if [ -f "package.json" ]; then
    # Prioriza runners específicos (mais confiável que "test" genérico)
    if grep -q '"vitest"' package.json 2>/dev/null; then
        echo "[akita] Detected vitest"
        npx vitest run
    elif grep -q '"jest"' package.json 2>/dev/null; then
        echo "[akita] Detected jest"
        npx jest
    elif grep -q '"test"' package.json 2>/dev/null; then
        # Verifica se o script test não é o placeholder padrão
        TEST_SCRIPT=$(node -e "console.log(require('./package.json').scripts?.test || '')" 2>/dev/null || echo "")
        if [ -n "$TEST_SCRIPT" ] && [[ "$TEST_SCRIPT" != *"no test specified"* ]]; then
            echo "[akita] Using npm test script: $TEST_SCRIPT"
            npm test
        else
            echo "[akita] npm test is a placeholder. No real test runner found."
            exit 1
        fi
    else
        echo "[akita] No test script found in package.json"
        exit 1
    fi
elif [ -f "pyproject.toml" ] || [ -f "pytest.ini" ] || [ -f "setup.cfg" ]; then
    echo "[akita] Detected pytest"
    python -m pytest
elif [ -f "go.mod" ]; then
    echo "[akita] Detected Go test"
    go test ./...
else
    echo "[akita] No test runner detected."
    exit 1
fi

echo "[akita] Tests completed."
