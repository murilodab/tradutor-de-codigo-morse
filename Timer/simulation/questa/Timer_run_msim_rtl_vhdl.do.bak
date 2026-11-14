transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -2008 -work work {/home/murilo/Documentos/UFMG/Quartus/Projeto/Timer/Timer.vhd}

vcom -2008 -work work {/home/murilo/Documentos/UFMG/Quartus/Projeto/Timer/Timer_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Timer_tb

add wave *
view structure
view signals
run -all
