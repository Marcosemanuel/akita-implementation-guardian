# Template: Spec Viva do Projeto

A Spec Viva é o documento que descreve o projeto para o agente de IA. É o equivalente do onboarding doc de uma equipe — mas o "novo membro" é o agente, que lê o doc inteiro em 2 segundos antes de cada interação.

> "O investimento em documentação retorna exponencialmente com agentes de IA porque eles realmente leem." — Akita

## Referência

No artigo, o CLAUDE.md do projeto tem 702 linhas e cobre tudo que o agente precisa saber. Não foi escrito de uma vez — evoluiu com o projeto. Cada hurdle descoberto era documentado.

---

## [Nome do Projeto]

### Visão geral
[Descrição em 2-3 frases do que o sistema faz]

### Stack tecnológico
- **Linguagem:** [ex: Ruby 3.3, Python 3.11]
- **Framework:** [ex: Rails 8, FastAPI]
- **Banco de dados:** [ex: PostgreSQL 16, SQLite]
- **Infraestrutura:** [ex: Docker, Kamal, AWS]
- **CI:** [ex: GitHub Actions]

### Variáveis de ambiente
| Variável | Propósito | Obrigatória? |
|---|---|---|
| `DATABASE_URL` | Conexão com banco | Sim |
| [variável] | [propósito] | [sim/não] |

### Estrutura de diretórios
```
projeto/
├── src/          # [descrição]
├── tests/        # [descrição]
├── config/       # [descrição]
└── scripts/      # [descrição]
```

### Serviços e componentes
| Componente | Responsabilidade |
|---|---|
| [componente] | [o que faz] |

### Jobs e automações
| Job | Frequência | Descrição |
|---|---|---|
| [job] | [cron/evento] | [o que faz] |

### Common hurdles (armadilhas conhecidas)
> Documentar aqui toda vez que descobrir um hurdle durante o desenvolvimento.

| # | Hurdle | Solução |
|---|---|---|
| 1 | [problema] | [como resolvemos] |

### Design patterns do projeto
| Pattern | Onde | Por que |
|---|---|---|
| [pattern] | [módulo] | [justificativa] |

### Padrões proibidos
| Proibido | Alternativa | Motivo |
|---|---|---|
| [anti-padrão] | [usar isso] | [por que] |

### Pipeline semanal/diário
[Se houver pipeline de execução regular, documentar]

### Checklist pós-implementação
- [ ] Testes passando
- [ ] CI verde
- [ ] Lint passando
- [ ] Segurança verificada
- [ ] Documentação atualizada
- [ ] Spec viva atualizada

---

> Mantido pelo `spec_guard`. Atualizado ao final de cada ciclo de incremento.
