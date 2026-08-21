-- Comando para criar BCD
-- 1- 
-- codigo
-- Create database...;
-- create database if not exist hotel_...;

-- 2-
-- ativar bcd
-- codigo
-- use ...;

-- 3-
-- tabelas 
-- codigo
-- create table if not exists cadastro ( id_cadastro int auto_increment primary key,
--  varchar(50) not null,
--  cpf varchar(14) not null unique,
--  telefone varchar (15),
--  
--  
--   -- esses são os atributos compostos 
--  convenio enum ('Sim','Não') default 'Sim',
--  tipos_quartos enum ('Simples','Luxo') ....
--  data_cadastro timestamp default current_timestamp 
--  
--  );
--  create table if not exists serviços (
--  id_servico int primary key,
--  nome_servico varchar(60) not null,
--  tipo_servico enum ('serviço quarto', 'frigobar', 'manutenção') default 'serviço quarto',
--  preco decimal (5,2) default 0.00
--  );
--  
--  4-
-- comando para ver tabelas
-- show tables ;


-- 5- 
-- em casos de necessidade ou correção 
-- apagar bcd
-- drop database ...;
-- apagar tabelas
-- drop tables cadastro;



-- comando para executar caso tenha esquecido algo nas tabelas 
-- inserir campos 
-- alter table cadastro add email varchar (100);


-- alterar tipos de dados
-- alter table cadastro modify telefone int; 

-- renomer tabelas
-- rename table cadastro to alunos; 
--  
-- apagar dados de uma tabela 
-- truncate table alunos; 

-- apagar coluna ou atributo 
-- alter table alunos drop column telefone;

-- inserindo dados na tabela
-- insert into alunos (id_servico, nome_servico, tipo_servico, preco)
-- values (1,'Limpeza', 'Frigobar', 35.00);

-- insert into alunos (id_servico, nome_servico, tipo_servico, preco)
-- values(2, 'manutencao', 'limpeza', 35.00);

-- consutar dados em uma tabela
-- select * from servicos ;
-- insert into tabela (campo1, campo 2, caompo ...n
-- values(valor1, valor 2, valor ...n)


drop table pagamento;
create table if not exists pagamento (
id_pagamento int auto_increment primary key,
nome_cliente varchar(50) not null, 
despesas_total decimal (6,2) not null,
data_pagamento timestamp default current_timestamp ,
forma_pagamento enum ('credito', 'debito', 'pix', 'dinheiro') default 'credito', 
comprovante int not null 
);

insert into pagamento (id_pagamento, nome_cliente, despesas_total, data_pagamento, forma_pagamento, comprovante)
values (1, 'Nicolas', 300.00, '2026-08-24', default, 300);
insert into pagamento (id_pagamento, nome_cliente, despesas_total, data_pagamento, forma_pagamento, comprovante)
values (1, 'Matheus', 306.00, '2026-08-20', default, 301);
insert into pagamento (id_pagamento, nome_cliente, despesas_total, data_pagamento, forma_pagamento, comprovante)
values (1, 'Rennan', 305.00, '2026-08-21', default, 302);
insert into pagamento (id_pagamento, nome_cliente, despesas_total, data_pagamento, forma_pagamento, comprovante)
values (1, 'Vinicius', 304.00, '2026-08-22', default, 303);
insert into pagamento (id_pagamento, nome_cliente, despesas_total, data_pagamento, forma_pagamento, comprovante)
values (1, 'Pedro', 302.00, '2026-08-23', default, 304);









 










