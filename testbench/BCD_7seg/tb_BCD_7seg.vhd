library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- A entidade de um testbench é sempre vazia, pois ela apenas injeta sinais internos
entity tb_Bcd_7seg is
end tb_Bcd_7seg;

architecture sim of tb_Bcd_7seg is

    -- 1. Declaração do componente a ser testado (DUT - Device Under Test)
    component Bcd_7seg is
        port (
            entrada : in  std_logic_vector(5 downto 0);
            saida   : out std_logic_vector(6 downto 0)
        );
    end component;

    -- Sinais internos para estimular o componente
    signal tb_entrada : std_logic_vector(5 downto 0) := (others => '0');
    signal tb_saida   : std_logic_vector(6 downto 0);

    -- Tabela completa entrada -> saida esperada, igual à decodificação do DUT
    type test_vector is record
        entrada_val    : std_logic_vector(5 downto 0);
        saida_esperada : std_logic_vector(6 downto 0);
    end record;

    type test_array is array (natural range <>) of test_vector;

    constant TESTS : test_array := (
        ("000000", "1111110"), -- 0
        ("000001", "0110000"), -- 1
        ("000010", "1101101"), -- 2
        ("000011", "1111001"), -- 3
        ("000100", "0110011"), -- 4
        ("000101", "1011011"), -- 5
        ("000110", "1011111"), -- 6
        ("000111", "1110000"), -- 7
        ("001000", "1111111"), -- 8
        ("001001", "1111011"), -- 9
        ("001010", "1110111"), -- A
        ("001011", "0011111"), -- b
        ("001100", "1001110"), -- C
        ("001101", "0111101"), -- d
        ("001110", "1001111"), -- E
        ("001111", "1000111"), -- f
        ("010000", "1011110"), -- G
        ("010001", "0110111"), -- H
        ("010010", "0000110"), -- I
        ("010011", "0111100"), -- J
        ("010100", "1010111"), -- K
        ("010101", "0001110"), -- L
        ("010110", "0010101"), -- M (aproximado)
        ("010111", "0010101"), -- n
        ("011000", "0011101"), -- o
        ("011001", "1100111"), -- P
        ("011010", "1110011"), -- q
        ("011011", "0000101"), -- r
        ("011100", "1011011"), -- S
        ("011101", "0001111"), -- t
        ("011110", "0111110"), -- U
        ("011111", "0011100"), -- v
        ("100000", "0101010"), -- W (aproximado)
        ("100001", "0110111"), -- X (aproximado)
        ("100010", "0111011"), -- y
        ("100011", "1101101"), -- Z
        ("100100", "0000000"), -- fora da tabela -> apaga tudo (when others)
        ("111111", "0000000")  -- fora da tabela -> apaga tudo (when others)
    );

begin

    -- 2. Instanciação do componente a ser testado
    inst_Bcd_7seg: Bcd_7seg
        port map (
            entrada => tb_entrada,
            saida   => tb_saida
        );

    -- 3. Processo sequencial para injetar os casos de teste (combinacional, sem clock)
    process
    begin
        for i in TESTS'range loop
            tb_entrada <= TESTS(i).entrada_val;
            wait for 1 ns; -- tempo suficiente para o sinal combinacional se propagar
            assert tb_saida = TESTS(i).saida_esperada
                report "Falha no indice " & integer'image(i) &
                       ": entrada=" & to_string(TESTS(i).entrada_val) &
                       " saida=" & to_string(tb_saida) &
                       " esperado=" & to_string(TESTS(i).saida_esperada)
                severity error;
        end loop;

        report "tb_Bcd_7seg: todos os casos passaram" severity note;

        -- Interrompe a execução dos estímulos
        wait;
    end process;

end sim;
