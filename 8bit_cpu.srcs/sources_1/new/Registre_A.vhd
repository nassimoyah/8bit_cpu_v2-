----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2025 08:20:56 PM
-- Design Name: 
-- Module Name: out_reg - Behavioral
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

entity Registre_A is
Port ( 
        clk : in std_logic;
         jump : in std_logic;
         st: in std_logic;   
    
        reg_data : out std_logic_vector(7 downto 0);
        write_data : in std_logic_vector(7 downto 0)
    );
end Registre_A;

architecture Behavioral of Registre_A is
 signal reg : std_logic_vector(7 downto 0) := "00000000";
begin
    process(clk)
    begin
        if falling_edge(clk) then
              if (jump = '0' and st ='0') then   
               
                reg <= write_data;
              end if ; 
        end if;
    end process;

    reg_data <= reg;
end Behavioral;