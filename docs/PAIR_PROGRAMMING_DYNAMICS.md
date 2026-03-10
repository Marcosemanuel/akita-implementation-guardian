# Dinâmica de Pair Programming com IA

## Modelo

O modelo operacional da Skill é **pair programming**, não auditoria. A diferença é fundamental:

| Modo | Descrição | Resultado |
|---|---|---|
| **Gerador de código** | Recebe spec, devolve output. Sem conversa. | Protótipo frágil |
| **Par de pair programming** | Conversa. Interrompe. Questiona. Simplifica. | Software de verdade |

---

## Papéis no par

### Humano — Navega

- Define **direção** (o quê e o porquê)
- **Questiona** decisões do agente
- **Interrompe** quando percebe over-engineering
- Traz **contexto de domínio** que o agente não tem
- **Prioriza** (o agente executa qualquer coisa com igual entusiasmo)
- É o **freio** e o **code review**

### Agente — Pilota

- Escreve **código** na velocidade de digitação
- Roda **testes** e identifica edge cases
- Propõe **soluções** técnicas
- Executa **refactoring** mecânico rapidamente
- Mantém **consistência** com padrões do projeto
- Faz **pesquisa** contextual em segundos

> Quando inverte (humano ditando código exato, agente apenas digitando), o resultado **sempre** piora.

---

## Padrões de interação eficazes

### 1. Interrupção por over-engineering

O agente propõe solução complexa. O humano reconhece excesso e interrompe.

**Exemplo real:** Email delivery com state machine de 8 estados, retry queues separadas, dead letter handling. Interrupção: "Simplifica. Quatro estados: pending, sending, sent, unknown." Resultado: 40 linhas.

**Quando fazer:** Sempre que a proposta parecer desproporcional ao problema.

### 2. Contexto que o agente não tem

O humano traz conhecimento de domínio que não existe em treinamento.

**Exemplo real:** Yahoo Finance faz TLS fingerprinting. Agente tentou HTTParty (bloqueado). Humano explicou. Resultado: headless Chromium com stealth patches.

**Quando fazer:** Sempre que o agente usar abordagem que você sabe que não vai funcionar no contexto específico.

### 3. Decisão de arquitetura conjunta

Ambos contribuem para a decisão. Humano com visão de sistema, agente com conhecimento técnico.

**Exemplo real:** Pipeline de podcast. Humano sugeriu: "Rails orquestra, Python serve TTS via HTTP." Cada linguagem no que faz melhor.

**Quando fazer:** Em decisões estruturais que afetam o projeto a longo prazo.

### 4. Prompt refinement iterativo

Ajustes iterativos em prompts de IA, testados com dados reais.

**Exemplo real:** Personalidades de newsletter soavam iguais. Ajustes: "Akita nunca diz 'talvez'. Marvin usa 'bom…' e 'enfim'." Cada ajuste era um commit testado.

**Quando fazer:** Sempre que output de LLM não estiver no nível desejado.

---

## Anti-padrões de pair programming com IA

| Anti-padrão | Problema | Correção |
|---|---|---|
| Humano dita código | Agente vira apenas digitador. Resultado pior. | Descreva o objetivo, deixe o agente propor. |
| Agente sem freio | Over-engineering aceito sem questionamento. | Questione complexidade. "Precisa disso?" |
| Spec sem conversa | Entregar spec longa, esperar sistema pronto. | Itere. Converse. Interrompa. |
| Contexto não dado | Agente usa abordagem genérica que não funciona. | Explique restrições de domínio. |
| Confiança cega | Aceitar tudo que o agente produz. | Revisão permanente. Você é o code review. |

---

## O que o agente faz bem e o que faz mal

### Faz bem
- **Boilerplate e scaffolding** — jobs, services, testes, migrations
- **Testes** — identifica edge cases, gera testes abrangentes
- **Refactoring mecânico** — renomear, extrair métodos, mover código
- **Pesquisa contextual** — "como funciona RFC 8058?" em segundos
- **Consistência** — segue padrões do projeto sem esquecer

### Faz mal
- **Decisões de arquitetura** — tende a over-engineer, precisa de freio
- **Conhecimento de domínio** — não sabe coisas específicas do seu contexto
- **Segurança proativa** — implementa o que pede, raramente sugere proteções
- **Priorização** — executa qualquer coisa com igual entusiasmo, não diz "faça X antes"
- **Opiniões** — suaviza tudo sem instruções explícitas

---

## Regra fundamental

> O multiplicador real do agente não é "10x mais código". É **eliminar o tempo morto**. Sem agente, 70% do tempo é digitando boilerplate, lendo docs, debugando typos. Com agente, esse tempo vira zero e o humano foca 100% em decisões de arquitetura, domínio e qualidade.
