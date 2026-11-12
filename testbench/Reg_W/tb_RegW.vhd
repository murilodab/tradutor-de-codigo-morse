library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- A entidade de um testbench é sempre vazia, pois ela apenas injeta sinais internos
entity tb_RegistradorGenerico is
end tb_RegistradorGenerico;

architecture sim of tb_RegistradorGenerico is

    -- 1. Declaração do componente a ser testado (DUT - Device Under Test)
    component RegistradorGenerico is
        generic (
            W : integer := 8
        );
        port (
            clock : in  std_logic;
            Reset : in  std_logic;
            Load  : in  std_logic;
            D     : in  std_logic_vector(W-1 downto 0);
            Q     : out std_logic_vector(W-1 downto 0)
        );
    end component;

    -- Declaração conforme image_8d2d8d.png
    signal meu_clock: std_logic := '0'; -- Inicialização
    
    -- Sinais internos para estimular o componente (largura de 4 bits para casar com W=4)
    signal tb_Reset : std_logic := '1'; -- Começa em '1' (inativo, já que é ativo em zero)
    signal tb_Load  : std_logic := '0';
    signal tb_D     : std_logic_vector(3 downto 0) := (others => '0');
    signal tb_Q     : std_logic_vector(3 downto 0);

begin

    -- 2. Instanciação mapeando o genérico para W=4
    RegW: RegistradorGenerico
        generic map (
            W => 4
        )
        port map (
            clock => meu_clock,
            Reset => tb_Reset,
            Load  => tb_Load,
            D     => tb_D,
            Q     => tb_Q
        );

    -- Atribuição de estímulos (Geração do Clock) conforme image_8d2d8d.png
    -- Isso cria uma onda quadrada infinita com período de 10 ns (alterna a cada 5 ns)
    meu_clock <= not meu_clock after 5 ns;

    -- 3. Processo sequencial para injetar os casos de teste
    process
    begin
        -- Caso A: Pulso de Reset Assíncrono inicial
        tb_Reset <= '0';
        wait for 12 ns; 
        tb_Reset <= '1'; -- Libera o registrador para funcionar
        wait for 10 ns;

        -- Caso B: Testar a carga de dados (Load ativo)
        tb_D <= "1010";
        tb_Load <= '1';
        wait for 10 ns; -- Tempo suficiente para a borda de subida do clock capturar os dados

        -- Caso C: Testar retenção (Load inativo)
        -- O registrador deve manter "1010" na saída Q, mesmo mudando a entrada D
        tb_Load <= '0';
        tb_D <= "0011";
        wait for 20 ns;

        -- Caso D: Nova carga para verificar funcionamento contínuo
        tb_Load <= '1';
        tb_D <= "1111";
        wait for 10 ns;
        
        -- Caso E: Teste de Reset interrompendo uma operação
        tb_Reset <= '0';
        wait for 10 ns;
        tb_Reset <= '1';
        
        -- Interrompe a execução dos estímulos
        wait;
    end process;

end sim;
