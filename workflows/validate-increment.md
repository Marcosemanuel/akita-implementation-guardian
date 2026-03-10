# validate-increment

## Objetivo

Validar se um incremento já implementado pode ser incorporado à base. Este workflow é acionado após a execução de cada incremento para garantir que a mudança atende aos critérios mínimos de qualidade.

## Quando usar

- Após a execução de qualquer incremento no Modo 01.
- Quando há código novo ou alterado que precisa de validação antes de integração.
- Após correções incrementais sugeridas por revisões anteriores.

## Entrada esperada

- Diff ou conjunto de arquivos alterados pelo incremento.
- Contrato do incremento (com critérios de aceite e testes esperados).
- Contexto arquitetural atual.

## Agente inicial

`implementation_guard`

## Ordem de execução

### Fase 1 — Revisão de código

**Agente:** `code_guard`

1. Revisar legibilidade do código alterado.
2. Verificar coerência com padrões do projeto.
3. Identificar repetiçẽs, acoplamento e pontos frágeis.
4. Verificar controle de erro.
5. Avaliar risco de regressão.

**Saída:** relatório de revisão de código.

### Fase 2 — Validação de testes

**Agente:** `test_guard`

1. Verificar se os testes esperados pelo contrato do incremento existem.
2. Verificar se o pipeline de CI está passando.
3. Identificar lacunas de cobertura nos fluxos modificados.

**Saída:** status do envelope de teste.

### Fase 3 — Revisão de segurança

**Agente:** `security_guard`

1. Verificar se superfícies alteradas introduzem novos riscos.
2. Revisar validação de entrada nos pontos modificados.
3. Verificar se segredos ou dados sensíveis foram expostos.

**Saída:** findings de segurança.

### Fase 4 — Revisão de resiliência

**Agente:** `resilience_guard`

1. Verificar se jobs ou automações alteradas mantêm idempotência.
2. Verificar se retries continuam semânticos.
3. Verificar se observabilidade mínima está preservada.

**Saída:** findings de resiliência.

### Fase 5 — Consolidação

**Agente:** `implementation_guard`

1. Consolidar outputs de todos os guards.
2. Classificar findings por severidade.
3. Determinar se o incremento pode avançar.
4. Listar blockers, highs, médios e próximos passos.

**Saída:** parecer consolidado.

## Critérios de bloqueio

O incremento é bloqueado se:

- Existe finding com severidade BLOCKER não resolvido.
- Testes esperados pelo contrato do incremento não existem.
- Pipeline de CI está quebrado.
- Revisão de código identifica regressão comprovada.

## Artefatos finais esperados

1. Relatório de revisão de código (template: `code_review_report.md`).
2. Status do envelope de teste.
3. Findings de segurança (template: `security_findings.md`).
4. Findings de resiliência (template: `resilience_findings.md`).
5. Parecer consolidado (template: `review_report.md`).
