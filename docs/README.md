# Documentação — Tradutor de Código Morse

Esta é a documentação viva do projeto **tradutor-de-codigo-morse**. "Viva" porque o
projeto está em desenvolvimento ativo e esta documentação deve ser atualizada conforme
o código evolui — em especial o arquivo [`04-decisoes-e-pendencias.md`](./04-decisoes-e-pendencias.md),
que funciona como backlog.

Boa parte do conteúdo aqui vem de duas fontes:

1. **O código VHDL** já existente no repositório.
2. **Três áudios de WhatsApp** (2026-11-10) em que o autor principal explica a arquitetura
   planejada para quem for colaborar no projeto. Esses áudios não estão versionados no
   repositório; o conteúdo relevante já foi extraído e incorporado aos demais arquivos
   desta pasta.

Como o código ainda não implementa tudo que os áudios descrevem, esta documentação marca
claramente o que **já está implementado** e o que é **planejado / pendente**.

## Índice

| Arquivo | Conteúdo |
|---|---|
| [`01-visao-geral.md`](./01-visao-geral.md) | O que é o projeto, objetivo, hardware alvo, autoria, licença |
| [`02-arquitetura.md`](./02-arquitetura.md) | Padrão Datapath + Controladora + Sinalizador, mapa de componentes e diagrama |
| [`03-fluxo-funcional.md`](./03-fluxo-funcional.md) | Passo a passo do sinal do botão até a letra no display, módulo por módulo |
| [`04-decisoes-e-pendencias.md`](./04-decisoes-e-pendencias.md) | Decisões já tomadas, perguntas em aberto, bugs conhecidos e roadmap |
| [`05-melhorias.md`](./05-melhorias.md) | Análise de código: bugs, riscos em hardware real, design, estilo, testes e organização do repositório — com sugestões de correção |
| [`06-testbenches.md`](./06-testbenches.md) | Convenção seguida pelos testbenches, explicação de `assert`/`severity`, padrão tabela-driven do `tb_BCD_7seg`, como rodar no Questa |

## Status rápido (2026-11-12)

```
Implementado (parcial ou completo): Conversor, Assembler, BCD_7seg, RegW (genérico),
                                     Controladora (compila, mas ainda não orquestra
                                     o datapath real)
Com testbench (0 erros no Questa):  RegW, Conversor, Assembler, BCD_7seg, Controladora
Não iniciado (apenas pasta vazia):  Timer, Tradutor, Datapath, Sinalizador
```

Veja [`04-decisoes-e-pendencias.md`](./04-decisoes-e-pendencias.md) para detalhes de cada item.
