# assets/snippets/

## Propósito

Armazena **trechos de código reutilizáveis** e **padrões de implementação aprovados** que servem como referência para os agentes e para o desenvolvedor.

## O que colocar aqui

- Snippets de padrões aprovados (ex: como implementar retry semântico).
- Exemplos de código que traduzem princípios da Skill em implementação concreta.
- Trechos de configuração padronizados (ex: setup de CI, config de lint).
- Boilerplates mínimos aprovados pelo `architecture_guard`.

## Formato esperado

### Convenção de nomes

```
linguagem_descricao.ext
```

**Exemplo:**
```
python_retry_semantico.py
javascript_middleware_auth.js
typescript_repository_pattern.ts
bash_ci_pipeline_basico.yml
```

## Regras

1. Snippets devem ser **mínimos e focados** — um snippet, um conceito.
2. Todo snippet deve ter **comentário no topo** explicando o que faz e quando usar.
3. Snippets devem seguir os padrões aprovados pelo `code_guard`.
4. Snippets obsoletos devem ser removidos, não acumulados.

## Exemplo

```python
# python_retry_semantico.py
# Padrão: Retry semântico com backoff exponencial
# Quando usar: Chamadas a APIs externas com possibilidade de erro 429/503
# Aprovado por: resilience_guard

import time

def retry_with_backoff(fn, max_retries=3, base_delay=1.0, retryable_codes=(429, 503)):
    for attempt in range(max_retries):
        try:
            return fn()
        except HTTPError as e:
            if e.status_code not in retryable_codes:
                raise  # Não retryable — falha imediata
            if attempt == max_retries - 1:
                raise  # Última tentativa — propaga o erro
            delay = base_delay * (2 ** attempt)
            time.sleep(delay)
```
