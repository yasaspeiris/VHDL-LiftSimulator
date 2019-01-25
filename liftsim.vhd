library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity liftsim is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           target_state : in  STD_LOGIC_Vector (2 downto 0);
			  x : in  STD_LOGIC;
           floor : out  STD_LOGIC_VECTOR (3 downto 0);
			  ledg,led1,led2,led3,led4,led5,led6 : out STD_LOGIC;
			  up_down: out STD_LOGIC); --Indicates the direction of the elevator
end liftsim;


architecture Behavioral of liftsim is

type floor_state_type is (floorg,floor1a,floor2a,floor3a,floor4a,floor5a,floor6,floor5d,floor4d,floor3d,floor2d,floor1d);

signal floor_state: floor_state_type := floorg;


begin


floor_state_machine: process(clk) 
begin
	
	if clk'event and clk='1' then
	
		
		if reset='1' then
			floor_state <= floorg;
		
		else
			
			case floor_state is
				
				when floorg => 
					if (target_state = "001") then 
						floor_state <= floor1a;
					elsif (target_state = "010") then 
						floor_state <= floor2a; 			
					elsif (target_state = "011") then 
						floor_state <= floor3a;
					elsif (target_state = "100") then 
						floor_state <= floor4a;
					elsif (target_state = "101") then 
						floor_state <= floor5a;
					elsif (target_state = "110") then 
						floor_state <= floor6;
					end if;
					if (x = '1') then 
						floor_state <= floorg;
					elsif (target_state = "000") then
						floor_state <= floorg;
					end if;
					
				when floor1a => 
					if (target_state = "010") then 
						floor_state <= floor2a; 			
					elsif (target_state = "011") then 
						floor_state <= floor3a;
					elsif (target_state = "100") then 
						floor_state <= floor4a;
					elsif (target_state = "101") then 
						floor_state <= floor5a;
					elsif (target_state = "110") then 
						floor_state <= floor6;
					end if;
					if (x = '1') then 
						floor_state <= floor1d;
					elsif (target_state = "000" or target_state = "001") then
						floor_state <= floor1a;
					end if;
					
				when floor2a => 			
					if (target_state = "011") then 
						floor_state <= floor3a;
					elsif (target_state = "100") then 
						floor_state <= floor4a;
					elsif (target_state = "101") then 
						floor_state <= floor5a;
					elsif (target_state = "110") then 
						floor_state <= floor6;
					end if;
					if (x = '1') then 
						floor_state <= floor2d;
					elsif (target_state = "000" or target_state = "001" or target_state = "010") then
						floor_state <= floor2a;
					end if;
					
				when floor3a => 			
					if (target_state = "100") then 
						floor_state <= floor4a;
					elsif (target_state = "101") then 
						floor_state <= floor5a;
					elsif (target_state = "110") then 
						floor_state <= floor6;
					end if;
					if (x = '1') then 
						floor_state <= floor3d;
					elsif (target_state = "000" or target_state = "001" or target_state = "010"or target_state = "011") then
						floor_state <= floor3a;
					end if;
					
				when floor4a => 			
					if (target_state = "101") then 
						floor_state <= floor5a;
					elsif (target_state = "110") then 
						floor_state <= floor6;
					end if;
					if (x = '1') then 
						floor_state <= floor4d;
					elsif (target_state = "000" or target_state = "001" or target_state = "010"or target_state = "011" or target_state = "100") then
						floor_state <= floor4a;
					end if;
					
				when floor5a => 			
					if (target_state = "110") then 
						floor_state <= floor6;
					end if;
					if (x = '1') then 
						floor_state <= floor5d;
					elsif (target_state = "000" or target_state = "001" or target_state = "010"or target_state = "011" or target_state = "100"or target_state = "101") then
						floor_state <= floor5a;
					end if;
					
				when floor6 =>
					if (target_state = "000") then 
						floor_state <= floorg;
					elsif (target_state = "001") then 
						floor_state <= floor1d;
					elsif (target_state = "010") then 
						floor_state <= floor2d; 			
					elsif (target_state = "011") then 
						floor_state <= floor3d;
					elsif (target_state = "100") then 
						floor_state <= floor4d;
					elsif (target_state = "101") then 
						floor_state <= floor5d;
					end if;
					if (x = '1') then 
						floor_state <= floorg;
					elsif (target_state = "110") then
						floor_state <= floor6;
					end if;
					
				when floor5d => 
					if (target_state = "000") then 
						floor_state <= floorg;
					elsif (target_state = "001") then 
						floor_state <= floor1d; 
					elsif (target_state = "010") then 
						floor_state <= floor2d; 			
					elsif (target_state = "011") then 
						floor_state <= floor3d;
					elsif (target_state = "100") then 
						floor_state <= floor4d;
					end if;
					if (x = '1') then 
						floor_state <= floorg;
					elsif (target_state = "110" or target_state = "101") then
						floor_state <= floor5d;
					end if;
				
				when floor4d => 
					if (target_state = "000") then 
						floor_state <= floorg;
					elsif (target_state = "001") then 
						floor_state <= floor1d; 
					elsif (target_state = "010") then 
						floor_state <= floor2d; 			
					elsif (target_state = "011") then 
						floor_state <= floor3d;
					end if;
					if (x = '1') then 
						floor_state <= floorg;
					elsif (target_state = "110" or target_state = "101" or target_state = "100") then
						floor_state <= floor4d;
					end if;
					
				when floor3d => 
					if (target_state = "000") then 
						floor_state <= floorg;
					elsif (target_state = "001") then 
						floor_state <= floor1d; 
					elsif (target_state = "010") then 
						floor_state <= floor2d; 
					end if;
					if (x = '1') then 
						floor_state <= floorg;
					elsif (target_state = "110" or target_state = "101" or target_state = "100"or target_state = "011") then
						floor_state <= floor3d;
					end if;
					
				when floor2d => 
					if (target_state = "000") then 
						floor_state <= floorg;
					elsif (target_state = "001") then 
						floor_state <= floor1d;  
					end if;
					if (x = '1') then 
						floor_state <= floorg;
					elsif (target_state = "110" or target_state = "101" or target_state = "100"or target_state = "011" or target_state = "010") then
						floor_state <= floor2d;
					end if;
					
				when floor1d => 
					if (target_state = "000") then 
						floor_state <= floorg; 
					end if;
					if (x = '1') then 
						floor_state <= floorg;
					elsif (target_state = "110" or target_state = "101" or target_state = "100"or target_state = "011" or target_state = "010" or target_state = "001") then
						floor_state <= floor1d;
					end if;
					
				
				when others =>
					floor_state <= floorg;
			end case;
		end if;
	end if;
end process;




floor <= "0000" when (floor_state = floorg) else --0
			"0001" when (floor_state = floor1a) else --1
			"0010" when (floor_state = floor2a) else --2
			"0011" when (floor_state = floor3a) else --3
			"0100" when (floor_state = floor4a) else --4
			"0101" when (floor_state = floor5a) else --5
			"0001" when (floor_state = floor1d) else --1
			"0010" when (floor_state = floor2d) else --2
			"0011" when (floor_state = floor3d) else --3
			"0100" when (floor_state = floor4d) else --4
			"0101" when (floor_state = floor5d) else --5
			"0000"; --otherwise reset output to floor 0
			
with floor_state select ledg <= 
			'1' when floorg,
			'0' when others;
			
with floor_state select led1 <= 
			'1' when floor1a, 
			'1' when floor1d,
			'0' when others;
			
with floor_state select led2 <=
			'1' when floor2a,
			'1' when floor2d,
			'0' when others;
			
with floor_state select led3 <= 
			'1' when floor3a, 
			'1' when floor3d,
			'0' when others;

with floor_state select led4 <=
			'1' when floor4a,
			'1' when floor4d,
			'0' when others;

with floor_state select led5 <= 
			'1' when floor5a,
			'1' when floor5d,
			'0' when others;

with floor_state select led6 <= 
			'1' when floor6,
			'0' when others;
			
with floor_state select up_down <= 
			'1' when floorg,
			'1' when floor1a,
			'1' when floor2a,
			'1' when floor3a,
			'1' when floor4a,
			'1' when floor5a,
			'0' when others;
			

end Behavioral;