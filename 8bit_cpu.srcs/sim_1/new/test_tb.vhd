----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.03.2025 16:44:38
-- Design Name: 
-- Module Name: test_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_tb is
--  Port ( );
end test_tb;

architecture Behavioral of test_tb is
component my_cpu_design_wrapper
        port (
            clk_0 : in STD_LOGIC;
            jump1 : out STD_LOGIC;
            next_inst_0 : out STD_LOGIC_VECTOR (15 downto 0);
            opcode : out STD_LOGIC_VECTOR (7 downto 0);
            prog_mem_data : out STD_LOGIC_VECTOR (7 downto 0);
            reg_data : out STD_LOGIC_VECTOR (7 downto 0);
            result_0 : out STD_LOGIC_VECTOR (7 downto 0);
            saute_now_0 : out STD_LOGIC;
            store_flag : out STD_LOGIC
        );
    end component;

    -- Signal Declaration
    signal clk : STD_LOGIC := '0';
    signal jump1 : STD_LOGIC;
    signal next_inst : STD_LOGIC_VECTOR (15 downto 0);
    signal opcode : STD_LOGIC_VECTOR (7 downto 0);
    signal prog_mem_data : STD_LOGIC_VECTOR (7 downto 0);
    signal reg_data : STD_LOGIC_VECTOR (7 downto 0);
    signal result : STD_LOGIC_VECTOR (7 downto 0);
    signal saute_now : STD_LOGIC;
    signal store_flag : STD_LOGIC;

begin
    -- Instantiate the Unit Under Test (UUT)
    UUT: my_cpu_design_wrapper
        port map (
            clk_0 => clk,
            jump1 => jump1,
            next_inst_0 => next_inst,
            opcode => opcode,
            prog_mem_data => prog_mem_data,
            reg_data => reg_data,
            result_0 => result,
            saute_now_0 => saute_now,
            store_flag => store_flag
        );

    -- Clock Process: Toggle every 20 ns (Period = 40 ns)
    process
    begin
        
            clk <= '0';
            wait for 20 ns;
            clk <= '1';
            wait for 20 ns;
        
    end process;


end Behavioral;
