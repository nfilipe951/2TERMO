--tcl - transações e integridade
--sem transação: parte do processo irá permanecer gravado
-- com transação: podemos confirmar ou desfazer o processo inteiro

-- estrutura de transação

begin TRANSACTION;
--comandos sql
COMMIT; --confirma a transação 

ROLLBACK; --desfaz a transação

--processo inicial 

INSERT into cliente (nome,email,telefone,cidade, ativo) values ('C.Ronaldo','cronaldo@email.com','199991231456','Funchal', TRUE)

select nome FROM cliente;

--ex 1: commit
-- confirma as alterações dentro da transação 


start TRANSACTION;

update produto 
set preco = 8.50
where id_produto = 1;

COMMIT;

--ex2 rollback 
-- desfaz asalterações ainda não confirmadas 
start TRANSACTION;

update produto
set preco = 5000.00
where id_produto = 1

SELECT * FROM produto WHERE id_produto = 1;
ROLLBACK;

-- EX 3: SAVEPOINT
-- CRIAR UM PONTO DENTRO DE UMA TRANSAÇÃO

START TRANSACTION;

UPDATE produto
SET preco = preco * 1.50
WHERE id_categoria = 1

SAVEPOINT reajuste_cafes;

UPDATE produto
SET preco = preco * 2.00
where id_categoria = 4

ROLLBACK to savepoint reajusto_cafes;
commit ;



-- ex 4 : release SAVEPOINT
-- remove o save point da transação 


release savepoint reajuste_cafes;

-- ex 5: autocommit
release SAVEPOINT reajuste_cafes;

-- ativo por padrão no mysql 

start TRANSACTION;
-- dmls relacionadas

commit;

-- ex 6 : transações não subtitui constraint 

constraint fk_produto_categoria foreing key (id_categoria)references categoria (id_categoria) on delete cascade on update cascade;



constraint ck_estoque_quantidade CHECK (quantidade >= 0 );

CREATE TABLE cliente (
    id_cliente int primary key,
    nome VARCHAR(60),
    telefone VARCHAR (15),
    cidade varchar (60),
    ativo BOOLEAN default true,
    constraint fk_pedido_cliente FOREIGN KEY (id_cliente) references client (id_cliente); on delete CASCADE on UPDATE cascade;
);

--sempre checar  a quantidade e se abaixo ou de 0 igual que 0 sinalizar 

CREATE Table estoque (
    id_estoque int AUTO_INCREMENT,
        id_produto INT NOT NULL,
        QUANTIDADE INT NOT NULL DEFAULT 0,
        CONSTRAINT PK_ESTOQUE PRIMARY KEY (ID_ESTOQUE),
        CONSTRAINT UQ_ESTOQUE_QUANTIDADE CHECK (QUANTIDADE >= 0),
        CONSTRAINT FK_ESTOQUE_PRODUTO FOREIGN KEY  (ID_PRODUTO)
        REFERENCES PRODUTO (ID_PRODUTO) ON UPDATE CASCADE ON DELETE RESTRICT
);

insert into estoque (id_produto, quantidade) values (1,50), (2,40), (3,30);

insert into estoque (id_produto, quantidade) values (4,0);

select * from estoque;

-- ex 7 : fluxo seguro para update / delete 
-- exclusão física 

delete from produto 
where id_produto = 11;

exclusão lógica 
update produto 
set ativo = false 
where id_ produto = 3;

select * from produto id_produto = 3;
commit ;

ROLLBACK;

-- ex 8: pedido completo com transação 

start transaction; 
insert into pedido (data_pedidp, status, valor_total, id_cliente VALUES(NOW(), 'ABERTO',0.00, 130));

insert into item_pedido (id_pedido, id_produto< quantidade, preco_unitario) VALUES (@pedido, 1,2, 7.50), (@pedido,, 1,2, 8.50);

COMMIT; 

-- ex 9: pedido completo com transação e rollback 

start TRANSACTION;

insert into pedido (data_pedidp, status, valor_total, id_cliente VALUES(NOW(), 'ABERTO',0.00, 23));

SET @PEDIDO = LAST_INSERT_ID ();

-- produto inexistente

insert into item_pedido (id_pedido, id_produto, quantidade, preco_unitario) values (@pedido, 1,999, 9.00), (@pedido, 1,999,11.00);

rollback; 


-- parte 2 - com inner join, left join, right join - consulta de entidades relacionadas 


-- inner join -  consulta de registros relacionados entre duas tableas 
-- retorna registros que possuem correspondencias

-- ex 1: pedidos com o nome cliente 

select p.id_pedido, p.data_pedido, c.nome as cliente, p.valor_total from pedido as p 
from pedido as p 
inner join cliente as c 
on c.id_cliente = p.id_cliente; 

-- leia on: cliente cujo id_cliente é igual ao id_cliente gravado no pedido
--alias de tabela 

-- p e c são apelidos que deixam consultas mas curtas e legiveis



-- ex 2: left join mantem todos os registros da tabela da esquerda mesmo quando mão existe correspondencia na tabela direita 
-- todos os clientes, inclusive quem nunca comprou

select c.nome, p.id_pedido, p.data_pedido
from cliente as c 
left JOIN pedido as p 
on p.id_cliente = c.id_cliente 
order by c.nome;


-- descobrindo clientes sem pedidos

select c.id_cliente, c.nome from cliente as c left join pedido as p on p.id_cliente = id_cliente where p.id_pedido is null ;

-- ex 3 : joins com tres tabelas
-- itens de pedido com nome do produto

select p.id_produto, pr.nome as produto, ip.quantidade, ip.preco_unitario, ip.quantidade * ip.preco_unitario as subtotal from pedido as p 
inner join item_pedido as ip  
on ip_id_pedido = p.id_pedido   
inner join produto as pr  
on pr.id_produto = ip.id_produto 
order by p.id_pedido;  

-- ex 4: join com categoria 
-- produto e nome de sua categoria

select pr.nome as produto, c.nome as categoria, pr.preco 
from produto as pr 
inner join cateforia as c  
on c.id_categoria = pr.id_categoria   
order bt c.nome, pr.nome;


-- ex 5 : agregação + join 
-- quantidade de produtos por categoria

select c.nome as categoria, count(pr.id_PRODUTO) AS QTDE_PRODUTOS 
FROM CATEGORIA AS C 
LEFT JOING PRODUTO AS PR  
ON PR.ID_CATEGORIA = C.ID_CATEGORIA 
GROUP BY C.ID_CATEGORIA, C.NOME   
ORDER BY QTDE_PRODUTOS DESC;

-- TOTAL COMPRADO POR CLIENTE
SELECT C.NOME AS CLIENTE, COUNT (P.ID_PEDIDO) AS QTDE_PEDIDOS, SUM (P.VALOR_TOTAL) AS TOTAL_COMPRADO 
FROM CLIENTE AS C  
INNER JOIN PEDIDO AS P 
ON P.ID_CLIENTE = C.ID_CLIENTE 
WHERE P.STATUS = 'FINALIZADO'
GROUP BY C.ID_CLIENTE, C.NOME 
ORDER BY TOTAL_COMPRADO DESC;

-- EX 6 :  RELATORIO COMPLETO DO PEDIDO
SELECT P.ID_PEDIDO, DATE_FORMAT(P.DATA_PEDIDO, '%d %m %y %h %i') AS DATA, C.NOME AS CLIENTE, PR.MNOME AS PRODUTO, IP.QUANTIDADE, IP.PRECO_UNITARIO, QUANTIDADE * PRECO_UNITARIO AS SUBTOTAL FROM PEDIDO AS P 
INNER JOIN IYEM_PEDIDP AS IP  
ON IP.ID_PEDIDO = P.ID_PRODUTO
ORDER BY P.ID_PEDIDO, PR.NOME; 


