function verificarPeso(leitura)  {
    const peso = Number(leitura);
}
if (isNaN(peso)) {
    throw new Error ('Entrada invalida! Digite apenas números.'); 
}
if (peso <= 100 || peso >= 500) {
    throw new Error ('Peso fora do padrao (100g - 500g)! Peça descartada.');
}else {
    return (`Peca aprovada com ${peso}g`);
}

module.exports = {
    verificarPeso,
    
}