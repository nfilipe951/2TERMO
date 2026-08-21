// • O Verificador de Votação (Básico)
// • Objetivo: Praticar `if/else` simples.
// • Enunciado: Crie um programa que peça o nome do usuário e o
// ano de nascimento. O programa deve calcular a idade e dizer se
// ele já tem idade mínima para votar (16 anos).


const entrada = require('readline-sync');

console.log("---Verificador de votação---");

const nome = entrada.question('Nome do cliente:');
const idade = entrada.questionInt('Digite o ANO de nascimento:');

atual = (2026-idade)

if (atual < 16) {
    console.log(`\nVocê tem ${atual} anos, Não poderá votar`);
} else if (atual >= 16) {
    console.log(`\nPARABENS você tem ${atual}anos, Poderá votar!`);
}

