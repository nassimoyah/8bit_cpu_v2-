transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vcom -work xil_defaultlib -93  \
"../../../bd/my_cpu_design/ip/my_cpu_design_Pc_0_0/sim/my_cpu_design_Pc_0_0.vhd" \
"../../../bd/my_cpu_design/ip/my_cpu_design_memoire_programe_0_0/sim/my_cpu_design_memoire_programe_0_0.vhd" \
"../../../bd/my_cpu_design/ip/my_cpu_design_ALU_0_0/sim/my_cpu_design_ALU_0_0.vhd" \
"../../../bd/my_cpu_design/ip/my_cpu_design_Registre_A_0_0/sim/my_cpu_design_Registre_A_0_0.vhd" \
"../../../bd/my_cpu_design/ip/my_cpu_design_Reg_B_0_0/sim/my_cpu_design_Reg_B_0_0.vhd" \
"../../../bd/my_cpu_design/ip/my_cpu_design_reg16_bit_0_0/sim/my_cpu_design_reg16_bit_0_0.vhd" \
"../../../bd/my_cpu_design/ip/my_cpu_design_Port_Or_0_0/sim/my_cpu_design_Port_Or_0_0.vhd" \
"../../../bd/my_cpu_design/ip/my_cpu_design_Port_Or_1_0/sim/my_cpu_design_Port_Or_1_0.vhd" \
"../../../bd/my_cpu_design/sim/my_cpu_design.vhd" \


