----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.03.2021 15:14:26
-- Design Name: 
-- Module Name: tb_d_ff_rst - Behavioral
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

entity tb_d_ff_rst is
--  Port ( );
end tb_d_ff_rst;

architecture Behavioral of tb_d_ff_rst is

      constant c_CLK_PERIOD : time    := 10 ns;

        signal s_clk        : std_logic;
        signal s_rst        : std_logic;
        signal s_d          : std_logic;
        signal s_q          : std_logic;
        signal s_q_bar      : std_logic;

begin

        uut_d_ff_rst : entity work.d_ff_rst
            port map 
        (
                 clk   => s_clk,   
                 rst   => s_rst, 
                 d     => s_d,
                 q     => s_q,   
                 q_bar => s_q_bar
        );
        
        --------------------------------------------------------------------
        -- Clock generation process
        --------------------------------------------------------------------
        p_clk_gen : process
        begin
            while now < 750 ns loop         -- 75 periods of 100MHz clock
                s_clk <= '0';
                wait for c_CLK_PERIOD / 2;
                s_clk <= '1';
                wait for c_CLK_PERIOD / 2;
            end loop;
            wait;
        end process p_clk_gen;
        
        --------------------------------------------------------------------
        -- Reset generation process
        --------------------------------------------------------------------        
        p_reset_gen : process
        begin
            -- Reset activated
            s_rst <= '1';
            wait for 13 ns;
            -- Reset deactivated
            s_rst <= '0';
            wait for 23 ns;
            -- Reset activated
            s_rst <= '1';
            wait for 46 ns;
            -- Reset deactivated
            s_rst <= '0';
            wait for 77 ns;
            s_rst <= '1';
            wait;
        end process p_reset_gen;
        
        --------------------------------------------------------------------
        -- Data generation process
        --------------------------------------------------------------------
        p_stimulus : process
        begin
            report "Stimulus process started" severity note;
                                                 
                --d sekvence
                s_d <= '1';
                wait for 10 ns;
                s_d <= '0';
                wait for 10 ns;  
                s_d <= '1';
                wait for 10 ns;  
                s_d <= '0';
                wait for 10 ns;  
                
                assert (s_q = '0' and s_q_bar = '1')
                report "process failed" severity error;
                
                wait for 10 ns;
                s_d <= '1'; wait for 20 ns;
                
                assert (s_q = '1' and s_q_bar = '0')
                report "process failed" severity error;
                
                wait for 10 ns;
                s_d <= '0';
                wait for 10 ns;
                s_d <= '1';
                wait for 10 ns;  
                s_d <= '0';
                wait for 10 ns;  
                s_d <= '1';
                wait for 10 ns;  
                s_d <= '0';
                wait for 10 ns;  
                s_d <= '1';
                wait for 10 ns;    
                s_d <= '0';
                wait for 10 ns;  
                s_d <= '1';
                wait for 10 ns;  
                s_d <= '0';
                wait for 10 ns;  
                s_d <= '1';
                wait for 10 ns;     
            
            report "Stimulus process finished" severity note;
            wait;
            end process p_stimulus;  
                   
        
end Behavioral;
