# Mapa de Capacidades da IA

## Fonte

Observações empíricas do artigo [Do Zero à Pós-Produção em 1 Semana](https://akitaonrails.com/2026/02/20/do-zero-a-pos-producao-em-1-semana-como-usar-ia-em-projetos-de-verdade-bastidores-do-the-m-akita-chronicles/) — 274 commits com agente de IA.

---

## O que a IA faz BEM ✅

### Boilerplate e scaffolding
Jobs, services, testes, migrations — o agente produz na velocidade de digitação.
> **Implicação para a Skill:** deixar o agente pilotar na criação de boilerplate.

### Testes
Surpreendentemente bom em identificar edge cases e gerar testes abrangentes. Sabe os padrões, sabe os edge cases comuns.
> **Implicação para a Skill:** pedir testes proativamente, não esperar o humano lembrar.

### Refactoring mecânico
Renomear, extrair métodos, mover código entre arquivos — rápido e preciso. O refactoring é onde o par brilha: "esse código tá duplicado, extrai um concern" e o agente faz em 2 minutos o que levaria 20.
> **Implicação para a Skill:** o `code_guard` pode sugerir refactorings que o agente executa rapidamente.

### Pesquisa contextual
"Como funciona RFC 8058?" produz resposta acionável em segundos.
> **Implicação para a Skill:** usar o agente para pesquisa durante planejamento e debugging.

### Consistência
Segue padrões estabelecidos no projeto (concerns, naming conventions, test structure) sem esquecer.
> **Implicação para a Skill:** documentar padrões na Spec Viva — o agente segue sem reclamar.

---

## O que a IA faz MAL ❌

### Decisões de arquitetura
Tende a **over-engineer**. Precisa de freio humano constante. Propôs state machine de 8 estados quando 4 bastavam.
> **Implicação para a Skill:** o `architecture_guard` deve questionar TODA proposta complexa.

### Conhecimento de domínio específico
Não sabe que o Yahoo faz TLS fingerprinting, ou que determinada API muda de formato. Conhecimento específico vem do humano.
> **Implicação para a Skill:** common hurdles devem ser documentados na Spec Viva.

### Segurança proativa
Implementa o que você pede, mas **raramente sugere proteções que você não pediu** (SSRF, rate limiting, encryption at rest).
> **Implicação para a Skill:** o `security_guard` existe porque o agente não pensa em segurança sozinho.

### Priorização
Executa qualquer coisa com igual entusiasmo. **Não diz** "isso é perda de tempo" ou "faça X antes de Y".
> **Implicação para a Skill:** o humano prioriza, o agente executa. Nunca inverta.

### Opiniões
Suaviza tudo. Prompts de personalidade viram genericidade sem instruções explícitas.
> **Implicação para a Skill:** prompts de qualidade exigem refinamento iterativo.

---

## Regra fundamental

> IA não programa sozinha, e não é inútil. É um **multiplicador** do programador. Um programador medíocre com IA produz código medíocre mais rápido. Um programador experiente com IA produz código bom na velocidade que antes só era possível com equipes.

---

## O bug que não é bug

> **O agente nunca diz "não".** Isso é um bug, não uma feature. Se você pede algo over-engineered, ele implementa com entusiasmo. Se pede algo inseguro, implementa sem reclamar. **Você é o freio. Você é o code review. Você é o adulto na sala.**
