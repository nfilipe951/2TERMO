// 1. Criamos a fôrma (Classe)
class Biscoito {
  constructor(sabor) {
    this.sabor = sabor; // Atributo: Guarda o sabor
  }
}

// 2. Criamos os biscoitos de verdade (Objetos / Instâncias)
const biscoito1 = new Biscoito("Chocolate");
const biscoito2 = new Biscoito("Baunilha");

console.log(biscoito1.sabor); // Mostra na tela: "Chocolate"
console.log(biscoito2.sabor); // Mostra na tela: "Baunilha"
