<p align="center">
  <h1 align="center">🛡️ Akita Implementation Guardian</h1>
  <p align="center">
    <strong>Skill de pair programming disciplinado para desenvolvimento com IA</strong>
  </p>
  <p align="center">
    Aplica Extreme Programming (XP) ao ciclo humano + agente, garantindo que velocidade nunca destrua qualidade.
  </p>
  <p align="center">
    <a href="#instalação"><img src="https://img.shields.io/badge/install-CLI-blue?style=for-the-badge" alt="Install"></a>
    <a href="#licença"><img src="https://img.shields.io/badge/license-MIT-green?style=for-the-badge" alt="License"></a>
    <a href="https://akitaonrails.com/2026/02/20/do-zero-a-pos-producao-em-1-semana-como-usar-ia-em-projetos-de-verdade-bastidores-do-the-m-akita-chronicles/"><img src="https://img.shields.io/badge/based%20on-Akita%20Article-red?style=for-the-badge" alt="Article"></a>
  </p>
</p>

---

## 🎯 O que é?

Uma **Skill** (extensão para agentes de IA) que aplica disciplina de **Extreme Programming** ao desenvolvimento assistido por IA. Em vez de "vibe coding", o agente segue um processo governado de:

- **TDD** — Testes junto com código, nunca depois
- **Small Releases** — Incrementos pequenos, verificáveis e reversíveis
- **Refactoring contínuo** — Limpeza cirúrgica protegida por testes
- **Pair Programming** — Humano navega, agente pilota, guards garantem disciplina
- **Segurança como hábito** — Em cada commit, não como fase final

> *"274 commits. 8 dias. Cada commit é production-ready."* — Akita

---

## 📊 De onde vem?

Baseada nos resultados empíricos do artigo **"Do Zero à Pós-Produção em 1 Semana"** de Fabio Akita:

| Métrica | M.Akita Chronicles | FrankMD (sem disciplina) |
| --- | --- | --- |
| Commits | 274 | 54 |
| Testes | 1.323 | ~50 (retroativos) |
| Ratio teste/código | > 1:1 | < 0.1:1 |
| Refactorings | 27 | 0 |
| Commits de segurança | 21 | 0 |
| CI | ~22s por run | Ausente |

**Mesmo desenvolvedor. Mesmo agente. Duas abordagens. Resultado: o projeto disciplinado entregou mais, em menos tempo, com menos dor.**

---

## 💡 O que ela faz?

A Skill atua como um **sistema de governança embutido** no agente de IA. Ela intercepta decisões de código, arquitetura e processo em tempo real, aplicando guards especializados que garantem qualidade sem depender da memória do desenvolvedor.

### 1. Transforma ideias em planos incrementais verificáveis

> **Cenário:** Você diz "preciso de um sistema de e-commerce com auth, catálogo e carrinho"

A Skill **não deixa o agente sair codando**. Em vez disso, o `plan_guard` quebra a ideia em incrementos pequenos e verificáveis (Small Releases), cada um com:
- Escopo delimitado
- Critérios de aceite
- Testes obrigatórios
- Plano de rollback

**Resultado prático:** 6 incrementos ordenados, cada um entregável em horas, não semanas.

### 2. Garante TDD em cada incremento — nunca "testes depois"

> **Cenário:** O agente escreve uma função de validação de email

O `test_guard` **bloqueia o avanço** até que os testes existam e passem. A regra é simples: *escreveu código, escreveu teste junto*. Não existe "depois faço os testes".

**Métricas de referência:** 1.323 testes em 8 dias, ratio teste/código > 1:1, CI em ~22 segundos.

### 3. Freia over-engineering e complexidade prematura

> **Cenário:** O agente propõe uma state machine com 8 estados para delivery de email

O `architecture_guard` identifica complexidade desproporcional e sugere simplificação. No artigo, essa intervenção reduziu **8 estados para 4** e **centenas de linhas para 40**.

**Regra:** Se a solução exige explicar por que é simples, ela não é simples.

### 4. Refactoring contínuo protegido por testes

> **Cenário:** Um arquivo cresceu para 400 linhas e acumula 3 responsabilidades

O `code_guard` detecta e sugere **refactoring cirúrgico** — extrair funções, separar módulos, renomear variáveis. Cada refactoring é protegido pelos testes existentes e leva minutos, não dias.

**Referência:** 27 commits de refactoring em 8 dias. Nenhum arquivo ultrapassou 300 linhas.

### 5. Segurança como hábito, não como fase final

> **Cenário:** O agente adiciona um endpoint de API sem rate limiting

O `security_guard` verifica automaticamente: secrets expostos, CVEs em dependências, headers de segurança, rate limiting, validação de input. A segurança é verificada **em cada commit**, não como uma sprint de emergência antes do deploy.

**Referência:** 21 commits de segurança espalhados nos 8 dias.

### 6. Recuperação de incidentes com causa raiz

> **Cenário:** O job de notificação duplicou emails para 500 usuários

Em vez de "apaga fogo e segue", a Skill ativa um workflow de investigação: timeline, causa raiz, lacunas de teste, fragilidade operacional. O resultado é uma **correção incremental com testes de prevenção**, não um hotfix desesperado.

### 7. Auditoria técnica de código legado

> **Cenário:** Você herdou um repositório Python sem testes e sem CI

A Skill roda todos os 7 guards sobre o código existente e produz: parecer técnico consolidado, gaps priorizados (BLOCKER → HIGH → MEDIUM), plano de estabilização incremental e uma **Spec Viva** para contextualizar o agente sobre o projeto.

---

### 🔑 Diferencial técnico

| Sem a Skill | Com a Skill |
| --- | --- |
| Agente coda em modo livre | Agente segue gates obrigatórios |
| Testes são opcionais | Testes bloqueiam avanço |
| Refactoring "depois" | Refactoring contínuo e protegido |
| Segurança como fase final | Segurança em cada commit |
| Incidente → hotfix | Incidente → causa raiz + prevenção |
| Código cresce sem controle | Nenhum arquivo ultrapassa limites |
| Contexto perdido entre sessões | Spec Viva persiste decisões |

---

## 🚀 Instalação

### Via Git Clone (recomendado)

**🐧 Linux (Bash/Zsh):**

```bash
git clone https://github.com/Marcosemanuel/akita-implementation-guardian.git .agent/skills/akita-implementation-guardian
```

**🍎 macOS (Terminal / Zsh):**

```zsh
git clone https://github.com/Marcosemanuel/akita-implementation-guardian.git .agent/skills/akita-implementation-guardian
```

**🪟 Windows (PowerShell):**

```powershell
git clone https://github.com/Marcosemanuel/akita-implementation-guardian.git .agent\skills\akita-implementation-guardian
```

### Via Git Submodule

```bash
# Linux / macOS / Windows (Git Bash)
git submodule add https://github.com/Marcosemanuel/akita-implementation-guardian.git .agent/skills/akita-implementation-guardian
```

### Download Manual (sem git)

**🐧 Linux / 🍎 macOS:**

```bash
curl -L https://github.com/Marcosemanuel/akita-implementation-guardian/archive/main.zip -o aig.zip
unzip aig.zip -d .agent/skills/
mv .agent/skills/akita-implementation-guardian-main .agent/skills/akita-implementation-guardian
rm aig.zip
```

**🪟 Windows (PowerShell):**

```powershell
Invoke-WebRequest -Uri https://github.com/Marcosemanuel/akita-implementation-guardian/archive/main.zip -OutFile aig.zip
Expand-Archive aig.zip -DestinationPath .agent\skills\
Rename-Item .agent\skills\akita-implementation-guardian-main .agent\skills\akita-implementation-guardian
Remove-Item aig.zip
```

### Verificação

Após a instalação, verifique que o arquivo `SKILL.md` está no caminho correto:

```bash
# 🐧 Linux / 🍎 macOS
cat .agent/skills/akita-implementation-guardian/SKILL.md
```

```powershell
# 🪟 Windows
type .agent\skills\akita-implementation-guardian\SKILL.md
```

---

## 📁 Estrutura do Projeto

```
akita-implementation-guardian/
├── SKILL.md                    # Ponto de entrada — instruções para o agente
├── README.md                   # Este arquivo
├── LICENSE                     # MIT License
│
├── agents/                     # 🤖 Agentes especializados (guards)
│   ├── implementation_guard.md # Orquestrador principal
│   ├── plan_guard.md           # Quebra em Small Releases
│   ├── architecture_guard.md   # Freio contra over-engineering
│   ├── test_guard.md           # Garante TDD e CI
│   ├── code_guard.md           # Qualidade e refactoring
│   ├── security_guard.md       # Segurança como hábito
│   └── resilience_guard.md     # Robustez operacional
│
├── workflows/                  # 🔄 Fluxos de trabalho
│   ├── build-from-plan.md      # Construir a partir de plano
│   ├── implement-increment.md  # Implementar incremento
│   ├── validate-increment.md   # Validar incremento
│   ├── stabilize-foundation.md # Estabilizar base
│   ├── pre-merge-hardening.md  # Endurecer antes de merge
│   ├── post-incident-recovery.md # Recuperar de incidente
│   └── review-existing-codebase.md # Auditar código legado
│
├── docs/                       # 📚 Documentação de referência
│   ├── WORKFLOW_SPEC.md        # Especificação de workflows
│   ├── BUILD_GATES.md          # Gates de qualidade
│   ├── ARCHITECTURE_RULES.md   # Regras de arquitetura
│   ├── REVIEW_CRITERIA.md      # Critérios de revisão
│   ├── TESTING_STANDARD.md     # Padrão de testes
│   ├── SECURITY_BASELINE.md    # Baseline de segurança
│   ├── FAILURE_PATTERNS.md     # Padrões de falha (+ AI-specific)
│   └── RESILIENCE_PATTERNS.md  # Padrões de resiliência
│
├── templates/                  # 📝 Templates para artefatos
├── data/                       # 📊 Dados estruturados (JSON)
├── scripts/                    # ⚙️ Scripts utilitários (Python + Bash + PowerShell)
├── references/                 # 📖 Exemplos bons e ruins
└── assets/                     # 🎨 Diagramas e snippets
```

---

## 🔄 Workflows Disponíveis

| Workflow | Quando usar | Resultado |
| --- | --- | --- |
| `build-from-plan` | Início de projeto novo | Plano incremental + Spec Viva |
| `stabilize-foundation` | Base frágil sem testes/CI | Fundação estabilizada |
| `implement-increment` | Incremento autorizado | Código + testes implementados |
| `validate-increment` | Código pronto para revisão | Parecer multi-dimensional |
| `pre-merge-hardening` | Antes de merge/release | Parecer de merge |
| `post-incident-recovery` | Bug/incidente em produção | Causa raiz + correção |
| `review-existing-codebase` | Código legado para auditar | Parecer técnico + Spec Viva |

---

## 🤖 Agentes (Guards)

| Guard | Função | Foco |
| --- | --- | --- |
| `implementation_guard` | Orquestrador | Coordena fluxo, escalona para humano |
| `plan_guard` | Planejamento | Quebra em Small Releases |
| `architecture_guard` | Arquitetura | Freio contra over-engineering |
| `test_guard` | Testes | TDD, CI, cobertura |
| `code_guard` | Código | Qualidade, refactoring |
| `security_guard` | Segurança | Segurança como hábito |
| `resilience_guard` | Resiliência | Robustez operacional |

---

## 🧠 Princípios Fundamentais

1. **Sem gate aprovado, sem avanço** — Cada fase tem critérios obrigatórios
2. **O humano é o freio** — O agente nunca diz "não", então o humano deve questionar
3. **TDD é multiplicativo com IA** — Testes viram rede de segurança das mudanças do agente
4. **Refactoring é investimento** — Limpeza cirúrgica em minutos, protegida por testes
5. **Segurança não é fase** — É hábito integrado em cada commit
6. **Spec Viva** — Documento vivo com contexto, decisões e hurdles para o agente

---

## 🤝 Contribuindo

Contribuições são bem-vindas! Consulte o [CONTRIBUTING.md](CONTRIBUTING.md) para guidelines.

---

## 🙏 Agradecimentos

Esta Skill foi construída sobre os princípios e lições documentados por **[Fabio Akita](https://github.com/akitaonrails)** em seu artigo:

> **["Do Zero à Pós-Produção em 1 Semana — Como usar IA em projetos de verdade"](https://akitaonrails.com/2026/02/20/do-zero-a-pos-producao-em-1-semana-como-usar-ia-em-projetos-de-verdade-bastidores-do-the-m-akita-chronicles/)**

O insight central: **disciplina de Extreme Programming aplicada ao pair programming com IA não reduz velocidade — ela multiplica resultados.** O artigo documenta a construção do projeto *The M.Akita Chronicles* com dados empíricos que fundamentam cada regra desta Skill.

Obrigado, Akita, por compartilhar o processo com transparência e rigor. 🙌

---

## 📄 Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

---

<p align="center">
  <sub>Feito com disciplina, não com pressa. 🛡️</sub>
</p>
