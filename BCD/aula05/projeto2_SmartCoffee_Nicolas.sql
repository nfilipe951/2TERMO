-- Projeto SMARTCOFFEE_ Nicolas

CREATE DATABASE SmartCoffee_Nicolas;
use SmartCoffee_Nicolas; 

create table if not exists pedidos (
id_funcionario int auto_increment primary key,
tipo_atendimento varchar(30), 
data_hora time not null, 
status_ varchar(50),
valor_total decimal not null, 
obs varchar(100)
);

create table if not exists pagamento (
id_pagamento int NOT NULL, AUTO_INCREMENT,
forma_pagamento varchar(30),
valor_pago decimal not null
data_pagamento datetime,








