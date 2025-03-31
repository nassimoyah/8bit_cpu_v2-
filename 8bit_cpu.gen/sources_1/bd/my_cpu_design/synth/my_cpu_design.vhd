--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
--Date        : Sun Mar 30 18:54:48 2025
--Host        : aorus running 64-bit major release  (build 9200)
--Command     : generate_target my_cpu_design.bd
--Design      : my_cpu_design
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity my_cpu_design is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of my_cpu_design : entity is "my_cpu_design,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=my_cpu_design,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=7,numReposBlks=7,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=7,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of my_cpu_design : entity is "my_cpu_design.hwdef";
end my_cpu_design;

architecture STRUCTURE of my_cpu_design is
  component my_cpu_design_Pc_0_0 is
  port (
    store_enable : in STD_LOGIC;
    clk : in STD_LOGIC;
    halt : in STD_LOGIC;
    skip_1 : in STD_LOGIC;
    jump_to_addr_en : in STD_LOGIC;
    jumping_address : in STD_LOGIC_VECTOR ( 15 downto 0 );
    next_inst : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component my_cpu_design_Pc_0_0;
  component my_cpu_design_memoire_programe_0_0 is
  port (
    reg_data_en : in STD_LOGIC;
    stored_val : in STD_LOGIC_VECTOR ( 7 downto 0 );
    inst_addr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    address : out STD_LOGIC_VECTOR ( 15 downto 0 );
    op : out STD_LOGIC_VECTOR ( 7 downto 0 );
    data : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component my_cpu_design_memoire_programe_0_0;
  component my_cpu_design_ALU_0_0 is
  port (
    Z : in STD_LOGIC;
    op : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rega_data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    mem_data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    mem_data16 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Reg16_data : in STD_LOGIC_VECTOR ( 15 downto 0 );
    skip1 : out STD_LOGIC;
    jump_enable : out STD_LOGIC;
    Halt : out STD_LOGIC;
    store_enable : out STD_LOGIC;
    reg_B_enable : out STD_LOGIC;
    reg_A_enable : out STD_LOGIC;
    reg_16_enable : out STD_LOGIC;
    reg_16_enable_add : out STD_LOGIC;
    result_16 : out STD_LOGIC_VECTOR ( 16 downto 0 );
    result : out STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  end component my_cpu_design_ALU_0_0;
  component my_cpu_design_Registre_A_0_0 is
  port (
    carry_flag : out STD_LOGIC;
    zero_flag : out STD_LOGIC;
    Write_enable : in STD_LOGIC;
    clk : in STD_LOGIC;
    write_data : in STD_LOGIC_VECTOR ( 8 downto 0 );
    reg_data : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component my_cpu_design_Registre_A_0_0;
  component my_cpu_design_Reg_B_0_0 is
  port (
    write_enable : in STD_LOGIC;
    clk : in STD_LOGIC;
    reg_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    write_data : in STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  end component my_cpu_design_Reg_B_0_0;
  component my_cpu_design_reg16_bit_0_0 is
  port (
    memo_data : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Result_data : in STD_LOGIC_VECTOR ( 16 downto 0 );
    clk : in STD_LOGIC;
    carry_flag : out STD_LOGIC;
    Write_en : in STD_LOGIC;
    memo_Write_en : in STD_LOGIC;
    reg16_data : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component my_cpu_design_reg16_bit_0_0;
  component my_cpu_design_Port_Or_0_0 is
  port (
    IN1 : in STD_LOGIC;
    IN2 : in STD_LOGIC;
    C : out STD_LOGIC
  );
  end component my_cpu_design_Port_Or_0_0;
  signal ALU_0_Halt : STD_LOGIC;
  signal ALU_0_jump1 : STD_LOGIC;
  signal ALU_0_jump_enable : STD_LOGIC;
  signal ALU_0_reg_A_enable : STD_LOGIC;
  signal ALU_0_reg_B_enable : STD_LOGIC;
  signal ALU_0_result_16 : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal ALU_0_store_enable : STD_LOGIC;
  signal \^alu_output\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal Registre_A_0_carry_flag : STD_LOGIC;
  signal \^add_enable\ : STD_LOGIC;
  signal memoire_programe_0_address : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^next_inst_0\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^opcode\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^prog_mem_data\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal reg16_bit_0_carry_flag : STD_LOGIC;
  signal \^rega_data\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^reg_data_0\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^store_16_enable\ : STD_LOGIC;
  signal \^zero_flag_0\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_0 : signal is "XIL_INTERFACENAME CLK.CLK_0, CLK_DOMAIN my_cpu_design_clk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
begin
  ALU_output(8 downto 0) <= \^alu_output\(8 downto 0);
  add_enable <= \^add_enable\;
  next_inst_0(15 downto 0) <= \^next_inst_0\(15 downto 0);
  opcode(7 downto 0) <= \^opcode\(7 downto 0);
  prog_mem_data(7 downto 0) <= \^prog_mem_data\(7 downto 0);
  regA_data(7 downto 0) <= \^rega_data\(7 downto 0);
  reg_data_0(15 downto 0) <= \^reg_data_0\(15 downto 0);
  store_16_enable <= \^store_16_enable\;
  zero_flag_0 <= \^zero_flag_0\;
ALU_0: component my_cpu_design_ALU_0_0
     port map (
      Halt => ALU_0_Halt,
      Reg16_data(15 downto 0) => \^reg_data_0\(15 downto 0),
      Z => \^zero_flag_0\,
      jump_enable => ALU_0_jump_enable,
      mem_data(7 downto 0) => \^prog_mem_data\(7 downto 0),
      mem_data16(15 downto 0) => memoire_programe_0_address(15 downto 0),
      op(7 downto 0) => \^opcode\(7 downto 0),
      reg_16_enable => \^store_16_enable\,
      reg_16_enable_add => \^add_enable\,
      reg_A_enable => ALU_0_reg_A_enable,
      reg_B_enable => ALU_0_reg_B_enable,
      rega_data(7 downto 0) => \^rega_data\(7 downto 0),
      result(8 downto 0) => \^alu_output\(8 downto 0),
      result_16(16 downto 0) => ALU_0_result_16(16 downto 0),
      skip1 => ALU_0_jump1,
      store_enable => ALU_0_store_enable
    );
Pc_0: component my_cpu_design_Pc_0_0
     port map (
      clk => clk_0,
      halt => ALU_0_Halt,
      jump_to_addr_en => ALU_0_jump_enable,
      jumping_address(15 downto 0) => memoire_programe_0_address(15 downto 0),
      next_inst(15 downto 0) => \^next_inst_0\(15 downto 0),
      skip_1 => ALU_0_jump1,
      store_enable => ALU_0_store_enable
    );
Port_Or_0: component my_cpu_design_Port_Or_0_0
     port map (
      C => Carry_flag,
      IN1 => reg16_bit_0_carry_flag,
      IN2 => Registre_A_0_carry_flag
    );
Reg_B_0: component my_cpu_design_Reg_B_0_0
     port map (
      clk => clk_0,
      reg_data(7 downto 0) => regB_data(7 downto 0),
      write_data(8 downto 0) => \^alu_output\(8 downto 0),
      write_enable => ALU_0_reg_B_enable
    );
Registre_A_0: component my_cpu_design_Registre_A_0_0
     port map (
      Write_enable => ALU_0_reg_A_enable,
      carry_flag => Registre_A_0_carry_flag,
      clk => clk_0,
      reg_data(7 downto 0) => \^rega_data\(7 downto 0),
      write_data(8 downto 0) => \^alu_output\(8 downto 0),
      zero_flag => \^zero_flag_0\
    );
memoire_programe_0: component my_cpu_design_memoire_programe_0_0
     port map (
      address(15 downto 0) => memoire_programe_0_address(15 downto 0),
      data(7 downto 0) => \^prog_mem_data\(7 downto 0),
      inst_addr(15 downto 0) => \^next_inst_0\(15 downto 0),
      op(7 downto 0) => \^opcode\(7 downto 0),
      reg_data_en => ALU_0_store_enable,
      stored_val(7 downto 0) => \^rega_data\(7 downto 0)
    );
reg16_bit_0: component my_cpu_design_reg16_bit_0_0
     port map (
      Result_data(16 downto 0) => ALU_0_result_16(16 downto 0),
      Write_en => \^add_enable\,
      carry_flag => reg16_bit_0_carry_flag,
      clk => clk_0,
      memo_Write_en => \^store_16_enable\,
      memo_data(15 downto 0) => memoire_programe_0_address(15 downto 0),
      reg16_data(15 downto 0) => \^reg_data_0\(15 downto 0)
    );
end STRUCTURE;
