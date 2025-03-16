library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Pc is
    Port ( 
        store_flag : in STD_LOGIC; 
        clk , halt : in STD_LOGIC;           --  clk du system 
        
        skip_next : in STD_LOGIC;  -- Skip next instruction
        jump_enable : in STD_LOGIC;   -- Jump to specific address
        jump_addr  : in STD_LOGIC_VECTOR(15 downto 0);
        next_inst : out STD_LOGIC_VECTOR (15 downto 0)
    );
end Pc;

architecture Behavioral of Pc is

              
    signal current_instr : std_logic_vector(15 downto 0) := "0000000000000000"; -- cuurent instr signal  

begin      ---------------------  arch begin -----------------------

    process(clk)   ------------------  process begin --------------------
    begin 
       if(halt = '0') then 
        if rising_edge(clk) then  
        
            -- Jump to a specific address
            if jump_enable = '1' then 
                current_instr <= jump_addr ;
                saute_noww <= '0';   -- 0 because it is not a normal jump it is specifique addr jump
            ---------------------------------------------    
            -- Skip next instruction
            elsif skip_next = '1' then  
                if current_instr < "001111111111110" then     -- if current instr  < 3FFE
                    current_instr <= std_logic_vector(unsigned(current_instr) + TO_UNSIGNED(2,16));  -- Skips 1 instruction
                else
                    current_instr <= "0000000000000000";
                end if;
                saute_noww <= '1';  -- jump flag 
                
            -- Normal increment
            elsif store_flag = '1' then 
                
                if current_instr < "001111111111110" then     -- if current instr  < 3FFE
                    current_instr <= std_logic_vector(unsigned(current_instr) + TO_UNSIGNED(3,16));  -- Skips 1 instruction
                else
                    current_instr <= "0000000000000000";
                end if;
                 
                
            else 
                if current_instr < "001111111111110" then
                    current_instr <= std_logic_vector(unsigned(current_instr) + TO_UNSIGNED(1,16));  
                else
                    current_instr <= "0000000000000000";
                end if;
                 
            end if;
            
        end if;
      end if ; 
        
    end process;

    next_inst <= current_instr;  
   

end Behavioral;