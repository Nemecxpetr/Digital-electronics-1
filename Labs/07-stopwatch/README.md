# 7. Stopwatch

## Lab assignment

1. Stopwatch. Submit:
    * VHDL code of the process `p_stopwatch_cnt`,
    * VHDL code of the simulation process `p_stimulus`,
    * Screenshot(s) of the simulation, from which it is clear that start, pause and reset work correctly,
    * VHDL code of the top layer architecture.

2. Stopwatch with minutes. Submit:
    * (Hand-drawn) sketch of the stopwatch schematic.

## Preparation tasks (done before the lab at home)

Consider the clock enable circuit from previous laboratories and find out the values of its parameter `g_MAX` so that the output signal `ce_o` has the frequency 100&nbsp;Hz or 1&nbsp;kHz. Let the frequency of the main clock signal be 100&nbsp;MHz.

   | **Frequency** | **Number of clk periods (g_MAX)** | **Number of clk periods in hex** | **Number of clk periods in binary** |
   | :-: | :-: | :-: | :-: |
   | 100&nbsp;Hz | 10 000 000 | `x"98_9680"` | `b"1001 1000 1001 0110 1000 0000"` |
   | 1000&nbsp;Hz | 1 000 000 |  `x"F_4240"` | `b"0000 1111 0100 0010 0100 0000"` |
       
## 1. Stopwatch
    
## 2. Stopwatch with minutes
