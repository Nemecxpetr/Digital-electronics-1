# 02 Logic

## Lab assignment

1. Preparation tasks (done before the lab at home). Submit:
  * -[x] Binary comparator truth table.

2. A 2-bit comparator. Submit:
  * -[x] Karnaugh maps for all three functions.
  * -[x] Simplified SoP form of the "greater than" function 
  * -[x] And simplified PoS form of the "less than" function.


3. A 4-bit binary comparator. Submit:
  * -[ ] Listing of VHDL code (`design.vhd`),
  * -[ ] Listing of VHDL testbench (`testbench.vhd`),
  * -[ ] Listing of simulator console output, i.e. with reported error,
  * -[ ] Link to your public EDA Playground example.

## 1 Binary coparator truth table

| **Dec. equivalent** | **B[1:0]** | **A[1:0]** | **B is greater than A** | **B equals A** | **B is less than A** |
| :-: | :-: | :-: | :-: | :-: | :-: |
| 0  | 0 0 | 0 0 | 0 | 1 | 0 |
| 1  | 0 0 | 0 1 | 0 | 0 | 1 |
| 2  | 0 0 | 1 0 | 0 | 0 | 1 |
| 3  | 0 0 | 1 1 | 0 | 0 | 1 |
| 4  | 0 1 | 0 0 | 1 | 0 | 0 |
| 5  | 0 1 | 0 1 | 0 | 1 | 0 |
| 6  | 0 1 | 1 0 | 0 | 0 | 1 |
| 7  | 0 1 | 1 1 | 0 | 0 | 1 |
| 8  | 1 0 | 0 0 | 1 | 0 | 0 |
| 9  | 1 0 | 0 1 | 1 | 0 | 0 |
| 10 | 1 0 | 1 0 | 0 | 1 | 0 |
| 11 | 1 0 | 1 1 | 0 | 0 | 1 |
| 12 | 1 1 | 0 0 | 1 | 0 | 0 |
| 13 | 1 1 | 0 1 | 1 | 0 | 0 |
| 14 | 1 1 | 1 0 | 1 | 0 | 0 |
| 15 | 1 1 | 1 1 | 0 | 1 | 0 |

According to the truth table, write canonical SoP (Sum of Products) and PoS (Product of Sums) forms for "equals" and "less than" functions:

![Binary comparator functions](Images/comparator.png)

## 2 - A 2-bit binary comparator
Karnaugh maps for all free functions

![Karnaugh](Images/Karnaugh.png)

Simplified SoP form of the "greater than" function and a PoS form of the "less than" function:

![Simplified equations](Images/2_equations.png)

## 3 - A 4-bit binary comparator

EDA Playground [link](https://www.edaplayground.com/x/pQ3D)

```vhdl
architecture Behavioral of comparator_2bit is
begin

    B_less_A_o   <= '1' when (b_i < a_i) else '0';
    B_equals_A_o <= '1' when (b_i = a_i) else '0';
    B_greater_A_o <= '1' when (b_i > a_i) else '0';
    
end architecture Behavioral;
```


