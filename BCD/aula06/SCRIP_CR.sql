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

