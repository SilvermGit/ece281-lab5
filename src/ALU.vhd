----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2025 02:50:18 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( i_A : in STD_LOGIC_VECTOR (7 downto 0);
           i_B : in STD_LOGIC_VECTOR (7 downto 0);
           i_op : in STD_LOGIC_VECTOR (2 downto 0);
           o_result : out STD_LOGIC_VECTOR (7 downto 0);
           o_flags : out STD_LOGIC_VECTOR (3 downto 0));
end ALU;
       
    
architecture Behavioral of ALU is
    signal w_and : std_logic_vector (7 downto 0):= "00000000";
    signal w_or : std_logic_vector (7 downto 0) := "00000000";
    signal w_add : std_logic_vector (7 downto 0):= "00000000";
    signal w_flags : std_logic_vector (13 downto 0) := "00000000";
    signal w_carry_add: std_logic_vector (8 downto 0) := "000000000";
    signal w_carry_full: std_logic_vector (8 downto 0) := "000000000";
    signal w_carry_full2: std_logic_vector (8 downto 0) := "000000000";
    signal w_inverted: std_logic_vector (7 downto 0) := "00000000";
    signal w_subtract : std_logic_vector (7 downto 0) := "00000000";
    signal w_carry_subtract: std_logic_vector (8 downto 0) := "000000000";

begin
    w_and(0) <= i_A(0) and i_B(0);
    w_and(1) <= i_A(1) and i_B(1);
    w_and(2) <= i_A(2) and i_B(2);
    w_and(3) <= i_A(3) and i_B(3);
    w_and(4) <= i_A(4) and i_B(4);
    w_and(5) <= i_A(5) and i_B(5);
    w_and(6) <= i_A(6) and i_B(6);
    w_and(7) <= i_A(7) and i_B(7);
    w_flags(2) <= '1' when (w_and(7) = '1') else '0'; -- Negative
    w_flags(1) <= '1' when (w_and = "00000000") else '0'; -- Zero
    w_flags(0) <= '1' when (w_and(7) = '1' and i_A(7) = '0' and i_B(7) = '0') else -- Overflow
                  '1' when (w_and(7) = '0' and i_A(7) = '1' and i_B(7) = '1') else '0'; -- Overflow

    
    w_or(0) <= i_A(0) or i_B(0);
    w_or(1) <= i_A(1) or i_B(1);
    w_or(2) <= i_A(2) or i_B(2);
    w_or(3) <= i_A(3) or i_B(3);
    w_or(4) <= i_A(4) or i_B(4);
    w_or(5) <= i_A(5) or i_B(5);
    w_or(6) <= i_A(6) or i_B(6);
    w_or(7) <= i_A(7) or i_B(7);
    w_flags(5) <= '1' when (w_or(7) = '1') else '0'; -- Negative
    w_flags(4) <= '1' when (w_or = "00000000") else '0'; -- Zero
    w_flags(3) <= '1' when (w_or(7) = '1' and i_A(7) = '0' and i_B(7) = '0') else -- Overflow
                  '1' when (w_or(7) = '0' and i_A(7) = '1' and i_B(7) = '1') else '0'; -- Overflow
    
    w_carry_add(0) <= '0';
    w_add(0) <= i_A(0) xor i_B(0) xor w_carry_full(0);
    w_carry_add(1) <= (i_A(0) and i_B(0)) or ((i_A(0) xor i_B(0)) and w_carry_add(0));
    w_add(1) <= i_A(1) xor i_B(1) xor w_carry_full(1);
    w_carry_add(2) <= (i_A(1) and i_B(1)) or ((i_A(1) xor i_B(1)) and w_carry_add(1));
    w_add(2) <= i_A(2) xor i_B(2) xor w_carry_full(2);
    w_carry_add(3) <= (i_A(2) and i_B(2)) or ((i_A(2) xor i_B(2)) and w_carry_add(2));
    w_add(3) <= i_A(3) xor i_B(3) xor w_carry_full(3);
    w_carry_add(4) <= (i_A(3) and i_B(3)) or ((i_A(3) xor i_B(3)) and w_carry_add(3));
    w_add(4) <= i_A(4) xor i_B(4) xor w_carry_full(4);
    w_carry_add(5) <= (i_A(4) and i_B(4)) or ((i_A(4) xor i_B(4)) and w_carry_add(4));
    w_add(5) <= i_A(5) xor i_B(5) xor w_carry_full(5);
    w_carry_add(6) <= (i_A(5) and i_B(5)) or ((i_A(5) xor i_B(5)) and w_carry_add(5));
    w_add(6) <= i_A(6) xor i_B(6) xor w_carry_full(6);
    w_carry_add(7) <= (i_A(6) and i_B(6)) or ((i_A(6) xor i_B(6)) and w_carry_add(6));
    w_add(7) <= i_A(7) xor i_B(7) xor w_carry_full(7);
    w_carry_add(8) <= (i_A(7) and i_B(7)) or ((i_A(7) xor i_B(7)) and w_carry_add(7));
    w_flags(9) <= '1' when (w_add(7) = '1') else '0'; -- Negative
    w_flags(8) <= '1' when (w_add = "00000000") else '0'; -- Zero
    w_flags(7) <= '1' when (w_carry_add(8) = '1') else '0'; -- Carry
    w_flags(6) <= '1' when (w_add(7) = '1' and i_A(7) = '0' and i_B(7) = '0') else -- Overflow
                  '1' when (w_add(7) = '0' and i_A(7) = '1' and i_B(7) = '1') else '0'; -- Overflow
                  
    w_carry_add(0) <= '0';
    w_add(0) <= i_A(0) xor i_B(0) xor w_carry_full(0);
    w_carry_add(1) <= (i_A(0) and i_B(0)) or ((i_A(0) xor i_B(0)) and w_carry_add(0));
    w_add(1) <= i_A(1) xor i_B(1) xor w_carry_full(1);
    w_carry_add(2) <= (i_A(1) and i_B(1)) or ((i_A(1) xor i_B(1)) and w_carry_add(1));
    w_add(2) <= i_A(2) xor i_B(2) xor w_carry_full(2);
    w_carry_add(3) <= (i_A(2) and i_B(2)) or ((i_A(2) xor i_B(2)) and w_carry_add(2));
    w_add(3) <= i_A(3) xor i_B(3) xor w_carry_full(3);
    w_carry_add(4) <= (i_A(3) and i_B(3)) or ((i_A(3) xor i_B(3)) and w_carry_add(3));
    w_add(4) <= i_A(4) xor i_B(4) xor w_carry_full(4);
    w_carry_add(5) <= (i_A(4) and i_B(4)) or ((i_A(4) xor i_B(4)) and w_carry_add(4));
    w_add(5) <= i_A(5) xor i_B(5) xor w_carry_full(5);
    w_carry_add(6) <= (i_A(5) and i_B(5)) or ((i_A(5) xor i_B(5)) and w_carry_add(5));
    w_add(6) <= i_A(6) xor i_B(6) xor w_carry_full(6);
    w_carry_add(7) <= (i_A(6) and i_B(6)) or ((i_A(6) xor i_B(6)) and w_carry_add(6));
    w_add(7) <= i_A(7) xor i_B(7) xor w_carry_full(7);
    w_carry_add(8) <= (i_A(7) and i_B(7)) or ((i_A(7) xor i_B(7)) and w_carry_add(7));
    
    w_inverted(0) <= not i_B(0);
    w_inverted(1) <= not i_B(1);
    w_inverted(2) <= not i_B(2);
    w_inverted(3) <= not i_B(3);
    w_inverted(4) <= not i_B(4);
    w_inverted(5) <= not i_B(5);
    w_inverted(6) <= not i_B(6);
    w_inverted(7) <= not i_B(7);
    
    w_carry_subtract(0) <= '0';
    w_subtract(0) <= i_A(0) xor w_inverted(0) xor w_carry_full2(0);
    w_carry_subtract(1) <= (i_A(0) and w_inverted(0)) or ((i_A(0) xor w_inverted(0)) and w_carry_subtract(0));
    w_subtract(1) <= i_A(1) xor w_inverted(1) xor w_carry_full2(1);
    w_carry_subtract(2) <= (i_A(1) and w_inverted(1)) or ((i_A(1) xor w_inverted(1)) and w_carry_subtract(1));
    w_subtract(2) <= i_A(2) xor w_inverted(2) xor w_carry_full2(2);
    w_carry_subtract(3) <= (i_A(2) and w_inverted(2)) or ((i_A(2) xor w_inverted(2)) and w_carry_subtract(2));
    w_subtract(3) <= i_A(3) xor w_inverted(3) xor w_carry_full2(3);
    w_carry_subtract(4) <= (i_A(3) and w_inverted(3)) or ((i_A(3) xor w_inverted(3)) and w_carry_subtract(3));
    w_subtract(4) <= i_A(4) xor w_inverted(4) xor w_carry_full2(4);
    w_carry_subtract(5) <= (i_A(4) and w_inverted(4)) or ((i_A(4) xor w_inverted(4)) and w_carry_subtract(4));
    w_subtract(5) <= i_A(5) xor w_inverted(5) xor w_carry_full2(5);
    w_carry_subtract(6) <= (i_A(5) and w_inverted(5)) or ((i_A(5) xor w_inverted(5)) and w_carry_subtract(5));
    w_subtract(6) <= i_A(6) xor w_inverted(6) xor w_carry_full2(6);
    w_carry_subtract(7) <= (i_A(6) and w_inverted(6)) or ((i_A(6) xor w_inverted(6)) and w_carry_subtract(6));
    w_subtract(7) <= i_A(7) xor w_inverted(7) xor w_carry_full2(7);
    w_carry_subtract(8) <= (i_A(7) and w_inverted(7)) or ((i_A(7) xor w_inverted(7)) and w_carry_subtract(7));
    w_flags(13) <= '1' when (w_subtract(7) = '1') else '0'; -- Negative
    w_flags(12) <= '1' when (w_subtract = "00000000") else '0'; -- Zero
    w_flags(11) <= '1' when (w_carry_subtract(8) = '1') else '0'; -- Carry
    w_flags(10) <= '1' when (w_subtract(7) = '1' and i_A(7) = '0' and i_B(7) = '0') else --Overflow
                   '1' when (w_subtract(7) = '0' and i_A(7) = '1' and i_B(7) = '1') else '0'; --Overflow
    
    o_result <= w_add when (i_op = "000") else
                w_subtract when (i_op = "001") else
                w_and when (i_op = "010") else
                w_or when (i_op = "011") else
                "00000000";
                
    o_flags(3) <= w_flags(9) when (i_op = "000") else 
                  w_flags(13) when (i_op = "001") else
                  w_flags(2) when (i_op = "010") else
                  w_flags(5) when (i_op = "011") else 
                  '0'; 
              
    o_flags(2) <= w_flags(8) when (i_op = "000") else 
                  w_flags(12) when (i_op = "001") else
                  w_flags(1) when (i_op = "010") else
                  w_flags(4) when (i_op = "011") else 
                  '0';   
                  
                      
    o_flags(1) <= w_flags(7) when (i_op = "000") else 
                   w_flags(11) when (i_op = "001") else
                  '0';   
               
    o_flags(0) <= w_flags(6) when (i_op = "000") else 
                  w_flags(10) when (i_op = "001") else
                  w_flags(0) when (i_op = "010") else
                  w_flags(3) when (i_op = "011") else 
                  '0';      

end Behavioral;
