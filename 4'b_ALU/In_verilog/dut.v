// Code your design here
module alu_4bit(
  input [3:0]a, //input
  input [3:0]b, //input
  input [2:0]opcode, //operation controller
  output reg [3:0]result,  //output
  output reg cout,   //for carry flag 
  output zero_flag   // for zero flag
);
  always@(*) begin
    cout = 1'b0;
    case(opcode)
      3'b000: {cout, result} = a + b; //addition
      3'b001: {cout, result} = a - b; //subtraction
      3'b010: result = a & b;  //AND operation
      3'b011: result = a | b;  //OR operation
      3'b100: result = a ^ b;  //Xor operation
      3'b101: result = ~a;  //NOT operation
      3'b110: result = ~(a & b);  //NAND operation
      3'b111: result = ~(a|b);  //NOR operation
      default: result = 4'b0000;
    endcase
  end
  assign zero_flag = (result == 4'b0000); // if result is ZERO then, the zero flag will active
endmodule
