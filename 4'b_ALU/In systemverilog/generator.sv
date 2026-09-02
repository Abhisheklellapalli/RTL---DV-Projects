//**GENERATOR**//
class generator;
  transaction tx;
  mailbox mb;
  task gen();
    repeat(15) begin
      tx=new();
      assert(tx.randomize());
      mb.put(tx);
      #1;
      tx.display("generator values");
    end
  endtask
endclass
