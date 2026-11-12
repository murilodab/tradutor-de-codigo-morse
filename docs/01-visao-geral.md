# Visão Geral

## O que é

Um **tradutor de código Morse** implementado em VHDL, para rodar em uma placa FPGA
**Altera/Intel MAX10M50F484C7G** (conforme o `README.md` principal do repositório).

A ideia central: o usuário comunica letras pressionando um botão em sequências de
toques curtos (ponto) e longos (traço), seguindo o código Morse; o circuito mede a
duração de cada toque, acumula até 6 símbolos, decodifica a letra correspondente e a
exibe em um display de 7 segmentos.

## Contexto

- Comentário no topo de `maquina/Controladora/Controladora.vhd`: *"Projeto Final LSD V1.0"* —
  indica que é um projeto final de disciplina (Lógica/Laboratório de Sistemas Digitais).
- O padrão de arquitetura (Datapath + Controladora + Sinalizador) foi reaproveitado de
  um projeto anterior de uma aula, segundo o autor em áudios explicativos enviados à
  equipe (conteúdo já incorporado a esta documentação).
- Repositório no GitHub: `murilodab/tradutor-de-codigo-morse`, branch `main`.
- Histórico de commits (em 2026-11-10): `Initial commit` → `Commit Inicial` →
  `Added Reg_W` → `Added gitkeep`. Projeto em estágio bem inicial.

## Autoria e colaboração

- Autor dos commits até o momento: Murilo Barbosa.
- Nos áudios, o autor se dirige a colegas de equipe (nomes citados oralmente — a
  transcrição automática pode não ter captado os nomes com exatidão, então evite
  tratá-los como certos sem confirmar com a equipe).
- Licença: **GNU GPLv3** (arquivo `LICENSE` na raiz do repositório).

## Hardware alvo

- Placa declarada no `README.md`: **MAX10M50F484C7G**.
- ⚠️ Atenção: o componente `BCD_7seg.vhd` traz um comentário dizendo que foi
  *"testado e fornecido com pinagem para Kit Terasic Altera DE2"* — uma placa
  diferente da declarada no README. Vale confirmar se a pinagem dos 7 segmentos
  funciona sem alteração no MAX10M50F484C7G, ou se precisa de ajuste. Ver
  [`04-decisoes-e-pendencias.md`](./04-decisoes-e-pendencias.md).
