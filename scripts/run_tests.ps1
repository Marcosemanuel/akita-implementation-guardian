# run_tests.ps1 — Roda testes do projeto (versão Windows/PowerShell)
# Detecta automaticamente o test runner disponível

$ErrorActionPreference = "Stop"

Write-Host "[akita] Running tests..."

if (Test-Path "package.json") {
    $pkg = Get-Content "package.json" -Raw | ConvertFrom-Json

    # Tenta runners específicos primeiro (mais confiável que "test" genérico)
    if ($pkg.devDependencies.PSObject.Properties["vitest"] -or $pkg.dependencies.PSObject.Properties["vitest"]) {
        Write-Host "[akita] Detected vitest"
        npx vitest run
    } elseif ($pkg.devDependencies.PSObject.Properties["jest"] -or $pkg.dependencies.PSObject.Properties["jest"]) {
        Write-Host "[akita] Detected jest"
        npx jest
    } elseif ($pkg.scripts.PSObject.Properties["test"] -and $pkg.scripts.test -ne "echo `"Error: no test specified`" && exit 1") {
        Write-Host "[akita] Using npm test script"
        npm test
    } else {
        Write-Host "[akita] No test runner found in package.json"
        exit 1
    }
} elseif ((Test-Path "pyproject.toml") -or (Test-Path "pytest.ini") -or (Test-Path "setup.cfg")) {
    Write-Host "[akita] Detected pytest"
    python -m pytest
} elseif (Test-Path "go.mod") {
    Write-Host "[akita] Detected Go test"
    go test ./...
} else {
    Write-Host "[akita] No test runner detected."
    exit 1
}

Write-Host "[akita] Tests completed."
