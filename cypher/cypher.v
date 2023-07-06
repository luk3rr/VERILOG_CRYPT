/*
* Filename: cypher.v
* Created on: July  5, 2023
* Author: Lucas Araújo <araujolucas@dcc.ufmg.br>
*/

`include "definitions.v"

/**
 * @brief Criptografa um texto a partir de uma chave OTP
 * @param clk Clock do dispositivo
 * @param otp Chave OTP que será utilizada na criptografia
 * @param plaintext Texto que será criptografado
 * @return ciphertext Texto criptografado
*/
module cypher (input wire                      clk,
               input wire [`MSG_SIZE - 1 : 0]  otp,
               input wire [`MSG_SIZE - 1 : 0]  plaintext,
               output wire [`MSG_SIZE - 1 : 0] ciphertext);

   assign ciphertext = plaintext ^ otp;

endmodule // cypher
