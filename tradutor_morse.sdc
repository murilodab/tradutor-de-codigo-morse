# Clock real do DE10-Lite: 50 MHz (periodo de 20 ns).
create_clock -name clock -period 20.000 [get_ports {clock}]
derive_clock_uncertainty

# reset/btn_a/btn_b sao sinais externos assincronos, ja tratados por
# sincronizador/debounce dentro do Datapath antes de qualquer logica
# sincrona - nao faz sentido cobrar timing sincrono deles vindo de fora.
set_false_path -from [get_ports {reset btn_a btn_b}] -to [all_registers]
