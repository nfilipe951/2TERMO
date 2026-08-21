// • Álcool ou Gasolina? (Matemática + Lógica)
// • Objetivo: Praticar lógica aplicada ao dia a dia.
// • Enunciado: Dizem que só compensa abastecer com Álcool se o
// preço dele for menor que 70% do preço da Gasolina. Peça o preço
// do litro de cada um. O programa deve calcular: `precoAlcool /
// precoGasolina`. Se o resultado for menor que 0.7, mostre
// "Abasteça com ÁLCOOL". Caso contrário, mostre "Abasteça com
// GASOLINA".



const entrada = require('readline-sync')

console.log(`--- ÁCOOL OU GASOLINA---`);

const precoAlcool = entrada.questionFloat(`Digite o preco do litro do alcool: \n`)
const precoGasolina = entrada.questionFloat(`Digite o preco do litro da Gasolina: \n`)

conta = precoAlcool/precoGasolina

if (conta < 0.7) {
    console.log (`\nAbasteça com ÁLCOOL`);
} else {
    console.log(`\n Abasteça com Gasolina`);
}


