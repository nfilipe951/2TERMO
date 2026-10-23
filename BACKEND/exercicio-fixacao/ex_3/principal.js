// Atividade 3: Gestor de Clima Industrial (Múltiplas Funções)
// Foco: Exportar um objeto com várias funções.

// "Agora vamos criar um sistema para o setor de segurança. Precisamos de um
// módulo chamado sensor.js que tenha duas ferramentas:"
// 1. checarTemperatura(valor): Se for maior que 40, retorna "ALERTA: Caldeira
// Superaquecida".
// 2. checarUmidade(valor): Se for menor que 20, retorna "ALERTA: Ar muito seco".

// Instrução: No arquivo principal.js, peça os dois valores ao usuário e use as
// ferramentas do módulo para exibir os avisos.

const entrada = require("readline-sync");
const sensor = require ("./sensor");

const temp = entrada.questionFloat("Digite a temperatura: \n")
const umid = entrada.questionFloat("Digite a umidade: \n");

const alertatemp = sensor.verTemperatura(temp);
const alertaumid = sensor.verUmidade(umid);

if (alertatemp) {
    console.log(alertatemp);
}

if (alertaumid) {
    console.log(alertaumid);
}
