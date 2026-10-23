// Atividade 4: O "Mercadinho" (Organização de Responsabilidades)

// "Este é o teste final. Quero um sistema de vendas. Mas atenção à regra
// profissional: O arquivo de funções não pode fazer perguntas! Ele apenas recebe
// números e devolve cálculos."

// - Módulo calculosVenda.js:
// - Função calcularTotal(preco, qtd) -> retorna preco * qtd.
// - Função gerarCupom(nome, valor) -> retorna uma string: "Cliente: [nome] -
// Total: R$ [valor]".

// - Programa caixa.js:
// - Faz todos os question do readline-sync.
// - Usa o módulo para processar e imprime o cupom final.

const entrada = require("readline-sync");
const calculo = require ("./calculosVendas");

const nome = entrada.questionInt ("Digite o nome do cliente: \n");
const preco = entrada.questionFloat ("Digite o preco do produto: \n");
const qtd = entrada.questionInt ("Digite a quantidade: \n");

const total = calculoVendas.calculoVendas(preco, qtd);
const cupom = calculoVendas.criarcupom(nome, total);