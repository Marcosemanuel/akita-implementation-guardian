#!/bin/bash
# run_security_scan.sh — Roda scan de segurança básico
# Verifica dependências vulneráveis e segredos expostos

set -euo pipefail

echo "[akita] Running security scan..."

# --- Check for exposed secrets ---
echo "[akita] Checking for exposed secrets..."
if command -v git &>/dev/null; then
    # Padrões expandidos de secrets
    PATTERNS=(
        "(api[_-]?key|apikey|secret[_-]?key|secret)\s*[=:]\s*['\"][^'\"]{8,}"
        "(password|passwd|pwd)\s*[=:]\s*['\"][^'\"]{8,}"
        "(token|auth[_-]?token|access[_-]?token)\s*[=:]\s*['\"][^'\"]{8,}"
        "(sk_live_|pk_live_|sk_test_|pk_test_)"
        "(AKIA[0-9A-Z]{16})"
        "(ghp_[a-zA-Z0-9]{36})"
        "(xoxb-|xoxp-)"
        "Bearer\s+[a-zA-Z0-9\-._~+/]+="
    )

    SECRETS_FOUND=false
    for pattern in "${PATTERNS[@]}"; do
        RESULTS=$(git grep -rn -i -E "$pattern" -- '*.py' '*.js' '*.ts' '*.env' '*.json' '*.yml' '*.yaml' '*.toml' 2>/dev/null || true)
        if [ -n "$RESULTS" ]; then
            SECRETS_FOUND=true
            echo "[akita] WARNING: Possible secrets found:"
            echo "$RESULTS" | head -20
        fi
    done

    if [ "$SECRETS_FOUND" = false ]; then
        echo "[akita] No obvious secrets detected."
    fi

    # Check .env tracked by git
    ENV_IN_GIT=$(git ls-files --cached ".env" 2>/dev/null || true)
    if [ -n "$ENV_IN_GIT" ]; then
        echo "[akita] BLOCKER: .env file is tracked by git! Add it to .gitignore immediately."
    fi
fi

# --- Check npm dependencies ---
if [ -f "package.json" ]; then
    echo "[akita] Auditing npm dependencies..."
    npm audit --production 2>/dev/null || echo "[akita] npm audit found issues."
fi

# --- Check pip dependencies ---
if [ -f "requirements.txt" ]; then
    echo "[akita] Checking pip dependencies..."
    if command -v pip-audit &>/dev/null; then
        pip-audit -r requirements.txt 2>/dev/null || echo "[akita] pip-audit found issues."
    else
        echo "[akita] pip-audit not installed. Install with: pip install pip-audit"
    fi
fi

echo "[akita] Security scan completed."
