# Princípios Obrigatórios

Todos os componentes da Skill `akita-implementation-guardian` devem obedecer aos princípios abaixo, derivados de **Extreme Programming** e validados empiricamente no artigo [Do Zero à Pós-Produção em 1 Semana](https://akitaonrails.com/2026/02/20/do-zero-a-pos-producao-em-1-semana-como-usar-ia-em-projetos-de-verdade-bastidores-do-the-m-akita-chronicles/).

> "274 commits em 8 dias não acontecem porque o agente é mágico. Acontecem porque XP funciona tão bem com um par de IA quanto com um par humano."

---

## 1. O humano decide o quê. O agente decide o como.

O par de pair programming tem papéis claros. O humano navega: define direção, questiona decisões, corrige rota. O agente pilota: escreve código, roda testes, propõe soluções. **Inverter piora dramaticamente o resultado.**

**Na prática:** "Eu trago o quê e o porquê. O agente traz o como — e o como é frequentemente melhor do que eu faria sozinho. Mas o como sem o quê produz código correto que resolve o problema errado."

**Anti-padrão:** Humano ditando código exato, agente apenas digitando.

---

## 2. Small Releases (incrementos pequenos)

Cada commit é production-ready. Sem exceção. Não existe "commit quebrando que vai ser consertado no próximo".

**Na prática:** 274 commits, cada um passa no CI. A "explosão" de commits por dia não é caos — são small releases empilhadas. Cada uma adiciona uma feature, roda CI, está pronta pra deploy.

**Regra:** Se um incremento não pode ser revertido de forma simples, é grande demais.

**Anti-padrão:** Build em one-shot, entrega única sem etapas intermediárias.

---

## 3. TDD — Testes são mais importantes com IA, não menos

O agente modifica código com confiança porque tem testes como rede de segurança. Sem testes, cada mudança é uma aposta. O agente propõe uma mudança, o teste pega a regressão, a mudança é corrigida antes de commitar.

**Na prática:** 1.323 testes. Mais linhas de teste do que de código. Em 274 commits, CI pegou 50+ bugs reais antes de ir para produção.

**Ciclo virtuoso:** TDD com IA é multiplicativo. O agente gera testes abrangentes. Os testes viram rede de segurança das mudanças que o próprio agente faz depois.

**Anti-padrão:** "Testes depois", cobertura superficial, testes retroativos.

---

## 4. Integração Contínua em cada commit

CI roda em cada commit: lint + audit de dependências + segurança estática + testes completos. Falhas de CI devem ser tratadas antes de qualquer avanço.

**Na prática:** ~22 segundos por execução. Multiplicado por 274 commits: 100+ minutos de validação automatizada sem esforço manual. Brakeman pegou SQL injection, path traversal e redirect aberto — corrigidos no mesmo commit.

**Anti-padrão:** CI opcional, pipeline que falha silenciosamente, pipeline permanentemente vermelho.

---

## 5. Refactoring contínuo é obrigatório

O agente empilha código. Se você não poda regularmente — extrair concerns, DRY duplicações, simplificar interfaces — a base degenera.

**Na prática:** 27 commits de refactoring ao longo de 8 dias. Pequenos e cirúrgicos: "Extract StealthBrowser wrapper", "DRY section rendering", "Replace DuckDuckGo with Brave Search API". Cada um leva minutos, protegido pelos testes que já existem.

**Contra-exemplo (FrankMD):** Sem refactoring contínuo, um arquivo cresceu 10x em 54 commits, atingiu 5.000 linhas, exigiu 6 cirurgias de emergência. Cada parada: centenas de linhas movidas, horas de trabalho, alto risco de regressão.

**Anti-padrão:** O agente sozinho não refatora — empilha código novo em cima do existente.

---

## 6. Simplicidade como regra

A versão mais simples que resolve o problema é a correta até que evidência contrária exija expansão.

**Na prática:** Proposta de state machine com 8 estados para email delivery. Interrupção: "Simplifica. Quatro estados." Resultado: 40 linhas que resolvem o problema inteiro.

**O agente tende a over-engineer.** Precisa de freio humano constante.

**Anti-padrão:** Microserviços para CRUD, CQRS sem volume, filas sem necessidade, abstrações genéricas sem uso comprovado.

---

## 7. Segurança não é fase — é hábito

Segurança não se concentra numa "sprint de segurança" no final. São commits espalhados ao longo do ciclo inteiro.

**Na prática:** 21 commits de segurança em 8 dias. Brakeman roda em todo commit. Vulnerabilidades corrigidas no momento que aparecem: SSRF, CSP, rate limiting, encryption, path traversal.

**O agente implementa o que você pede, mas raramente sugere proteções que você não pediu.** Segurança proativa é responsabilidade do humano + guards.

**Anti-padrão:** Segurança implícita, "vai funcionar porque é interno", dependências não auditadas.

---

## 8. Spec Viva — Documentação é investimento com retorno imediato

Cada hora documentando economiza horas de contexto perdido em sessões futuras. Com agentes de IA, o retorno é exponencial porque eles realmente leem.

**Na prática:** O CLAUDE.md do projeto tem 702 linhas: visão da arquitetura, stack, variáveis de ambiente, common hurdles com soluções, design patterns, checklist pós-implementação. Na próxima sessão, o agente já sabe tudo.

**O equivalente do onboarding doc de uma equipe** — mas o "novo membro" é o agente, e lê o doc inteiro em 2 segundos.

**Anti-padrão:** Documentação inexistente, desatualizada, que não reflete a realidade.

---

## O agente nunca diz "não"

Isso é bug, não feature. Se você pede algo over-engineered, ele implementa com entusiasmo. Se pede algo inseguro, implementa sem reclamar. **Você é o freio. Você é o code review. Você é o adulto na sala.**

---

## Regra síntese

> "O futuro do desenvolvimento não é IA substituindo programadores. É programadores que sabem usar IA como ferramenta — com a mesma disciplina que sempre usaram — produzindo em uma semana o que equipes inteiras levam trimestres. Não porque a IA é genial. Porque o processo é genial. O XP tinha razão desde o começo. Só faltava um par que nunca cansa e digita a 1000 palavras por minuto." — Akita
