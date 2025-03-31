
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
    Port (  
           
           reg_data_en : in STD_LOGIC ; -- store flag / indicator for store instruction 
           stored_val : in STD_LOGIC_VECTOR (7 downto 0);  -- strored value 
           inst_addr : in STD_LOGIC_VECTOR (15 downto 0); -- addresse of next instruction   
           address : out STD_LOGIC_VECTOR (15 downto 0);
           op : out STD_LOGIC_VECTOR (7 downto 0);       --  op code 8 bit 
           data  : out STD_LOGIC_vector(7 downto 0)       -- output data
           
           );
end memoire_programe;

architecture Behavioral of memoire_programe is

    signal dataa : STD_LOGIC_VECTOR (7 downto 0);  -- signals  
    signal opp : STD_LOGIC_VECTOR (7 downto 0);
    signal address_s : STD_LOGIC_VECTOR (15 downto 0);
   
    type instruction_set is array (0 to 65535) of STD_LOGIC_VECTOR (7 downto 0);
    
    signal  memo : instruction_set := (
    
1 => "00000011",  --  03 load a value to A 
2 => "00001000",  --  Load 88 



5 => "00010001",  --  03 load a value to A 
6 => "00010010",  --  03 load a value to A 



10 => "00010000",
11 => "00000000",
12 => "00000110",


    others => "00000000"  
    );




begin
    process(inst_addr)
      variable addr_int : integer range 0 to 65535;
        begin
                
     ------------ opcode & data fetch --------------- 
                addr_int := TO_INTEGER(unsigned(inst_addr)); 
     
                opp <= memo(addr_int);          -- op code fetch               
                dataa <= memo(addr_int +1 );    -- other cases 
                address_s <= memo(addr_int +1 ) & memo(addr_int +2 ) ;
                if reg_data_en ='1' then 
                
                    memo(TO_INTEGER(unsigned(address_s))) <= stored_val ; end if ;

        ---------------------------------------------------
    end process;
    
                address <= address_s ; 
                op <= opp ;
                data <= dataa ; 
   
end Behavioral;