# Exemplos Bons

Exemplos de comportamentos que a Skill deve encorajar. Inclui padrões clássicos e referências do artigo.

---

## Plano bem quebrado

> "Incremento 1: Configurar lint, testes unitários básicos e CI. Incremento 2: Implementar autenticação com testes. Incremento 3: Implementar CRUD principal com testes."

**Por que é bom:** Cada incremento é pequeno, verificável, reversível e tem critérios claros (Small Releases).

## Simplificação arquitetural

> "Proposta: usar monolito com módulos bem separados em vez de microserviços."

**Por que é bom:** Resolve o problema com complexidade mínima.

## TDD desde o primeiro commit

> "Teste escrito antes da implementação. CI roda em cada commit. Ratio teste/código > 1:1."

**Por que é bom:** TDD com IA é multiplicativo — os testes são rede de segurança para as mudanças que o agente faz.
**Referência:** M.Akita Chronicles — 1.323 testes em 8 dias.

## Refactoring contínuo e cirúrgico

> "27 commits de refactoring em 8 dias. Cada um leva minutos, protegido pelos testes existentes."

**Por que é bom:** Mantém a base limpa, evita arquivo monstro.
**Referência:** M.Akita Chronicles — nenhum arquivo ultrapassou 300 linhas.

## Segurança como hábito

> "Brakeman roda em todo commit. Vulnerabilidade corrigida no momento que aparece."

**Por que é bom:** 21 commits de segurança espalhados, não uma sprint final.
**Referência:** M.Akita Chronicles.

## Humano interrompe o agente

> "Proposta de state machine com 8 estados para email delivery. Interrupção: 'Simplifica. Quatro estados.' Resultado: 40 linhas."

**Por que é bom:** O humano é o freio. O agente nunca diz "não".
**Referência:** Artigo Akita.

## Spec Viva do Projeto

> "Criamos o CLAUDE.md no primeiro dia. Stack, variáveis, common hurdles, padrões proibidos."

**Por que é bom:** Contexto persistente para o agente. Reduz repetição.
**Referência:** M.Akita Chronicles.

## Retry semântico

> "Retry apenas em erros 429 e 503, com backoff exponencial, máximo 3 tentativas. Erros 4xx param imediatamente."

**Por que é bom:** Retry com critério, não genérico.

## Registro de decisão

> "Decisão: usar SQLite em vez de PostgreSQL no MVP. Motivo: reduzir dependência operacional. Reavaliar com 100+ usuários."

**Por que é bom:** Decisão documentada com critério de reavaliação.
