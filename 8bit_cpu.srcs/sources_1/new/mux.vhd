library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
    Port ( 
        write_data   : in STD_LOGIC_VECTOR (15 downto 0);
        Result_data  : in STD_LOGIC_VECTOR (15 downto 0);
        sel0         : in STD_LOGIC;
        sel1         : in STD_LOGIC;
        S            : out STD_LOGIC_VECTOR (15 downto 0):= ( others => '0')   -- Change 'out' to 'inout'
    );
end mux;

architecture Behavioral of mux is
signal sel : std_logic_vector(1 downto 0);
begin
    sel <= sel1 & sel0;

    process(sel,Result_data)
    begin
        case sel is
            when "01"  => S <= write_data;
            when "10"  => S <= Result_data;
         
            when others => null;  -- Do nothing, S retains its previous value
        end case;
    end process;

end Behavioral;
