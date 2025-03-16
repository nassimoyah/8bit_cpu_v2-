transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+my_cpu_design  -L xil_defaultlib -L secureip -O5 xil_defaultlib.my_cpu_design

do {my_cpu_design.udo}

run 1000ns

endsim

quit -force
