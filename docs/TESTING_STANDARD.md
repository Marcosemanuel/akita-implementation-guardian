# Padrão de Testes

## Regra central

> "TDD com IA é multiplicativo: o agente gera testes, os testes viram rede de segurança das mudanças que ele mesmo faz." — Akita

Testes não são etapa posterior. São **infraestrutura de velocidade** e condição para avanço seguro. Com IA, TDD é mais importante, não menos.

## Referência empírica (M.Akita Chronicles)

- **1.323 testes** em 8 dias
- Ratio teste/código: **> 1:1** (mais linhas de teste que de código)
- CI rodando em **~22 segundos**
- TDD orgânico desde o primeiro commit

---

## Baseline mínima por projeto

| Nível | Obrigatório? | Escopo |
|---|---|---|
| Lint | Sim | Todo o código |
| Testes unitários | Sim | Lógica de negócio |
| Testes de integração | Sim (fluxos críticos) | APIs, DB, serviços |
| Testes E2E | Recomendado | Fluxos principais |
| Testes de contrato | Quando há serviços | Interfaces entre serviços |

## Critérios de qualidade de teste

1. **Determinísticos** — Testes devem produzir o mesmo resultado em qualquer execução.
2. **Independentes** — Testes não devem depender de ordem de execução.
3. **Rápidos** — A suite deve rodar em tempo razoável para não desencorajar execução.
4. **Focados** — Cada teste deve validar um comportamento específico.
5. **Legíveis** — O nome do teste deve descrever o que está sendo validado.

## Cobertura

- Cobertura de linhas não é sinônimo de qualidade.
- O foco deve ser em cobrir **caminhos críticos de negócio**.
- Fluxos financeiros, autenticação e dados sensíveis devem ter cobertura obrigatória.

## Pipeline de CI

- Deve rodar em todo push/PR.
- Deve incluir: lint → testes unitários → testes de integração.
- Falhas devem bloquear merge.
- Resultados devem ser visíveis e auditáveis.
