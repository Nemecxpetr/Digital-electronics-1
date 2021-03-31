# 8. Traffic light controller

## Lab assignment

1. Preparation tasks (done before the lab at home). Submit:
    * -[x] Completed state table,
    * -[x] Figure with connection of RGB LEDs on Nexys A7 board and completed table with color settings.

2. Traffic light controller. Submit:
    * -[ ] Listing of VHDL code of sequential process `p_traffic_fsm` with syntax highlighting,
    * -[ ] Listing of VHDL code of combinatorial process `p_output_fsm` with syntax highlighting,
    * -[ ] Screenshot(s) of the simulation, from which it is clear that controller works correctly.
    <!--* -[ ] Listing of VHDL architecture of the top layer.-->

3. Smart controller. Submit:
    * -[ ] State table,
    * -[ ] State diagram,
    * -[ ] Listing of VHDL code of sequential process `p_smart_traffic_fsm` with syntax highlighting.

## Preparation tasks (done before the lab at home)

Read the article [Implementing a Finite State Machine in VHDL](https://www.allaboutcircuits.com/technical-articles/implementing-a-finite-state-machine-in-vhdl/) (parts **A Bit of Background** and **The Finite State Machine**) and understand what an FSM is.

Fill in the table with the state names and output values accoding to the given inputs. Let the reset has just been applied.

| **Input P** | `0` | `0` | `1` | `1` | `0` | `1` | `0` | `1` | `1` | `1` | `1` | `0` | `0` | `1` | `1` | `1` |
| :-- | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| **Clock** | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) |
| **State** | A | A | B | C | C | D | A | B | C | D | B | B | B | c | D | B |
| **Output R** | `0` | `0` | `0` | `0` | `0` | `1` | `0` | `0` | `0` | `1` | `0` | `0` | `0` | `0` | `1` | `0` |

See schematic or reference manual of the Nexys board and see table with the connection of two RGB LEDs. 

![Nexys reference manual](Images/nexys_ref.png)


| **RGB LED** | **Artix-7 pin names** | **Red** | **Yellow** | **Green** |
| :-: | :-: | :-: | :-: | :-: |
| LD16 | N15, M16, R12 | `1,0,0` | `0,1,0` | `0,0,1` |
| LD17 |  N16, R11, G14| `1,0,0` | `0,1,0` | `0,0,1` |
