# Mapeamento XP

Mapeamento entre práticas de Extreme Programming e componentes da Skill, com exemplos concretos do artigo [Do Zero à Pós-Produção em 1 Semana](https://akitaonrails.com/2026/02/20/do-zero-a-pos-producao-em-1-semana-como-usar-ia-em-projetos-de-verdade-bastidores-do-the-m-akita-chronicles/).

> "Tudo que fizemos tem nome no XP. Não porque planejei — porque são as práticas que naturalmente emergem quando você programa com feedback rápido." — Akita

---

## Mapa de práticas

| Prática XP | Componente da Skill | Evidência empírica (artigo) |
|---|---|---|
| **Pair Programming** | Modo 01 (humano+IA) | "O par é o agente. Eu navego, ele pilota." |
| **Small Releases** | `plan_guard` + CI | 274 commits, cada um passa no CI, production-ready |
| **TDD** | `test_guard` | 1.323 testes, ratio > 1:1, CI pegou 50+ bugs |
| **Refactoring Contínuo** | `code_guard` | 27 refactors pequenos, "Extract StealthBrowser" em minutos |
| **Integração Contínua** | `test_guard` + CI | rubocop + bundler-audit + brakeman + testes, ~22s |
| **Simple Design** | `architecture_guard` | "Simplifica. Quatro estados." → 40 linhas |
| **Planning Game** | `plan_guard` | Backlog incremental com critérios de aceite |
| **Collective Code Ownership** | `spec_guard` | Spec Viva compartilhada |
| **Sustainable Pace** | Gates | Build governado, sem commits quebrando |
| **On-site Customer** | `implementation_guard` | Escalação para humano |
| **Coding Standards** | `code_guard` | Padrões do projeto + lint automático |
| **Metaphor** | `spec_guard` | Decisões documentadas no brain |

---

## Detalhamento com exemplos

### Pair Programming
"Eu não uso o agente como gerador de código. Uso como par de pair programming. A diferença é fundamental. Um gerador recebe spec e devolve output. Um par **conversa**. Eu interrompo quando toma caminho errado. Dou contexto que ele não tem. Questiono decisões. Peço alternativas."

### Small Releases
"Dos 274 commits, cada um passa no CI. Sem exceção. Não existe 'commit quebrando que vai ser consertado no próximo'. A distribuição de commits por dia mostra o ritmo: a 'explosão' do dia 2 não é caos — são small releases empilhadas."

### TDD
"1.323 testes. Mais linhas de teste do que de código. A pergunta que importa: esses testes são úteis? A prova empírica: em 274 commits, CI pegou 50+ bugs reais. TDD com agente é multiplicativo: ele gera testes, os testes viram rede de segurança das mudanças que ele mesmo faz."

### Refactoring Contínuo
"27 commits explícitos de refactoring. Exemplos: Extract StealthBrowser wrapper (código duplicado em 4 clients → 1 serviço), DRY section rendering (5 métodos copy-paste → 1 parametrizado). O refactoring é onde o par brilha: 'extrai um concern' e o agente faz em 2 minutos."

### Integração Contínua
"Rubocop (estilo) → bundler-audit (vulnerabilidades) → Brakeman (segurança) → testes. ~22 segundos. Brakeman pegou SQL injection, path traversal, redirect aberto. Corrigidos antes de ir para produção."

---

## Contra-exemplo (FrankMD)

Sem XP: 11 commits/dia, 5.000 linhas num arquivo, 6 cirurgias de emergência, testes retroativos.

> "Mesmo desenvolvedor. Mesmo agente de IA. Duas abordagens diferentes. Resultado: o projeto disciplinado entregou mais, em menos tempo, com menos dor."
