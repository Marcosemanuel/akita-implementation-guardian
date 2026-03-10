# build-from-plan

## Objetivo

Criar a esteira inicial de construção a partir de um plano, PRD, ideia ou roadmap. Este é o workflow principal do Modo 01 para iniciar um ciclo de construção governada.

## Quando usar

- Quando a entrada for um plano de implementação.
- Quando a entrada for um PRD (Product Requirements Document).
- Quando a entrada for uma ideia ou especificação técnica.
- Quando a entrada for um roadmap ou lista de requisitos.

## Entrada esperada

- Plano, PRD, ideia, roadmap ou conjunto de requisitos em formato textual.
- Contexto do projeto (se existente).
- Restrições técnicas conhecidas (se aplicável).

## Agente inicial

`implementation_guard`

## Ordem de execução

### Fase 1 — Classificação e ingestão

**Agente:** `implementation_guard`

1. Receber a entrada.
2. Classificar o tipo (ideia, plano, PRD, roadmap).
3. Identificar se há contexto de projeto existente.
4. Selecionar subagentes necessários para as fases seguintes.

### Fase 2 — Saneamento de plano

**Agente:** `plan_guard`

1. Analisar o escopo total.
2. Quebrar em incrementos pequenos e verificáveis.
3. Definir critérios de pronto para cada incremento.
4. Definir critérios de aceite para cada incremento.
5. Identificar riscos por etapa.
6. Definir ordem de execução.
7. Exigir plano de rollback por incremento.

**Saída:** plano incremental revisado.

### Fase 3 — Revisão arquitetural

**Agente:** `architecture_guard`

1. Revisar a arquitetura proposta (se houver).
2. Identificar over-engineering.
3. Propor simplificações.
4. Adiar abstrações sem necessidade comprovada.
5. Validar que a complexidade é justificada.

**Saída:** parecer arquitetural com simplificações.

### Fase 4 — Requisitos de teste e CI

**Agente:** `test_guard`

1. Injetar requisitos mínimos de teste por incremento.
2. Definir baseline de CI.
3. Identificar fluxos críticos que precisam de cobertura obrigatória.

**Saída:** requisitos de teste embutidos no plano.

### Fase 5 — Baseline de segurança

**Agente:** `security_guard`

1. Identificar superfícies expostas.
2. Injetar critérios de hardening mínimo.
3. Listar verificações obrigatórias de segurança.

**Saída:** baseline de segurança embutida no plano.

### Fase 6 — Critérios de resiliência

**Agente:** `resilience_guard`

1. Identificar jobs, automações e integrações.
2. Injetar requisitos de idempotência, locks, retries semânticos.
3. Definir observabilidade mínima.

**Saída:** critérios de resiliência embutidos no plano.

### Fase 7 — Persistência de decisões

**Agente:** `spec_guard`

1. Registrar decisões iniciais do projeto.
2. Registrar arquitetura aprovada.
3. Registrar riscos aceitos.
4. Registrar padrões proibidos.

**Saída:** registros no `.agent/brain/`.

### Fase 8 — Consolidação final

**Agente:** `implementation_guard`

1. Consolidar outputs de todos os subagentes.
2. Verificar se todos os gates foram atendidos.
3. Emitir parecer final.
4. Definir o primeiro incremento seguro.

**Saída:** relatório consolidado + primeiro incremento autorizado.

## Critérios de bloqueio

O workflow é bloqueado se:

- O plano não pôde ser quebrado em incrementos verificáveis.
- A arquitetura proposta tem complexity BLOCKER não resolvida.
- Não há baseline mínima de testes definida.
- Existem superfícies de segurança críticas sem tratamento.
- Jobs ou automações identificados não têm critérios de resiliência.

## Artefatos finais esperados

1. Plano de implementação revisado (template: `implementation_plan.md`).
2. Contratos dos primeiros incrementos (template: `increment_contract.md`).
3. Parecer arquitetural (template: `architecture_review_report.md`).
4. Decisões iniciais persistidas em `.agent/brain/decisions/`.
5. Riscos iniciais persistidos em `.agent/brain/risks/`.
