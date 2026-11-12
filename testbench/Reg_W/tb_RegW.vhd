library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_RegistradorGenerico is
end tb_RegistradorGenerico;

architecture sim of tb_RegistradorGenerico is

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
    signal tb_Reset : std_logic := '0'; -- Começa em '0' (inativo, já que é ativo em um)
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
        tb_Reset <= '1';
        wait for 12 ns;
        tb_Reset <= '0'; -- Libera o registrador para funcionar
        wait for 10 ns;
        assert tb_Q = "0000" report "Falha no Caso A: reset nao zerou Q" severity error;

        -- Caso B: Testar a carga de dados (Load ativo)
        tb_D <= "1010";
        tb_Load <= '1';
        wait for 10 ns; -- Tempo suficiente para a borda de subida do clock capturar os dados
        assert tb_Q = "1010" report "Falha no Caso B: load nao carregou 1010" severity error;

        -- Caso C: Testar retenção (Load inativo)
        -- O registrador deve manter "1010" na saída Q, mesmo mudando a entrada D
        tb_Load <= '0';
        tb_D <= "0011";
        wait for 20 ns;
        assert tb_Q = "1010" report "Falha no Caso C: Q nao reteve o valor com Load inativo" severity error;

        -- Caso D: Nova carga para verificar funcionamento contínuo
        tb_Load <= '1';
        tb_D <= "1111";
        wait for 10 ns;
        assert tb_Q = "1111" report "Falha no Caso D: nova carga nao funcionou" severity error;

        -- Caso E: Teste de Reset interrompendo uma operação
        tb_Reset <= '1';
        wait for 10 ns;
        assert tb_Q = "0000" report "Falha no Caso E: reset nao interrompeu a operacao" severity error;
        tb_Reset <= '0';

        report "tb_RegistradorGenerico: todos os casos passaram" severity note;

        -- Interrompe a execução dos estímulos
        wait;
    end process;

end sim;
