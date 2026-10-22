-- Active: 1788435082402@@127.0.0.1@3306@somativa
--1-------------------------------------------------------------------------------------

CREATE DATABASE if NOT EXISTS biblioteca_somm2;

USE biblioteca_som2;

CREATE TABLE IF NOT EXISTS USUARIO (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20) NULL,
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS LIVROO (
    id_livro INT AUTO_INCREMENT PRIMARY KEY ,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(120) NOT NULL,
    isbn CHAR(13) not NULL UNIQUE,
    ano_publicacao INT  NULL,
    quantidade_disponivel INT DEFAULT 0 CHECK (quantidade_disponivel >= 0)

);

CREATE TABLE EMPRESTIMOO (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE NULL,
    status_emprestimo VARCHAR(20) DEFAULT 'ABERTO' CHECK (status_emprestimo IN ('ABERTO', 'DEVOLVIDO', 'ATRASADO')),
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,
    CONSTRAINT fk_emprestimo_usuarioo FOREIGN KEY (id_usuario) REFERENCES USUARIO (id_usuario) ON DELETE RESTRICT,
    CONSTRAINT fk_emprestimo_livroo FOREIGN KEY (id_livro) REFERENCES LIVROO(id_livro) ON DELETE RESTRICT
);


CREATE Table PAGAMENTOO (
    id_pagamento int auto_increment primary key,
    data_pagamento date not null,
    nome_comprador varchar(60) not null,
    nome_livro varchar(60),
    forma_pagamento varchar(20) not null
);

CREATE Table fornecedorr (
    id_fornecedor int AUTO_INCREMENT PRIMARY KEY,
    razao_produto varchar (60) not null
);

--2-------------------------------------------------------------------------------------------

ALTER TABLE livroo ADD COLUMN editora_ VARCHAR(100) NULL;

INSERT INTO USUARIO (nome, email, telefone, ativo) VALUES
('luisa amancio', 'luiza.amancio@email.com', '19991112222', TRUE),
('nicolas amancio', 'xong.amancio@email.com', NULL, TRUE),
('carlos amancio', 'carlinhoss.amancio@email.com', '19983334444', TRUE),
('iara amancio', 'iaraaa.amancio@email.com', '19975556666', TRUE);

INSERT INTO livroo (titulo, autor, isbn, ano_publicacao, quantidade_disponivel, editoraa) VALUES
('Diario de um banana', 'Jeff Kinney', '0000000001111', 2007, 5, 'VR EDITORA'),
('Diario de um banana2', 'Jeff Kiney', '0000000002222', 2008, 2, 'VR EDITORA'),
('Diario de um banana3', 'Jeff Kiney', '0000000003333', 2009, 4, 'VR EDITORA'),
('Diario de um banana4', 'Jeff Kiney', '0000000004444', 2010, 1, 'VR EDITORA'),
('Diario de um banana5', 'Jeff Kiney', '0000000005555', 2011, 3, 'VR EDITORA'),
('Diario de um banana6', 'Jeff Kiney', '0000000006666', 2012, 6, 'VR EDITORA');

INSERT INTO EMPRESTIMO (data_prevista, status_emprestimo, id_usuario, id_livro) VALUES
('2026-11-01', 'ABERTO', 1, 1),
('2026-11-05', 'ABERTO', 2, 3),
('2026-11-10', 'ABERTO', 3, 5);


SELECT id_usuario, nome, telefone FROM USUARIO WHERE email = 'carlinhoss.amancioo@email.com';
UPDATE USUARIO SET telefone = '19996448720' WHERE id_usuario = 2;

UPDATE LIVROO SET quantidade_disponivel = quantidade_disponivel + 2 WHERE ano_publicacao >= 2020;

INSERT INTO USUARIO (nome, email, telefone) VALUES ('Usuário Teste', 'teste@email.com', '19900000000');


DELETE FROM USUARIO WHERE email = 'teste@email.com';

--3---------------------------------------------------------------------------------------

SELECT titulo, autor, quantidade_disponivel FROM livroo;


SELECT * FROM livroo 
WHERE quantidade_disponivel > 2 
ORDER BY quantidade_disponivel DESC;


SELECT * FROM livroo 
WHERE titulo LIKE '%Algoritmos%';

SELECT * FROM livroo 
WHERE ano_publicacao BETWEEN 2015 AND 2025;


SELECT 
    COUNT(*) AS total_livros,
    SUM(quantidade_disponivel) AS total_exemplares,
    AVG(quantidade_disponivel) AS media_exemplares,
    MIN(quantidade_disponivel) AS menor_estoque,
    MAX(quantidade_disponivel) AS maior_estoque
FROM livroo;


SELECT 
    E.id_emprestimo,
    U.nome AS usuario,
    L.titulo AS livroo,
    E.data_emprestimo,
    E.status_emprestimo
FROM EMPRESTIMO E
INNER JOIN USUARIO U ON E.id_usuario = U.id_usuario
INNER JOIN LIVRO L ON E.id_livro = L.id_livro;


SELECT 
    E.id_emprestimo,
    U.nome AS usuario,
    L.titulo AS livroo,
    E.data_emprestimo,
    E.status_emprestimo
FROM EMPRESTIMO E
INNER JOIN USUARIO U ON E.id_usuario = U.id_usuario
INNER JOIN livroo L ON E.id_livro = L.id_livro
WHERE E.status_emprestimo = 'ABERTO';


SELECT 
    U.nome AS usuario,
    COUNT(E.id_emprestimo) AS total_emprestimos
FROM USUARIO U
INNER JOIN EMPRESTIMO E ON U.id_usuario = E.id_usuario
GROUP BY U.id_usuario, U.nome
ORDER BY total_emprestimos DESC;


SELECT 
    U.nome AS usuario,
    COUNT(E.id_emprestimo) AS total_emprestimos
FROM USUARIO U
LEFT JOIN EMPRESTIMO E ON U.id_usuario = E.id_usuario
GROUP BY U.id_usuario, U.nome
ORDER BY total_emprestimos DESC;


--4------------------------------------------------------------------------------------



START TRANSACTION;


INSERT INTO EMPRESTIMO (data_prevista, status_emprestimo, id_usuario, id_livro) 
VALUES ('2026-11-15', 'ABERTO', 4, 2);
    

   
UPDATE livroo 
SET quantidade_disponivel = quantidade_disponivel - 1 
WHERE id_livro = 2;


SELECT * FROM EMPRESTIMO WHERE id_usuario = 4 AND id_livro = 2;
SELECT id_livro, titulo, quantidade_disponivel FROM LIVRO WHERE id_livro = 2;
COMMIT; 


START TRANSACTION;

UPDATE livroo SET quantidade_disponivel = 99 WHERE id_livro = 1;


SELECT id_livro, titulo, quantidade_disponivel FROM LIVRO WHERE id_livro = 1;
ROLLBACK;


SELECT id_livro, titulo, quantidade_disponivel FROM LIVRO WHERE id_livro = 1;


START TRANSACTION;

UPDATE livroo SET quantidade_disponivel = quantidade_disponivel + 1 WHERE id_livro = 1;
    
SAVEPOINT savepoint1;


 

-- 8 


--Uma análise técnica é como garantir a segurança dos dados em um sistema de biblioteca que vai usar as ferramentas do banco de dados 

--Evitar cadastros que existe e o unique impede que dois usuários tenham mesmo email ou que dois livros tenham o mesmo isbn , porque o banco não aceita duplicações.
--Protege contra valores negativos e o chek impede que a quantidade de livros fique abaixo de zero

--O foreing key vai garantir que um empréstimo seja feito para um usuário que exista e do mesmo jeito o on delet restrict vai impedir que um livro seja apagado se ele ainda tiver um histórico de empréstimos

--As operações completas e seguras como o COMMIT e o ROLLBACK faz com que ao  tentar registrar um empréstimo e atualizar o estoque, ou os dois ser feitos, ou nada vai ser gravado no banco de dados

-- Um controle de regras do negócio  é impedir a criação de empréstimo quando o estoque chegar a zero é responsabilidade que  vai validar antes de gravar 

 




