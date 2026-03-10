# Modo 01 — Pair Programming Governado

## Definição

O Modo 01 é o modo de **pair programming disciplinado** da Skill `akita-implementation-guardian`. Ele aplica Extreme Programming ao ciclo de construção humano+IA, garantindo que a velocidade do agente seja multiplicadora — não destrutiva.

## Princípio central

> "A IA é seu espelho. Se for incompetente, vai produzir coisas ruins mais rápido. Se for competente, vai produzir coisas boas mais rápido." — Akita

## Modelo: Pair Programming com IA

O modelo é pair programming, não auditoria. A diferença é fundamental:

- **Gerador de código:** recebe spec, devolve output. Sem conversa.
- **Par de pair programming:** conversa. Interrompe. Questiona. Simplifica.

### Dinâmica do par

| Papel | Responsabilidade | Quem faz melhor |
|---|---|---|
| **Navegar** | Definir direção, questionar decisões, corrigir rota | Humano |
| **Pilotar** | Escrever código, rodar testes, propor soluções | Agente |

> Quando inverte (humano ditando código exato, agente apenas digitando), o resultado sempre piora.

### Exemplos reais da prática (artigo Akita)

1. **Interrupção por over-engineering.** Proposta de state machine com 8 estados para email delivery. Humano interrompeu: "Simplifica. Quatro estados: pending, sending, sent, unknown." Resultado: 40 linhas que resolvem o problema inteiro.

2. **Contexto que o agente não tem.** Yahoo faz TLS fingerprinting — bloqueia HTTP clients que não são browser real. Agente tentou HTTParty. Humano explicou. Resultado: headless Chromium com stealth.

3. **Decisão de arquitetura conjunta.** Pipeline de podcast poderia ser monolito Python. Humano sugeriu: "Rails orquestra, Python serve TTS via HTTP." Cada linguagem no que faz melhor.

4. **Prompt refinement iterativo.** Personalidades de newsletter soavam genéricas. Ajustes iterativos: "Akita nunca diz 'talvez'. Marvin usa 'bom…' e 'enfim'." Cada ajuste testado com dados reais.

## Framework: Extreme Programming

Todas as práticas da Skill têm nome no XP. Não por planejamento — porque são as práticas que naturalmente emergem quando se programa com feedback rápido:

| Prática XP | Como se manifesta |
|---|---|
| **Pair Programming** | Humano navega, agente pilota |
| **Small Releases** | Cada commit passa no CI, é production-ready |
| **TDD** | Testes antes, ratio > 1:1, CI pega regressões |
| **Refactoring Contínuo** | Poda regular, extrair concerns, DRY |
| **Integração Contínua** | Lint + audit + security + testes em cada commit |
| **Simple Design** | Versão mais simples que resolve é a correta |

## Definição operacional

1. Recebe um objetivo, plano ou PRD.
2. Converte em etapas seguras (small releases).
3. Organiza um backlog incremental.
4. Orienta a construção por fases (pair programming).
5. Revisa cada fase com agentes especializados.
6. Bloqueia avanço quando faltarem guardrails mínimos.
7. Mantém spec viva e documentação do projeto.

## Fluxo operacional

### Fase A — Ingestão

A Skill recebe: ideia, PRD, plano técnico, roadmap ou requisitos. O `implementation_guard` classifica a entrada e seleciona o workflow.

### Fase B — Saneamento de plano

`plan_guard` e `architecture_guard` transformam a ambição em backlog incremental executável, reduzem complexidade desnecessária e impõem critérios de pronto.

**Artefato:** plano de implementação revisado.

### Fase C — Estabilização de base

`test_guard`, `security_guard` e `resilience_guard` garantem baseline mínima para build seguro.

**Artefato:** parecer de readiness de base.

> Se a base não estiver pronta, o build não prossegue.

### Fase D — Execução por incremento (pair programming)

O humano navega e o agente pilota dentro do escopo delimitado. Cada incremento: escopo, superfícies, critérios de aceite, testes, riscos, rollback.

### Fase E — Revisão do incremento

`code_guard`, `test_guard`, `security_guard` e `resilience_guard` verificam se a mudança pode avançar.

### Fase F — Persistência e spec viva

`spec_guard` registra o que mudou e atualiza a memória viva e a spec do projeto.

### Fase G — Hardening antes do próximo avanço

`implementation_guard` valida se o sistema pode continuar crescendo sem deterioração.

## O que o Modo 01 NÃO faz

- Tomar decisões de negócio sozinho.
- Fazer deploy autônomo irrestrito.
- Assumir que código funcional é código pronto.
- Aceitar complexidade sem justificativa.
- Dizer "não" ao humano — o agente implementa qualquer coisa com entusiasmo. **O humano é o freio.**

## Limites

1. **Não garante correção absoluta** — Reduz risco, não elimina.
2. **Não substitui validação humana** — Especialmente em arquitetura, trade-offs e produto.
3. **Não substitui operação real** — Sem CI, scripts e contexto reais, vira estrutura de prompt.
4. **Não resolve domínio errado** — Se o problema estiver mal definido, a esteira constrói com qualidade o sistema errado.
