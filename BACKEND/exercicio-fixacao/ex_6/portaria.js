// Atividade 6: Cadastro de Visitantes da Fábrica (Array de Objetos)
// Foco: Criar uma lista de objetos preenchida dinamicamente.
// "Agora o nível subiu! Vamos fazer o sistema da portaria. Eu não quero guardar
// apenas o nome do visitante, eu quero guardar o Nome e a Empresa de onde ele
// vem.
// O que vocês devem fazer:
// 1. Crie um array vazio chamado listaVisitantes.
// 2. Crie um laço while que pergunte: 'Deseja cadastrar um novo visitante?
// (s/n)'.
// 3. Se a resposta for 's':
// o Peça o Nome e a Empresa.
// o Crie um objeto { nome: ..., empresa: ... }.
// o Dê um .push() desse objeto para dentro da sua lista.

// 4. Se a resposta for 'n':
// o Pare o laço e mostre na tela a lista de todos os visitantes que
// entraram hoje."


const entrada = require('readline-sync');

const listaVisitantes = [];

let continuar = entrada.question('Deseja cadastrar um novo visitante? (s/n) ');

while (continuar === 's') {
    let nome = entrada.question('Digite o nome do visitante: ');
    let empresa = entrada.question('Digite a empresa: ');

    let visitante = {
        nome: nome,
        empresa: empresa
    };

    listaVisitantes.push(visitante);

    continuar = entrada.question('Deseja cadastrar um novo visitante? (s/n) ');
}

console.log("\nLista de todos os visitantes que entraram hoje:");
console.log(listaVisitantes);