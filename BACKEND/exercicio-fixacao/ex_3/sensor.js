function checarTemperatura(valor) {
    if (valor > 40) {
        return "ALERTA: Caldeira Superaquecida";
    }
}

function checarUmidade (valor) {
    if (valor < 20 ) {
        return "ALERTA: Ar muito seco";
    }
}

module.exportes = {
    checarTemperatura,
    checarUmidade
}