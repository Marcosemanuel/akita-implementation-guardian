# stabilize-foundation

## Objetivo

Fortalecer a fundação do projeto antes de permitir expansão de escopo. Sem base sólida — testes, CI, segurança — o pair programming com IA amplifica problemas em vez de resolver.

> "Sem TDD, cada mudança que o agente faz é uma aposta. Com TDD, é uma certeza." — Akita

## Quando usar

- Base de código existente sem testes adequados.
- CI inexistente ou quebrada.
- Segurança não auditada.
- Jobs/automações sem resiliência mínima.
- Projeto sem Spec Viva documentada.

## Entrada esperada

- Acesso ao repositório/código existente.
- Estado atual de CI (se existir).
- Contexto do projeto (stack, objetivo, restrições).

## Agente inicial

`implementation_guard`

## Ordem de execução

### Fase 1 — Coleta de fatos

**Agente:** `implementation_guard` (com apoio do script `collect_project_facts.py`)

1. Executar coleta automatizada de fatos do projeto.
2. Identificar linguagens, dependências, presença de testes e CI.
3. Mapear estrutura de diretórios.
4. Verificar se Spec Viva existe.

**Saída:** relatório de fatos do projeto.

### Fase 2 — Auditoria de testes e CI

**Agente:** `test_guard`

1. Verificar presença e qualidade de lint.
2. Verificar presença de testes unitários e de integração.
3. Avaliar cobertura em fluxos críticos.
4. Verificar saúde do pipeline de CI.
5. Definir baseline mínima para avanço seguro.

**Saída:** status do envelope de testes com gaps identificados.

### Fase 3 — Auditoria de segurança

**Agente:** `security_guard`

1. Revisar validação de entrada.
2. Revisar autenticação e autorização.
3. Verificar segredos expostos.
4. Auditar dependências vulneráveis.
5. Verificar headers de segurança.

**Saída:** findings de segurança com correções obrigatórias.

### Fase 4 — Auditoria de resiliência

**Agente:** `resilience_guard`

1. Identificar jobs, automações e integrações assíncronas.
2. Verificar idempotência.
3. Verificar retries semânticos vs genéricos.
4. Verificar observabilidade mínima.
5. Verificar recuperação de falha.

**Saída:** findings de resiliência.

### Fase 5 — Auditoria de complexidade

**Agente:** `architecture_guard`

1. Identificar over-engineering existente.
2. Mapear complexidade desnecessária.
3. Propor simplificações para a base.

**Saída:** parecer de complexidade.

### Fase 6 — Criação da Spec Viva

**Agente:** `spec_guard`

1. Se não existir, criar Spec Viva do Projeto (template: `project_spec.md`).
2. Documentar stack, variáveis, common hurdles já conhecidos.
3. Registrar decisões e padrões identificados.

**Saída:** Spec Viva inicial + registros no `.agent/brain/`.

### Fase 7 — Consolidação e plano de estabilização

**Agente:** `implementation_guard`

1. Consolidar gaps de todos os guards.
2. Priorizar correções por criticidade.
3. Gerar plano de estabilização incremental.
4. Definir critérios de "base pronta para crescer".

**Saída:** relatório consolidado (template: `review_report.md`) + plano (template: `implementation_plan.md`).

## Critérios de bloqueio

- Nenhuma feature nova deve ser implementada enquanto a base não passar pelo gate de fundação.
- Se a base tiver blockers de segurança, testes ou resiliência, o avanço é impedido.

## Artefatos finais

1. Relatório de gaps consolidado (template: `review_report.md`).
2. Plano de estabilização incremental (template: `implementation_plan.md`).
3. Spec Viva do Projeto (template: `project_spec.md`).
4. Parecer: autorizado ou bloqueado para avanço.
5. Decisões iniciais persistidas no brain.
