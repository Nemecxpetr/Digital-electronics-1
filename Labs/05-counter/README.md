# 5 Counter

## Lab assignment

1. Preparation tasks (done before the lab at home). Submit:
    * -[x] Figure or table with connection of push buttons on Nexys A7 board,
    * -[x] Table with calculated values.

2. Bidirectional counter. Submit:
    * -[x] Listing of VHDL code of the process `p_cnt_up_down` with syntax highlighting.
    * -[x] Listing of VHDL reset and stimulus processes from testbench file `tb_cnt_up_down.vhd` with syntax highlighting and asserts,
    * -[x] Screenshot with simulated time waveforms; always display all inputs and outputs,

3. Top level. Submit:
    * -[x] Listing of VHDL code from source file `top.vhd` with all instantiations for the 4-bit bidirectional counter.
    * -[x] Image of the top layer including both counters, ie a 4-bit bidirectional counter from Part 4 and a 16-bit counter with a different time base from Part Experiments on your own. The image can be drawn on a computer or by hand.

## 1. Preparation task

The Nexys A7 board provides five push buttons for user applications. See schematic or reference manual of the Nexys A7 board and find out the connection of these push buttons, ie to which FPGA pins are connected and how (schema):


Table with connection of push buttons on Nexys A7 board:
 | **Button name** | **Pin** | **Voltage when off** | **Voltage when on** |
   | :-: | :-: | :-: | :-: |
   | BTNL | P17 | 0V | 3.3V |
   | BTNR | M17 | 0V | 3.3V |
   | BTNU | M18 | 0V | 3.3V |
   | BTND | P18 | 0V | 3.3V |
   | BTNC | N17 | 0V | 3.3V |
   | BTNRES | C12 | 0V | 3.3V |


![Nexys A7 ref manual](Images/nexys-A7-ref.png)

   | **Time interval** | **Number of clk periods** | **Number of clk periods in hex** | **Number of clk periods in binary** |
   | :-: | :-: | :-: | :-: |
   | 2&nbsp;ms | 200 000 | `x"3_0d40"` | `b"0011_0000_1101_0100_0000"` |
   | 4&nbsp;ms | 400 000 | `x"6_1A80"` | `b"0110_0001_1010_1000_0000"` |
   | 10&nbsp;ms | 1 000 000 | `x"F_4240"` | `b"1111_0100_0010_0100_0000"` |
   | 250&nbsp;ms | 25 000 000 | `x"17D_7840"` | `b"0001_0111_1101_0111_1000_0100_0000"` |
   | 500&nbsp;ms | 50 000 000 | `x"2FA_F080"` | `b"0010_1111_1010_1111_0000_1000_0000"` |
   | 1&nbsp;sec | 100 000 000 | `x"5F5_E100"` | `b"0101_1111_0101_1110_0001_0000_0000"` |
   
   
   ## 2. Bidirectional counter
   
   Listing of VHDL code of the process `p_cnt_up_down`
   
   ```vhdl
       p_cnt_up_down : process(clk)
    begin
        if rising_edge(clk) then
        
            if (reset = '1') then               -- Synchronous reset
                s_cnt_local <= (others => '0'); -- Clear all bits

            elsif (en_i = '1') then       -- Test if counter is enabled


                -- TEST COUNTER DIRECTION HERE
                if (cnt_up_i = '1') then
                    
                    s_cnt_local <= s_cnt_local + 1;
                else
                    s_cnt_local <= s_cnt_local - 1;
                end if;

            end if;
        end if;
    end process p_cnt_up_down;
   ```
   
   Listing of VHDL reset and stimulus processes from testbench file `tb_cnt_up_down.vhd`
   
   ```vhdl
    --------------------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------------------
    p_reset_gen : process
    begin
        s_reset <= '0';
        wait for 12 ns;
        
        -- Reset activated
        s_reset <= '1';
        wait for 73 ns;

        s_reset <= '0';
        wait;
    end process p_reset_gen;

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;

        -- Enable counting
        s_en     <= '1';
        
        -- Change counter direction
        s_cnt_up <= '1';
        wait for 380 ns;
        s_cnt_up <= '0';
        wait for 220 ns;

        -- Disable counting
        s_en     <= '0';

        report "Stimulus process finished" severity note;
        wait;
    
    end process p_stimulus;   
   ```
   
   Screenshot with simulated time waveforms
   
   ![Simulated time waveforms](Images/sim1.png)
   
| **![Simulated time waveforms](Images/sim1_1.png)** | **![Simulated time waveforms](Images/sim1_2.png)** | **![Simulated time waveforms](Images/sim1_3.png)** |
   | :-: | :-: | :-: |
    
   ## 3. Top level
   
   Listing of VHDL code from source file `top.vhd` with all instantiations for the 4-bit bidirectional counter
   
   ```vhdl
     --------------------------------------------------------------------
    -- Instance (copy) of clock_enable entity
    clk_en0 : entity work.clock_enable
        generic map(
            g_MAX => 100000000        
          )
        port map(
            clk   =>  CLK100MHZ,
            reset =>  BTNC,
            ce_o  =>  s_en
        ); 

    --------------------------------------------------------------------
    -- Instance (copy) of cnt_up_down entity
    bin_cnt0 : entity work.cnt_up_down
        generic map(
         g_CNT_WIDTH => 4
          
        )
        port map(
           clk      => CLK100MHZ,
           reset    => BTNC,
           en_i     => s_en,
           cnt_up_i => SW(0),
           cnt_o    => s_cnt
        );  

    -- Display input value on LEDs
    LED(3 downto 0) <= s_cnt;
    
    --------------------------------------------------------------------
    -- Instance (copy) of hex_7seg entity
    hex2seg : entity work.hex_7seg
        port map(
            hex_i    => s_cnt,
            seg_o(6) => CA,
            seg_o(5) => CB,
            seg_o(4) => CC,
            seg_o(3) => CD,
            seg_o(2) => CE,
            seg_o(1) => CF,
            seg_o(0) => CG
        );

    -- Connect one common anode to 3.3V
    AN <= b"1111_1110";

   ```
   
   Image of the top layer including both counters, ie a 4-bit bidirectional counter from Part 4 and a 16-bit counter with a different time base from Part Experiments on your own. The image can be drawn on a computer or by hand.
   
  
   ![Top Layer](Images/top.jpg)
   
   
   
   
   
