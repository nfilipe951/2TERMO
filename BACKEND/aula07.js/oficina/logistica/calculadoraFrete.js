function calacularbase(km) {
    return km + 2.10;
}

function calcularSeguro(valorCarga) {
    return valorCarga * 0.01;
}

function verificarPrazo(km) {
    if (km < 100) {
        return "1 dia util"; 1 

    }else {
        return "3 a 5 dias uteis";
    }
}
module.exports = {
    calacularbase,
    calcularSeguro,
    verificarPrazo
} 