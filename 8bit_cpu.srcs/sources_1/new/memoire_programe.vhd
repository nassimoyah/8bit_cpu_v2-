
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
    
signal memo : instruction_set := (
    -- INSERT GENERATED CONTENT HERE
    2=> X"03",
    3=> X"03",
    4=> X"08",
    5=> X"05",
    6=> X"11",
    7=> X"12",
    8=> X"01",
    9=> X"09",
    10=> X"09",
    11=> X"44",
    12=> X"55",
    13=> X"06",
    14=> X"01",
    15=> X"00",
    16=> X"0A",
    17=> X"00",
    18=> X"02",
    19=> X"03",
    20=> X"FF",
    21=> X"12",
    22=> X"10",
    23=> X"00",
    24=> X"15",
    25=> X"04",
    26=> X"05",
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
-- END OF GENERATED CONTENT HERE
    others => X"00"
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
