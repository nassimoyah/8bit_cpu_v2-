--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
--Date        : Sun Mar 30 18:54:48 2025
--Host        : aorus running 64-bit major release  (build 9200)
--Command     : generate_target my_cpu_design_wrapper.bd
--Design      : my_cpu_design_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity my_cpu_design_wrapper is
  port (
    ALU_output : out STD_LOGIC_VECTOR ( 8 downto 0 );
    Carry_flag : out STD_LOGIC;
    add_enable : out STD_LOGIC;
    clk_0 : in STD_LOGIC;
    next_inst_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    opcode : out STD_LOGIC_VECTOR ( 7 downto 0 );
    prog_mem_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    regA_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    regB_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    reg_data_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    store_16_enable : out STD_LOGIC;
    zero_flag_0 : out STD_LOGIC
  );
end my_cpu_design_wrapper;

architecture STRUCTURE of my_cpu_design_wrapper is
  component my_cpu_design is
  port (
    clk_0 : in STD_LOGIC;
    next_inst_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    ALU_output : out STD_LOGIC_VECTOR ( 8 downto 0 );
    regA_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    prog_mem_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    opcode : out STD_LOGIC_VECTOR ( 7 downto 0 );
    regB_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    reg_data_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    add_enable : out STD_LOGIC;
    store_16_enable : out STD_LOGIC;
    Carry_flag : out STD_LOGIC;
    zero_flag_0 : out STD_LOGIC
  );
  end component my_cpu_design;
begin
my_cpu_design_i: component my_cpu_design
     port map (
      ALU_output(8 downto 0) => ALU_output(8 downto 0),
      Carry_flag => Carry_flag,
      add_enable => add_enable,
      clk_0 => clk_0,
      next_inst_0(15 downto 0) => next_inst_0(15 downto 0),
      opcode(7 downto 0) => opcode(7 downto 0),
      prog_mem_data(7 downto 0) => prog_mem_data(7 downto 0),
      regA_data(7 downto 0) => regA_data(7 downto 0),
      regB_data(7 downto 0) => regB_data(7 downto 0),
      reg_data_0(15 downto 0) => reg_data_0(15 downto 0),
      store_16_enable => store_16_enable,
      zero_flag_0 => zero_flag_0
    );
end STRUCTURE;
