# review-existing-codebase

## Objetivo

Auditar código existente e emitir parecer técnico com plano de correção incremental. Inclui criação de Spec Viva para projetos que não têm documentação.

> "A primeira sessão com um projeto existente é onboarding. A Spec Viva é o documento de onboarding — mas o novo membro é o agente." — Akita

## Quando usar

- Projeto legado que precisa de avaliação.
- Antes de assumir manutenção de código existente.
- Para avaliar saúde de um repositório antes de expandir.
- Quando ingressar em projeto sem documentação.

## Entrada esperada

- Acesso ao repositório ou conjunto de arquivos.
- Contexto do projeto (stack, objetivo, restrições).

## Agente inicial

`implementation_guard`

## Ordem de execução

### Fase 1 — Coleta de fatos

**Agente:** `implementation_guard` (com apoio do script `collect_project_facts.py`)

1. Executar coleta automatizada de fatos.
2. Identificar linguagens, dependências, presença de testes/CI.
3. Mapear estrutura de diretórios e componentes.
4. Identificar serviços, jobs e automações.

**Saída:** relatório de fatos do projeto.

### Fase 2 — Revisão arquitetural

**Agente:** `architecture_guard`

1. Mapear componentes e suas relações.
2. Identificar complexidade desnecessária.
3. Detectar over-engineering existente.
4. Avaliar acoplamento entre módulos.

**Saída:** parecer arquitetural.

### Fase 3 — Revisão de código

**Agente:** `code_guard`

1. Revisar legibilidade e coerência.
2. Identificar repetições e acoplamento excessivo.
3. Verificar controle de erro e exceções.
4. Identificar pontos frágeis.
5. Sugerir refactorings prioritários.

**Saída:** relatório de revisão de código (template: `code_review_report.md`).

### Fase 4 — Auditoria de testes e CI

**Agente:** `test_guard`

1. Verificar presença e qualidade de testes.
2. Avaliar cobertura de fluxos críticos.
3. Verificar saúde do pipeline de CI.
4. Identificar gaps prioritários.

**Saída:** status do envelope de testes.

### Fase 5 — Auditoria de segurança

**Agente:** `security_guard`

1. Verificar superfícies expostas.
2. Auditar dependências vulneráveis.
3. Verificar segredos e dados sensíveis.
4. Verificar headers e configurações de segurança.

**Saída:** findings de segurança (template: `security_findings.md`).

### Fase 6 — Auditoria de resiliência

**Agente:** `resilience_guard`

1. Identificar jobs, automações e integrações.
2. Verificar idempotência e observabilidade.
3. Verificar recuperação de falha.

**Saída:** findings de resiliência (template: `resilience_findings.md`).

### Fase 7 — Criação da Spec Viva

**Agente:** `spec_guard`

1. Criar Spec Viva do Projeto (template: `project_spec.md`).
2. Documentar stack, estrutura, variáveis de ambiente.
3. Documentar common hurdles identificados durante a auditoria.
4. Registrar decisões e padrões detectados.
5. Registrar achados no brain.

**Saída:** Spec Viva + registros no `.agent/brain/`.

### Fase 8 — Consolidação

**Agente:** `implementation_guard`

1. Consolidar parecer final de todos os guards.
2. Classificar findings por severidade.
3. Gerar plano de correção incremental.
4. Definir prioridades de estabilização.

**Saída:** parecer consolidado (template: `review_report.md`) + plano (template: `implementation_patch_plan.md`).

## Critérios de bloqueio

- N/A — este workflow é diagnóstico. O bloqueio está no parecer que impede avanço sem correção.

## Artefatos finais

1. Parecer técnico consolidado (template: `review_report.md`).
2. Plano de correção incremental (template: `implementation_patch_plan.md`).
3. Spec Viva do Projeto (template: `project_spec.md`).
4. Achados registrados no brain.
