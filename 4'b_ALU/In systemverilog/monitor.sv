//**MONITOR**//
class monitor;
  transaction tx;
  mailbox mmb;
  virtual alui mintr;
  event drv_done;
  task moni();
    forever 
      begin
        @(drv_done);
        tx=new();
        tx.a=mintr.a;
        tx.b=mintr.b;
        tx.opcode=mintr.opcode;
        tx.result=mintr.result;
        tx.cout=mintr.cout;
        mmb.put(tx);
        tx.display("MONITOR");
      end
  endtask
endclass
