//**TOP MODULE**//
module alu_tb;
  generator gene=new();
  driver dri=new();
  mailbox mbx=new();
  alui inf();
    alu_4bit dut(.a(inf.a),
                 .b(inf.b),
                 .opcode(inf.opcode),
                 .result(inf.result),
                 .cout(inf.cout),
                 .zero_flag(inf.zero_flag)
                );
    initial begin
      gene.mb=mbx;
      dri.mb=mbx;
      dri.intrf=inf;
      fork
        gene.gen();
      join_none
        dri.driv();
    end
  initial begin
    #200;
    $display("===simulation is complete===");
    $finish;
  end
endmodule
