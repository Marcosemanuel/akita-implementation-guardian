# Contra-Exemplo: FrankMD

## Fonte

[Do Zero à Pós-Produção em 1 Semana](https://akitaonrails.com/2026/02/20/do-zero-a-pos-producao-em-1-semana-como-usar-ia-em-projetos-de-verdade-bastidores-do-the-m-akita-chronicles/) — seção "O Contra-Exemplo: FrankMD".

## Por que este contra-exemplo importa

Prova empiricamente a tese da Skill: **mesmo desenvolvedor + mesmo agente de IA + sem disciplina = resultado inferior**. A variável não foi a IA — foi o processo.

---

## Os dois projetos

| Aspecto | M.Akita Chronicles (com XP) | FrankMD (sem XP) |
|---|---|---|
| Duração | 8 dias | 19 dias |
| Commits | 274 | 212 |
| Commits/dia | **34** | **11** |
| Testes | 1.323 (TDD orgânico) | Retroativos |
| Paradas forçadas | Zero | 6 cirurgias de emergência |
| Maior arquivo | Sempre pequeno | 5.000 linhas (!) |
| Refactoring | 27 commits pequenos e cirúrgicos | 6 cirurgias grandes e arriscadas |
| CI | Em cada commit (~22s) | Parcial |

---

## A espiral do app_controller.js

O FrankMD é um SPA-like com Stimulus. Todo o JavaScript vivia num único arquivo: `app_controller.js`.

O padrão: **construir-construir-construir-PARAR-refatorar**.

O arquivo cresceu **10x em 54 commits**, atingiu quase **5.000 linhas**, e precisou de **6 rodadas de refactoring** para trazer de volta ao aceitável. Cada parada: centenas de linhas movidas, dezenas de arquivos criados.

O CSS seguiu o mesmo padrão: 1.053 linhas num único `application.css`, até explodir em 10 arquivos de tema + 9 de componente.

---

## Testes: retroativos vs orgânicos

No FrankMD, o 2º commit foi "Add comprehensive test suite" — testes de sistema cobrindo o happy path e nada mais. Testes de unidade só vieram no commit #52, **depois que o arquivo já tinha 5.000 linhas** — porque precisava de testes para refatorar com segurança.

A cobertura teve que ser **empurrada** de 77% para 89% num commit explícito. Não era TDD — era preencher buracos.

---

## A lição concreta

Os 6 refactors grandes do FrankMD **não foram "refactoring contínuo"**. Foram cirurgias de emergência em dívida técnica acumulada. Cada um:
- Levou **horas** (não os 2 minutos de "extrai um concern")
- Introduziu **riscos** (mover 1.500 linhas = alta chance de quebrar algo)
- Exigiu **testes retroativos** para ter segurança

Com TDD e refactoring contínuo, o M.Akita Chronicles **nunca acumulou essa dívida**. Os 27 refactors são commits pequenos protegidos por 1.323 testes que já existiam.

---

## Conclusão do Akita

> "Esse projeto não é um showcase de IA. É um showcase de engenharia de software acelerada por IA. A prova mais forte é que o mesmo desenvolvedor com o mesmo agente produziu resultados radicalmente diferentes dependendo do processo."

> "O futuro do desenvolvimento não é IA substituindo programadores. É programadores que sabem usar IA com a mesma disciplina que sempre usaram, produzindo em uma semana o que equipes levam trimestres."
