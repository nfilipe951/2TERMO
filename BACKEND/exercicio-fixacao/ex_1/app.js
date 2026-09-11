// 1. Crie uma pasta chamada atividade1.
// 2. Crie o arquivo conversor.js (Módulo). Dentro dele, crie uma função que
// recebe um valor em Dólar e retorna em Real (considere o dólar a R$ 5,00).
// 3. Exporte essa função.
// 4. Crie o arquivo app.js. Peça o valor em dólar ao usuário, use a ferramenta do
// módulo e mostre o resultado.

const entrada = require('readline-sync');
const calculo = require('./conversor');

console.log ("Bem-Vindo ao conversor de Dolar --- Real");
const Dolar = entrada.questionFloat ("Digite o valor para conversão");

const valorReal = calculo.converter(Dolar);
console.log (`Valor em real: R$ ${valorReal.toFixed(2)}`);
