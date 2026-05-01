----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2025 02:42:49 PM
-- Design Name: 
-- Module Name: controller_fsm - FSM
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

entity controller_fsm is
    Port ( i_reset : in STD_LOGIC;
           i_clk: in STD_LOGIC;
           i_adv : in STD_LOGIC;
           o_cycle : out STD_LOGIC_VECTOR (3 downto 0));
end controller_fsm;

architecture FSM of controller_fsm is
    type sm_controller is (s_controller1, s_controller2, s_controller3, s_controller4);
    
    signal f_Q, f_Q_next: sm_controller;
begin
    state_process: process(i_clk)
    begin
        if rising_edge(i_clk) then        -- only update state on clock edge
            if (i_reset = '1') then
                    f_Q <= s_controller1;
            else            
                case f_Q is
                    when s_controller1 => 
                        if (i_adv = '1') then f_Q_next <= s_controller2; end if;
                        if (i_adv = '1') then f_Q <= s_controller2; end if;
                    when s_controller2 => 
                        if (i_adv = '1') then f_Q_next <= s_controller3; end if;
                        if (i_adv = '1') then f_Q <= s_controller3; end if;
                    when s_controller3 => 
                        if (i_adv = '1') then f_Q_next <= s_controller4; end if;
                        if (i_adv = '1') then f_Q <= s_controller4; end if;
                    when s_controller4 => 
                        if (i_adv = '1') then f_Q_next <= s_controller1; end if;
                        if (i_adv = '1') then f_Q <= s_controller1; end if;     
                end case;
            end if;
        end if;
    end process;
    
    output_process: process (f_Q)
    begin
        case f_Q is
            when s_controller1 => o_cycle <= "0001";
            when s_controller2 => o_cycle <= "0010";
            when s_controller3 => o_cycle <= "0100";
            when s_controller4 => o_cycle <= "1000";
        end case;
    end process;            
            
           

end FSM;
