/*
* Filename: flipflop_d_sinc_tb.v
* Created on: July  5, 2023
* Author: Lucas Araújo <araujolucas@dcc.ufmg.br>
*/

// Testbench do flip-flop D síncrono
module ff_d_sinc_tb;
   reg clk, en, reset, d;
   wire q;

   ff_d_sinc ff_d_inst (.clk(clk), .en(en), .reset(reset), .d(d), .q(q));

   always
     #2 clk = !clk;

   initial begin
      clk = 0;
      d = 0;
      en = 1;
      reset = 0;

      #4 d = 1;
      #4 d = 0;
      #4 d = 1;
      #4 d = 0;
      #4 d = 1;
      #4 d = 0;

      #20 $finish;

   end // initial begin

   always @(posedge clk)
     begin
        $display("Tempo %t, q = %b", $time, q);
     end

   initial
     begin
        $dumpfile("waveform.vcd");
        $dumpvars();
        #5 reset = 0;
        #5 en = 1;
     end

endmodule // ff_d_sinc_tb
