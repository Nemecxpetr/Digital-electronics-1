# Logic gates

[My playground](https://www.edaplayground.com/x/DcV5):
```vhdl
architecture dataflow of gates is
begin
    f_o  <= (not b_i and a_i) or (not b_i and not c_i);
    fnand_o <= not(not((not b_i) and a_i) and not(not c_i and not b_i));
    fnor_o <= not(b_i or not a_i) or not(c_i or b_i);

end architecture dataflow;
```

| **c** | **b** |**a** | **f(c,b,a)** | **f(c,b,a)nand** | **f(c,b,a)nor** |
| :-: | :-: | :-: | :-: | :-: | :-: |
|  0  |  0  |  0  |  1  |  1  |  1  | 
|  0  |  0  |  1  |  1  |  1  |  1  |   
|  0  |  1  |  0  |  0  |  0  |  0  |    
|  0  |  1  |  1  |  0  |  0  |  0  |     
|  1  |  0  |  0  |  1  |  1  |  1  |   
|  1  |  0  |  1  |  1  |  1  |  1  |   
|  1  |  1  |  0  |  0  |  0  |  0  |    
|  1  |  1  |  1  |  0  |  0  |  0  |   
