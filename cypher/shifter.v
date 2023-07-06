/*
* Filename: shifter.v
* Created on: July  5, 2023
* Author: Lucas Araújo <araujolucas@dcc.ufmg.br>
*/

`include "definitions.v"

/**
 * @brief Deslocador de bits que gera a chave OTP
 * @param clk Clock do dispositivo
 * @param en Habilita ou desabilita o módulo
 * @param seed Semente geradora
 * @return out OTP gerado pelo deslocamento
*/
module shifter(input wire clk,
               input wire                    reset,
               input wire                    en,
               input wire [7:0]              seed,
               output wire [`MSG_SIZE - 1:0] out);

   reg [`MSG_SIZE - 1:0] shift_reg;

   always @(posedge clk or posedge reset)
     begin
        if (reset)
          shift_reg <= {`MSG_SIZE{seed}};

        else if (en)
          shift_reg <= {shift_reg[`MSG_SIZE - 9 : 8], shift_reg[`MSG_SIZE - 1 : 8]}; // Deslocamento de 1 byte
     end

   assign out = shift_reg;

endmodule // shifter
