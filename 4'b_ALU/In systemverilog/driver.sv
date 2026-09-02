//**DRIVER**//
class driver;
  transaction tx;
  mailbox mb;
  virtual alui intrf;
  task driv();
    forever
      begin
        mb.get(tx);
        intrf.a=tx.a;
        intrf.b=tx.b;
        intrf.opcode=tx.opcode;
        #2;
        tx.display("driver values");
        $display("result=%b cout=%b zero_flag=%b",intrf.result,intrf.cout,intrf.zero_flag);
      end
  endtask
endclass
