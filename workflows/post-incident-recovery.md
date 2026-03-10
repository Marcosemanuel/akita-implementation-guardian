# post-incident-recovery

## Objetivo

Investigar causa raiz de incidentes, regressões ou bugs sérios e fortalecer a esteira para prevenir recorrência. O incidente é oportunidade de aprendizado: cada bug corrigido vira teste, cada falha vira documentação.

> "Segurança não é fase — é hábito. Cada vulnerabilidade corrigida é um commit, não uma sprint." — Akita

## Quando usar

- Após bug sério em produção.
- Após regressão causada por mudança recente.
- Após falha em job ou automação crítica.
- Após incidente de segurança.

## Entrada esperada

- Descrição do incidente.
- Logs, stack traces, artefatos do erro.
- Timeline do incidente (se disponível).
- Impacto em usuários/dados.

## Agente inicial

`implementation_guard`

## Ordem de execução

### Fase 1 — Coleta e timeline

**Agente:** `implementation_guard`

1. Coletar artefatos do incidente (logs, traces, capturas).
2. Construir timeline: quando começou, quando foi detectado, quando foi contido.
3. Identificar superfícies afetadas.
4. Classificar severidade do incidente.

**Saída:** sumário do incidente com timeline.

### Fase 2 — Localização da falha

**Agente:** `code_guard`

1. Analisar código nas superfícies afetadas.
2. Identificar causa raiz provável.
3. Verificar se a falha foi introduzida por mudança recente (regressão).
4. Avaliar se a causa envolve exceção engolida, race condition ou edge case.

**Saída:** localização da falha com causa raiz provável.

### Fase 3 — Lacunas de teste

**Agente:** `test_guard`

1. Verificar se existiam testes cobrindo o cenário falho.
2. Identificar por que os testes não pegaram o bug.
3. Definir testes que devem ser adicionados para prevenir recorrência.
4. Verificar se CI estava verde antes do deploy.

**Saída:** lacunas de teste identificadas + testes propostos.

### Fase 4 — Fragilidades operacionais

**Agente:** `resilience_guard`

1. Verificar se o incidente envolve job, automação ou integração.
2. Verificar idempotência e retries.
3. Verificar se observabilidade detectou o problema ou se foi descoberto externamente.

**Saída:** findings de resiliência relacionados.

### Fase 5 — Componente de segurança

**Agente:** `security_guard`

1. Verificar se o incidente tem componente de segurança.
2. Verificar se dados sensíveis foram expostos.
3. Verificar se a vulnerabilidade era conhecida.

**Saída:** findings de segurança relacionados.

### Fase 6 — Contribuição de complexidade

**Agente:** `architecture_guard`

1. Verificar se complexidade excessiva contribuiu para o incidente.
2. Sugerir simplificações para prevenir recorrência.

**Saída:** parecer de complexidade.

### Fase 7 — Registro e lições aprendidas

**Agente:** `spec_guard`

1. Registrar incidente no `.agent/brain/incidents/` (formato do README do brain).
2. Registrar lições aprendidas.
3. Documentar hurdle na Spec Viva (se aplicável).
4. Atualizar padrões proibidos (se a causa raiz indicar).

**Saída:** registro persistido no brain + Spec Viva atualizada.

### Fase 8 — Consolidação e plano de correção

**Agente:** `implementation_guard`

1. Consolidar outputs de todos os guards.
2. Propor correção incremental (não reescrita).
3. Definir testes obrigatórios da correção.
4. Emitir plano de hardening preventivo.

**Saída:** plano de correção (template: `implementation_patch_plan.md`).

## Critérios de bloqueio

- Não propor features novas até que a correção esteja implementada e validada.
- Correção deve incluir testes que previnem recorrência.

## Artefatos finais

1. Timeline e causa raiz do incidente.
2. Correção proposta (template: `implementation_patch_plan.md`).
3. Testes de prevenção de recorrência.
4. Endurecimento preventivo.
5. Registro no `.agent/brain/incidents/`.
6. Spec Viva atualizada com hurdle.
