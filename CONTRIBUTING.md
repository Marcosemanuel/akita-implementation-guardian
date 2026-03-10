# Contribuindo para o Akita Implementation Guardian

Obrigado por considerar contribuir! 🙌

## Como contribuir

### Reportar problemas

1. Verifique se o problema já foi reportado nas [Issues](https://github.com/Marcosemanuel/akita-implementation-guardian/issues).
2. Se não, crie uma nova issue com:
   - Descrição clara do problema
   - Passos para reproduzir
   - Comportamento esperado vs atual

### Sugerir melhorias

1. Abra uma issue com a tag `enhancement`.
2. Descreva o que você gostaria de ver e por quê.
3. Se possível, inclua exemplos de como funcionaria.

### Enviar Pull Requests

1. Faça fork do repositório.
2. Crie um branch descritivo: `git checkout -b melhoria/novo-guard`.
3. Faça suas alterações seguindo os padrões do projeto.
4. Verifique que todos os scripts Python funcionam: `python scripts/verify_increment_ready.py`.
5. Commit com mensagem clara: `git commit -m "feat: adicionar guard para acessibilidade"`.
6. Push e abra o PR.

## Padrões do projeto

- **Markdown**: Todos os docs seguem o padrão `UPPER_SNAKE_CASE.md`.
- **Agentes**: Seguem a estrutura de `agents/*.md` com seções padronizadas.
- **Workflows**: Seguem a estrutura de `workflows/*.md` com fases numeradas.
- **Linguagem**: Documentação em português brasileiro.
- **Princípio**: Toda mudança deve ser verificável e reversível.

## Código de Conduta

Seja respeitoso. Contribua com intenção de melhorar. Questione com dados.
