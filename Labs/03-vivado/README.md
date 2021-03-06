# 3 Vivado

## Lab assignment

1. Preparation tasks (done before the lab at home). Submit:
    * -[x] Figure or table with connection of 16 slide switches and 16 LEDs on Nexys A7 board.

2. Two-bit wide 4-to-1 multiplexer. Submit:
    * -[x] Listing of VHDL architecture from source file `mux_2bit_4to1.vhd` with syntax highlighting,
    * -[x] Listing of VHDL stimulus process from testbench file `tb_mux_2bit_4to1.vhd` with syntax highlighting,
    * -[x] Screenshot with simulated time waveforms; always display all inputs and outputs.

3. A Vivado tutorial. Submit:
    * -[x] Your tutorial for Vivado design flow: project creation, adding source file, adding testbench file, running simulation, (adding XDC constraints file).

## 1. Table with connection of 16 slide switches and 16 LEDs on Nexys A7 board
From this [schematic](https://github.com/tomas-fryza/Digital-electronics-1/blob/master/Docs/nexys-a7-sch.pdf) we can see the connections of slide switches and LEDs on Nexys A7 board and to which FPGA pins they are connected and how.

| **SW** | **SW pins** | **SW Connection type** | **LEDs** | **LED pins** | **SW Connection Type**  |
| :-: | :-: | :-: | :-: | :-: | :-: |
| 1  | J15 | IOSTANDARD LVCMOS33 | 1  | H17 |IOSTANDARD LVCMOS33 |
| 2  | L16 | IOSTANDARD LVCMOS33 | 2  | K15 |IOSTANDARD LVCMOS33 |
| 3  | M13 | IOSTANDARD LVCMOS33 | 3  | J13 |IOSTANDARD LVCMOS33 |
| 4  | R15 | IOSTANDARD LVCMOS33 | 4  | N14 |IOSTANDARD LVCMOS33 |
| 5  | R17 | IOSTANDARD LVCMOS33 | 5  | R18 |IOSTANDARD LVCMOS33 |
| 6  | T18 | IOSTANDARD LVCMOS33 | 6  | V17 |IOSTANDARD LVCMOS33 |
| 7  | U18 | IOSTANDARD LVCMOS33 | 7  | U17 |IOSTANDARD LVCMOS33 |
| 8  | R13 | IOSTANDARD LVCMOS33 | 8  | U16 |IOSTANDARD LVCMOS33 |
| 9  | T8  | IOSTANDARD LVCMOS18 | 9  | V16 |IOSTANDARD LVCMOS33 |
| 10 | U8  | IOSTANDARD LVCMOS18 | 10 | T15 |IOSTANDARD LVCMOS33 |
| 11 | R16 | IOSTANDARD LVCMOS33 | 11 | U14 |IOSTANDARD LVCMOS33 |
| 12 | T13 | IOSTANDARD LVCMOS33 | 12 | T16 |IOSTANDARD LVCMOS33 |
| 13 | H6  | IOSTANDARD LVCMOS33 | 13 | V15 |IOSTANDARD LVCMOS33 |
| 14 | U12 | IOSTANDARD LVCMOS33 | 14 | V14 |IOSTANDARD LVCMOS33 |
| 15 | U11 | IOSTANDARD LVCMOS33 | 15 | V12 |IOSTANDARD LVCMOS33 |
| 16 | V10 | IOSTANDARD LVCMOS33 | 16 | V11 |IOSTANDARD LVCMOS33 |


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
If you want to create vhdl code in Vivado here is a short tutorial on how to begin.


When you open Vivado 2020.2 you should see this window:
![Vivado start](Images/vivado01.png)

* Click on `Create project`.


### ![Vivado start](Images/vivado02.png)
* Click `Next` to chose Project name and Location.
* Project name is in our case `Comparator` and location is a place on our hard drive where all the files are gonna be stored in one file folder. This folder is gonna be created by the program and named with the Project name.

### ![Vivado start](Images/vivado03.png)
* Click `Next` until you see the page for adding sources.
* Don't worry though. You can alwas click `Back` and change everything you need.


### ![Vivado start](Images/vivado04.png)
* `Create File` to create an equivalent to `design.vhd` in EDA Playground. 

### ![Vivado start](Images/vivado05.png)
* Click `Next` and you can add constraints (`.xdc`) You can skip this step for you can add them later while working on the project. But the proces is same as before.
Constraints specifies which pin from a board (a board we are gonna add to our project in the next step) we are gonna use for which input or output signals of our code.
That's basically a reason why it is ok to skip this step and do it  

Next step is important for connection of our project to a particular board from Xilinx we want to use so pay attention. If you want to use Nexys 50 but don't have it [here](https://github.com/Standa-R/test-Digital-electronics-1/blob/main/HowToAddNexysA7-50TToVivado.md) is a tutorial on how to add it.

### ![Vivado start](Images/vivado06.png)

* Click on `Boards` and choose which one you are gonna be using. In our case we will use Nexus A7-50T

### ![Vivado start](Images/vivado07.png)

* Click `Next` and you will see a summary. If there is some problem or you made a mistake feel free to go back and change everything we did so far.

### ![Vivado start](Images/vivado08.png)

* Click `Finish` and the project will be made.

### ![Vivado Project](Images/vivado09.png)

* In sources you can open your `.vhd` file and write your code. 

### ![Vivado Project](Images/vivado10.png)
* For creating a "testbench" file chose `File/Add Sources` or a shortcut `Alt + A`
* There you can create simulation sources (process is the same as when creating the `Design.vhd` earlier)

### ![Vivado Project](Images/vivado11.png)

* Last thing you might be interested in is runnig the simulation. 
* That is done via `Flow/Run Simulation/Run Behavioral Simulation`

![image](https://user-images.githubusercontent.com/78843182/109514709-9ea97e80-7aa6-11eb-8c1e-3b1ac6b76ba2.png)









