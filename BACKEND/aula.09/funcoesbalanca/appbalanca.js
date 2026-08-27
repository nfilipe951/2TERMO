const readline = require('readline-sync');
const verificarPeso = require('./funcoesbalanca');

while (true) {
    const leitura = readline.question("Digite o peso da peça (ou 'sair'): ");
    if (leitura.toLowerCase() === 'sair') {
        console.log('Sistema encerrado.');
        break;
    }
    try {
        const resultado = verificarPeso(leitura);
        console.log(resultado);
    } catch (erro) {
        console.log(`⚠️ ALERTA: ${erro.message}`);
    }
}







