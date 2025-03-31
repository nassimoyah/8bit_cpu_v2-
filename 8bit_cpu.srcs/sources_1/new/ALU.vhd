library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port ( 
        Z : in STD_LOGIC ;
        op : in STD_LOGIC_VECTOR (7 downto 0);
        rega_data : in STD_LOGIC_VECTOR (7 downto 0); 
        mem_data : in STD_LOGIC_VECTOR (7 downto 0) := "00000000"; 
        mem_data16 : in STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000"; 
        Reg16_data : in STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000"; 
        
        ---------- control signals --------
        skip1 : out std_logic;
        jump_enable : out  STD_LOGIC;
        Halt : out  STD_LOGIC := '0';
        store_enable : out  STD_LOGIC;
        reg_B_enable : out  STD_LOGIC;
        reg_A_enable : out  STD_LOGIC;
        reg_16_enable : out  STD_LOGIC;
        reg_16_enable_add : out  STD_LOGIC;
        
        result_16 : out STD_LOGIC_VECTOR (16 downto 0);
        result : out STD_LOGIC_VECTOR (8 downto 0)
    );
end ALU;

architecture Behavioral of ALU is
    ------------------------------------------  signals ----------------------------------
    signal skip : STD_LOGIC := '0';
    signal resultt_16 : std_logic_vector(16 downto 0);
    signal resultt : std_logic_vector(8 downto 0);
    signal jp : std_logic := '0';
    signal st : std_logic := '0';
    ---------------------------------------------------------------------------------------
begin

    --------------------------- op code decoding ---------------------------------
    with op select
        resultt <= ('0' & mem_data) when "00000011", 
                   ('0' & std_logic_vector(unsigned(mem_data) + unsigned(rega_data))) when "00000001", 
                   ('0' & std_logic_vector(unsigned(rega_data) - unsigned(mem_data))) when "00000010", 
                   ('0' & (rega_data AND mem_data)) when "00000100", 
                   ('0' & (rega_data OR mem_data)) when "00000101", 
                   ('0' & rega_data) when "00000110" | "00000111", 
                   ('0' & rega_data) when "00010000", 
                   ('0' & mem_data) when "00001000" | "00001001", 
                   ('0' & std_logic_vector(unsigned(rega_data) + 1)) when "00010001",
                   ('0' & std_logic_vector(unsigned(rega_data) - 1)) when "00010010",
                   "000000000" when others;
    
    --------------------------- op code decoding Result16 ---------------------------------
    with op select
        resultt_16 <= std_logic_vector(unsigned('0' & mem_data16) + unsigned('0' & Reg16_data)) when "00001010",
                      std_logic_vector(unsigned('0' & Reg16_data) - unsigned('0' & mem_data16)) when "00001011",
                      "00000000000000001" when others;

    ------------------------ jump instruction decoding ------------------------------
    with op select
        jp <= '1' when "00000111", 
        ('1' and not(Z)) when "00010000",  
              '0' when others;
    
    ------------------------ store instruction decoding ------------------------------
    with op select
        st <= '1' when "00000110" | "00001001" | "00001010" | "00001011", 
              '0' when others;
    
    ------------------------ skip instruction decoding ------------------------------
    with op select
        skip <= '1' when "00000011" | "00000001" | "00000010" | "00000100" | "00000101" | "00001000", 
                '0' when others;
    
    ------------------------ Halt instruction decoding ------------------------------
    with op select
        Halt <= '1' when "11111111", 
                '0' when others;
    
    ------------------------ Register enable signals ------------------------------
    with op select
        reg_B_enable <= '1' when "00001000", 
                        '0' when others;
    
    with op select
        reg_A_enable <= '1' when "00000011" | "00000001" | "00000010" | "00010001" | "00010010",
                        '0' when others;
    
    with op select
        reg_16_enable <= '1' when "00001001", 
                         '0' when others;
    
    with op select
        reg_16_enable_add <= '1' when "00001010" | "00001011", 
                             '0' when others;
    
    -- Output Assignments
    result_16 <= resultt_16;
    result <= resultt;
    jump_enable <= jp;
    store_enable <= st;
    skip1 <= skip;
    
end Behavioral;
