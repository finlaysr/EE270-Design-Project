----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2026 12:43:05
-- Design Name: 
-- Module Name: disp_driver - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

type vector_array is array (0 to 3) of std_logic_vector(0 downto 3); -- This is an array for 
-- std_logic_vector

entity digit_getter is
    Port (
        currNum : in integer; -- Taking in the current Number
        digitVectorArray : out vector_array -- Geting the output
    );
end digit_getter;

architecture main of digit_getter is

begin

	getDigits : process(currNum) is
		variable temp : integer; -- This will hold an altering currNum
        -- Values to fit into array elements
        variable digit0 : integer;
        variable digit1 : integer;
        variable digit2 : integer;
        variable digit3 : integer;
        
	begin 
    	temp := currNum;
        
        digit0 := temp / 1000;
        temp := temp - (digit0 * 1000);
        
        digit1 := temp / 100;
        temp := temp - (digit1 * 100);
        
        digit2 := temp / 10;
        temp := temp - (digit2 * 10);
        
        digit3 := temp;
        
        digitVectorArray(0) <= std_logic_vector(to_unsigned(digit0, 4));
        digitVectorArray(1) <= std_logic_vector(to_unsigned(digit1, 4));
        digitVectorArray(2) <= std_logic_vector(to_unsigned(digit2, 4));
        digitVectorArray(3) <= std_logic_vector(to_unsigned(digit3, 4));
	end process;

end main;
