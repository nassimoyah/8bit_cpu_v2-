library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port ( 
        op : in STD_LOGIC_VECTOR (2 downto 0);
        jump1 : out std_logic ; -- just one adress jumping 
        jump_enable : out  STD_LOGIC ; -- jump signal 
        store_enable : out  STD_LOGIC ; -- store signal
        operamd : in STD_LOGIC_VECTOR (4 downto 0);
        rega_data : in STD_LOGIC_VECTOR (7 downto 0); 
        mem_data : in STD_LOGIC_VECTOR (7 downto 0) := "00000000"; 
        
        result : out STD_LOGIC_VECTOR (7 downto 0)
    );
end ALU;

architecture Behavioral of ALU is
------------------------------------------  signals ----------------------------------
    signal j1 : STD_LOGIC := '0' ;  -- just one adress jumping 
    signal resultt : std_logic_vector(7 downto 0); -- result signal 
    signal jp : std_logic:='0' ;  -- jumping signal 
    signal st : std_logic:='0' ;  --storing signal
---------------------------------------------------------------------------------------
begin

 --------------------------- op code decoding ---------------------------------
with op select
    resultt <= mem_data        when "000",  -- Load operation
               rega_data + mem_data when "001",  -- Addition
               rega_data - mem_data when "010",  -- Subtraction
               mem_data   when "011", -- load a value to A 
               rega_data and mem_data when "100", -- AND operation
               ("000" & operamd) when "101", -- store A in memory  
                ("000" & operamd)  when "110", -- junp  operation
               "00000000"            when others; -- Default case
               
------------------------ jump instruction decoding ------------------------------

with op select
    jp <= '1'       when "110",  -- jump case opcode 
               '0' when others; -- Default case

---------------------------------------------------------------------------------------
with op select
    st <= '1'       when "101",  -- store op case  
               '0' when others; -- Default case
---------------------------------------------------------------------------------------
with op select
    j1 <= '1'       when "011",  -- store op case  
               '0' when others; -- Default case
---------------------------------------------------------------------------------------



    result <= resultt;
    jump_enable <= jp ; 
    store_enable <= st ; 
    jump1 <= j1 ; 
end Behavioral;