// • Desafio 4: Classificação de Atleta (Múltiplas Condições)
// • Objetivo: Praticar `else if`.
// • Enunciado: Uma escola de natação precisa classificar seus
// alunos por idade:
// • 5 a 10 anos Infantil
// • 11 a 17 anos: Juvenil
// • 18 a 60 anos: Adulto
// • Acima de 60 anos: Sênior


const entrada = require('readline-sync')

console.log(`--- CLASSIFICACAO DE ATLETA ---`);

const idade = entrada.questionInt (`\n Digite sua idade para a classificacao: \n`)

if (idade < 5 && idade <= 10) {
    console.log("Muito jovem para a competição")
}else if (idade >= 11 && idade <= 17) {
    console.log(`O aluno é juvenil`)
}else if (idade >= 18 && idade <= 60) {
    console.log(`O aluno é ADULTO`)
} else if (idade > 60) {
    console.log(`O aluno é Senior`)
} else {
    console.log(`O aluno é muito novo para participar`)
}