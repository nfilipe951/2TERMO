function calcularTotal(preco, qtd) {
      return preco * qtd;
}

function criarcupom(nome, valor) {
    return `Cliente: ${nome} - Total: R$ ${valor.tofixed(2)}`;
}
module.exports = {
    calcularTotal,
    criarcupom
}
