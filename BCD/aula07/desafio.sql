-- ============================================================
-- AULA 08 - ATIVIDADE PRÁTICA DE DML
-- Nome: _Nicolas Filipe Amancio__
-- Turma: __2DEVIS__ Data: _1/10/2026_
-- Base: smartcoffee_dml
-- ============================================================

-- 1
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('miguel', 'miguel@gmail.com', '19988451691', 'Campinas', TRUE),
('luisa', 'luisa@gmail.com', '19988451692', 'Limeira', TRUE);

SELECT * FROM cliente;

-- 2
INSERT INTO categoria (nome) VALUES 
('ESPECIARIAS DA CASA');

-- 3
INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('CUPCAKE', 8.00, TRUE, 1),
('MOUSSE DE MORANGO', 25.00, TRUE, 1),
('FONDUE', 15.00, TRUE, 1);


-- insert into produto (nome, produto, ativo, id_categoria) values
-- ('sorvete', 8.0, true, @categoria_especial);

-- 4
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES 
('Lucas Pereira', 'lucas@email.com', NULL, 'Limeira', TRUE);


-- 5




--professor

set @pedido_atividade = LAST_INSERT_ID

insert INTO item_pedido( `ID_PEDIDO`, `ID_PRODUTO`, `QUANTIDADE`, `PRECO_UNITARIO`) VALUES (@pedido_atividae,4,1,13.00), (@pedido_atividade,9,2,9.00);


-----------
INSERT INTO pedido (data_pedido, status, valor_total, id_cliente) 
VALUES (NOW(), 'ABERTO', 21.00, 81);


SELECT * FROM pedido;


-- 6
SET @pedido_atividade = LAST_INSERT_ID();

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES 
(@pedido_atividade, 1, 2, 8.00),
(@pedido_atividade, 2, 1, 25.00);


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- PARTE B 

-- 7
SELECT * FROM cliente WHERE nome = 'miguel';

-- UPDATE:
UPDATE cliente 
SET telefone = '19999990000' 
WHERE nome = 'miguel';


SELECT * FROM cliente WHERE nome = 'miguel';


-- 8
SELECT * FROM cliente WHERE nome = 'luisa';


UPDATE cliente 
SET cidade = 'São Paulo', telefone = '11988887777' 
WHERE nome = 'luisa';


SELECT * FROM CLIENTE WHERE nome = 'luisa';


-- 9
SELECT * FROM PRODUTO WHERE ID_CATEGORIA = 1;


UPDATE PRODUTO 
SET preco = preco * 1.08 
WHERE ID_CATEGORIA = @categoria_especial;


SELECT * FROM PRODUTO WHERE ID_CATEGORIA= 1;

-- 10
SELECT * FROM pedido WHERE id = @pedido_atividade;


UPDATE PEDIDO
SET status = 'PREPARANDO' 
WHERE id = @pedido_atividade;


SELECT * FROM PEDIDO WHERE id = @pedido_atividade;


--11
--1 versão
select SUM( quantidade*preco_unitario) AS total
FROM item_pedido
where id_pedido = @pedido_atividade;

--2 versão
UPDATE pedido 
SET `VALOR_TOTAL` = (SELECT SUM(quantidade*preco_unitario) FROM item_pedido where id_pedido =@pedido_atividade) 




-- 12
SELECT * FROM produto WHERE nome = 'CUPCAKE';

-- UPDATE:
UPDATE PRODUTO
SET ativo = FALSE 
WHERE nome = 'CUPCAKE';
SELECT * FROM PRODUTO WHERE nome = 'CUPCAKE';
---

--professor

select * from produto where nome ='Croissant Especial';
UPDATE produto SET ativo = FALSE WHERE nome = 'Croissant Especial';

SELECT * from produto where nome = 'Croissant Especial';

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- PARTE C 

-- 13
INSERT INTO CLIENTE(nome, email, telefone, cidade, ativo) VALUES 
('Cliente Teste', 'teste@email.com', '19000000000', 'Limeira', TRUE);


SELECT * FROM CLIENTE WHERE email = 'teste@email.com';

DELETE FROM CLIENTE WHERE email = 'teste@email.com';



--professor
insert into cliente(`NOME`,`EMAIL`,`CIDADE`)
VALUES ('Cliente temporario', 'temporario.a09@email.com', 'Limeira');

SELECT*from cliente where email = temporario.a09@email.com;
DELETE from cliente where email = temporario.a09@email.com

SELECT from cliente where email = temporario.a09@email.com


-- 14

SELECT * FROM cliente WHERE id = 81;
DELETE FROM cliente WHERE id = 81;

-- Resposta :
-- Cannot delete or update a parent row: a foreign key constraint fails (`smartcoffee_dml`.`pedido`, CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`))


-- 15

-- A Chave Estrangeira bloqueou a exclusão para continuar a referencia dos dados. 
-- Se o cliente for apagado os pedidos que está nele ele ficariam sem um cliente cadastrado.


-- 16
INSERT INTO CATEGORIA (nome) VALUES ('Excluir Depois');

-- SELECT de validação:
SELECT * FROM CATEGORIA WHERE nome = 'Excluir Depois';

-- DELETE:
DELETE FROM CATEGORIA WHERE nome = 'Excluir Depois';




