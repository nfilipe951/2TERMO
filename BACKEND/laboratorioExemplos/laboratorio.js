// const fs = require("fs");
// const texto = fs.readFileSync("maquinas.json", "utf8");
// const maquinas = JSON.parse(texto);
// maquinas.forEach((maquina, indice) => {
// console.log(`${indice + 1}. ${maquina.nome}`);
// });

// // const procurada = maquinas.find(maquina => maquina.id === 99);
// // console.log(procurada); // undefined


// const procurada = maquinas.find(maquina => maquina.id === 2);
// console.log(procurada);

// if (procurada !== undefined) {
// console.log(procurada.nome);
// } else {
// console.log("Máquina não encontrada.");
// }

// const emManutencao = maquinas.filter(
// maquina => maquina.status === "Manutenção"
// );
// console.log(emManutencao.length);
// console.log(emManutencao);


// // const paradas = maquinas.filter(maquina => maquina.status === "Parada");
// // console.log(paradas); // []
// // console.log(paradas.length); // 0


// const fs = require("fs");
// try {
// const texto = fs.readFileSync("maquinas.json", "utf8");
// const maquinas = JSON.parse(texto);
// console.log(`Registros carregados: ${maquinas.length}`);
// } catch (erro) {
// console.log("Não foi possível carregar os dados.");
// console.log(erro.message);
// }


// desafios 


// Desafio A - Desafio A - Fundamental. Exiba uma linha para cada máquina no padrão ID | Nome | Status. Utilize o array carregado do JSON.

console.log("---".repeat(10))
console.log("Maquinas Cadastradas")
console.log("\nID | Nome      | Status");
maquinas.forEach(maquina => {
    console.log(`${maquina.id} | ${maquina.nome} | ${maquina.status}`);
});

// Desafio B - Intermediário. Leia um ID de uma variável, localize a máquina e mostre o setor. Se não existir, apresente uma mensagem amigável.

const id = 2;
const maquinaAchada = maquinas.find(maquina => maquina.id === id);
if (maquinaAchada === undefined) {
    console.log("\nMaquina nao encontrada. Informe um id funcional.");
} else {
    console.log("---".repeat(10))
    console.log(`Busca por ID: '${id}'`)
    console.log(`\nID: ${maquinaAchada.id}`);
    console.log(`Nome: ${maquinaAchada.nome}`);
    console.log(`Setor: ${maquinaAchada.setor}`);
    console.log(`Status: ${maquinaAchada.status}`);
};

// Desafio C - Intermediário. Crie uma variável com o nome de um setor. Exiba quantas máquinas pertencem a ele e os nomes encontrados.

const nomeSetor = "Estamparia";
const maquinaPorSetor = maquinas.filter(maquina => maquina.setor === nomeSetor);

if (maquinaPorSetor[0] === undefined) {
    console.log("\nMaquina nao encontrada.");
} else {
    console.log("---".repeat(8));
    console.log(`Busca por setor: '${nomeSetor}'`);
    console.log(`Quantidade de maquinas: ${maquinaPorSetor.length}`)
    for (let m of maquinaPorSetor) {
        console.log(`\nID: ${m.id}`);
        console.log(`Nome: ${m.nome}`);
        console.log(`Setor: ${m.setor}`);
        console.log(`Status: ${m.status}`);
    };
};

// Desafio D - Avançado. Crie uma função que receba um status por parâmetro e devolva o array filtrado. Teste com status existente e inexistente.

function receberStatus(status) {
    const maquinasEncontradas = maquinas.filter(maquina => maquina.status === status);
    
    if (maquinasEncontradas[0] === undefined) {
        console.log("\nMaquina nao encontrada.");
    } else {
        console.log("---".repeat(8));
        console.log(`Maquinas com status '${status}'`)
        for (let m of maquinasEncontradas) {
            console.log(`\nID: ${m.id}`);
            console.log(`Nome: ${m.nome}`);
            console.log(`Setor: ${m.setor}`);
        };
    };
};

receberStatus("Ativa"); // Existente - exibe o array formatado
receberStatus("aRiVo") // Inexistente - exibe 'Maquina nao encontrada.'
