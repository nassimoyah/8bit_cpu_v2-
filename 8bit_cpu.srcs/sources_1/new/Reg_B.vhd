

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Reg_B is
  Port (  write_enable :  in std_logic; 
          clk : in std_logic;
        reg_data : out std_logic_vector(7 downto 0);
        write_data : in std_logic_vector(8 downto 0)
  );
end Reg_B;

architecture Behavioral of Reg_B is

 signal reg : std_logic_vector(7 downto 0) := "00000000";
 
begin


 process(clk)
    begin
        if rising_edge(clk) then
               
             if write_enable = '1'  then   
                reg <= write_data(7 downto 0) ;      
            end  if  ; 
            end if ;           
        
    end process;
     reg_data <= reg ; 
end Behavioral;
