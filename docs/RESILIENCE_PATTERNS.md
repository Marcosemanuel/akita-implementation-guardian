# Padrões de Resiliência

## Regra central

> Todo sistema com jobs, automações ou processamento assíncrono deve ser auditado para robustez operacional.

O agente implementa integrações rapidamente, mas raramente adiciona proteções operacionais proativamente. O `resilience_guard` compensa essa lacuna.

---

## Padrões obrigatórios

### 1. Idempotência
Executar a mesma operação múltiplas vezes deve produzir o mesmo resultado. Implementar via chaves de idempotência ou verificação de estado antes de ação.

### 2. Retry semântico
Retries devem ser feitos com critério: backoff exponencial, limite de tentativas, distinção entre erros retryable e non-retryable. **Retry genérico é anti-padrão.**

### 3. Locks e mutex
Operações concorrentes que modificam estado compartilhado devem usar locks. Locks devem ter TTL para evitar deadlock.

### 4. Deduplicação
Mensagens e eventos devem ser deduplicados. O sistema deve tolerar receber a mesma mensagem mais de uma vez sem efeito colateral.

### 5. Timeouts
Toda chamada externa deve ter timeout configurado. Timeout padrão deve ser definido no nível do projeto.

### 6. Circuit breaker
Integrações instáveis devem ter mecanismo de circuit breaker para evitar cascata de falhas.

### 7. Dead letter
Mensagens que falharam processamento devem ser encaminhadas para dead letter queue para inspeção e reprocessamento manual.

### 8. Observabilidade
- Logs estruturados em pontos críticos.
- Métricas de execução em jobs recorrentes.
- Alertas em falhas silenciosas.
- Capacidade de rastrear uma requisição do início ao fim.

### 9. Recuperação segura
O sistema deve poder retomar de falha sem corromper estado. Transações devem ser usadas quando relevante.

---

## Anti-padrões

| Anti-padrão | Risco |
|---|---|
| Retry genérico (catch + retry ilimitado) | Duplicação, loop infinito |
| Cron sem lock | Execução duplicada |
| Job sem idempotência | Processamento duplicado |
| Integração sem timeout | Thread bloqueada indefinidamente |
| Sem dead letter | Perda silenciosa de mensagens |
| Sem logs em jobs | Falha silenciosa sem diagnóstico |
