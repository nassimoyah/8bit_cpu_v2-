library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Pc is
    Port ( 
        clk : in STD_LOGIC;
        saute_now : out std_logic;
        jump1_enable : in STD_LOGIC;  -- Skip next instruction
        jump_enable : in STD_LOGIC;   -- Jump to specific address
        jump_addr  : in STD_LOGIC_VECTOR(7 downto 0);
        next_inst : out STD_LOGIC_VECTOR (4 downto 0)
    );
end Pc;

architecture Behavioral of Pc is
    signal saute_noww : std_logic := '0'; 
    signal current_instr : std_logic_vector(4 downto 0) := "00000"; 

begin

    process(clk)
    begin 
        if falling_edge(clk) then  
        
            -- Jump to a specific address
            if jump_enable = '1' then 
                current_instr <= jump_addr(4 downto 0);
                saute_noww <= '0';  
                
            -- Skip next instruction
            elsif jump1_enable = '1' then  
                if current_instr < "10100" then
                    current_instr <= std_logic_vector(unsigned(current_instr) + TO_UNSIGNED(2,5));  -- Skips 1 instruction
                else
                    current_instr <= "00000";
                end if;
                saute_noww <= '1';  
                
            -- Normal increment
            else 
                if current_instr < "10100" then
                    current_instr <= std_logic_vector(unsigned(current_instr) + TO_UNSIGNED(1,5));  
                else
                    current_instr <= "00000";
                end if;
                saute_noww <= '0'; 
            end if;
            
        end if;
    end process;

    next_inst <= current_instr;  
    saute_now <= saute_noww; 

end Behavioral;