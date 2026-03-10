# Baseline de Segurança

## Regra central

> "Segurança não é fase — é hábito. 21 commits de segurança em 8 dias." — Akita

O agente implementa o que pede, mas raramente sugere proteções extras. Segurança proativa é responsabilidade do humano + guards.

---

## Checklist mínimo

### Entrada e validação
- [ ] Toda entrada de usuário é validada e sanitizada.
- [ ] Parâmetros de URL e query strings são validados.
- [ ] Upload de arquivos possui validação de tipo e tamanho.

### Autenticação
- [ ] Autenticação é obrigatória em endpoints protegidos.
- [ ] Tokens possuem expiração.
- [ ] Sessões são invalidadas no logout.
- [ ] Senhas são armazenadas com hash forte (bcrypt, argon2).

### Autorização
- [ ] Autorização é verificada em cada operação sensível.
- [ ] Existe separação de papéis/permissões quando aplicável.
- [ ] Usuários não podem acessar dados de outros usuários.

### Segredos
- [ ] API keys, tokens e senhas não estão em código-fonte.
- [ ] Variáveis de ambiente sensíveis não são commitadas.
- [ ] Segredos são rotacionados periodicamente.

### Dependências
- [ ] Dependências são auditadas regularmente.
- [ ] CVEs críticas são corrigidas com prioridade.
- [ ] Dependências não utilizadas são removidas.

### Logs
- [ ] Logs não contêm dados sensíveis (PII, tokens, senhas).
- [ ] Logs são suficientes para diagnóstico sem ser excessivos.

### Rede e headers
- [ ] CORS está configurado adequadamente.
- [ ] HTTPS é obrigatório em produção.
- [ ] Headers de segurança estão configurados (CSP, HSTS, X-Frame-Options).

### Rate limiting
- [ ] Endpoints públicos possuem limitação de taxa.
- [ ] Endpoints de autenticação possuem proteção contra brute force.

### Integrações externas
- [ ] Respostas de APIs externas são validadas.
- [ ] Timeouts estão configurados.
- [ ] Falhas em integrações são tratadas gracefully.
