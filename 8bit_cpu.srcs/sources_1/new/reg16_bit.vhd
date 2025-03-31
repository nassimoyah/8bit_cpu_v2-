----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.03.2025 09:49:36
-- Design Name: 
-- Module Name: reg16_bit - Behavioral
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

entity reg16_bit is
 Port (
        --Write_enable : in std_logic;
        memo_data   : in STD_LOGIC_VECTOR (15 downto 0);
        Result_data  : in STD_LOGIC_VECTOR (16 downto 0);
        clk : in std_logic;
        carry_flag : out std_logic;
        Write_en : in std_logic := '0';
        memo_Write_en : in std_logic := '0';
        reg16_data : out std_logic_vector(15 downto 0)
 );
end reg16_bit;

architecture Behavioral of reg16_bit is
signal reg : std_logic_vector(15 downto 0) := "0000000000000000" ;

begin
    process(clk)
    begin
        if rising_edge(clk) then
        if(write_en ='1'  ) then 
           reg <= Result_data(15 downto 0) ;  
           carry_flag <= Result_data(16) ;
        elsif  memo_Write_en = '1' then 
            reg <= memo_data; 
        end if  ;        
        end if;
    end process;

    reg16_data <=  reg ; 
    
    end Behavioral;
