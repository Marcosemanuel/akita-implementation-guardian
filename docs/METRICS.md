# Métricas de Ciclo de Construção

## Por que medir

O artigo do Akita prova empiricamente: o mesmo dev + mesmo agente produz resultados **radicalmente diferentes** dependendo do processo. Métricas tornam isso visível.

---

## Métricas recomendadas

### Velocidade de entrega

| Métrica | O que mede | Referência (artigo) |
|---|---|---|
| Commits/dia | Throughput do par | 34 commits/dia (com XP) vs 11 (sem) |
| Tempo de CI | Feedback loop | ~22 segundos |
| % features vs hardening | Equilíbrio de esforço | 37% features, 63% hardening |

### Qualidade

| Métrica | O que mede | Referência (artigo) |
|---|---|---|
| Total de testes | Tamanho da rede de segurança | 1.323 testes |
| Ratio teste/código | Cobertura proporcional | > 1:1 (mais teste que código) |
| Cobertura em lógica de negócio | Proteção real | > 95% |
| Bugs pegos pelo CI | ROI dos testes | 50+ bugs pegos antes de produção |

### Saúde operacional

| Métrica | O que mede | Referência (artigo) |
|---|---|---|
| Paradas forçadas | Dívida técnica acumulada | Zero (com XP) vs 6 (sem) |
| Refactors grandes | Cirurgias de emergência | Zero grandes (com XP) vs 6 (sem) |
| Commits de segurança | Hábito vs sprint | 21 espalhados em 8 dias |

---

## Como usar

1. **Não otimize para a métrica.** Métricas são termômetro, não objetivo.
2. **Compare consigo mesmo.** Os números de referência são do artigo, não são meta universal.
3. **Use para detectar problemas.** Commits/dia caindo? Ratio teste/código baixo? CI lento? Investigue.
4. **Revise periodicamente.** Ao final de cada ciclo, o `spec_guard` deve atualizar métricas no brain.

---

## Anti-padrão

> Não persiga 100% de cobertura. O coverage real em lógica de negócio importa. Os 17-18% não cobertos no artigo são integração com APIs externas que são mockadas. Cobertura perfeita é vanity metric.
