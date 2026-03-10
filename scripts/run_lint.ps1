# run_lint.ps1 — Roda lint do projeto (versão Windows/PowerShell)
# Detecta automaticamente o linter disponível

$ErrorActionPreference = "Stop"

Write-Host "[akita] Running lint..."

if (Test-Path "biome.json") {
    npx biome check .
} elseif ((Test-Path ".eslintrc") -or (Test-Path ".eslintrc.js") -or (Test-Path ".eslintrc.json") -or (Test-Path "eslint.config.js") -or (Test-Path "eslint.config.mjs")) {
    npx eslint .
} elseif ((Test-Path "pyproject.toml") -and (Select-String -Path "pyproject.toml" -Pattern "ruff" -Quiet)) {
    ruff check .
} elseif ((Test-Path ".flake8") -or ((Test-Path "pyproject.toml") -and (Select-String -Path "pyproject.toml" -Pattern "flake8" -Quiet))) {
    flake8 .
} else {
    Write-Host "[akita] No linter detected. Skipping."
    exit 0
}

Write-Host "[akita] Lint completed."
