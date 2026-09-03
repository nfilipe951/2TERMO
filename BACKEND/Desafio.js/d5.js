// • Desafio 5: O Simulador de Empréstimo (Operadores Lógicos)
// • Objetivo: Praticar `&&` e `||`.
// • Enunciado: Um banco aprova empréstimos se o cliente preencher
// dois requisitos:
// • 1. Ter renda mensal acima de R$ 2.000,00.
// • 2. NÃO ter o nome sujo (pergunte ao usuário: "Seu nome está limpo?
// true/false").
// • O programa deve ler a renda e o status do nome e dizer "Empréstimo
// Aprovado" ou "Empréstimo Negado".






const entrada = require('readline-sync');

console.log(`--SIMULADOR DE EMPRÉSTIMO---`);

const nome = entrada.question("Digite seu nome e se está limpo:") // true or false
const renda = entrada.questionFloat("Digite sua renda mensal: ");

if (renda >= 2000) {
    console.log(`\nParabéns ${nome}, Empréstimo aprovado!`)
} else {
    console.log(`\nSinto muito ${nome}, Empréstimo negado!`)
}



