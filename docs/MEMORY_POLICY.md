# Política de Memória Viva

## Regra central

> A memória viva existe para impedir reintrodução de erro, perda de contexto entre sessões e repetição de debates já encerrados.

---

## O que deve ser persistido

| Tipo | Diretório | Exemplos |
|---|---|---|
| Planos | `.agent/brain/plans/` | Plano vigente, backlog incremental |
| Decisões | `.agent/brain/decisions/` | Escolhas arquiteturais, trade-offs |
| Arquitetura | `.agent/brain/architecture/` | Diagrama vigente, contratos |
| Riscos | `.agent/brain/risks/` | Riscos aceitos, débitos técnicos |
| Revisões | `.agent/brain/reviews/` | Pareceres, findings recorrentes |
| Incidentes | `.agent/brain/incidents/` | Causa raiz, lições aprendidas |

## O que NÃO deve ser persistido

- Ruído operacional sem valor futuro.
- Outputs transitórios de execução.
- Hipóteses não confirmadas.
- Conclusões descartadas.
- Decisões não validadas.

## Função estratégica

A memória viva impede:

1. **Reintrodução de erro** — Erros corrigidos ficam documentados.
2. **Perda de contexto** — Sessões futuras começam com continuidade.
3. **Inconsistência entre incrementos** — Decisões são mantidas coerentes.
4. **Repetição de debates** — Discussões encerradas não são reabertas sem motivo.

## Responsabilidade

O `spec_guard` é o único agente autorizado a persistir informação no brain. Outros agentes devem solicitar registro via relatório de saída.

## Formato dos registros

Todos os registros devem usar os templates disponíveis em `templates/` para garantir padronização.

## Ciclo de atualização

A memória viva deve ser atualizada ao final de cada ciclo de incremento (Fase F do fluxo operacional do Modo 01).

---

## Spec Viva do Projeto

Além do brain, o `spec_guard` é responsável por manter a **Spec Viva do Projeto** — documento que descreve o projeto para o agente (equivalente ao CLAUDE.md de 702 linhas descrito no artigo do Akita).

> "Cada vez que descobríamos um hurdle, documentávamos. Na próxima sessão, o agente já sabe." — Akita

A Spec Viva deve conter: visão da arquitetura, stack, variáveis de ambiente, estrutura de diretórios, common hurdles, design patterns e checklist pós-implementação. Template disponível em `templates/project_spec.md`.

O investimento em documentação retorna exponencialmente com agentes de IA porque **eles realmente leem**.
