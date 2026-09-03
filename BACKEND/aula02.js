// const entrada = require('readline-sync');

// console.log("---Sistema de analise de crédito---");

// // coleta de dados
// const nome = entrada.question("Nome do cliente:");
// const idade = entrada.questionInt("Idade: ");
// const renda = entrada.questionFloat("Renda mensal: ");
// const temImovel = entrada.KeyInYNStrict("Possui imovel proprio? ");//

// // logica combinada
// // (idade >= 18) é obrigatório
// // (renda >= 2500 || temImovel === true) um dos dois tem que ser verdade
// if (idade >= 18 && (renda >= 2500 || temImovel === true)) {
//     console.log(`\nPARABENS, ${nome}! seu credito foi APROVADO!`);
// } else {
//         console.log(`\nSinto muito, ${nome} seu credito foi NEGADO!`);
// }



// let contador = 0;

// while (contador <= 100) {
//     console.log(`Contagem: ${contador}`);
//     contador ++; // isso aumenta 1 no contador (IMPORTANTE!)
// }
// console.log("Fim da contagem!");



// const entrada = require(`readline-sync`)
// const num = entrada.questionInt("Tabuada de qual qual numero? ");

// for (let i = 1; i <= 10; i++ ) {
//     console.log(`${num} x ${i} = ${num * i}`)
// }


// const entrada = require('readline-sync');

// let opcao = 0;

// // O programa vai repetir tudo o que estiver aqui dentro
// while (opcao !== 3) {
//     console.log("\n=== MENU DA PADARIA ===");
//     console.log("1. Calcular Venda");
//     console.log("2. Ver Horario de Funcionamento");
//     console.log("3. Sair");
   
//     opcao = entrada.questionInt("Escolha uma opcao: ");

//     if (opcao === 1) {
//         let preco = entrada.questionFloat("Preco do produto: ");
//         let qtd = entrada.questionInt("Quantidade: ");
//         console.log(`Total: R$ ${(preco * qtd).toFixed(2)}`);
//     } else if (opcao === 2) {
//         console.log("Funcionamos das 07h as 22h.");
//     } else if (opcao === 3) {
//         console.log("Saindo do sistema...");
//     } else {
//         console.log("Opcao invalida!");
//     }
// }


