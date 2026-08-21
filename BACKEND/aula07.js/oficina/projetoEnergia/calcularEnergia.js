function calcularkwh(potencia, hora) {
    return (potencia*hora)/1000; 
}

function calcularcusto(totalkwh, precokwh) {
    return totalkwh*precokwh;
}

function calcularconsumo (totalkwh) {
    if (totalkwh < 100) {
    return "Consumo baixo";
    }else {
        return "Consumo Elevado";
    }
}
module.exports = {
    calcularkwh,
    calcularcusto,
    calcularconsumo
} 