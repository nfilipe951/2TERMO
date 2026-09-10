-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE pedido (
id_pedido Texto(1) PRIMARY KEY,
data_pedido datetime not null,
id_cliente int auto increment primary key
)

CREATE TABLE cliente (
id_cliente int auto increment primary key PRIMARY KEY,
nome_cliente varchar (60)
)

CREATE TABLE produto+estoque (
id_produto int auto increment primary key,
nome_produto varchar (60),
id_estoque int auto increment primary key,
quantidade int not null,
PRIMARY KEY(id_produto,id_estoque)
)

CREATE TABLE fornecedor (
id_funcionario int auto_increment primary key  PRIMARY KEY,
razao_social varchar(60)
)

CREATE TABLE produto (
id_produto int auto_increment primary key PRIMARY KEY,
nome_produto varchar(60)
)
CREATE TABLE cliente (
id_cliente Texto(1) PRIMARY KEY,
cpf varchar (60),
id_pedido int not null
)
CREATE TABLE pedido (
id_pedido int not null PRIMARY KEY,
data_pedido datetime
)

CREATE TABLE relação_2 (
id_item int increment primary key PRIMARY KEY,
valor decimal (10,2),
id_produto int primary key,
id_fornecedor int primary key )

ALTER TABLE pedido ADD FOREIGN KEY(id_cliente) REFERENCES cliente (id_cliente) 
