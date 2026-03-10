#!/usr/bin/env python3
"""
verify_increment_ready.py

Verifica se um incremento está pronto para execução.
Valida contrato contra o checklist de incremento.
"""

import json
import sys
from pathlib import Path


def load_checklist() -> list:
    checklist_path = Path(__file__).parent.parent / "data" / "increment-checklist.json"
    if not checklist_path.exists():
        print(
            f"[akita] WARNING: Checklist not found at {checklist_path}. "
            "Verification will run without checklist validation.",
            file=sys.stderr,
        )
        return []
    data = json.loads(checklist_path.read_text(encoding="utf-8"))
    items = data.get("increment_checklist", [])
    if not items:
        print(
            "[akita] WARNING: Checklist file exists but 'increment_checklist' is empty.",
            file=sys.stderr,
        )
    return items


def verify_contract(contract_path: str) -> dict:
    path = Path(contract_path)
    if not path.exists():
        return {"ready": False, "error": f"Contract not found: {contract_path}"}

    content = path.read_text(encoding="utf-8")
    checklist = load_checklist()

    results = []
    for item in checklist:
        check_id = item["id"]
        mandatory = item.get("mandatory", False)

        # Heurística simples: verifica se termos-chave estão presentes
        keywords = {
            "scope": ["escopo", "scope", "superfíc"],
            "acceptance": ["aceite", "acceptance", "critério"],
            "tests": ["teste", "test"],
            "rollback": ["rollback", "revert"],
            "risks": ["risco", "risk"],
            "surfaces": ["superfíc", "surface", "arquivo"],
            "contract": ["contrato", "contract"],
            "dependencies": ["dependênc", "depend"],
            "ci_green": ["ci", "pipeline"],
            "spec_viva": ["spec viva", "project_spec", "claude.md", "spec do projeto"],
        }

        found = False
        if check_id in keywords:
            found = any(kw.lower() in content.lower() for kw in keywords[check_id])
        else:
            found = True  # Para checks sem keyword, assume presente

        results.append({
            "id": check_id,
            "check": item["check"],
            "mandatory": mandatory,
            "found": found,
            "status": "OK" if found else ("BLOCKER" if mandatory else "WARNING"),
        })

    blockers = [r for r in results if r["status"] == "BLOCKER"]
    warnings = [r for r in results if r["status"] == "WARNING"]

    return {
        "contract": str(path),
        "ready": len(blockers) == 0,
        "total_checks": len(results),
        "passed": len([r for r in results if r["status"] == "OK"]),
        "blockers": len(blockers),
        "warnings": len(warnings),
        "details": results,
    }


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: verify_increment_ready.py <contract.md>")
        sys.exit(1)
    result = verify_contract(sys.argv[1])
    print(json.dumps(result, indent=2, ensure_ascii=False))
