# Especificação de Workflows

Todos os workflows da Skill operam sob o modelo de **Pair Programming Governado**: o humano navega, o agente pilota, e os guards garantem disciplina de Extreme Programming.

---

## Campos obrigatórios de cada workflow

Todo workflow **deve** conter:

1. **Nome** — Identificador único.
2. **Objetivo** — O que o workflow busca alcançar.
3. **Quando usar** — Condições de acionamento.
4. **Entrada esperada** — O que deve ser fornecido.
5. **Agente inicial** — Quem recebe a solicitação.
6. **Ordem de execução** — Sequência de agentes e fases.
7. **Critérios de bloqueio** — Condições que impedem conclusão.
8. **Artefatos finais** — O que o workflow deve produzir (templates referenciados).

---

## Workflows disponíveis

| Workflow | Entrada | Objetivo |
| --- | --- | --- |
| `build-from-plan` | Plano, PRD, ideia | Criar esteira de construção incremental |
| `stabilize-foundation` | Projeto existente | Fortalecer base + criar Spec Viva |
| `implement-increment` | Contrato de incremento | Executar incremento em pair programming |
| `validate-increment` | Código alterado | Validar incremento pós-execução |
| `pre-merge-hardening` | Diff acumulado | Endurecer antes de merge |
| `post-incident-recovery` | Dados do incidente | Investigar, corrigir, fortalecer |
| `review-existing-codebase` | Código existente | Auditar e gerar Spec Viva |

---

## Regras de execução

1. Workflows são **sequenciais** — cada fase depende da anterior.
2. Um finding BLOCKER em qualquer fase **interrompe** o workflow.
3. O `implementation_guard` sempre **inicia e consolida**.
4. Cada agente produz saída no formato definido em sua especificação.
5. Outputs devem ser **auditáveis** — sem decisões opacas.
6. Alterações na memória viva são feitas **apenas pelo `spec_guard`**.
7. A **Spec Viva** deve ser consultada no início e atualizada no fim de cada workflow.
8. O **humano pode interromper** qualquer fase a qualquer momento.

---

## Encadeamento de workflows

Workflows podem ser encadeados quando o contexto exigir:

```text
build-from-plan → stabilize-foundation → implement-increment → validate-increment → pre-merge-hardening
```

O `implementation_guard` decide o encadeamento com base no estado do projeto.

> "274 commits. 8 dias. Cada commit é production-ready." — O encadeamento garante que cada passo é seguro.
