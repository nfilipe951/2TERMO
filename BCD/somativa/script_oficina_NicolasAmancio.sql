create database Oficina_Nicolas;
use Oficina_Nicolas;

create table if not exists clientes (
id_clientes int auto_increment primary key,
nome_clientes varchar(100) not null, 
idade int, 
telefone varchar(14),
email varchar(100),
cpf varchar(14) 
);

create table if not exists veiculos (
placa varchar(20),
quilometragem varchar(100),
id_veiculos int auto_increment primary key,
cor varchar(40),
nome_responsavel varchar(100),
ano date
);

create table if not exists marcas (
placa varchar(20),
ano date,
id_marcas int auto_increment primary key,
categoria varchar(50),
nome_marca varchar(60),
valor_table decimal
);
 
create table if not exists modelos (
valor_modelo decimal,
nome_modelo varchar(50),
data_lancamento datetime,
id_modelo int auto_increment primary key,
garantia datetime,
cor_modelo varchar(20)
);


create table if not exists funcionarios (
telefone varchar(14),
cpf varchar(14),
cargo varchar(100),
nome_funcionario varchar(100),
id_funcionario int auto_increment primary key,
turno varchar(60)
);

create table if not exists servicos (
id_servico int auto_increment primary key,
nome_servico varchar(100),
localizacao varchar(60),
data_hora datetime,
nome_responsavel varchar(100),
quantidade int
);

create table if not exists pecas (
ip varchar(100),
nome_pecas varchar(60),
localizacao varchar(200),
valor_pecas decimal not null,
medidas varchar(100),
id_pecas int auto_increment primary key
);

create table if not exists ordem_de_servicos (
nome_cliente varchar(100),
problema text(500),
valor decimal,
tipo_servico varchar(50),
telefone varchar(14),
id_ordem int auto_increment primary key
);

create table if not exists pagamentos (
valor_total decimal not null,
comprovante varchar(50),
data_pagamento datetime,
status_pagamento varchar(50),
forma_pagamento varchar(15)
);


create table if not exists fornecedores(
valor_fornecedor decimal,
localizacao_fornecedor varchar(100),
produto_fornecedor varchar(200),
id_fornecedor int auto_increment primary key,
 quantidade_fornecedor int,
 nome_fornecedor varchar(100),
 data_de_recibo datetime
 );

