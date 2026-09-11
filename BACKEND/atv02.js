const entrada = require('readline-sync') ;

const nome = entrada.question('Nome do aluno? ');
const n1 = entrada.question('Nota 1: ');
const n2 = entrada.question('Nota 2: ');

const media = (n1 + n2) / 2;

console.log(`\nMedia final de ${nome}: ${media.toFixed(1)}`);

if (media >= 7) {
    console.log('SITUACAO:APROVADO!');
} else if (media >= 5 && media < 7) {
    console.log('SITUACAO:RECUPERAÇÃO!');
} else {
    console.log('SITUACAO: REPROVADO!');
}
