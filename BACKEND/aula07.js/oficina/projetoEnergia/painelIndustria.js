const entrada = require('readline-sync');
const energia = require('./calcularEnergia');

const nomeMaquina = entrada.question("Nome da maquina: ");
const potencia = entrada.questionInt("Potencia em Watts: ");
const horas = entrada.questionInt("Horas de uso no mes: ");
const precoKwh = entrada.questionFloat("Preco do kWh: ");

const totalKwh = energia.calcularkwh(potencia, horas);
const custo = energia.calcularcusto(totalKwh, precoKwh);
const classificacao = energia.calcularconsumo(totalKwh);

console.log(`
===== Relatorio de Eficiencia =====
Maquina: ${nomeMaquina.toUpperCase()};
Consumo: ${totalKwh} kWh;
Custo: R$ ${custo.toFixed(2)};
Classificacao: ${classificacao}`);
console.log("-".repeat(15));
