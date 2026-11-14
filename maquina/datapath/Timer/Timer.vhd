library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Mede por quantos ciclos de clock o botao 'a' fica pressionado e decide,
-- com base no perfil de velocidade selecionado, se o toque foi um ponto
-- (flag_timer = '0') ou um traco (flag_timer = '1'). Ver docs/04-decisoes-e-pendencias.md
-- (secao "Perfis de velocidade") para a tabela de limiares por perfil.
entity Timer is
    generic (
        CLOCK_FREQ_HZ : integer := 50_000_000 -- frequencia do clock da placa, em Hz
    );
    port (
        clock      : in  std_logic;
        reset      : in  std_logic;
        a          : in  std_logic;                    -- botao (mesmo sinal usado pelo Conversor)
        profile    : in  std_logic_vector(1 downto 0); -- "00"=Iniciante "01"=Avancado outros=Expert
        flag_timer : out std_logic                     -- '0'=ponto '1'=traco
    );
end Timer;

architecture rtl of Timer is

    constant LIMIAR_INICIANTE : integer := CLOCK_FREQ_HZ * 3;        -- traco >= 3,0 s
    constant LIMIAR_AVANCADO  : integer := (CLOCK_FREQ_HZ * 3) / 2;  -- traco >= 1,5 s
    constant LIMIAR_EXPERT    : integer := (CLOCK_FREQ_HZ * 6) / 10; -- traco >= 0,6 s

    constant MAX_LIMIAR : integer := LIMIAR_INICIANTE; -- maior limiar, define o teto do contador

    signal contador : integer range 0 to MAX_LIMIAR := 0;

begin

    process (clock, reset)
        variable limiar : integer range 0 to MAX_LIMIAR;
    begin
        if reset = '1' then
            contador   <= 0;
            flag_timer <= '0';
        elsif rising_edge(clock) then
            case profile is
                when "00"   => limiar := LIMIAR_INICIANTE;
                when "01"   => limiar := LIMIAR_AVANCADO;
                when others => limiar := LIMIAR_EXPERT;
            end case;

            if a = '1' then
                if contador < MAX_LIMIAR then
                    contador <= contador + 1;
                end if;

                if contador >= limiar then
                    flag_timer <= '1'; -- traco
                else
                    flag_timer <= '0'; -- ponto
                end if;
            else
                contador <= 0; -- solto: prepara para o proximo toque
            end if;
        end if;
    end process;

end rtl;
