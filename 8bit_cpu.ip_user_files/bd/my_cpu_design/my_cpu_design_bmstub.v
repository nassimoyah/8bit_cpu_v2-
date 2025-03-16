// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module my_cpu_design (
  clk_0,
  next_inst_0,
  saute_now_0,
  result_0,
  reg_data,
  prog_mem_data,
  jump1,
  opcode,
  store_flag,
  address_0
);

  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.CLK_0" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN my_cpu_design_clk_0, INSERT_VIP 0" *)
  input clk_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output [15:0]next_inst_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output saute_now_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output [7:0]result_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output [7:0]reg_data;
  (* X_INTERFACE_IGNORE = "true" *)
  output [7:0]prog_mem_data;
  (* X_INTERFACE_IGNORE = "true" *)
  output jump1;
  (* X_INTERFACE_IGNORE = "true" *)
  output [7:0]opcode;
  (* X_INTERFACE_IGNORE = "true" *)
  output store_flag;
  (* X_INTERFACE_IGNORE = "true" *)
  output [15:0]address_0;

  // stub module has no contents

endmodule
