#!/usr/bin/env python3
"""
collect_project_facts.py

Coleta fatos básicos do projeto para alimentar o implementation_guard.
Analisa: estrutura de diretórios, linguagens, dependências, presença de testes e CI.
"""

import os
import json
import sys
from pathlib import Path


def collect_facts(project_root: str) -> dict:
    root = Path(project_root)
    facts = {
        "project_root": str(root.resolve()),
        "languages": detect_languages(root),
        "has_tests": has_tests(root),
        "has_ci": has_ci(root),
        "has_lint": has_lint(root),
        "has_docker": (root / "Dockerfile").exists() or (root / "docker-compose.yml").exists(),
        "has_env_file": (root / ".env").exists(),
        "has_gitignore": (root / ".gitignore").exists(),
        "dependency_files": find_dependency_files(root),
        "total_files": count_files(root),
        "directory_structure": get_top_level_structure(root),
    }
    return facts


def detect_languages(root: Path) -> list:
    extensions = {}
    for f in root.rglob("*"):
        if f.is_file() and not is_ignored(f):
            ext = f.suffix.lower()
            if ext:
                extensions[ext] = extensions.get(ext, 0) + 1

    lang_map = {
        ".py": "Python", ".js": "JavaScript", ".ts": "TypeScript",
        ".jsx": "React JSX", ".tsx": "React TSX", ".go": "Go",
        ".rs": "Rust", ".java": "Java", ".rb": "Ruby",
        ".php": "PHP", ".cs": "C#", ".swift": "Swift",
    }
    detected = []
    for ext, count in sorted(extensions.items(), key=lambda x: -x[1]):
        if ext in lang_map:
            detected.append({"language": lang_map[ext], "file_count": count})
    return detected[:5]


def has_tests(root: Path) -> bool:
    test_patterns = ["test_", "_test.", ".test.", "spec_", "_spec.", ".spec."]
    for f in root.rglob("*"):
        if f.is_file() and any(p in f.name.lower() for p in test_patterns):
            return True
    return False


def has_ci(root: Path) -> bool:
    ci_paths = [
        ".github/workflows", ".gitlab-ci.yml", "Jenkinsfile",
        ".circleci", ".travis.yml", "azure-pipelines.yml",
    ]
    for p in ci_paths:
        if (root / p).exists():
            return True
    return False


def has_lint(root: Path) -> bool:
    lint_files = [
        ".eslintrc", ".eslintrc.js", ".eslintrc.json",
        ".flake8", "pyproject.toml", ".prettierrc",
        "biome.json", ".stylelintrc",
    ]
    for f in lint_files:
        if (root / f).exists():
            return True
    return False


def find_dependency_files(root: Path) -> list:
    dep_files = [
        "package.json", "requirements.txt", "Pipfile", "pyproject.toml",
        "go.mod", "Cargo.toml", "Gemfile", "composer.json", "pom.xml",
    ]
    found = []
    for f in dep_files:
        if (root / f).exists():
            found.append(f)
    return found


def count_files(root: Path) -> int:
    count = 0
    for f in root.rglob("*"):
        if f.is_file() and not is_ignored(f):
            count += 1
    return count


def get_top_level_structure(root: Path) -> list:
    items = []
    for item in sorted(root.iterdir()):
        if item.name.startswith(".") and item.name not in [".github", ".agent"]:
            continue
        items.append({
            "name": item.name,
            "type": "directory" if item.is_dir() else "file",
        })
    return items


def is_ignored(path: Path) -> bool:
    ignored = ["node_modules", ".git", "__pycache__", ".venv", "venv", "dist", "build"]
    parts = path.parts
    return any(i in parts for i in ignored)


if __name__ == "__main__":
    project_path = sys.argv[1] if len(sys.argv) > 1 else "."
    facts = collect_facts(project_path)
    print(json.dumps(facts, indent=2, ensure_ascii=False))
