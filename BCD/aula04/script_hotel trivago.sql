-- COMANDO PARA CRIAR BANCO DE DADOS  
create database Hotel_Trivago;
create database hotel_trivago2;

-- comando para apagar banco de dados 
drop database hotel_trivago2;

-- comando para ativar banco de dados
use Hotel_Trivago;
 
 -- comando para criar tabela
 create table funcionarios (
 id_funcionario int auto_increment primary key, 
 NOME varchar (60) not null,
 email_funcionario varchar(60),
 idade_funcionario int not null,
 telefone_funcionario varchar(14),
 turno varchar(30) not null, 
 cpf varchar(14) not null unique
 );

create table quarto (
    id_quarto int auto_increment primary key,
    numero_quarto int not null unique,
    quantidade_leitos int not null,
    capacidade int not null,
    preco decimal(10,2) not null,
    status_quarto varchar(10) not null default 'vago'
);

create table hospede (
    id_cliente int auto_increment primary key,
    nome_hospede varchar(60) not null,
    CPF varchar(14) not null unique,
    email_hospede varchar(60),
    telefone varchar(14),
    data_nascimento date,
    data_cadastro timestamp default current_timestamp
);

create table consumos (
    id_consumo int auto_increment primary key,
    tipos_alimento varchar(60) not null,
    local_consumido varchar(60),
    valor_total decimal(10,2) not null,
    data_consumo date not null,
    quantidade int not null
);

create table pagamento (
    id_pagamento int auto_increment primary key,
    data_pagamento date not null,
    despesas_total decimal(10,2) not null,
    nome_hospede varchar(60) not null,
    comprimento varchar(60),
    forma_pagamento varchar(20) not null
);


-- comando para apagar tabelas 
drop table funcionarios ;





