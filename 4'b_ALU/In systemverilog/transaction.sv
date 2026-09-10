//**TRANSACTION**//
class transaction;
  rand bit[3:0]a;
  rand bit[3:0]b;
  randc bit[2:0]opcode;
  bit [3:0]result;
  bit cout;
  function void display(string tag="");
    $display("%s opcode=%b a=%b b=%b ",tag,opcode,a,b);
  endfunction
endclass
