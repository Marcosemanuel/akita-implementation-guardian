# assets/diagrams/

## Propósito

Armazena **diagramas visuais** do projeto: arquitetura, fluxos, componentes e workflows.

## O que colocar aqui

- Diagramas de arquitetura do sistema.
- Fluxogramas de workflows da Skill.
- Diagramas de sequência de fluxos críticos.
- Mapas de componentes e suas interações.
- Diagramas de deploy/infraestrutura.

## Formatos aceitos

| Formato | Uso |
|---|---|
| `.md` com Mermaid | Preferido — versionável, editável em texto |
| `.svg` | Exportação visual de alta qualidade |
| `.png` | Screenshots ou diagramas gerados externamente |

## Convenção de nomes

```
tipo_descricao.ext
```

**Exemplo:**
```
arch_visao-geral-sistema.md
flow_workflow-build-from-plan.md
seq_fluxo-autenticacao.md
deploy_infraestrutura-producao.md
```

## Regras

1. Preferir **Mermaid em Markdown** para manter versionamento e editabilidade.
2. Diagramas devem ser **atualizados** quando a arquitetura mudar.
3. Diagramas obsoletos devem ser removidos ou marcados como `_archived`.
4. Todo diagrama deve ter **título e data** claros.

## Exemplo (Mermaid)

```markdown
# Arquitetura — Visão Geral

Data: 2026-03-10

\```mermaid
graph TD
    A[Cliente] --> B[API Gateway]
    B --> C[Auth Middleware]
    C --> D[Controllers]
    D --> E[Services]
    E --> F[Repositories]
    F --> G[(Database)]
    D --> H[External APIs]
\```
```

## Quem mantém

- **`spec_guard`** — atualiza diagramas quando a arquitetura muda.
- **`architecture_guard`** — solicita criação/atualização via parecer.
