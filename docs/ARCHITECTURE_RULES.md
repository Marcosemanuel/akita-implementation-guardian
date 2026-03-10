# Regras de Arquitetura

## Regra central

> "A versão mais simples que resolve o problema é a versão correta." — Akita

O agente tende a over-engineer. Se você não interrompe, ele entrega CQRS para um CRUD e state machine de 8 estados para algo que resolve com 4 flags.

---

## Regras obrigatórias

### 1. Monolito primeiro
Não decompor em serviços até que a dor de manter tudo junto seja comprovada.

### 2. Sem abstrações prematuras
Generalizar apenas quando houver pelo menos 3 casos de uso concretos que justifiquem.

### 3. Sem filas sem dor
Filas, event buses e mecanismos de mensageria só devem ser introduzidos quando processamento síncrono comprovadamente não atende.

### 4. Sem state machines desnecessárias
Se o problema pode ser resolvido com flags ou enums simples, não introduzir state machine formal.

### 5. Sem orquestração excessiva
Padrões como saga, choreography ou CQRS só se justificam em cenários distribuídos reais.

### 6. Sem camadas redundantes
Cada camada deve ter responsabilidade clara e distinta. Camadas que apenas repassam chamadas devem ser eliminadas.

### 7. Dependências justificadas
Toda dependência externa deve ser justificada. Bibliotecas que resolvem problemas triviais devem ser questionadas.

### 8. Consistência sobre perfeição
Manter padrão consistente no projeto é mais importante do que adotar o padrão "ideal" de mercado.
