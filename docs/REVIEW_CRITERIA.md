# Critérios de Revisão

Critérios explícitos de revisão por dimensão no pair programming governado. Cada guard verifica seu domínio; o humano valida o conjunto.

---

## Revisão de Plano (plan_guard)

- Escopo está quebrado em incrementos (Small Releases)?
- Cada incremento tem critérios de aceite?
- Existe definição de pronto?
- Entregáveis são verificáveis?
- Riscos estão identificados?
- Rollback está definido?
- Cada incremento cabe numa sessão de pair programming?

## Revisão de Arquitetura (architecture_guard)

- A solução é a mais simples possível?
- Há abstrações sem uso comprovado?
- Há serviços/componentes desnecessários?
- Acoplamento é adequado?
- Complexidade é justificada por evidência?

## Revisão de Testes (test_guard)

- TDD está sendo praticado (testes junto com código)?
- Lint está configurado?
- Testes unitários existem para lógica de negócio?
- Fluxos críticos têm cobertura?
- CI está saudável e roda em cada commit?
- Testes são determinísticos?

## Revisão de Segurança (security_guard)

- Entradas são validadas?
- Autenticação e autorização estão presentes?
- Segredos estão protegidos?
- Dependências estão auditadas?
- Rate limiting existe em endpoints públicos?
- Security scan roda em cada commit?

## Revisão de Resiliência (resilience_guard)

- Jobs são idempotentes?
- Retries são semânticos?
- Locks existem onde necessário?
- Observabilidade está presente?
- Timeouts estão configurados?

## Revisão de Código (code_guard)

- Código é legível?
- Repetição é adequadamente tratada?
- Exceções são controladas?
- Padrões da Spec Viva são seguidos?
- Risco de regressão é baixo?
- Há oportunidade de refactoring?

## Revisão de Spec Viva (spec_guard)

- Spec Viva existe e está atualizada?
- Decisões do ciclo estão registradas?
- Common hurdles estão documentados?
- Padrões proibidos estão registrados?

