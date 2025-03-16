--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
--Date        : Fri Mar 14 18:34:35 2025
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
    clk_0 : in STD_LOGIC;
    jump1 : out STD_LOGIC;
    next_inst_0 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    prog_mem_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    reg_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    result_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    saute_now_0 : out STD_LOGIC
  );
end my_cpu_design_wrapper;

architecture STRUCTURE of my_cpu_design_wrapper is
  component my_cpu_design is
  port (
    clk_0 : in STD_LOGIC;
    next_inst_0 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    saute_now_0 : out STD_LOGIC;
    result_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    reg_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    prog_mem_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    jump1 : out STD_LOGIC
  );
  end component my_cpu_design;
begin
my_cpu_design_i: component my_cpu_design
     port map (
      clk_0 => clk_0,
      jump1 => jump1,
      next_inst_0(4 downto 0) => next_inst_0(4 downto 0),
      prog_mem_data(7 downto 0) => prog_mem_data(7 downto 0),
      reg_data(7 downto 0) => reg_data(7 downto 0),
      result_0(7 downto 0) => result_0(7 downto 0),
      saute_now_0 => saute_now_0
    );
end STRUCTURE;
