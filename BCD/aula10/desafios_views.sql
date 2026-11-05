-- 1. Criar a view de produtos ativos

CREATE VIEW vw_produtos_ativos AS
SELECT id_produto, nome, preco, id_categoria
FROM produto
WHERE ativo = TRUE;


-- 2. Consultar produtos ativos com preço maior que R$ 10,00

SELECT *
FROM vw_produtos_ativos
WHERE preco > 10.00;


-- 3. Listar todas as views do banco

SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';


-- 4. Exibir a definição da view de produtos ativos

SHOW CREATE VIEW vw_produtos_ativos;


-- 5. Criar view de produtos e categorias

CREATE VIEW vw_produtos_categorias AS
SELECT
p.id_produto,
p.nome AS produto,
p.preco,
c.id_categoria,
c.nome AS categoria
FROM produto AS p
INNER JOIN categoria AS c
ON p.id_categoria = c.id_categoria;


-- 6. Criar view de pedidos e clientes

CREATE VIEW vw_pedidos_clientes AS
SELECT
p.id_pedido,
p.data_pedido,
c.id_cliente,
c.nome AS cliente,
p.status_pedido
FROM pedido AS p
INNER JOIN cliente AS c
ON c.id_cliente = p.id_cliente;


-- 7. Consultar somente pedidos finalizados

SELECT *
FROM vw_pedidos_clientes
WHERE status_pedido = 'FINALIZADO';


-- 8. Criar view com pedido, produto, quantidade,
-- preço unitário e subtotal

CREATE VIEW vw_itens_pedidos AS
SELECT
p.id_pedido,
pr.nome AS produto,
ip.quantidade,
ip.preco_unitario,
ip.quantidade * ip.preco_unitario AS subtotal
FROM pedido AS p
INNER JOIN item_pedido AS ip
ON p.id_pedido = ip.id_pedido
INNER JOIN produto AS pr
ON ip.id_produto = pr.id_produto;


-- 9. Criar view de vendas por produto

CREATE VIEW vw_vendas_por_produto AS
SELECT
pr.id_produto,
pr.nome AS produto,
SUM(ip.quantidade) AS quantidade_vendida,
SUM(ip.quantidade * ip.preco_unitario) AS faturamento
FROM produto AS pr
INNER JOIN item_pedido AS ip
ON pr.id_produto = ip.id_produto
GROUP BY
pr.id_produto,
pr.nome;


