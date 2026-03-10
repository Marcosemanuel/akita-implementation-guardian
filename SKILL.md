---
name: akita-implementation-guardian
description: Skill de pair programming disciplinado para desenvolvimento com IA. Aplica Extreme Programming (XP) ao ciclo humano+agente, garantindo que velocidade nunca destrua qualidade.
---

# akita-implementation-guardian

## Finalidade

Governar o ciclo de pair programming humano+IA, aplicando práticas de Extreme Programming para que a velocidade do agente seja multiplicadora — não destrutiva.

> "A IA é seu espelho. Se for incompetente, vai produzir coisas ruins mais rápido. Se for competente, vai produzir coisas boas mais rápido." — Akita

## Modelo operacional

**Pair Programming com IA.** O humano navega (define o quê e o porquê). O agente pilota (executa o como). Quando o humano dita código exato e o agente apenas digita, o resultado piora.

A Skill garante que esse par opere com disciplina de XP:

- **Small Releases** — cada commit é production-ready.
- **TDD** — testes são a rede de segurança que permite velocidade.
- **Refactoring Contínuo** — o agente empilha código; sem poda, degenera.
- **Integração Contínua** — CI roda em cada commit, sem exceção.
- **Simplicidade** — a versão mais simples que resolve é a correta.

## Quando usar

- Construir um sistema novo a partir de um plano, PRD ou ideia.
- Transformar um PRD em backlog executável com incrementos governados.
- Evoluir um produto de forma incremental com revisão contínua.
- Revisar e estabilizar uma base de código existente.
- Endurecer o projeto antes de merge ou release.
- Conduzir revisão pós-incidente.

## Quando NÃO usar

- Tarefas pequenas e localizadas.
- Demandas de revisão pontual sem contexto de projeto.
- Protótipos rápidos sem necessidade de governança.
- Quando não houver intenção de manter memória viva do projeto.

## As 8 lições (fonte: artigo Akita)

1. **Vibe coding sem disciplina é protótipo descartável.** CI, testes e small releases são o oposto de vibe coding — é engenharia com copiloto.
2. **TDD é MAIS importante com IA, não menos.** O agente modifica código com confiança porque tem testes como rede de segurança.
3. **O humano decide o quê. O agente decide o como.** Inverter piora dramaticamente.
4. **Refactoring contínuo é obrigatório.** O agente empilha código. Sem poda, a base degenera.
5. **Documentação é investimento com retorno imediato.** Cada hora documentando economiza horas de contexto perdido.
6. **Small releases são a chave.** Cada commit é production-ready. Se algo falhar, reverte um commit.
7. **Segurança não é fase — é hábito.** Commits de segurança espalhados, não concentrados no final.
8. **O agente nunca diz "não".** Implementa over-engineering com entusiasmo. Você é o freio.

## Agente central

- **`implementation_guard`** — Orquestrador do ciclo de construção. Classifica a entrada, seleciona workflows, convoca subagentes, aprova ou bloqueia transições.

## Subagentes

| Agente | Domínio |
|---|---|
| `plan_guard` | Converter intenção em plano incremental executável |
| `architecture_guard` | Simplificar arquitetura e conter over-engineering |
| `test_guard` | Envelope de testes e Integração Contínua |
| `resilience_guard` | Robustez operacional (idempotência, locks, retries) |
| `security_guard` | Segurança técnica mínima e intermediária |
| `code_guard` | Revisão direta do código produzido ou alterado |
| `spec_guard` | Memória viva do projeto (decisões, riscos, spec viva) |

## Workflows

| Workflow | Quando usar |
|---|---|
| `build-from-plan` | Entrada é plano, PRD ou ideia |
| `stabilize-foundation` | Base ainda não é segura para crescer |
| `implement-increment` | Incremento delimitado e autorizado |
| `validate-increment` | Após execução de um incremento |
| `pre-merge-hardening` | Antes de merge ou release |
| `post-incident-recovery` | Após bug sério, regressão ou incidente |
| `review-existing-codebase` | Auditoria de código legado/existente |

## Severidade dos findings

- **BLOCKER** — Impede avanço, merge ou continuação.
- **HIGH** — Impede ampliação saudável do escopo.
- **MEDIUM** — Deve entrar no próximo ciclo.
- **LOW** — Melhoria recomendada.

## Formato mínimo de saída

Toda saída consolidada deve conter:

1. Resumo executivo
2. Achados por severidade
3. Problemas obrigatórios de corrigir
4. Melhorias recomendadas
5. Riscos remanescentes
6. Próximo incremento seguro
7. Atualizações para documentação viva

## Limitação fundamental

Esta Skill **não substitui julgamento humano**. O agente é multiplicador, não substituto. Um programador medíocre com IA produz código medíocre mais rápido. Um programador experiente com IA produz código bom na velocidade que antes só era possível com equipes.
