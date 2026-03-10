# Implementação da Skill `akita-implementation-guardian` — Modo 01 Pair Programming Governado

Esta implementação visa construir a Skill "Akita Implementation Guardian" operando como **par de construção disciplinado**, aplicando Extreme Programming ao ciclo humano+IA.

## Artigo Base

[Do Zero à Pós-Produção em 1 Semana](https://akitaonrails.com/2026/02/20/do-zero-a-pos-producao-em-1-semana-como-usar-ia-em-projetos-de-verdade-bastidores-do-the-m-akita-chronicles/) — Akita (2026-02-20)

## Tese Central

> IA é multiplicador do programador, não substituto. XP + pair programming com IA produz resultados superiores ao vibe coding sem disciplina.

## Proposed Changes

Os arquivos serão criados dentro de `c:/Users/Alienware Marcos/Desktop/PORTIFÓLIO/SKILLS e AGENTS/.agent/skills/akita-implementation-guardian/`.

---

### Base da Skill

#### [NEW] `SKILL.md`
#### [NEW] `README.md`

---

### Documentação Doutrinária (`docs/`)

#### [NEW] `docs/MODE01_OVERVIEW.md`
#### [NEW] `docs/PRINCIPLES.md`
#### [NEW] `docs/BUILD_GATES.md`
#### [NEW] `docs/AGENT_CONTRACTS.md`
#### [NEW] `docs/WORKFLOW_SPEC.md`
#### [NEW] `docs/ARCHITECTURE_RULES.md`
#### [NEW] `docs/TESTING_STANDARD.md`
#### [NEW] `docs/SECURITY_BASELINE.md`
#### [NEW] `docs/RESILIENCE_PATTERNS.md`
#### [NEW] `docs/MEMORY_POLICY.md`
#### [REINTEGRATED] `docs/REVIEW_CRITERIA.md` — Critérios explícitos de revisão por dimensão
#### [REINTEGRATED] `docs/FAILURE_PATTERNS.md` — Catálogo de padrões de falha recorrentes

---

### Agentes de Governança (`agents/`)

#### [NEW] `agents/implementation_guard.md` (Agente Central — Orquestrador)
#### [NEW] `agents/plan_guard.md`
#### [NEW] `agents/architecture_guard.md`
#### [NEW] `agents/test_guard.md`
#### [NEW] `agents/resilience_guard.md`
#### [NEW] `agents/security_guard.md`
#### [NEW] `agents/code_guard.md`
#### [NEW] `agents/spec_guard.md`

---

### Workflows Operacionais (`workflows/`)

#### [NEW] `workflows/build-from-plan.md`
#### [NEW] `workflows/stabilize-foundation.md`
#### [NEW] `workflows/implement-increment.md`
#### [NEW] `workflows/validate-increment.md`
#### [NEW] `workflows/pre-merge-hardening.md`
#### [NEW] `workflows/post-incident-recovery.md`
#### [REINTEGRATED] `workflows/review-existing-codebase.md` — Auditoria de código legado/existente

---

### Templates de Saída (`templates/`)

#### [NEW] `templates/implementation_plan.md`
#### [NEW] `templates/increment_contract.md`
#### [NEW] `templates/review_report.md`
#### [NEW] `templates/blocker_report.md`
#### [NEW] `templates/security_findings.md`
#### [NEW] `templates/resilience_findings.md`
#### [NEW] `templates/decision_record.md`
#### [REINTEGRATED] `templates/code_review_report.md` — Relatório especializado do `code_guard`
#### [REINTEGRATED] `templates/architecture_review_report.md` — Relatório especializado do `architecture_guard`
#### [REINTEGRATED] `templates/spec_update.md` — Template de atualização de spec para o `spec_guard`
#### [REINTEGRATED] `templates/implementation_patch_plan.md` — Plano de correção incremental

---

### Dados Estruturados (`data/`)

#### [NEW] `data/workflows.json`
#### [NEW] `data/build-gates.json`
#### [NEW] `data/risk-matrix.json`
#### [NEW] `data/severity-rules.json`
#### [NEW] `data/anti-patterns.json`
#### [NEW] `data/increment-checklist.json`
#### [REINTEGRATED] `data/plan-checklist.json` — Checklist de validação de planos completos
#### [REINTEGRATED] `data/code-review-checklist.json` — Checklist estruturado para o `code_guard`

---

### Scripts Auxiliares (`scripts/`)

#### [NEW] `scripts/collect_project_facts.py`
#### [NEW] `scripts/detect_changed_surfaces.py`
#### [NEW] `scripts/run_lint.sh`
#### [NEW] `scripts/run_tests.sh`
#### [NEW] `scripts/run_security_scan.sh`
#### [NEW] `scripts/summarize_ci_failures.py`
#### [NEW] `scripts/verify_increment_ready.py`

---

### Referências (Progressive Disclosure) (`references/`)

#### [NEW] `references/akita_principles.md`
#### [NEW] `references/xp_mapping.md`
#### [NEW] `references/examples_good.md`
#### [NEW] `references/examples_bad.md`

---

### Recursos Visuais (`assets/`)

#### [NEW] `assets/snippets/`
#### [NEW] `assets/diagrams/`

---

### Memória Viva (`.agent/brain/`)

#### [NEW] `.agent/brain/plans/`
#### [NEW] `.agent/brain/decisions/`
#### [NEW] `.agent/brain/architecture/`
#### [NEW] `.agent/brain/risks/`
#### [NEW] `.agent/brain/reviews/`
#### [NEW] `.agent/brain/incidents/`

---

## Verification Plan

O plano de verificação inclui validações estruturais e cenários funcionais baseados no Modo 01.

1. **Validação Estrutural:**
   - [ ] Verificar se a árvore de diretórios criada sob `.agent/skills/akita-implementation-guardian/` corresponde de forma exata ao layout do Modo 01.
   - [ ] Confirmar que cada arquivo de agente (`agents/*.md`) define de forma explícita e restritiva seu escopo, incluindo "o que nunca fazer" e critérios de bloqueio (BLOCKER).
   - [ ] Confirmar que cada workflow define: nome, objetivo, quando usar, entrada esperada, agente inicial, ordem de agentes, critérios de bloqueio e artefatos finais.

2. **Cenário de Teste 1: Build-from-Plan (Workflow `build-from-plan`)**
   - **Ação:** Submeter um PRD vago que propõe construir tudo de uma vez sem testes definidos.
   - **Sucesso Esperado:** O `implementation_guard` aciona `plan_guard` e `architecture_guard`. O plano é bloqueado e reescrito em incrementos menores com critérios de aceite, definição de pronto e contrato de incremento.

3. **Cenário de Teste 2: Stabilize-Foundation (Workflow `stabilize-foundation`)**
   - **Ação:** Submeter uma base de projeto sem CI, sem testes e com segredos expostos.
   - **Sucesso Esperado:** Os guards de teste, segurança e resiliência impedem qualquer avanço de escopo e emitem um relatório de gaps com plano de estabilização.

4. **Cenário de Teste 3: Validate-Increment (Workflow `validate-increment`)**
   - **Ação:** Submeter um incremento de código com job assíncrono sem idempotência, sem lock e sem retry semântico.
   - **Sucesso Esperado:** O `resilience_guard` classifica como `HIGH`, e o `code_guard` emite parecer com sugestões de correção incremental. O incremento é bloqueado até correção.

5. **Cenário de Teste 4: Pre-Merge-Hardening (Workflow `pre-merge-hardening`)**
   - **Ação:** Simular merge request com dependência vulnerável e ausência de rollback.
   - **Sucesso Esperado:** A Skill emite parecer "não mergeável" com blockers listados pelo `security_guard` e exigência de plano de rollback.

6. **Cenário de Teste 5: Memória Viva**
   - **Ação:** Após completar um ciclo de incremento, verificar se o `spec_guard` persistiu decisões em `.agent/brain/`.
   - **Sucesso Esperado:** Registros de decisão, riscos aceitos e revisões concluídas existem como arquivos no brain.
