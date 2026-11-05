-- Active: 1788435082402@@127.0.0.1@3306@smartcoffee_dml_nicolass
-- view ou visões - transformar determinadas consultas em visões
-- como posso disponibilizar uma consulta como se fosse uma tabela?
-- resposta : views 


-- ex 1 : view - como consultar um visão logica

create view vw_produtos_ativos as select id_produto, nome, preco 
FROM produto 
where ativo = true ;


-- visualizar a consulta criada através da view  
select * from vw_produtos_ativos;


--obs : a view guarda a definção da consulta . Em uma view comum os dados continuem pertencendo as tabelas de origem 

-- tabela - armazena registros 
-- view - representa o resultado logica da consulta


-- por que utilizar ?
-- por que desejo simplicar a minha consulta 
-- reutilizar lógica onde a consulta ganha nome
-- padronização de relatorio
-- restrição da exposição da logica


-- resumo 1 :
-- uma consulta original ou inicial :
select id_produto, nome, preco 
from produto  
where ativo = true;



-- como utilizar 
select *from vw_produto_ativos;

-- ex2 utilizar filtros nas views 
select id_produto, nome, preco 
from produto 
where preco >= 10.00
order by preco DESC;

select * from vw_produtos_ativos
where preco >= 10.00
order by preco desc;


--obs : view não elimina a possibilidade de usar where, order by e outras clausulas 

-- ex 3 : view com join - mostrar produtos e categorias


-- criando em view 

create view vw_produto_categorias as
select p.id_produto, p.nome as produto, ca.nome as categoria, p.preco 
from produto as p  
inner join categoria as ca  
on ca.id_categoria = p..id_categoria;

-- resultado visual por view 

select * from vw_produtos_categorias 
order by categoria, produto;


-- ex 4 : view com tabelas - relatorio de pedidos

create view vw_pedidos_clientes as  
select p.id_pedido, p.data_pedido, p.status, c.id_cliente, c.nome as cliente
from pedido as p  
inner join cliente as c  
on c.id_cliente = p.id_cliente 

-- resultado 
select * from vw_pedidos_clientes 
where status = 'aberto';



-- apagar view 

drop view vw_pedidos_clientes ;



-- ex 5: VIEW completa para um relatorio completo
CREATE VIEW vw_itens_pedidos AS
SELECT pe.id_pedido, pe.data_pedido, c.nome AS Cliente, pr.nome AS Produto, ip.quantidade, ip.preco_unitario, ip.quantidade * ip.preco_unitario AS Subtotal
FROM pedido AS pe
INNER JOIN cliente AS c
ON c.id_cliente = pe.id_cliente
INNER JOIN item_pedido AS ip
ON ip.id_pedido = pe.id_pedido
INNER JOIN produto AS pr
ON pr.id_produto = ip.id_produto;


-- resultado
select * from vw_itens_pedidos 
where id_pedido = 3;



-- ex 6 : view com funções de agregações 

crear view vw_vendas_por_produtos as  
select pr.id_produto, pr.nome as produto, sum(ip.quantidade) as unidades_vendidas , sum(ip.quanridade_unitario) as faturamento
from produto as pr  
inner join item_pedido as ip  
on ip.id_produto = pr.id_produto  
inner join pedido as pe 
on pe.id_pedido = ip.id_pedido 
where pe.status = 'FINALIZADO'
group by pr.id_produto, pr.nome;

-- resulta: consulta gerencial

select * from vw_vendas_por_produto
ORDER BY faturamento desc;


-- ex 7: view com left join - queremos todos os clientes inclusive quem nunca realizou pedidos 

CREATE VIEW vw_clientes_resumo AS
SELECT c.id_cliente, c.nome AS cliente, COUNT(p.id_pedido) AS Quantidade_Pedidos
FROM cliente AS c
LEFT JOIN pedido AS p
ON p.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nome;

-- resultado
select * from vw_clientes_resumo 
where quantidade_pedidos = 0;

-- EX 8: NOMEANDO VIEWS
-- ALIASES TORNAM AS VIEWS MAIS CLARAS -- AS

CREATE VIEW vw_precos_produtos AS
SELECT id_produto, nome AS Produto, preco AS Preco_Atual
FROM produtos;

SELECT * FROM vw_precos_produtos;

-- EX 9: VISUALIZAR AS VIEWS EXISTENTES

SHOW FULL TABLES WHERE TABLE_TYPE = 'VIEW';

--podemos consultar o catálago 
select table_name from information_schema.VIEWS 
where `TABLE_SCHEMA`=DATABASE();

-- ex 10: visualizando definições
show create view vw_produtos_categorias;


-- EX 11: CREATE OR REPLACE VIEW
CREATE OR REPLACE VIEW vw_produto_ativos AS
SELECT id_produto, nome, preco, id_categoria
FROM produto
WHERE ativo = TRUE;

-- obs: irá substituir ou alterar uma view ja criada com suas informações

--ex 12: view atualizavel
update vw_clientes craete view vw-clientes_ativos as 
select id_cliente, nome, email, ativo 
from cliente 
where ativo = true; 


-- atualizar a tabela cliente 
update vw_clientes_ativos 
set nome = 'Ana Francis'
where id_cliente = 2;

-- ex 13 : view não atualizavel 
update vw_vendas por produto
set Faturamento = 1000
where id_produto = 1 

-- obs: O campo é calculado. Simplesmente não possivel receber 1000. 

-- ex 14 : with check options - view que mostra apenas produtos ativos

create or replace view vw_produtos_ativos as 
select id_produto, nome, preco, ativo, id_categoria 
from produto 
where ativo = true  
with check option;

select * from vw_produto_ativos;

-- Obs: O WITH CHECK OPTION ajuda a impedir alterações realizadas pela
-- VIEW que fariam o registro deixar de atender à condição definida.

-- Verificar se tudo o que eu pedi para ele está OK. Se estiver, ele confirma.


-- ex 15 : padrão definição de nomenclatura
-- vw- views  
-- nome- complementar a tabela ou consultar que deseja realizar 
-- vw_nome_desejo  
-- vw_nome_da_finalidade 
-- vw_produtos_ativos 

--apagar view 

drop view vw_vendas_por_produto;