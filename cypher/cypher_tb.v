/*
* Filename: cypher_tb.v
* Created on: July  5, 2023
* Author: Lucas Araújo <araujolucas@dcc.ufmg.br>
*/

`include "definitions.v"

// Testbench do módulo cypher
module cypher_tb;
   reg clk;
   reg reset;
   reg enable;
   reg [7:0] seed;
   reg [`MSG_SIZE - 1 : 0] plaintext;
   wire [`MSG_SIZE - 1 : 0] ciphertext;
   wire [`MSG_SIZE - 1 : 0] decrypted_text;
   wire [`MSG_SIZE - 1 : 0] otp_out;

   shifter sh (.clk(clk), .reset(reset), .en(enable), .seed(seed), .out(otp_out));
   cypher ci (.clk(clk), .otp(otp_out), .plaintext(plaintext), .ciphertext(ciphertext));

   initial
     begin
        clk = 0;
        reset = 1;
        enable = 1;
        seed = 8'b00110011;

        #3 reset = 0;
        enable = 1;

        // MSG -> Pearl Jam - Black
        plaintext = `MSG;

        #10 $finish;
     end // initial begin

   always @(posedge clk)
     begin
        $display("plaintext : %s", plaintext);
        $display("ciphertext: %s", ciphertext);
        $display("decrypted : %s", ciphertext ^ otp_out);
     end

   always
     begin
        #10 clk = !clk;
     end

   initial
     begin
        $dumpfile("waveform.vcd");
        $dumpvars();
        #5 reset = 0;
        #5 enable = 1;
     end

endmodule // shifter_tb
