-- Active: 1788435082402@@127.0.0.1@3306@sesi_cr_tb
CREATE DATABASE sesi_cr_TB;
use sesi_cr_TB;

create table cliente(
    id_cliente int AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR (60) not NULL,
   
);

CREATE table pedido (
    id_pedido int AUTO_INCREMENT KEY,
    data_pedido DATETIME not NULL,
    id_cliente int NOT NULL,
    FOREIGN KEY (id_cliente) references cliente (id_cliente)
);

--consulta de tabela

SELECT*FROM cliente;

SELECT * FROM pedido;

INSERT into clinte (nome_cliente) VALUES
('Nicolas'),
('Pedro'),
('Poste');


CREATE Table fornecedor (
    id_fornecedor int AUTO_INCREMENT PRIMARY KEY,
    razao_social varchar (60) not null
);

create table profundo (
    id_produto int AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(50) not NULL,
    id_fornecedor int not NULL,
    Foreign Key (id_fornecedor) REFERENCES fornecedor (id_fornecedor)
);


-- DESAFIOS
-- 1 - QUESTÃO
-- CATEGORIA --- POSSUI --- PRODUTOS
-- Uma categoria pode possuir vários produtos. Cada produto pertence a apenas uma categoria.

-- 1. Uma categoria pode possuir vários produtos. Cada produto pertence a apenas uma categoria.
-- (1,N)      PARA         (1,1)

-- 2. Um funcionário pode registrar vários pedidos. Cada pedido é registrado por um funcionário.
-- (1,N)      PARA         (1,1)

-- 3. Um fornecedor comercializa vários produtos, e o mesmo produto pode ser comprado de vários fornecedores.
-- (1,N)      PARA         (1,N)

-- 4. Uma mesa pode existir sem nenhuma reserva futura. Uma reserva deve estar vinculada a uma mesa.
-- (0,N)      PARA         (1,1)

-- 5. Um pedido possui vários itens. Um item de pedido pertence a um único pedido.
-- (1,1)      PARA         (1,N)

