library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port ( 
        op : in STD_LOGIC_VECTOR (7 downto 0);
        skip1 : out std_logic ; -- just one adress jumping 
        jump_enable : out  STD_LOGIC ; -- jump signal 
        Halt : out  STD_LOGIC := '0' ; 
        store_enable : out  STD_LOGIC ; -- store signal
        --operamd : in STD_LOGIC_VECTOR (7 downto 0);
        rega_data : in STD_LOGIC_VECTOR (7 downto 0); 
        mem_data : in STD_LOGIC_VECTOR (7 downto 0) := "00000000"; 
        
        result : out STD_LOGIC_VECTOR (7 downto 0)
    );
end ALU;

architecture Behavioral of ALU is
------------------------------------------  signals ----------------------------------
    signal skip : STD_LOGIC := '0' ;  -- just one adress jumping 
    signal resultt : std_logic_vector(7 downto 0); -- result signal 
    signal jp : std_logic:='0' ;  -- jumping signal 
    signal st : std_logic:='0' ;  --storing signal
---------------------------------------------------------------------------------------
begin

 --------------------------- op code decoding ---------------------------------
with op select
 
             resultt <=   mem_data   when "00000011", -- load a value to register A  when (03)
              mem_data + rega_data   when "00000001" , -- ADD
             rega_data -  mem_data    when "00000010" , -- Soustraire 
             rega_data AND  mem_data    when "00000100" , -- Reg  AND Memory  
             rega_data OR  mem_data    when "00000101" , -- Reg  Or Memory  
             rega_data                 when "00000110" , -- Store A in memory 
             rega_data                 when "00000111" ,  -- jump to an addr 
             rega_data                 when "00000000",
               "00000000"            when others; -- Default case
               
------------------------ jump instruction decoding ------------------------------

with op select
    jp <= '1'       when "00000111",  -- jump case opcode 
               '0' when others; -- Default case

---------------------------------------------------------------------------------------
with op select
    st <= '1'       when "00000110",  -- store op case  
               '0' when others; -- Default case
---------------------------------------------------------------------------------------
with op select
    skip <= '1'       when "00000011" ,  -- skip next    op case  
            '1'       when "00000001",
            '1'       when "00000010",
            '1'       when "00000100" ,
            '1'       when "00000101" ,
               '0' when others; -- Default case
---------------------------------------------------------------------------------------
with op select
    Halt <= '1'       when "11111111" ,  -- skip next    op case  
               '0' when others; -- Default case
-------


    result <= resultt;
    jump_enable <= jp ; 
    store_enable <= st ; 
    skip1 <= skip ; 
end Behavioral;