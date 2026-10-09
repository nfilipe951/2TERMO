-- Active: 1788435082402@@127.0.0.1@3306@smartcoffee_dml_nicolass
-- ============================================================
-- AULA 09 - ATIVIDADE PRÁTICA DE DQL
-- Nome: ___Nicolas Filipe Amancio____________________________________________
-- Turma: _____2DEVIS_________________ Data: __08/10/2026_______________
-- Base: smartcoffee_dml_nicolass
-- ============================================================
USE smartcoffee_dml_nicolass;

-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.

select * 
from cliente;

-- 2. Exiba apenas nome, cidade e e-mail dos clientes.

select nome, cidade, email 
from cliente;

-- 3. Liste os nomes das cidades sem repetir valores.

select distinct cidade 
from cliente;

-- 4. Liste todos os produtos em ordem crescente de preço.

select * from produto 
order by preco asc;

-- 5. Mostre apenas os 5 produtos mais caros.

select * from produto 
order by preco desc limit 5;

-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.

select * from produto 
where preco between 8 and 15;

-- 7. Liste os clientes das cidades Limeira ou Americana.

select * from cliente 
where cidade in ('Limeira', 'Americana');

-- 8. Localize os produtos cujo nome contém a palavra “Café”.

select * from produto 
where nome like '%Café%';

-- 9. Liste os clientes que não informaram telefone.

select *
 from cliente 
 where telefone is null;

-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.

select * from pedido 
where status_pedido = 'FINALIZADO' and valor_total > 20 
order by valor_total desc;


-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.

select count(*) as total_produtos 
from produto;

-- 12. Mostre menor preço, maior preço e preço médio dos produtos.

select min(preco) as menor_preco, max(preco) as maior_preco, avg(preco) as preco_medio 
from produto;

-- 13. Informe quantos clientes existem em cada cidade.

select cidade, count(*) as total_clientes 
from cliente 
group by cidade;

-- 14. Mostre somente as cidades que possuem dois ou mais clientes.

select cidade, count(*) as total_clientes 
from cliente 
group by cidade having count(*) >= 2;

-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.
select sum(valor_total) as faturamento_total 
from pedido 
where status_pedido = 'FINALIZADO';

