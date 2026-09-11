function calcularOrcamento(precoPeca, horasTrabalho) {
    const valorHora = 85.00;
    const totalMaoDeObra = horasTrabalho * valorHora;
    return precoPeca + totalMaoDeObra;
}
function verificarGarantia(meses) {
    if (meses <= 3) {
        return "Dentro de Garantia";
    }else {
        return "Garantia Expirada"
    
    }
}

function ValorComDescontototal(precoSemDesconto) {
    return precoSemDesconto * 0.95;
    
}
module.exports = {
    calcularOrcamento,
    verificarGarantia,
    ValorComDescontototal
}

