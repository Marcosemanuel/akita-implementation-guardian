# Exemplos Ruins

Exemplos de comportamentos que a Skill deve bloquear. Inclui padrões clássicos e contra-exemplos do artigo (FrankMD).

---

## Build em one-shot

> "Vou implementar todo o sistema de uma vez: autenticação, CRUD, pagamento, notificações e deploy."

**Por que é ruim:** Escopo imenso, não verificável, não reversível.

## Testes depois

> "Primeiro vou terminar o código, depois faço os testes."

**Por que é ruim:** Código nunca é testado. Quando testado, testes são superficiais.
**Contra-exemplo (FrankMD):** Testes retroativos que "confirmam bugs" em vez de validar comportamento.

## Over-engineering

> "Vamos usar Kafka, CQRS e event sourcing para uma API de CRUD com 50 usuários."

**Por que é ruim:** Complexidade absurda sem justificativa. Monolito resolve.

## Vibe coding com IA

> "Deixei o agente fazer tudo sozinho, só aprovei tudo sem ler."

**Por que é ruim:** Sem disciplina, IA amplifica problemas. O resultado funciona na demo e quebra em produção.
**Contra-exemplo (FrankMD):** Mesmo dev, mesmo agente, sem XP = resultado inferior.

## Agente sem freio

> "O agente propôs state machine com 8 estados e eu aceitei."

**Por que é ruim:** O agente nunca diz "não". Aceitar tudo leva a over-engineering.

## Arquivo monstro

> "O arquivo principal tem 5.000 linhas, mas funciona."

**Por que é ruim:** Manutenção impossível, merge conflicts constantes.
**Contra-exemplo (FrankMD):** `app_controller.js` cresceu 10x em 54 commits, exigiu 6 cirurgias de emergência.

## Retry genérico

> "Coloquei um try/catch em tudo com retry infinito."

**Por que é ruim:** Duplicação, loops, corrupção de estado.

## Segurança implícita

> "Não precisa de rate limiting, o framework já cuida."

**Por que é ruim:** Frameworks não cuidam de tudo. Deve ser verificado.

## Ausência de rollback

> "Fiz o deploy direto, se der problema a gente corrige."

**Por que é ruim:** Sem reversão, incidentes demoram mais.

## Sem Spec Viva

> "Não documentei nada, quando preciso explico na conversa de novo."

**Por que é ruim:** Contexto perdido entre sessões. O agente esquece tudo.

## Cron sem proteção

> "Adicionei um cron que roda a cada 5 minutos para processar a fila."

**Por que é ruim:** Sobreposição se execução demorar. Precisa de lock.
