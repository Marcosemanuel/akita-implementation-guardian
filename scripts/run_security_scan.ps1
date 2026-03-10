# run_security_scan.ps1 — Roda scan de segurança básico (versão Windows/PowerShell)
# Verifica dependências vulneráveis e segredos expostos

$ErrorActionPreference = "Continue"

Write-Host "[akita] Running security scan..."

# --- Check for exposed secrets ---
Write-Host "[akita] Checking for exposed secrets..."

$secretPatterns = @(
    # Chaves e tokens explícitos
    '(api[_-]?key|apikey|secret[_-]?key|secret)\s*[=:]\s*[''"][^''"]{8,}',
    '(password|passwd|pwd)\s*[=:]\s*[''"][^''"]{8,}',
    '(token|auth[_-]?token|access[_-]?token|bearer)\s*[=:]\s*[''"][^''"]{8,}',
    # Padrões de chaves de serviço
    '(sk_live_|pk_live_|sk_test_|pk_test_)',          # Stripe
    '(AKIA[0-9A-Z]{16})',                              # AWS Access Key
    '(ghp_[a-zA-Z0-9]{36})',                           # GitHub Personal Access Token
    '(xoxb-|xoxp-)',                                   # Slack tokens
    'Bearer\s+[a-zA-Z0-9\-._~+/]+=*'                  # Bearer tokens
)

$extensions = @("*.py", "*.js", "*.ts", "*.env", "*.json", "*.yml", "*.yaml", "*.toml", "*.cfg")
$secretsFound = $false

foreach ($pattern in $secretPatterns) {
    foreach ($ext in $extensions) {
        $files = Get-ChildItem -Path . -Filter $ext -Recurse -ErrorAction SilentlyContinue |
            Where-Object { $_.FullName -notmatch 'node_modules|\.git|__pycache__|\.venv|venv|dist|build|\.lock' }

        foreach ($file in $files) {
            $findings = Select-String -Path $file.FullName -Pattern $pattern -AllMatches -ErrorAction SilentlyContinue
            if ($findings) {
                $secretsFound = $true
                foreach ($finding in $findings) {
                    Write-Host "[akita] WARNING: Possible secret in $($file.Name):$($finding.LineNumber) - $($finding.Line.Trim().Substring(0, [Math]::Min(80, $finding.Line.Trim().Length)))..."
                }
            }
        }
    }
}

if (-not $secretsFound) {
    Write-Host "[akita] No obvious secrets detected."
}

# --- Check npm dependencies ---
if (Test-Path "package.json") {
    Write-Host "[akita] Auditing npm dependencies..."
    try {
        npm audit --production 2>$null
    } catch {
        Write-Host "[akita] npm audit found issues."
    }
}

# --- Check pip dependencies ---
if (Test-Path "requirements.txt") {
    Write-Host "[akita] Checking pip dependencies..."
    $pipAudit = Get-Command pip-audit -ErrorAction SilentlyContinue
    if ($pipAudit) {
        try {
            pip-audit -r requirements.txt 2>$null
        } catch {
            Write-Host "[akita] pip-audit found issues."
        }
    } else {
        Write-Host "[akita] pip-audit not installed. Install with: pip install pip-audit"
    }
}

# --- Check .env in git ---
if (Test-Path ".git") {
    $envInGit = git ls-files --cached ".env" 2>$null
    if ($envInGit) {
        Write-Host "[akita] BLOCKER: .env file is tracked by git! Add it to .gitignore immediately."
    }
}

Write-Host "[akita] Security scan completed."
