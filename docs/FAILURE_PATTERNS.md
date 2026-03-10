# Padrões de Falha

Catálogo de padrões de falha recorrentes em projetos com IA. Usado como referência doutrinária para detecção proativa.

> "Mesmo desenvolvedor. Mesmo agente. Duas abordagens. Resultado: o projeto disciplinado entregou mais, em menos tempo, com menos dor." — Akita

---

## Falhas Clássicas de Software

### 1. Build em one-shot
**Descrição:** Tentar construir todo o sistema de uma vez.
**Consequência:** Código frágil, não testável, não revisável.
**Detecção:** Incremento sem fronteira clara, sem critérios de aceite.

### 2. "Testes depois"
**Descrição:** Adiar testes para "quando o código estiver pronto".
**Consequência:** Código que nunca é testado, regressões silenciosas.
**Detecção:** Incremento sem testes esperados no contrato.

### 3. CI opcional
**Descrição:** Pipeline inexistente ou ignorado.
**Consequência:** Sem visibilidade sobre saúde do build.
**Detecção:** Ausência de pipeline, pipeline permanentemente vermelho.

### 4. Arquitetura sem critério
**Descrição:** Decisões baseadas em "best practices" sem contexto.
**Consequência:** Over-engineering, complexidade operacional.
**Detecção:** Microserviços para CRUD, CQRS sem volume.

### 5. Abstração antes da dor
**Descrição:** Generalizar antes de ter casos de uso reais.
**Consequência:** Abstrações que ninguém usa.
**Detecção:** Interfaces genéricas com uma única implementação.

### 6. Retry genérico
**Descrição:** Retry cego em toda falha.
**Consequência:** Duplicação de processamento, loops infinitos.
**Detecção:** catch + retry sem filtro, sem backoff.

### 7. Ausência de rollback
**Descrição:** Deploy sem plano de reversão.
**Consequência:** Quando falha, não há como voltar.
**Detecção:** Incremento sem plano de rollback documentado.

### 8. Segurança implícita
**Descrição:** Assumir que "o framework cuida".
**Consequência:** Vulnerabilidades em produção.
**Detecção:** Ausência de checklist de segurança.

---

## Falhas Específicas de IA (do artigo)

### 9. Vibe coding sem disciplina
**Descrição:** Usar IA para gerar código sem TDD, CI, small releases ou refactoring.
**Consequência:** "Funciona em demo, quebra em produção."
**Contra-exemplo:** FrankMD — mesmo dev, mesmo agente, resultado inferior.
**Detecção:** Ausência de testes, commits grandes, sem CI.

### 10. Agente sem freio humano
**Descrição:** Aceitar tudo que o agente produz sem questionar.
**Consequência:** Over-engineering, código que resolve o problema errado.
**Detecção:** Humano não interrompe, não simplifica, não questiona.

> "O agente nunca diz 'não'. Se você pede algo over-engineered, ele implementa com entusiasmo."

### 11. Sem Spec Viva
**Descrição:** Não documentar contexto, decisões e hurdles para o agente.
**Consequência:** Contexto perdido entre sessões, explicações repetidas.
**Detecção:** Ausência de doc tipo CLAUDE.md, conversas longas sem decisão registrada.

### 12. Testes retroativos
**Descrição:** Escrever testes depois do código em vez de TDD.
**Consequência:** Testes que validam a implementação (não o comportamento).
**Contra-exemplo:** FrankMD — testes retroativos geraram testes que "confirmam bugs".
**Detecção:** Commits de código sem commits de teste correspondentes.

### 13. Arquivo monstro
**Descrição:** Deixar o agente empilhar código sem refatorar.
**Consequência:** Arquivos crescem indefinidamente, manutenção impossível.
**Contra-exemplo:** FrankMD — `app_controller.js` atingiu 5.000 linhas.
**Detecção:** Arquivo com mais de 500 linhas sem justificativa.

### 14. Avanço com base instável
**Descrição:** Adicionar features sobre base frágil.
**Consequência:** Cada feature amplifica a fragilidade.
**Detecção:** Features novas com CI vermelha, testes ausentes.

