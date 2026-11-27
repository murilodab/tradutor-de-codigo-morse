# Documentação — Tradutor de Código Morse

Esta é a documentação de referência do projeto **tradutor-de-codigo-morse**: descreve
a arquitetura e o comportamento do sistema tal como implementados, com as limitações
conhecidas de cada componente. Deve ser atualizada conforme o código evolui.

Boa parte do conteúdo aqui vem de três fontes:

1. **O código VHDL** já existente no repositório.
2. **Três áudios de WhatsApp** (2026-11-10) em que o autor principal explica a arquitetura
   planejada para quem for colaborar no projeto. Esses áudios não estão versionados no
   repositório; o conteúdo relevante já foi extraído e incorporado aos demais arquivos
   desta pasta.
3. **O histórico de commits e merges** do repositório — em especial o merge de
   2026-11-16, que trouxe uma reorganização grande de diretórios e a integração real
   de todo o datapath, feitas por Murilo Barbosa em paralelo à documentação desta
   pasta.

Cada arquivo descreve o estado atual do componente correspondente e, quando existem,
suas limitações conhecidas.

## Índice

| Arquivo | Conteúdo |
|---|---|
| [`01-visao-geral.md`](./01-visao-geral.md) | O que é o projeto, objetivo, hardware alvo, autoria, licença |
| [`02-arquitetura.md`](./02-arquitetura.md) | Padrão Datapath + Controladora + Sinalizador, mapa de componentes e diagrama |
| [`03-fluxo-funcional.md`](./03-fluxo-funcional.md) | Passo a passo do sinal do botão até a letra no display, módulo por módulo |
| [`06-testbenches.md`](./06-testbenches.md) | Convenções seguidas pelos testbenches (antiga e nova), como rodar no Questa, o que cada um cobre |

## Status rápido (2026-11-16)

```
Implementado e integrado:           Timer, Conversor, Assembler, Tradutor,
                                     BCD_7seg, Controladora (Projeto_v10),
                                     Sinalizador, Datapath — toda a cadeia
                                     conectada de ponta a ponta
Com testbench (sem assert auto):    Timer, Conversor, Assembler, Tradutor,
                                     Sinalizador (teste de integração)
Sem testbench:                      BCD_7seg, Controladora (Projeto_v10)
Não implementado:                   Driver de LCD 16x2 (alternativa ao
                                     display 7 segmentos)
```
