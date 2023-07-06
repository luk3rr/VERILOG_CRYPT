/*
* Filename: shifter_tb.v
* Created on: July  6, 2023
* Author: Lucas Araújo <araujolucas@dcc.ufmg.br>
*/

`include "definitions.v"

// Testbench do módulo shifter
module shifter_tb;
   reg clk;
   reg reset;
   reg enable;
   reg [`MSG_SIZE - 1 : 0] input_data;
   wire [`MSG_SIZE - 1 : 0] out;

   shifter ci(.clk(clk), .reset(reset), .en(enable), .out(out));

   initial
     begin
        clk = 0;
        reset = 1;
        enable = 0;

        input_data = `MSG;

        // Simulação
        #10 reset = 0;
        enable = 1;
        #100 enable = 0;

        #100;

        // Exibir resultados
        $display("Input data: %b", input_data);
        $display("Output data: %b", out);

        $finish;
     end

   always #5 clk = !clk;

endmodule // shifter_tb
