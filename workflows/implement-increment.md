# implement-increment

## Objetivo

Conduzir a execução de um incremento delimitado sob governança de pair programming. O humano navega (define escopo, questiona decisões), o agente pilota (escreve código, roda testes).

> "Cada commit é production-ready. Se algo der errado, reverte um commit." — Akita

## Quando usar

- Quando há um incremento autorizado pelo `implementation_guard`.
- Quando o contrato do incremento está preenchido.
- Quando a base passou pelo gate de fundação.

## Entrada esperada

- Contrato do incremento (template: `increment_contract.md`).
- Contexto arquitetural (decisões em `.agent/brain/architecture/`).
- Superfícies afetadas.
- Spec Viva do Projeto atualizada.

## Agente inicial

`implementation_guard`

## Ordem de execução

### Fase 1 — Verificação de pré-requisitos

**Agente:** `implementation_guard`

1. Verificar contrato do incremento preenchido (escopo, aceite, testes, rollback).
2. Confirmar que a base está saudável (CI verde, sem blockers pendentes).
3. Verificar que a Spec Viva está atualizada.
4. Liberar execução.

### Fase 2 — Implementação em pair programming

**Agentes:** Humano (navega) + Agente (pilota)

1. Humano define direção e prioridades do incremento.
2. Agente implementa código dentro do escopo delimitado.
3. **TDD:** Testes escritos junto com o código, não depois.
4. **Small releases:** Cada mudança significativa é um commit que passa no CI.
5. Humano interrompe se perceber over-engineering ou desvio de escopo.

> O agente nunca diz "não". Se a implementação está ficando complexa demais, o humano deve interromper.

### Fase 3 — Revisão rápida durante construção

**Agente:** `code_guard`

1. Revisar qualidade do código produzido.
2. Verificar coerência com padrões do projeto.
3. Identificar oportunidades de refactoring imediato.
4. Verificar que testes acompanham o código.

### Fase 4 — Verificação de escopo

**Agente:** `implementation_guard`

1. Confirmar que o escopo do contrato foi respeitado.
2. Verificar que não houve feature creep.
3. Confirmar que o incremento é revertível.

### Fase 5 — Refactoring check

**Agente:** `code_guard`

1. Verificar se o código adicionado criou duplicação.
2. Sugerir refactorings cirúrgicos (extract concern, DRY).
3. Garantir que o refactoring é protegido pelos testes existentes.

> "27 refactors em 8 dias. Cada um leva minutos, protegido pelos testes que já existem."

## Critérios de bloqueio

- Contrato do incremento não preenchido.
- Escopo ultrapassou o definido no contrato.
- Implementação introduz complexidade não autorizada pelo `architecture_guard`.
- Testes não acompanham o código (violação de TDD).
- CI quebrado.

## Artefatos finais

1. Código do incremento implementado (commits production-ready).
2. Testes do incremento (ratio >= 1:1 com código).
3. Evidências de CI verde.
4. Diff revisável pronto para `validate-increment`.
