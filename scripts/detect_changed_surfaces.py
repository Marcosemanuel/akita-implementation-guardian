#!/usr/bin/env python3
"""
detect_changed_surfaces.py

Detecta superfícies alteradas no projeto para alimentar pre-merge-hardening.
Usa git diff para identificar arquivos e módulos modificados.
"""

import subprocess
import json
import sys
from pathlib import Path


def detect_changes(project_root: str, base_ref: str = "main") -> dict:
    root = Path(project_root)

    try:
        result = subprocess.run(
            ["git", "diff", "--name-status", base_ref],
            capture_output=True, text=True, cwd=root
        )
        if result.returncode != 0:
            return {"error": f"git diff failed: {result.stderr.strip()}"}
    except FileNotFoundError:
        return {"error": "git not found"}

    changes = {"added": [], "modified": [], "deleted": [], "renamed": []}

    for line in result.stdout.strip().split("\n"):
        if not line.strip():
            continue
        parts = line.split("\t")
        status = parts[0][0]
        filepath = parts[-1]

        if status == "A":
            changes["added"].append(filepath)
        elif status == "M":
            changes["modified"].append(filepath)
        elif status == "D":
            changes["deleted"].append(filepath)
        elif status == "R":
            changes["renamed"].append(filepath)

    changes["total_changed"] = sum(len(v) for v in changes.values())
    changes["modules_affected"] = list(set(
        str(Path(f).parent) for f in
        changes["added"] + changes["modified"] + changes["renamed"]
    ))

    return changes


if __name__ == "__main__":
    project_path = sys.argv[1] if len(sys.argv) > 1 else "."
    base = sys.argv[2] if len(sys.argv) > 2 else "main"
    result = detect_changes(project_path, base)
    print(json.dumps(result, indent=2, ensure_ascii=False))
