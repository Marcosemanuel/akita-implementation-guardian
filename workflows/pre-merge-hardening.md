# pre-merge-hardening

## Objetivo

Impedir que uma mudança passe para produção ou seja mergeada sem endurecimento mínimo. Este é o último gate antes de merge ou release.

## Quando usar

- Antes de merge de branch para trunk/main.
- Antes de release para produção.
- Antes de deploy de versão significativa.
- Quando múltiplos incrementos estão sendo consolidados.

## Entrada esperada

- Conjunto de alterações acumuladas desde o último merge/release.
- Resultados das validações de incremento anteriores.
- Status atual do pipeline de CI.
- Lista de findings conhecidos e status de resolução.

## Agente inicial

`implementation_guard`

## Ordem de execução

### Fase 1 — Levantamento de superfícies alteradas

**Agente:** `implementation_guard` (com apoio do script `detect_changed_surfaces.py`)

1. Identificar todas as superfícies (arquivos, módulos, APIs) alteradas.
2. Classificar por criticidade.
3. Mapear para os guards que devem revisar.

### Fase 2 — Verificação de testes obrigatórios

**Agente:** `test_guard`

1. Confirmar que todos os testes obrigatórios existem e passam.
2. Verificar cobertura de fluxos críticos alterados.
3. Confirmar que CI está verde.

### Fase 3 — Verificação de segurança

**Agente:** `security_guard`

1. Rodar verificação de segurança nas superfícies alteradas.
2. Confirmar que CVEs de dependências estão tratadas.
3. Verificar que não há segredos expostos.

### Fase 4 — Verificação de observabilidade e rollback

**Agente:** `resilience_guard`

1. Verificar que observabilidade mínima está presente.
2. Confirmar que existe plano de rollback documentado.
3. Verificar que jobs e automações estão protegidos.

### Fase 5 — Verificação de documentação

**Agente:** `spec_guard`

1. Verificar que decisões foram persistidas no brain.
2. Confirmar que documentação está atualizada.

### Fase 6 — Parecer final

**Agente:** `implementation_guard`

1. Consolidar resultados de todas as verificações.
2. Emitir parecer: **mergeável** ou **não mergeável**.
3. Se mergeável, definir o próximo passo seguro.
4. Se não mergeável, listar blockers e ações obrigatórias.

## Critérios de bloqueio

O merge é bloqueado se:

- Existem findings BLOCKER não resolvidos.
- Pipeline de CI não está verde.
- Testes obrigatórios estão ausentes em fluxos críticos.
- Não existe plano de rollback.
- Segredos expostos foram detectados.
- Documentação crítica está desatualizada.

## Artefatos finais esperados

1. Parecer de merge (mergeável / não mergeável) com justificativa.
2. Lista de blockers pendentes (se houver) (template: `blocker_report.md`).
3. Findings de segurança (template: `security_findings.md`).
4. Confirmação de documentação atualizada.
