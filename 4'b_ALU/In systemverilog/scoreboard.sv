//**SCOREBOARD**//
class scoreboard;
  transaction tx;
  mailbox smbx;
  driver dvr;
  virtual alui intrf;
  int pass_count=1'b0;
  int fail_count=1'b0;
  task automatic ref_model(   // Reference model
    input [3:0]a,
    input [3:0]b,
    input [2:0]opcode,
    output [3:0]exp_result,
    output exp_cout
    );
    begin
      exp_cout = 1'b0;
      case(opcode)
      3'b000: {exp_cout, exp_result} = a + b;
      3'b001: {exp_cout, exp_result} = a - b;
      3'b010: exp_result = a & b;
      3'b011: exp_result = a | b;
      3'b100: exp_result = a ^ b;
      3'b101: exp_result = ~a;
      3'b110: exp_result = ~(a & b);
      3'b111: exp_result = ~(a|b);
      default: exp_result = 4'b0000;
      endcase
    end
  endtask
  
  task scb();
    bit [3:0]exp_result;
    bit exp_cout;
    forever 
      begin
        smbx.get(tx);
        ref_model(tx.a,tx.b,tx.opcode,exp_result,exp_cout);
        if(tx.result==exp_result && tx.cout==exp_cout) begin
          $display(" SCOREBOARD:PASS | opcode=%b a=%b b=%b result=%b cout=%b",tx.opcode,tx.a,tx.b,tx.result,tx.cout);
          pass_count++;
          end else begin
            $display("SCOREBOARD:FAIL | opcode=%b a=%b b=%b DUT_result=%b DUT_cout=%b EXPECTED_result=%b EXPECTED_cout=%b",
             tx.opcode,tx.a,tx.b,tx.result,tx.cout,exp_result,exp_cout);
            fail_count++;
          end
      end
  endtask
endclass
