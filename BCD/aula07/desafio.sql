INSERT into cliente (nome, email, telefone, cidade, ativo) VALUES

('miguel', 'miguel@gmail.com', '19988451691', 'Campinas', TRUE),
('luisa', 'luisa@gmail.com', '19988451692', 'Limeira', TRUE);
SELECT * from cliente 

INSERT INTO  categoria (nome) VALUES 
('ESPECIARIAS DA CASA');

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES

('CUPCAKE', 8.00, TRUE, 1),
('MOUSSE DE MORANGO', 25.00, TRUE, 1),
('FONDUE', 15.00, TRUE, 1);

SELECT * FROM pedido

INSERT INTO  PEDIDO (DATA_PEDIDO, STATUS_PEDIDO, VALOR_TOTAL, ID_CLIENTE);
(NOW(), 'ABERTO', 21.00, 81)


