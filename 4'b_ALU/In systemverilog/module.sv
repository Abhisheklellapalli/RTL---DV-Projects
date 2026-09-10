module alu_tb;
  generator gene=new();
  driver dri=new();
  monitor mon=new();
  scoreboard scb=new();
  mailbox mbx=new();
  mailbox mbxx=new();
  alui inf();
  event drv_done;
    alu_4bit dut(.a(inf.a),
                 .b(inf.b),
                 .opcode(inf.opcode),
                 .result(inf.result),
                 .cout(inf.cout),
                 .zero_flag(inf.zero_flag)
                );
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0,alu_tb);
      gene.mb=mbx;
      dri.mb=mbx;
      dri.intrf=inf;
      mon.mintr=inf;
      mon.mmb=mbxx;
      scb.smbx=mbxx;
      mon.drv_done=drv_done;
      dri.drv_done=drv_done;
      
      fork
        dri.driv();
        mon.moni();
        scb.scb();
      join_none
        
          #50;
        gene.gen();
      #50;
      
          $display("====TEST SUMMARY====");
          $display("Pass_count=%d | Fail_count=%d",scb.pass_count,scb.fail_count);
    end
endmodule
