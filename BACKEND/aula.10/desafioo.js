// em vez de buscar um produto especifico, usem o comando .filter() para mostrar na tela uma lista de todos os produtos que tenham menos de 100 unidades no estoque 

// const fs = require('fs');
// const { json } = require('stream/consumers');

// const produtos = [
//     {id:1, nome: "parafuso", qtd:100},
//     {id:2, nome: "porca", qtd:250},
//     {id:3, nome: "Arruela", qtd:50},
//     {id:4, nome: "Abraçadeira", qtd:10},
    
// ];


// function salvarDados() {
//     const dadosTexto = JSON.stringify(produtos, null, 2);
//     fs.writeFileSync('estoque.json', dadosTexto);
//     console.log("Dados Salvos com sucesso no arquivo estoque.json!");
// }
// function verEstoqueBaixo (){
//     console.log("\n--- Produtos com estoque baixo (menos de 100) ---");

//     const baixoEstoque = produtos.filter (p => p.qtd <100);
//     console.log(baixoEstoque);

// }
// salvarDados();
// verEstoqueBaixo();


// 🔍 Desafio 2: Localizador de Crachás (Uso de .find e Atualização)
// "Pessoal, agora vamos simular o sistema da portaria. Temos um arquivo de funcionários e precisamos verificar se um ID digitado existe no sistema.
// O que vocês devem fazer:
// Crie um arquivo chamado funcionarios.json com alguns nomes e IDs (ex: { "id": 101, "nome": "Ana", "setor": "Usinagem" }).
// O programa deve pedir para o usuário digitar um ID.
// Use o método .find() para localizar o funcionário com aquele ID.
// Se encontrar: Mostre o nome e o setor dele.
// Se NÃO encontrar: Mostre 'Acesso Negado: ID não encontrado'.
// DESAFIO EXTRA (Nível Pro): Se o funcionário for encontrado, pergunte para qual setor ele vai mudar, atualize o objeto no JavaScript e salve o arquivo JSON com a informação nova."

const fs = require('fs');
const { json } = require('stream/consumers');

const produtos = [
    {id:1, nome: "Luisa", setor: "usinagem"},
    {id:2, nome: "Ligia", setor:"ferramentaria"},
    {id:3, nome: "Livia", setor:"elétrica"},
    {id:4, nome: "Luis", setor: "usinagem"},
    
];
function salvarDados() {
    const dadosTexto = JSON.stringify(produtos, null, 2);
    fs.writeFileSync('funcionarios.json', dadosTexto);
    console.log("Dados Salvos com sucesso no arquivo funcionarios.json!");
}

