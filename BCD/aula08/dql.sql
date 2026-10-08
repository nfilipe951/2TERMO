--dql data query language (linguagem de consulta de dados)

inset INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Ana Flávia', 'anaf@email.com', '199984512456','Campinas',TRUE)

--EX select simples ou consulta simples 
--estrutura select como exemplo

--select coluna 
--from tabela

select *

from cliente;
--consultar todas as colunas 


SELECT nome, telefone
from cliente;
--constultar colunas especificas

--ex:  AS como apelido ou um novo nome para colunas
select nome as Nome_Cliente
FROM cliente;

SELECT email as Email_Cliente, telefone AS Zap
from cliente

--ex 3 : distinct - eliminando repetições
 SELECT DISTINCT cidade
 FROM cliente;

 --sem distinct o resultado ira se repitir mais vezes.
 --com o distinct o resultado ira aparecer uma vez

 --ex 4: where-- filtro por registros
--iremos definir condições 

--= igual
--<> ou != diferente
-->= maior ou igual
--< menor que
--<= menor igual

select nome, preco 
from produto
where preco > 10.00;
--consulta para valores acima de 10.00 Reais

select nome, preco ativo as Status 
from produto
where ativo = true;
--consulta status de clientes se esta ativo ou inativo


select id_pedido, data_pedido, valor_pedido
from pedido
where valor_total >= 25.00
--constulta pedidos acima de determinado valor 

--ex 5: uso do AND, OR e NOT

and todas as condições verdadeiras

select nome, preco
from produto
where preco >= 8.00 AND preco <= 25.00;

--or PELO MENOS UMA CONDIÇÃO VERDADEIRA

select nome, cidade
from cliente
where ciadade = 'limeira' or cidade 'Piracicaba';

--not não ira buscar ou consultar o valor desejado

select nome, cidade
from cliente
where not cidade = 'limeira';

--extra - utilizando AND e OR juntos separar por ()
SELECT nome, cidade, ativo
from cliente
where ativo = TRUE
AND (cidade = 'limeira' OR cidade ='Piracicaba');

--ex 6 : between - entre dois valores
--limire inicial e final

SELECT nome, preco 
from produto
where preco between 8.00 and 15.00;
--consulta por valores entre 8 e 15

select id_pedido, data_pedido, valor_total
from pedido
WHERE data_pedido between '2026-09-01 00:00:00' AND '2026-09-30 23:59:59'
--consulta por intervalo de datas 

--ex 7: in varias possibilidade

select nome, cidade
from cliente
WHERE cidade IN ('limera', 'Campinas','Americana','Piracicaba');
--Consulta  com varias condições e diminuindo o uso de OR

select nome, cidade
from cliente 
where cidade not in ('Limeira','Piracicaba');

--ex 8 : like  pesquisar por textos
--coringas
--% vários caracteres
--_exatamente um caracter

SELECT nome 
from produto
where nome like 'café%';
--consulta todos os produtos que começam com a palavra desejada


SELECT nome 
from produto 
where nome like '%chocolate';
--consulta todos os produtos que possuam a palavra desejada


select nome 
from produto 
where nome LIKE '%Silva';
--consulta todos os clientes que terminam com a palavra desejada

SELECT nome 
from cliente 
where nome like '%Si_va';
--consulta especificamente o caracter que não se lembra


--ex 9 : NULL - ausenciade valores
select nome, telefone
from cliente
where telefone is null;
--consulta campos que possuem o null



select nome, telefone 
from cliente 
where telefone is not null;
--consulta campos que não sao mais null



--ex 10: order by - ordenando resultados 
--asc crescente
--desc decrescente

select nome, preco 
from produto 
order by preco asc ;
--consultar dados de forma decrescente

select cidade, nome 
from cliente 
order by cidade asc, nome desc;
--consulta por mais de uma coluna



--ex 11: limit - limitar quantidade de linhas 

select nome, preco 
from produto
order by preco desc 
limit 5;
--consultar apenas uma quantidade especifica de linhas 


select nome, preco 
from produto
order by nome 
limit 5 offset 5;

--consultar com limite de valores e linhas 



--ex: 12 calculo de colunas
select nome, preco, preco - (preco * 2) AS preco_ajustado
from produto;

select id_item, quantidade, preco_unitario, quantidade * preco_unitario as sub_total
from item_pedido;

--ex 13 : funções para consultas
--textos

select UPPER(nome) as Nome_cliente, LOWER(email) as Email_cliente
from cliente;

select concat(nome, '---', cidade) cidade_clientes
from cliente;

--CONCAT concatenação de valores

--numeros
select nome, preco, ROUND(preco * 0.90, 2) as Preco_Desconto
from produto;

--datas
select id_pedido, data_pedido, DATE(data_pedido) as datas, MONTH(data_pedido) as mês, year (data_pedido) as ano, DAY(data_pedido) as dia, time(data_pedido) as horário
from pedido;


--COALESCE - substituir a informacao que deixamos em null ou não deixamos
select nome, COALESCE(telefone, 'Não Informado') as telefone
from cliente;

--ex 14: funções de agrupamento
--count - contar quantos registro existem
--sum - soma de valores 
--avg- média  de valores 
--min - menor valor 
--max - maior valor 

select count (*) as total_clientes
FROM cliente;
--contar quantos clientes existem

select avg (preco) as round (média_produtos, 2)
from produto;
--calcular media de preço dos produtos

select min (preco) as menor_preço, MAX(preco) AS maior_preco, avg(preco) as média_preço
from produto
--resumo de preços


select sum(valor_total) as faturamento_mensal
from pedido
where status ='FINALIZADO';


--ex 15: group by - agrupar dados

select cidade, count(*) as quantidade_clientes
from cliente
group by cidade;

select id_categoria, count(*) as quantidade_produtos
from produto
group by `ID_CATEGORIA`;

ex 16: having - filtro por grupos
where - filtra linhas antes do group by
having - filtra depois do group by 

select cidade, count(*) as qtde_clientes 
from cliente
group by `CIDADE`
having count(*) >= 2;
--cidades com pelo menos dois clientes 


--ex 17: ordem de criação de uma consulta completa 
select colunas 
from tabela
where condicao
group by colunas_agrupar
having condicao_agrupar
order by colunas 
LIMIT quantidade;

