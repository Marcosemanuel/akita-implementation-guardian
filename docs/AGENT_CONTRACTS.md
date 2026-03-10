# Contratos dos Agentes

Este documento define as regras de interação entre os agentes da Skill.

---

## Regras gerais

1. Todo agente é **deliberadamente restrito** ao seu domínio.
2. Nenhum agente deve invadir o escopo de outro.
3. O `implementation_guard` é o único agente que pode convocar e consolidar.
4. Todo agente deve escalar conflitos para o `implementation_guard`.
5. Todo agente deve produzir saída no formato definido em sua especificação.
6. Nenhum agente é autoridade final — supervisão humana prevalece.

---

## Mapa de domínios

| Agente | Domínio exclusivo | NÃO pode decidir sobre |
|---|---|---|
| `implementation_guard` | Orquestração, gates, consolidação | Produto, negócio |
| `plan_guard` | Plano, escopo, incrementos | Arquitetura, código |
| `architecture_guard` | Complexidade, simplificação | Implementação, testes |
| `test_guard` | Testes, CI, cobertura | Arquitetura, segurança |
| `resilience_guard` | Robustez operacional | Implementação, produto |
| `security_guard` | Segurança técnica | Arquitetura, produto |
| `code_guard` | Qualidade de código | Arquitetura, segurança |
| `spec_guard` | Memória viva, documentação | Implementação, decisão final |

---

## Protocolo de comunicação

### De subagente para implementation_guard
- Relatório no formato especificado.
- Classificação de findings por severidade.
- Recomendação clara: aprovar, bloquear ou refatorar.

### De implementation_guard para subagente
- Contexto da solicitação.
- Escopo da análise.
- Artefatos necessários para a revisão.

### Escalação para humano
Qualquer agente pode solicitar escalação via `implementation_guard` quando:
- A decisão envolve produto ou negócio.
- Há conflito entre recomendações de guards.
- A incerteza supera a capacidade de análise dos agentes.

---

## Veto

Qualquer guard pode emitir findings BLOCKER que impedem avanço. O `implementation_guard` **não pode ignorar** um BLOCKER sem resolução ou escalação para o humano.

---

## Dinâmica Humano-IA no Pair Programming

O par humano+agente tem regras explícitas:

| Papel | Faz | Não faz |
|---|---|---|
| **Humano** | Navega: define direção, questiona, interrompe, prioriza | Ditar código exato, aceitar tudo sem revisar |
| **Agente** | Pilota: escreve código, roda testes, propõe soluções | Decidir prioridade, ignorar interrupções, over-engineer sem freio |

### Regras de interação

1. **O humano decide o quê. O agente decide o como.** Inverter piora dramaticamente.
2. **O agente nunca diz "não".** Isso é responsabilidade do humano — questionar, interromper, simplificar.
3. **Contexto de domínio vem do humano.** O agente não sabe coisas específicas do seu contexto.
4. **Refactoring é decisão do humano.** O agente sozinho empilha código sem refatorar.
5. **Segurança proativa é do humano + guards.** O agente implementa o que pede, raramente sugere proteções extras.

> Para detalhamento completo, ver `docs/PAIR_PROGRAMMING_DYNAMICS.md`.

