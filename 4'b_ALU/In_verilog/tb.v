// Code your testbench here
// or browse Examples
module alu_4bit_tb;
  reg [3:0]a;
  reg [3:0]b;
  reg [2:0]opcode;
  wire [3:0]result;
  wire cout;
  alu_4bit dut(.a(a),
               .b(b),
               .opcode(opcode),
               .result(result),
               .cout(cout));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, alu_4bit_tb);
    repeat(15) begin
      a = $urandom_range(0,15); 
      b = $urandom_range(0,15);
      opcode = $urandom_range(0,7);
      #1;
      $display("opcode = %b(%d), a=%b(%d), b=%b(%d), Result=%b(%d), cout=%b(%d)",opcode,opcode,a,a,b,b,result,result,cout,cout);
    end
  end
endmodule
