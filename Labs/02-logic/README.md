# 02 Logic

## Lab assignment

1. Preparation tasks (done before the lab at home). Submit:
   * -[x] Binary comparator truth table.

2. A 2-bit comparator. Submit:
  * -[ ] Karnaugh maps for all three functions.
  * -[ ] Simplified SoP form of the "greater than" function and simplified PoS form of the "less than" function.

3. A 4-bit binary comparator. Submit:
  * -[ ] Listing of VHDL code (`design.vhd`),
  * -[ ] Listing of VHDL testbench (`testbench.vhd`),
  * -[ ] Listing of simulator console output, i.e. with reported error,
  * -[ ] Link to your public EDA Playground example.

*Prepare all tasks in your README file `Digital-electronics-1/Labs/02-logic/README.md`, [export/print it to PDF](https://github.com/tomas-fryza/Digital-electronics-1/wiki/Export-MD-to-PDF), use [BUT e-learning](https://moodle.vutbr.cz/) web page and submit a single PDF file. The deadline for submitting the task is the day before the next laboratory exercise.*

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


