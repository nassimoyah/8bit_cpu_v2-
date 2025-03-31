library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Pc is
    Port ( 
        store_enable : in STD_LOGIC; -- for  store in memory  instruction 
        clk  : in STD_LOGIC;     --  clk du system 
        halt : in STD_LOGIC;       -- instruction pour stopper l'execution du programe     
        skip_1 : in STD_LOGIC;  -- Skip next instruction ( pour les instrution de 2 octets ) 
        jump_to_addr_en : in STD_LOGIC;   -- Jump to specific address
        jumping_address  : in STD_LOGIC_VECTOR(15 downto 0); -- l'addresse du saut 
        next_inst : out STD_LOGIC_VECTOR (15 downto 0)   -- la sortie pour la prochaine addresse  
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
            if jump_to_addr_en = '1' then     
                current_instr <= jumping_address ;
                  
            ---------------------------------------------    
            -- Skip next instruction condition normal pour instruction 2 octets 
            elsif skip_1 = '1' then  
                if current_instr < "001111111111110" then     -- if current instr  < 3FFE
                    current_instr <= std_logic_vector(unsigned(current_instr) + TO_UNSIGNED(2,16));  -- Skips 1 instruction
                else
                    current_instr <= "0000000000000000";
                end if;
            
                
            
            elsif store_enable = '1' then     -- stocker dans la memoire  saut le deux prochaines instruction car il sont l'addresse 
                
                if current_instr < "001111111111110" then     -- if current instr  < 3FFE
                    current_instr <= std_logic_vector(unsigned(current_instr) + TO_UNSIGNED(3,16));  -- Skips 1 instruction
                else
                    current_instr <= "0000000000000000";
                end if;
                 
                
            else  -- cas normal pour un instruction 1 octet 
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