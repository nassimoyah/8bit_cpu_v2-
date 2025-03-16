vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vcom -work xil_defaultlib  -93  \
"../../../bd/my_cpu_design/ip/my_cpu_design_Pc_0_0/sim/my_cpu_design_Pc_0_0.vhd" \
"../../../bd/my_cpu_design/ip/my_cpu_design_memoire_programe_0_0/sim/my_cpu_design_memoire_programe_0_0.vhd" \
"../../../bd/my_cpu_design/ip/my_cpu_design_ALU_0_0/sim/my_cpu_design_ALU_0_0.vhd" \
"../../../bd/my_cpu_design/ip/my_cpu_design_Registre_A_0_0/sim/my_cpu_design_Registre_A_0_0.vhd" \
"../../../bd/my_cpu_design/sim/my_cpu_design.vhd" \


