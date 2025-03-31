

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Registre_A is
Port (  carry_flag : out std_logic ; 
        zero_flag : out std_logic:= '0' ; 
        Write_enable : in std_logic;
        clk : in std_logic;
        write_data : in std_logic_vector(8 downto 0);
        reg_data : out std_logic_vector(7 downto 0)
        
    );
end Registre_A;

architecture Behavioral of Registre_A is
 signal reg : std_logic_vector(7 downto 0) := "00000000";
begin
    process(clk)
    begin
       if reg = "00000000" then 
                        zero_flag <= '1' ;
                    else 
                        zero_flag <= '0' ; end if ;
        if rising_edge(clk) then
               if(write_enable ='1' ) then 
               
                    reg <= write_data(7 downto 0);  
                   
                        
                    carry_flag <=  write_data(8) ;
                end if ;          
        end if;
    end process;


    reg_data <= reg;
end Behavioral;