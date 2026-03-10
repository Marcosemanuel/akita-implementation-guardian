#!/usr/bin/env python3
"""
summarize_ci_failures.py

Sumariza falhas recentes de CI para o test_guard.
Lê logs do CI e extrai padrões de falha.
"""

import json
import sys
from pathlib import Path


def summarize_failures(log_path: str) -> dict:
    """
    Lê um arquivo de log de CI e extrai informações sobre falhas.
    Formato esperado: texto plano com indicadores de erro.
    """
    path = Path(log_path)
    if not path.exists():
        return {"error": f"Log file not found: {log_path}"}

    content = path.read_text(encoding="utf-8", errors="ignore")
    lines = content.split("\n")

    errors = []
    warnings = []

    error_indicators = [
        "ERROR", "FAIL", "FAILED", "FATAL",
        "error:", "Error:", "AssertionError", "AssertionError",
        "TypeError", "ValueError", "KeyError", "AttributeError",
        "ImportError", "ModuleNotFoundError", "SyntaxError",
        "RuntimeError", "Traceback", "panic:", "PANIC",
        "Exception:", "exit code 1", "exit status 1",
    ]
    warning_indicators = [
        "WARNING", "WARN", "warning:", "Warning:",
        "DeprecationWarning", "FutureWarning", "DEPRECATED",
        "SKIP", "SKIPPED", "TODO",
    ]

    for i, line in enumerate(lines):
        if any(ind in line for ind in error_indicators):
            errors.append({
                "line": i + 1,
                "content": line.strip()[:200],
            })
        elif any(ind in line for ind in warning_indicators):
            warnings.append({
                "line": i + 1,
                "content": line.strip()[:200],
            })

    return {
        "log_file": str(path),
        "total_lines": len(lines),
        "total_errors": len(errors),
        "total_warnings": len(warnings),
        "errors": errors[:20],
        "warnings": warnings[:10],
        "status": "failed" if errors else "passed",
    }


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: summarize_ci_failures.py <log_file>")
        sys.exit(1)
    result = summarize_failures(sys.argv[1])
    print(json.dumps(result, indent=2, ensure_ascii=False))
