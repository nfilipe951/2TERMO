 const entrada = require ('readline-sync');

 // importar o módulo funcoesOficina
 const oficina = require('./funcoesOficina');
 console.log("=== Sistema de Gestão de Oficina ===")

 const peca = entrada.questionFloat("Preco da peca: R$ ");
 const horas = entrada.questionInt("Horas de servico: ");
 const TempoUso = entrada.questionInt("Meses desde o ultimo conserto: ");

 const statusGarantia =  oficina.verificarGarantia(TempoUso);
 const total = oficina.calcularOrcamento(peca, horas);
 const ValorComDesconto = oficina.ValorComDescontototal(total);

 // relatorio final
 console.log("\n --- Relatorio de Servico ---");
 console.log(`Orcamento: R${total.toFixed(2)}`);
 console.log(`Orcamento com desconto (5%): R$ ${ValorComDesconto.toFixed(2)}`);
 console.log(`Status da Garantia ${statusGarantia}`);
 console.log("-------------------------------------");

