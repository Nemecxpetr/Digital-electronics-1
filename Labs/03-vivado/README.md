# 3 Vivado

## Lab assignment

1. Preparation tasks (done before the lab at home). Submit:
    * -[] Figure or table with connection of 16 slide switches and 16 LEDs on Nexys A7 board.

2. Two-bit wide 4-to-1 multiplexer. Submit:
    * -[x] Listing of VHDL architecture from source file `mux_2bit_4to1.vhd` with syntax highlighting,
    * -[x] Listing of VHDL stimulus process from testbench file `tb_mux_2bit_4to1.vhd` with syntax highlighting,
    * -[] Screenshot with simulated time waveforms; always display all inputs and outputs.

3. A Vivado tutorial. Submit:
    * -[] Your tutorial for Vivado design flow: project creation, adding source file, adding testbench file, running simulation, (adding XDC constraints file).

## 1. Table with connection of 16 slide switches and 16 LEDs on Nexys A7 board



## 2. Two-bit wide 4-to-1 multiplexer
Architecture from `mux_2bit_4to1.vhd`
```vhdl
architecture Behavioral of mux_2bit_4to1 is
begin

       f_o <= a_i when (sel_i = "00") else
              b_i when (sel_i = "01") else
              c_i when (sel_i = "10") else
              d_i;
                  
end architecture Behavioral;
```
Stimulus process from `tb_mux_2bit_4to1.vhd`
```vhdl
p_stimulus : process
    begin
        
        s_d <= "00"; s_c <= "00"; s_b <= "00"; s_a <= "00";
        s_sel <= "00"; wait for 50 ns;
        
        s_d <= "00"; s_c <= "00"; s_b <= "00"; s_a <= "01";
        s_sel <= "00"; wait for 50 ns;
        
        s_d <= "00"; s_c <= "00"; s_b <= "01"; s_a <= "00";
        s_sel <= "00"; wait for 50 ns;
        
        s_d <= "00"; s_c <= "00"; s_b <= "01"; s_a <= "01";
        s_sel <= "00"; wait for 50 ns;
        
        s_d <= "00"; s_c <= "00"; s_b <= "00"; s_a <= "00";
        s_sel <= "00"; wait for 50 ns;
        
        s_d <= "00"; s_c <= "11"; s_b <= "00"; s_a <= "00";
        s_sel <= "00"; wait for 50 ns;
        
        
        report "Stimulus process finished" severity note;

    wait;
    end process p_stimulus;
```

Simulated time waveforms:

![Simulation](Images/Waveforms.png)

## 3. A Vivado tutorial


