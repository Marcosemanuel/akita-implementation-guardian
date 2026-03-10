# Casos de Uso — Akita Implementation Guardian

Compilação completa dos cenários de uso da Skill, organizados por contexto de ativação. Cada caso mapeia para workflows, agentes, gates, artefatos e critérios de aceite.

> "O humano decide o quê. O agente decide o como. A Skill garante que ambos sigam o processo." — Akita

---

## UC-01 — Construir Projeto a Partir de Plano

**Contexto:** O humano tem uma ideia, PRD, roadmap ou especificação técnica e quer iniciar construção governada com IA.

**Workflow:** `build-from-plan`

**Gatilho:** Plano, PRD, ideia ou roadmap fornecido como entrada.

**Pré-condições:**

- Entrada textual com intenção clara.
- Contexto do projeto disponível (se existente).
- Restrições técnicas conhecidas (se aplicável).

**Fluxo principal:**

1. `implementation_guard` classifica a entrada (ideia, plano, PRD, roadmap).
2. `plan_guard` quebra em incrementos verificáveis (Small Releases).
3. `architecture_guard` simplifica arquitetura e elimina over-engineering.
4. `test_guard` injeta requisitos de TDD e CI por incremento.
5. `security_guard` define baseline de segurança nas superfícies expostas.
6. `resilience_guard` define critérios de robustez para jobs/automações.
7. `spec_guard` persiste decisões iniciais + cria Spec Viva do Projeto.
8. `implementation_guard` consolida e autoriza primeiro incremento.

**Pontos de decisão — escalar para humano:**

- Escopo ambíguo que requer priorização de produto.
- Trade-offs arquiteturais significativos (ex: monolito vs microserviços).
- Riscos que exigem validação explícita do humano.

**Pós-condições:**

- Plano incremental revisado existe.
- Contrato do primeiro incremento está preenchido.
- Spec Viva do Projeto criada ou atualizada.
- Decisões registradas no brain.
- Primeiro incremento autorizado.

**Gates:** `plan` + `foundation`

**Artefatos produzidos:**

- `implementation_plan.md` (plano incremental)
- `increment_contract.md` (primeiro incremento)
- `architecture_review_report.md` (parecer)
- `project_spec.md` (Spec Viva)
- Registros em `.agent/brain/decisions/` e `.agent/brain/risks/`

**Exemplo real:**
> "Quero construir um app de e-commerce com autenticação, catálogo e carrinho."
>
> **Resultado:** Plano com 6 incrementos: (1) lint+CI, (2) auth+testes, (3) catálogo+testes, (4) carrinho+testes, (5) integração+hardening, (6) deploy.

---

## UC-02 — Implementar um Incremento

**Contexto:** Existe um incremento autorizado com contrato preenchido. O par humano+agente vai implementar sob pair programming governado.

**Workflow:** `implement-increment`

**Gatilho:** Incremento autorizado pelo `implementation_guard` com contrato válido.

**Pré-condições:**

- Contrato do incremento preenchido (escopo, aceite, testes, rollback).
- Base saudável (CI verde, sem blockers pendentes).
- Spec Viva atualizada.
- Gate de incremento aprovado.

**Fluxo principal:**

1. `implementation_guard` verifica pré-requisitos e libera execução.
2. Humano navega (define direção), agente pilota (escreve código).
3. **TDD:** Testes escritos junto com o código, não depois.
4. **Small releases:** Cada mudança significativa é um commit production-ready.
5. `code_guard` revisa qualidade durante construção.
6. `implementation_guard` confirma escopo respeitado.
7. `code_guard` sugere refactorings cirúrgicos protegidos por testes.

**Pontos de decisão — escalar para humano:**

- Implementação ficando mais complexa que o esperado.
- Escopo precisando de ajuste.
- Decisão de design que impacta módulos fora do incremento.

**Pós-condições:**

- Código implementado dentro do escopo.
- Testes acompanham o código (ratio >= 1:1).
- CI verde.
- Diff revisável pronto para validação.
- Nenhum arquivo ultrapassou limites de complexidade.

**Gates:** `increment`

**Artefatos produzidos:**

- Código do incremento (commits production-ready)
- Testes unitários e de integração
- Evidências de CI verde

**Exemplo real:**
> "Incremento 3: Implementar CRUD de produtos com validação e testes unitários."
>
> **Resultado:** 5 commits, 12 testes, CI verde, 0 findings.

---

## UC-03 — Validar Incremento Pós-Implementação

**Contexto:** Incremento implementado, precisa de validação multi-dimensional antes de integração.

**Workflow:** `validate-increment`

**Gatilho:** Código novo ou alterado pronto para revisão.

**Pré-condições:**

- Incremento implementado.
- Diff ou conjunto de arquivos alterados disponível.
- Contrato do incremento com critérios de aceite.

**Fluxo principal:**

1. `code_guard` revisa legibilidade, padrões, coerência, exceções.
2. `test_guard` valida envelope de testes e saúde do CI.
3. `security_guard` verifica superfícies alteradas contra novos riscos.
4. `resilience_guard` verifica robustez de componentes alterados.
5. `implementation_guard` consolida, classifica findings, decide avanço.

**Pontos de decisão — escalar para humano:**

- Findings conflitantes entre guards (ex: simplificação vs segurança).
- Regressão detectada que requer rollback.
- Qualidade abaixo do aceitável mas prazo apertado.

**Pós-condições:**

- Todos os findings identificados e classificados.
- Blockers resolvidos ou documentados.
- Parecer emitido: avança, corrige ou bloqueia.

**Gates:** `validation`

**Artefatos produzidos:**

- `code_review_report.md`
- Status do envelope de teste
- `security_findings.md`
- `resilience_findings.md`
- `review_report.md` (parecer consolidado)

**Exemplo real:**
> "O incremento de autenticação está pronto. Pode mergear?"
>
> **Resultado:** 2 HIG findings (falta rate limiting em `/login`, teste de brute force ausente). Bloqueado até resolução.

---

## UC-04 — Estabilizar Base Existente

**Contexto:** Projeto existente com gaps em testes, CI, segurança ou resiliência. Precisa ser estabilizado antes de expandir com pair programming.

**Workflow:** `stabilize-foundation`

**Gatilho:** Base instável identificada — sem testes, sem CI, segurança não auditada.

**Pré-condições:**

- Acesso ao repositório/código existente.
- Conhecimento básico da stack.

**Fluxo principal:**

1. `implementation_guard` coleta fatos do projeto (script `collect_project_facts.py`).
2. `test_guard` audita testes, lint e CI existentes.
3. `security_guard` audita segurança mínima.
4. `resilience_guard` audita robustez de jobs/automações.
5. `architecture_guard` identifica complexidade prematura.
6. `spec_guard` cria Spec Viva do Projeto documentando stack, hurdles, padrões.
7. `implementation_guard` consolida gaps e emite plano de estabilização.

**Pontos de decisão — escalar para humano:**

- Priorização: qual gap corrigir primeiro.
- Budget de tempo: estabilização completa vs mínima.
- Decisão de manter ou substituir dependências vulneráveis.

**Pós-condições:**

- Todos os gaps identificados e priorizados.
- Spec Viva criada.
- Plano de estabilização incremental existe.
- Nenhuma feature nova é autorizada até gate de fundação aprovado.

**Gates:** `foundation`

**Artefatos produzidos:**

- `review_report.md` (gaps consolidados)
- `implementation_plan.md` (plano de estabilização)
- `project_spec.md` (Spec Viva)
- Parecer: autorizado ou bloqueado

**Exemplo real:**
> "Herdei um projeto Node.js sem testes e sem CI. Preciso fortalecer antes de adicionar features."
>
> **Resultado:** 8 gaps identificados (sem lint, 0% cobertura, secrets hardcoded, 3 CVEs). Plano de 4 incrementos de estabilização.

---

## UC-05 — Endurecer Antes de Merge/Release

**Contexto:** Múltiplos incrementos implementados, prontos para merge ou release. Último gate de qualidade antes de produção.

**Workflow:** `pre-merge-hardening`

**Gatilho:** Antes de merge para main/trunk ou release para produção.

**Pré-condições:**

- Incrementos implementados e validados individualmente.
- Resultados de validações anteriores disponíveis.
- Status de CI atual.

**Fluxo principal:**

1. `implementation_guard` identifica todas as superfícies alteradas (script `detect_changed_surfaces.py`).
2. `test_guard` confirma testes obrigatórios em fluxos críticos alterados.
3. `security_guard` roda scan completo, verifica CVEs e segredos.
4. `resilience_guard` verifica observabilidade e plano de rollback.
5. `spec_guard` confirma documentação atualizada no brain.
6. `implementation_guard` emite parecer final: mergeável ou não.

**Pontos de decisão — escalar para humano:**

- Blockers não resolvíveis sem decisão de produto.
- Trade-off entre prazo de release e qualidade pendente.
- Rollback que afeta dados em produção.

**Pós-condições:**

- Parecer emitido: mergeável ou não mergeável.
- Se mergeável: próximo passo seguro definido.
- Se não: blockers listados com ações obrigatórias.
- Documentação no brain atualizada.

**Gates:** `merge`

**Artefatos produzidos:**

- Parecer de merge (mergeável / não mergeável)
- `blocker_report.md` (se houver)
- `security_findings.md`
- Confirmação de documentação atualizada

**Exemplo real:**
> "Temos 5 incrementos no branch. Sprint acaba amanhã. Podemos mergear?"
>
> **Resultado:** 4/5 incrementos mergeáveis. Incremento 3 bloqueado (teste de integração falhando). Parecer: mergear 4, resolver incremento 3 separadamente.

---

## UC-06 — Recuperar de Incidente

**Contexto:** Bug sério, regressão ou falha em produção. Investigar causa raiz, corrigir e prevenir recorrência.

**Workflow:** `post-incident-recovery`

**Gatilho:** Incidente, bug sério, regressão ou falha de segurança.

**Pré-condições:**

- Descrição do incidente.
- Logs, stack traces, artefatos do erro.
- Timeline (quando começou, quando detectado, quando contido).

**Fluxo principal:**

1. `implementation_guard` coleta artefatos e constrói timeline.
2. `code_guard` localiza falha no código e causa raiz provável.
3. `test_guard` identifica lacunas de teste que permitiram a falha.
4. `resilience_guard` verifica fragilidades operacionais relacionadas.
5. `security_guard` verifica se há componente de segurança.
6. `architecture_guard` verifica se complexidade contribuiu.
7. `spec_guard` registra incidente no brain + atualiza Spec Viva com hurdle.
8. `implementation_guard` consolida e propõe correção incremental.

**Pontos de decisão — escalar para humano:**

- Incidente afeta dados de usuários em produção.
- Correção exige mudança arquitetural significativa.
- Causa raiz envolve decisão de produto.

**Pós-condições:**

- Causa raiz documentada.
- Correção proposta (nunca reescrita completa).
- Testes de prevenção de recorrência definidos.
- Incidente registrado no brain.
- Spec Viva atualizada com novo hurdle.
- Nenhuma feature nova até correção validada.

**Gates:** Nenhum gate formal — workflow diagnóstico com bloqueio informativo.

**Artefatos produzidos:**

- Timeline e causa raiz
- `implementation_patch_plan.md`
- Testes de prevenção
- Registro em `.agent/brain/incidents/`
- Spec Viva atualizada

**Exemplo real:**
> "O job de notificação duplicou emails para 500 usuários às 3h da manhã."
>
> **Resultado:** Causa raiz: cron sem lock + retry genérico. Correção: adicionar lock + retry semântico. 3 testes de prevenção. Hurdle adicionado à Spec Viva.

---

## UC-07 — Auditar Código Legado

**Contexto:** Código existente precisa de avaliação técnica completa antes de manutenção ou expansão.

**Workflow:** `review-existing-codebase`

**Gatilho:** Projeto legado para auditoria ou onboarding.

**Pré-condições:**

- Acesso ao repositório ou conjunto de arquivos.
- Contexto do projeto (stack, objetivo, restrições).

**Fluxo principal:**

1. `implementation_guard` coleta fatos (script `collect_project_facts.py`).
2. `architecture_guard` revisa estrutura, complexidade e acoplamento.
3. `code_guard` revisa qualidade, legibilidade e pontos frágeis.
4. `test_guard` revisa testes, cobertura e CI.
5. `security_guard` revisa segurança e dependências.
6. `resilience_guard` revisa robustez operacional.
7. `spec_guard` cria Spec Viva + registra achados no brain.
8. `implementation_guard` consolida parecer final.

**Pontos de decisão — escalar para humano:**

- Debilidade técnica tão grave que requer decisão: corrigir vs reescrever.
- Múltiplos padrões conflitantes no código.
- Stack técnica obsoleta que requer migração.

**Pós-condições:**

- Parecer técnico consolidado.
- Plano de correção incremental (nunca reescrita).
- Spec Viva criada para onboarding do agente.
- Todos os achados registrados no brain.

**Gates:** Nenhum — diagnóstico. Bloqueio está no parecer.

**Artefatos produzidos:**

- `review_report.md` (parecer consolidado)
- `implementation_patch_plan.md` (plano de correção)
- `project_spec.md` (Spec Viva)
- Achados em `.agent/brain/`

**Exemplo real:**
> "Vou assumir manutenção de um repo Python que não conheço. Qual a saúde dele?"
>
> **Resultado:** 12 findings (3 BLOCKER, 4 HIGH, 5 MEDIUM). Blocker: 0 testes, secrets no .env commitado, SQLAlchemy 1.3 com CVE crítica. Plano de 5 incrementos de correção.

---

## Mapa de Casos de Uso × Workflows × Gates × Agentes

| UC | Workflow | Gates | Agentes envolvidos |
| --- | --- | --- | --- |
| UC-01 | `build-from-plan` | plan, foundation | Todos os 8 |
| UC-02 | `implement-increment` | increment | impl, code |
| UC-03 | `validate-increment` | validation | impl, code, test, sec, res |
| UC-04 | `stabilize-foundation` | foundation | Todos os 8 |
| UC-05 | `pre-merge-hardening` | merge | impl, test, sec, res, spec |
| UC-06 | `post-incident-recovery` | — | Todos os 8 |
| UC-07 | `review-existing-codebase` | — | Todos os 8 |

---

## Encadeamentos Típicos

### Projeto novo (caminho feliz)

```text
UC-01 → UC-02 → UC-03 → [repetir UC-02/03] → UC-05
```

### Projeto legado

```text
UC-07 → UC-04 → UC-02 → UC-03 → [repetir] → UC-05
```

### Pós-incidente

```text
UC-06 → UC-04 → UC-02 (correção) → UC-03 → UC-05
```

### Ciclo contínuo

```text
UC-02 → UC-03 → UC-02 → UC-03 → ... → UC-05
                ↑                         |
                └───── UC-06 (se falha) ←─┘
```

> O `implementation_guard` decide o encadeamento com base no estado do projeto.
