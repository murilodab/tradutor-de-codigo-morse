library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all; -- Permite ler std_logic_vector diretamente do arquivo
use work.Assembler_pkg.all;    -- Importa o record morse_data

entity Tradutor_tb is
end entity Tradutor_tb;

architecture sim of Tradutor_tb is

    constant CLK_PERIOD : time := 20 ns; -- Clock de 50 MHz

    -- Sinais conectados ao Tradutor
    signal clock         : std_logic := '0';
    signal morse_data_in : morse_data := (value => (others => '0'), length => 0);
    signal seven_seg_out : std_logic_vector(5 downto 0);

    signal sim_done      : boolean := false;

    -- Função auxiliar para imprimir std_logic_vector no console (report)
    function slv_to_string(slv : std_logic_vector) return string is
        variable res : string(1 to slv'length);
        variable idx : integer := 1;
    begin
        for i in slv'range loop
            if slv(i) = '1' then
                res(idx) := '1';
            elsif slv(i) = '0' then
                res(idx) := '0';
            else
                res(idx) := 'X';
            end if;
            idx := idx + 1;
        end loop;
        return res;
    end function;

begin

    -- Instância do componente Tradutor
    uut : entity work.Tradutor
        port map (
            clock         => clock,
            morse_data_in => morse_data_in,
            seven_seg_out => seven_seg_out
        );

    -- Gerador de clock
    clk_gen : process
    begin
        while not sim_done loop
            clock <= '0';
            wait for CLK_PERIOD / 2;
            clock <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process clk_gen;

    -- Processo de leitura do arquivo de records
    stim_proc : process
        file input_file    : text open read_mode is "morse_records.txt";
        variable file_line : line;
        variable v_value   : std_logic_vector(5 downto 0);
        variable v_length  : integer;
        variable ok_val    : boolean;
        variable ok_len    : boolean;
    begin
        wait for CLK_PERIOD * 2;

        while not endfile(input_file) loop
            readline(input_file, file_line);

            -- Ignora linhas em branco
            if file_line'length > 0 then
                -- Lê o campo .value (6 bits) e depois o campo .length (integer)
                read(file_line, v_value, ok_val);
                read(file_line, v_length, ok_len);

                if ok_val and ok_len then
                    morse_data_in.value  <= v_value;
                    morse_data_in.length <= v_length;

                    -- Aguarda 3 ciclos de clock para visualizar claramente na forma de onda
                    wait for CLK_PERIOD * 3;

                    report "value = " & slv_to_string(morse_data_in.value) &
                           " | length = " & integer'image(morse_data_in.length) &
                           " => seven_seg_out = " & slv_to_string(seven_seg_out);
                end if;
            end if;
        end loop;

        file_close(input_file);
        report "Simulacao do Tradutor concluida.";
        sim_done <= true;
        wait;
    end process stim_proc;

end architecture sim;