# Especificação Descritiva:

O módulo "ff\_d\_sinc" é um flip-flop D síncrono com as seguintes entradas e saída:

Entradas:
- "clk" (wire): Sinal de clock utilizado para sincronizar as operações do flip-flop.
- "en" (wire): Sinal de habilitação que controla o funcionamento do flip-flop.
- "reset" (wire): Sinal de reset que redefine o estado do flip-flop.
- "d" (wire): Entrada de dados que será armazenada no flip-flop.

Saída:
- "q" (reg): Saída de dados do flip-flop.

## Comportamento:
O flip-flop D síncrono armazena o valor de entrada "d" na saída "q" em cada transição de
subida do sinal de clock "clk", quando o sinal de habilitação "en" está ativo. No entanto, se
o sinal de reset "reset" estiver ativo, a saída "q" é redefinida para o valor lógico "0".

# Especificação Comportamental:

O comportamento do módulo "ff\_d\_sinc" pode ser descrito da seguinte forma:

Sempre que ocorrer uma transição de subida no sinal de clock "clk", os seguintes passos
serão executados:

1. Verifica se o sinal de reset "reset" está ativo.
    - Se estiver ativo, define a saída "q" como "0".
    - Caso contrário, continua para o próximo passo.

2. Verifica se o sinal de habilitação "en" está ativo.
    - Se estiver ativo, define a saída "q" como o valor presente na entrada "d".
    - Caso contrário, mantém o valor atual da saída "q".
