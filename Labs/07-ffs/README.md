# 7 Latches and Flip-flops

## Lab assignment

1. Preparation tasks (done before the lab at home). Submit:
    * -[x] Characteristic equations and completed tables for D, JK, T flip-flops.

2. D latch. Submit:
    * -[x] VHDL code listing of the process `p_d_latch` with syntax highlighting,
    * -[x] Listing of VHDL reset and stimulus processes from the testbench `tb_d_latch` file with syntax highlighting and asserts,
    * -[x] Screenshot with simulated time waveforms; always display all inputs and outputs. The full functionality of the entity must be verified.

3. Flip-flops. Submit:
    * -[ ] VHDL code listing of the processes `p_d_ff_arst`, `p_d_ff_rst`, `p_jk_ff_rst`, `p_t_ff_rst` with syntax highlighting,
    * -[ ] Listing of VHDL clock, reset and stimulus processes from the testbench files with syntax highlighting and asserts,
    * -[ ] Screenshot, with simulated time waveforms; always display all inputs and outputs. The full functionality of the entities must be verified.

4. Shift register. Submit:
    * -[ ] Image of the shift register schematic. The image can be drawn on a computer or by hand. Name all inputs, outputs, components and internal signals.
    
## 1. Preparation tasks

Characteristic equations and completed tables for D, JK, T flip-flops
`Qn` represents main output value before clock edge and `Q(n+1)` represents value after the edge.

  | **D** | **Qn** | **Q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-- |
   | 0 | 0 | 0 | no change |
   | 0 | 1 | 0 | change |
   | 1 | 0 | 1 | no change |
   | 1 | 1 | 1 | change |

   | **J** | **K** | **Qn** | **Q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | 0 | 0 | 0 | 0 | No change |
   | 0 | 0 | 1 | 1 | No change |
   | 0 | 1 | 0 | 0 | reset |
   | 0 | 1 | 1 | 0 | reset |
   | 1 | 0 | 0 | 1 | set |
   | 1 | 0 | 1 | 1 | set |
   | 1 | 1 | 0 | 1 | toggle |
   | 1 | 1 | 1 | 0 | toggle |

   | **T** | **Qn** | **Q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-- |
   | 0 | 0 | 0 | no change |
   | 0 | 1 | 1 | no change |
   | 1 | 0 | 1 | invert |
   | 1 | 1 | 0 | invert |
      
 ## 2. D latch
   
 VHDL code listing of the process `p_d_latch`
 
```vhdl
 architecture Behavioral of d_latch is                                                    
                                                                                         
begin                                                                                    
                                                                                         
    ------------------------------------------------------------------------                 
    -- p_alarm:                                                                              
    -- A combinational process of alarm clock.                                               
    ------------------------------------------------------------------------                 
    p_d_latch : process (d, arst, en)                                                        
    begin                                                                                    
        if     (arst = '1')   then                                                                 
            q     <= '0';                                                                    
            q_bar <= '1';                                                                    
        elsif  (en = '1')     then                                                               
            q     <= d;                                                                          
            q_bar <= not d;                                                                  
        end if;                                                                              
    end process p_d_latch;                                                                   
                                                                                             
end Behavioral;                    
```

Listing of VHDL reset and stimulus processes from the testbench `tb_d_latch` file with syntax highlighting and asserts
 
```vhdl
     p_stimulus  : process
     begin
        report "Stimulus process started" severity note;
        
        s_en <= '0';
        s_d  <= '0';
        
        assert(s_q='0' and s_q_bar = '1')
        report "huh" severity error;
        
        --d sekvence
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
        s_d <= '0';
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        s_d <= '0';
     
        assert(s_q='0' and s_q_bar = '1')
        report "huh" severity error;    
        
        --/d select
        s_en <= '1';
        wait for 10 ns;
       
        --d sekvence
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
        s_d <= '0';
            
        assert(s_q='0' and s_q_bar = '1')
        report "huh" severity error;    
        
        --/d select
        s_en <= '0';
        wait for 50 ns;
        
        --d sekvence
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
        s_d <= '0';
            
     report "Stimulus process finished" severity note;
     end process p_stimulus;
```

Screenshot with simulated time waveforms

![Simulation ad2](Images/sim1.png)

## 3. Flip-flops
VHDL code listing of the process `p_d_ff_arst`
```vhdl

```
Listing of VHDL clock, reset and stimulus processes from the testbench files with syntax highlighting and asserts
```vhdl

```

Screenshot with simulated time waveforms

![Simulation ad3](Images/sim2_1.png)

VHDL code listing of the process `p_d_ff_rst`
```vhdl

```
Listing of VHDL clock, reset and stimulus processes from the testbench files with syntax highlighting and asserts
```vhdl

```

Screenshot with simulated time waveforms

![Simulation ad3](Images/sim2_2.png)

VHDL code listing of the process `p_jk_ff_rst`
```vhdl

```
Listing of VHDL clock, reset and stimulus processes from the testbench files with syntax highlighting and asserts
```vhdl

```

Screenshot with simulated time waveforms

![Simulation ad3](Images/sim2_3.png)

VHDL code listing of the process `p_t_ff_rst`
```vhdl

```
Listing of VHDL clock, reset and stimulus processes from the testbench files with syntax highlighting and asserts
```vhdl

```

Screenshot with simulated time waveforms

![Simulation ad3](Images/sim2_4.png)


## Shift register

Image of the shift register schematic. The image can be drawn on a computer or by hand. Name all inputs, outputs, components and internal signals.

