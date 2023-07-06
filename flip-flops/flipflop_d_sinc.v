/*
* Filename: flipflop_d_sinc.v
* Created on: July  5, 2023
* Author: Lucas Araújo <araujolucas@dcc.ufmg.br>
*/

/**
 * @brief flip-flop D síncrono
 * @param clk Clock do dispositivo
 * @param en Habilita ou desabilita o flip-flop
 * @param d Entrada de dados
 * @return q Saída de dados
*/
module ff_d_sinc(input wire clk,
                 input wire en,
                 input wire reset,
                 input wire d,
                 output reg q);

   always @(posedge clk)
     begin
        if (reset)
          q <= 1'b0;

        else if (en)
          q <= d;
     end

endmodule // ff_d_sinc
