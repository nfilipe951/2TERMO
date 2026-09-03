-- CORRECAO SOMATVA 01 - OFICINA MECÂNICA

CREATE DATABASE IF NOT EXISTS OFICINA_BRUNAO;

USE OFICINA_BRUNAO;

CREATE TABLE IF NOT EXISTS CLIENTES (
    ID_CLIENTES INT AUTO_INCREMENT PRIMARY KEY,
    NOME_CLIENTE VARCHAR(50) NOT NULL,
    TELEFONE_CLIENTE CHAR(15) NOT NULL,
    DATA_NASCIMENTO DATE NOT NULL,
    CPF CHAR(14) NOT NULL UNIQUE,
    EMAIL_CLIENTE VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS VEICULOS (
    ID_VEICULO INT AUTO_INCREMENT PRIMARY KEY,
    PLACA CHAR(8) NOT NULL UNIQUE,
    TIPO_VEICULO ENUM('CARRO', 'MOTO', 'CAMINHÃO') DEFAULT ('CARRO'),
    COR CHAR(20),
    QUILOMETRAGEM FLOAT,
    DATA_CADASTRO TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TIPO_MOTOR ENUM ('ELÉTRICO', 'COMBUSTÃO')
);

CREATE TABLE IF NOT EXISTS MARCAS (
    ID_MARCAS INT AUTO_INCREMENT PRIMARY KEY,
    ANO_FUNDACAO YEAR,
    PAIS_ORIGEM VARCHAR(60),
    STATUS ENUM ('ATIVO', 'INATIVO') DEFAULT ('ATIVO'),
    NOME_MARCA VARCHAR(30) NOT NULL,
    SITE_MARCA VARCHAR (100)
);

CREATE table if not exists MODELOS(
    id_modelos int AUTO_INCREMENT PRIMARY KEY,
    cor VARCHAR(20),
    ano_modelo YEAR,
    valor_modelo DECIMAL (10,2),
    categoria enum ('SUV', 'hatch', 'sedan','moto esporiva'),
    nome_modelo VARCHAR(60),
    data_cadastro timestamp default CURRENT_TIMESTAMP
);


CREATE table if not exists FUNCIONARIOS(
    id_funcionario int AUTO_INCREMENT PRIMARY KEY,
    nome_funcionario varchar(60) not NULL,
    telefone VARCHAR(20) not NULL,
    cpf_funcionario CHAR(14) unique not NULL,
    cargo varchar (50) not NULL,
    salario DECIMAL (10,2) not NULL,
    status_funcionario enum ('ativo', 'inativo') DEFAULT 'ativo'
);

create table if not exists SERVICOS (
    id_servicos int AUTO_INCREMENT PRIMARY KEY,
    tipo_servico VARCHAR (60) not null,
    descricao_problema VARCHAR(250) not NULL,
    preco_servico DECIMAL (10,2) DEFAULT 0.00 NOT NULL,
    data_inicio DATETIME not NULL,
    data_termino DATETIME not null,
    status_servico ENUM ('em andamento', 'pendente', 'concluido') DEFAULT 'pendente',
     data_cadastro timestamp default CURRENT_TIMESTAMP

);


CREATE table if not exists PECAS (
    id_peca int AUTO_INCREMENT PRIMARY KEY,
    tamanho VARCHAR(50),
    valor_peca DECIMAL(10,2),
    nome_peca VARCHAR(50),
    validade DATE NOT NULL,
    qt_pecas INT,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE if not exists ordem_de_servico (
    id_ordem int AUTO_INCREMENT PRIMARY KEY,
    prioridade ENUM('urgente', 'simples') DEFAULT 'simples',
    praso_final date not NULL,
    ranking_ordem VARCHAR(40) not NULL,
    data_emissao  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status_servico ENUM ('em andamento', 'pendente', 'concluido') DEFAULT 'pendente',
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE Table if not exists pagamentos (
    id_pagamento int AUTO_INCREMENT PRIMARY KEY,
    valor_total DECIMAL (10,2) not NULL,
    forma_pagamento enum ('debito', 'credito', 'pix') DEFAULT 'debito' not NULL,
    data_vencimento DATE not null,
    status_pagamento VARCHAR(30),
    comprovante INT,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP


);


CREATE table if not exists fornecedor(
    id_fornecedor int AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(100) not null,
    cnpj CHAR(18) unique not NULL,
    telefone_cntt VARCHAR(14) not null,
    email VARCHAR (100) not NULL,
    inscricao_estadual CHAR(10),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    
);


--alterações inserido campos novos na tabelas
alter table fornecedor add quantidade_produtos int ;
alter TABLE clientes add idade int;
alter table funcionarios add endereco varchar (100);
alter Table marcas add obs VARCHAR(200);
ALTER Table MODELOS add tipo varchar(50);
alter table ordem_de_servico ADD area_servico varchar(60) not NULL;
alter Table pecas add peso float not null;
ALTER table SERVICOS add obs VARCHAR(60);
ALTER table veiculos add modelo varchar(100);
ALTER Table fornecedor ADD tipo_envio VARCHAR(50);

alter Table pagamento ADD desconto DECIMAL(10,2) DEFAULT 0.00 not null;

-- exclusão de campos nas tabelas

ALTER table clientes drop column idade;

-- RENAME tabela
rename table modelos to modelos_fab













-- VISUALIZAR TODOS OS BD

SHOW SCHEMAS;

-- VISUALIZAR TABELAS
SHOW TABLES;

-- descricao sobre informações das tabelas
DESCRIBE CLIENTES;

 

