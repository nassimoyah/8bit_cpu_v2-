----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/18/2025 06:51:22 PM
-- Design Name: 
-- Module Name: program_memory - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memoire_programe is
    Port (  store : in STD_LOGIC ;
           
           stored_val : in STD_LOGIC_VECTOR (7 downto 0);
           store_addr : in STD_LOGIC_VECTOR (4 downto 0);
           inst_addr : in STD_LOGIC_VECTOR (4 downto 0);
           op : out STD_LOGIC_VECTOR (2 downto 0);
            operandd : out  STD_LOGIC_VECTOR (4 downto 0);
           data  : out STD_LOGIC_vector(7 downto 0) );
end memoire_programe;

architecture Behavioral of memoire_programe is
     signal dataa : STD_LOGIC_VECTOR (7 downto 0);
    signal operand : STD_LOGIC_VECTOR (4 downto 0);
    signal opp : STD_LOGIC_VECTOR (2 downto 0);
    type instruction_set is array (0 to 31) of STD_LOGIC_VECTOR (7 downto 0);
    
    signal  instr : instruction_set := (
1 => "01100001",  --     load to A reg next instr 
2 => "10001000",  -- 
3 => "01110101",  --      loadto A next instr
4 => "01000100",  --     
5 => "00111111",  --     add to regA (1111) F 
6 => "11000011",  --     jump tp (03)


--7=>  "01100000" ,
--8=> "11000010" ,
--9 => "11000011",

26 => "00001111", -- ram starts from 20 
27 => "00000010",
28 => "00000011",   -- 1d
29 => "00010011",   -- 1c
30 => "00000100",  -- 1e
31 => "00000011",  --1F 
    others => "11111111"  -- data = ff
    );

begin
    process(inst_addr,operand)
    begin
    ---------------------- storing case -------------------------------
        if store = '1' then 
            instr(TO_INTEGER(unsigned(store_addr))) <= stored_val ; 
        end if ;     
     -------------------------------------------------------------------      
     ------------ opcode & data fetch -------------------------  
        opp <= instr(TO_INTEGER(unsigned(inst_addr)))(7 downto 5);
         if opp = "011" then   
                operand <= inst_addr ; 
                dataa <= instr(TO_INTEGER(unsigned(operand)+1)); 
         else        
            operand <= instr(TO_INTEGER(unsigned(inst_addr)))(4 downto 0); 
                dataa <= instr(TO_INTEGER(unsigned(operand))); 
         end if ; 
        ---------------------------------------------------
    end process;
    operandd <= operand ; 
    op <= opp ; data <= dataa ; 
   
end Behavioral;