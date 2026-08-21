const entrada = require('readline-sync');

const nome = entrada.questionInt('idade do aluno? \n');
const autorizacao = entrada.question('Possui autorizacao? (S/N) \N')
const acpd= entrada.question('Está acompanhado por algum professor? (S/N)')

if(idade <= 16 &&  autorizacao === "S" || acpd === "S" ) {
 console.log(`Acesso liberado!`);
} else {
console.log(`Acesso negado!`);
}
