------------------------------------------------------------------------
--
-- Traffic lights controller testbench.
-- Nexys A7-50T, Vivado v2020.1.1, EDA Playground
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------
entity tb_smart_tlc is
    -- Entity of testbench is always empty
end entity tb_smart_tlc;

------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_smart_tlc is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    --Local signals
    signal s_clk_100MHz : std_logic;
    signal s_reset      : std_logic;
    signal s_south_i    : std_logic;
    signal s_west_i     : std_logic;
    signal s_south_o    : std_logic_vector(3 - 1 downto 0);
    signal s_west_o     : std_logic_vector(3 - 1 downto 0);

begin
    -- Connecting testbench signals with tlc entity (Unit Under Test)
    uut_smart_tlc : entity work.smart_tlc
        port map(
            clk     => s_clk_100MHz,
            reset   => s_reset,
            south_i => s_south_i,
            west_i  => s_west_i,
            south_o => s_south_o,
            west_o  => s_west_o
        );

    --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 10000 ns loop   -- 10 usec of simulation
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    --------------------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------------------
    p_reset_gen : process
    begin
        s_reset <= '0'; wait for 100 ns;
        -- Reset activated
        s_reset <= '1'; wait for 100 ns;
        -- Reset deactivated
        s_reset <= '0';
        wait;
    end process p_reset_gen;

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        s_south_i <= '0';
        s_west_i  <= '0';
        wait for 50 ns;
        s_south_i <= '1';
        s_west_i  <= '1';
        wait for 180 ns;
        s_south_i <= '1';
        s_west_i  <= '0';
        wait for 350 ns;
        s_south_i <= '1';
        s_west_i  <= '1';
        wait for 450 ns;
        s_south_i <= '0';
        s_west_i  <= '1';             
        wait;
        report "Stimulus process finished" severity note;
    end process p_stimulus;

end architecture testbench;
