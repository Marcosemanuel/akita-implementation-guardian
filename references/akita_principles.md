# Princípios Akita

Princípios extraídos do artigo [Do Zero à Pós-Produção em 1 Semana](https://akitaonrails.com/2026/02/20/do-zero-a-pos-producao-em-1-semana-como-usar-ia-em-projetos-de-verdade-bastidores-do-the-m-akita-chronicles/) — Akita (2026-02-20).

> "274 commits. 8 dias. 4 aplicações. 1.323 testes. Um sistema completo em produção."

---

## As 8 Lições

### 1. Vibe coding sem disciplina é protótipo descartável
274 commits com CI, testes, security scanning, e small releases é o oposto de vibe coding. É engenharia de software com um copiloto que digita rápido.

### 2. TDD é mais importante com IA, não menos
O agente modifica código com confiança porque tem 1.323 testes como rede de segurança. Sem testes, cada mudança é uma aposta.

### 3. O humano decide o quê. O agente decide o como.
"Eu trago o quê e o porquê. O agente traz o como — e o como é frequentemente melhor do que eu faria sozinho. Mas o como sem o quê produz código correto que resolve o problema errado."

### 4. Refactoring contínuo é obrigatório
O agente empilha código. Se você não poda regularmente, a base degenera. 27 refactors pequenos e cirúrgicos ao longo de 8 dias.

### 5. Documentação é investimento com retorno imediato
Cada hora documentando no CLAUDE.md economiza horas de contexto perdido. O investimento retorna exponencialmente com agentes porque eles realmente leem.

### 6. Small releases são a chave
Cada commit é production-ready. Se algo der errado, reverte um commit. Se a feature era má ideia, nunca dependeu de outra.

### 7. Segurança não é fase — é hábito
21 commits de segurança espalhados por 8 dias, não concentrados numa "sprint de segurança". Brakeman roda em todo commit.

### 8. O agente nunca diz "não"
Isso é um bug, não uma feature. Se você pede algo over-engineered, ele implementa com entusiasmo. Você é o freio. Você é o code review. Você é o adulto na sala.

---

## Citações-chave

> "IA não programa sozinha, e não é inútil. É um multiplicador do programador, não um substituto."

> "O multiplicador real do agente não é '10x mais código'. É eliminar o tempo morto."

> "O futuro do desenvolvimento não é IA substituindo programadores. É programadores que sabem usar IA com a mesma disciplina que sempre usaram, produzindo em uma semana o que equipes inteiras levam trimestres."

> "A IA é seu espelho. Se for incompetente, vai produzir coisas ruins mais rápido. Se for competente, vai produzir coisas boas mais rápido."

---

## O Framework: Extreme Programming

"Tudo que fizemos tem nome no XP. Não porque planejei — porque são as práticas que naturalmente emergem quando você programa com feedback rápido."

- Pair Programming → Humano navega, agente pilota
- Small Releases → Cada commit production-ready
- TDD → Testes antes, ratio > 1:1
- Refactoring Contínuo → Poda regular, commits pequenos
- Integração Contínua → Lint + audit + security + testes em cada commit
- Simple Design → Versão mais simples é a correta

---

## A Prova: FrankMD vs M.Akita Chronicles

"Mesmo desenvolvedor. Mesmo agente de IA. Duas abordagens diferentes. Resultado: o projeto disciplinado entregou mais, em menos tempo, com menos dor."

| | Com XP | Sem XP |
|---|---|---|
| Commits/dia | 34 | 11 |
| Paradas forçadas | 0 | 6 |
| Testes | TDD orgânico | Retroativos |
| Maior arquivo | Sempre pequeno | 5.000 linhas |

> Para detalhes completos, ver `references/frankmd_counter_example.md`.
