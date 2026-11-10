library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegistradorGenerico is
    -- A cláusula generic permite parametrizar a largura do registrador
    generic (
        W : integer := 8 -- Valor padrão de 8 bits, pode ser sobrescrito na instanciação
    );
    port (
        clock : in  std_logic;
        Reset : in  std_logic;
        Load  : in  std_logic;
        D     : in  std_logic_vector(W-1 downto 0);
        Q     : out std_logic_vector(W-1 downto 0)
    );
end RegistradorGenerico;

architecture RTL of RegistradorGenerico is
begin
    -- O Reset é assíncrono, então ele DEVE estar na lista de sensibilidade junto com o clock
    process(clock, Reset)
    begin
        -- Prioridade máxima: Reset assíncrono ativo em nível lógico zero ('0')
        if (Reset = '0') then
            Q <= (others => '0');
            
        -- Caso não haja Reset, avaliamos o comportamento síncrono na borda de subida
        elsif rising_edge(clock) then
            -- O Load é síncrono, então ele só é testado quando ocorre a borda do clock
            if (Load = '1') then
                Q <= D;
            end if;
        end if;
    end process;
end RTL;