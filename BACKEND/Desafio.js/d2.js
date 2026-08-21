// • O "Mão de Vaca" (Cálculo com Decisão)
// • Objetivo:** Praticar cálculos e `if/else`.
// • Enunciado: Um restaurante está dando 10% de desconto para
// contas acima de R$ 100,00. Peça o valor total da conta. Se for
// acima de 100, mostre o valor com desconto. Se for abaixo, mostre
// o valor normal.


const entrada = require('readline-sync');
console.log ("---Cálculo com Decisão");

const conta = entrada.questionFloat ('Digite o valor da conta:\n')

desconto = (conta * 0.10)

if (conta > 100) {
    console.log (`\n parabens voce ganhou um ${desconto}`)
} else {
    console.log (` \n O valor total da conta é ${conta}`);
}
