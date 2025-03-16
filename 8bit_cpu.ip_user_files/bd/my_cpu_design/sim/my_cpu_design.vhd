--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
--Date        : Sun Mar 16 20:24:08 2025
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
    address_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    clk_0 : in STD_LOGIC;
    jump1 : out STD_LOGIC;
    next_inst_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    opcode : out STD_LOGIC_VECTOR ( 7 downto 0 );
    prog_mem_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    reg_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    result_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    saute_now_0 : out STD_LOGIC;
    store_flag : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of my_cpu_design : entity is "my_cpu_design,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=my_cpu_design,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=4,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of my_cpu_design : entity is "my_cpu_design.hwdef";
end my_cpu_design;

architecture STRUCTURE of my_cpu_design is
  component my_cpu_design_Pc_0_0 is
  port (
    store_flag : in STD_LOGIC;
    clk : in STD_LOGIC;
    halt : in STD_LOGIC;
    saute_now : out STD_LOGIC;
    skip_next : in STD_LOGIC;
    jump_enable : in STD_LOGIC;
    jump_addr : in STD_LOGIC_VECTOR ( 15 downto 0 );
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
    op : in STD_LOGIC_VECTOR ( 7 downto 0 );
    skip1 : out STD_LOGIC;
    jump_enable : out STD_LOGIC;
    Halt : out STD_LOGIC;
    store_enable : out STD_LOGIC;
    rega_data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    mem_data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    result : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component my_cpu_design_ALU_0_0;
  component my_cpu_design_Registre_A_0_0 is
  port (
    clk : in STD_LOGIC;
    jump : in STD_LOGIC;
    st : in STD_LOGIC;
    reg_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    write_data : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component my_cpu_design_Registre_A_0_0;
  signal ALU_0_Halt : STD_LOGIC;
  signal ALU_0_jump_enable : STD_LOGIC;
  signal \^address_0\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^jump1\ : STD_LOGIC;
  signal \^next_inst_0\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^opcode\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^prog_mem_data\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^reg_data\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^result_0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^store_flag\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_0 : signal is "XIL_INTERFACENAME CLK.CLK_0, CLK_DOMAIN my_cpu_design_clk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
begin
  address_0(15 downto 0) <= \^address_0\(15 downto 0);
  jump1 <= \^jump1\;
  next_inst_0(15 downto 0) <= \^next_inst_0\(15 downto 0);
  opcode(7 downto 0) <= \^opcode\(7 downto 0);
  prog_mem_data(7 downto 0) <= \^prog_mem_data\(7 downto 0);
  reg_data(7 downto 0) <= \^reg_data\(7 downto 0);
  result_0(7 downto 0) <= \^result_0\(7 downto 0);
  store_flag <= \^store_flag\;
ALU_0: component my_cpu_design_ALU_0_0
     port map (
      Halt => ALU_0_Halt,
      jump_enable => ALU_0_jump_enable,
      mem_data(7 downto 0) => \^prog_mem_data\(7 downto 0),
      op(7 downto 0) => \^opcode\(7 downto 0),
      rega_data(7 downto 0) => \^reg_data\(7 downto 0),
      result(7 downto 0) => \^result_0\(7 downto 0),
      skip1 => \^jump1\,
      store_enable => \^store_flag\
    );
Pc_0: component my_cpu_design_Pc_0_0
     port map (
      clk => clk_0,
      halt => ALU_0_Halt,
      jump_addr(15 downto 0) => \^address_0\(15 downto 0),
      jump_enable => ALU_0_jump_enable,
      next_inst(15 downto 0) => \^next_inst_0\(15 downto 0),
      saute_now => saute_now_0,
      skip_next => \^jump1\,
      store_flag => \^store_flag\
    );
Registre_A_0: component my_cpu_design_Registre_A_0_0
     port map (
      clk => clk_0,
      jump => ALU_0_jump_enable,
      reg_data(7 downto 0) => \^reg_data\(7 downto 0),
      st => \^store_flag\,
      write_data(7 downto 0) => \^result_0\(7 downto 0)
    );
memoire_programe_0: component my_cpu_design_memoire_programe_0_0
     port map (
      address(15 downto 0) => \^address_0\(15 downto 0),
      data(7 downto 0) => \^prog_mem_data\(7 downto 0),
      inst_addr(15 downto 0) => \^next_inst_0\(15 downto 0),
      op(7 downto 0) => \^opcode\(7 downto 0),
      reg_data_en => \^store_flag\,
      stored_val(7 downto 0) => \^reg_data\(7 downto 0)
    );
end STRUCTURE;
