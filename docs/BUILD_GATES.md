# Gates de Qualidade

Os gates são pontos de verificação obrigatórios no pair programming governado. Sem aprovação do gate, o próximo passo não é liberado.

> "Sem gate aprovado, sem avanço. Sem exceção." — Esse é o freio que o agente não tem sozinho.

---

## Gate de Plano

**Quando:** Antes de iniciar qualquer construção.

**Verifica:**
- Escopo quebrado em incrementos pequenos e verificáveis.
- Critérios de pronto definidos para cada incremento.
- Backlog incremental com ordem de execução clara.
- Simplificação mínima aplicada (sem over-engineering).
- Riscos identificados por etapa.
- Plano de rollback por incremento.

**Responsável:** `plan_guard` + `architecture_guard`

---

## Gate de Fundação

**Quando:** Antes de liberar o primeiro incremento de implementação.

**Verifica:**
- Baseline de testes configurada (lint + unitários mínimos).
- Pipeline de CI existente e saudável.
- Segurança mínima verificada (sem segredos expostos, dependências auditadas).
- Observabilidade básica (logs mínimos).
- Resiliência mínima em jobs/automações (se existirem).

**Responsável:** `test_guard` + `security_guard` + `resilience_guard`

---

## Gate de Incremento

**Quando:** Antes de iniciar a execução de cada incremento.

**Verifica:**
- Contrato do incremento preenchido (escopo, aceite, testes, rollback).
- Riscos do incremento delimitados.
- Superfície controlada (não altera mais do que o necessário).
- Aprovação do `implementation_guard`.

**Responsável:** `implementation_guard`

---

## Gate de Validação

**Quando:** Após a execução de cada incremento.

**Verifica:**
- Revisão de código aprovada pelo `code_guard`.
- Testes esperados existem e passam.
- Segurança das superfícies alteradas verificada.
- Resiliência de componentes alterados verificada.
- Nenhum finding BLOCKER pendente.

**Responsável:** `code_guard` + `test_guard` + `security_guard` + `resilience_guard`

---

## Gate de Merge

**Quando:** Antes de merge ou release.

**Verifica:**
- Todos os blockers resolvidos.
- Base saudável (CI verde, testes passando).
- Documentação atualizada no brain.
- Próximo passo seguro definido.
- Plano de rollback documentado.

**Responsável:** `implementation_guard` (com suporte de todos os guards)

---

## Regra fundamental

> Sem gate aprovado, sem avanço. Sem exceção.
