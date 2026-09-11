const entrada = require('readline-sync') ;
const idade = entrada.question('Qual a sua idade? ');

if (idade >= 18) {
    console.log('Acesso liberado! Diverta-se.');
} else {
    console.log('Acesso negado. Vá para casa estudar Node.js!');
}