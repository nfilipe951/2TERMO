-- -- ============================================================================
-- -- CFP 5.05 - ESCOLA SENAI "LUIZ VARGA"
-- -- SITUAÇÃO DE APRENDIZAGEM - SOMATIVA 02: SISTEMA DE GERENCIAMENTO DE BIBLIOTECA
-- -- Aluno / Turma: Devis-26
-- -- Banco de Dados: DDL, DML, DQL e TCL
-- -- ============================================================================


-- -- ============================================================================
-- -- FASE 1 — DDL: CRIAÇÃO E ESTRUTURA (25 PONTOS)
-- -- ============================================================================

-- -- 1. Criação do banco — 3 pts
-- CREATE DATABASE IF NOT EXISTS biblioteca_som2;
-- USE biblioteca_som2;

-- -- 2. Tabela USUARIO — 6 pts
-- -- Atende às regras RN01 (nome/email obrigatórios), RN02 (e-mail único) e RN03 (ativo por padrão).
-- CREATE TABLE USUARIO (
--     id_usuario INT AUTO_INCREMENT PRIMARY KEY,
--     nome VARCHAR(100) NOT NULL,
--     email VARCHAR(120) NOT NULL UNIQUE,
--     telefone VARCHAR(20) NULL,
--     ativo BOOLEAN DEFAULT TRUE
-- );

-- -- 3. Tabela LIVRO — 6 pts
-- -- Atende às regras RN04 (título, autor, ISBN, qtde obrigatórios), RN05 (ISBN único) e RN06 (CHECK >= 0).
-- CREATE TABLE LIVRO (
--     id_livro INT AUTO_INCREMENT PRIMARY KEY,
--     titulo VARCHAR(150) NOT NULL,
--     autor VARCHAR(120) NOT NULL,
--     isbn CHAR(13) NOT NULL UNIQUE,
--     ano_publicacao INT NULL,
--     quantidade_disponivel INT DEFAULT 0 CHECK (quantidade_disponivel >= 0)
-- );

-- -- 4. Tabela EMPRESTIMO — 7 pts
-- -- Atende às regras RN11, RN12 (CHECK status), RN16 e RN17 (RESTRICT impede exclusão com histórico).
-- CREATE TABLE EMPRESTIMO (
--     id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
--     data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
--     data_prevista DATE NOT NULL,
--     data_devolucao DATE NULL,
--     status_emprestimo VARCHAR(20) DEFAULT 'ABERTO' CHECK (status_emprestimo IN ('ABERTO', 'DEVOLVIDO', 'ATRASADO')),
--     id_usuario INT NOT NULL,
--     id_livro INT NOT NULL,
--     CONSTRAINT fk_emprestimo_usuario FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario) ON DELETE RESTRICT,
--     CONSTRAINT fk_emprestimo_livro FOREIGN KEY (id_livro) REFERENCES LIVRO(id_livro) ON DELETE RESTRICT
-- );

-- -- 5. ALTER TABLE — 3 pts
-- -- Adiciona a coluna editora à tabela LIVRO.
-- ALTER TABLE LIVRO ADD COLUMN editora VARCHAR(100) NULL;


-- -- ============================================================================
-- -- FASE 2 — DML: MANIPULAÇÃO DE DADOS (25 PONTOS)
-- -- ============================================================================

-- -- 6. INSERT de usuários — 4 pts
-- -- Cadastra 4 usuários, incluindo um com telefone NULL.
-- INSERT INTO USUARIO (nome, email, telefone, ativo) VALUES
-- ('Ana Silva', 'ana.silva@email.com', '19991112222', TRUE),
-- ('Carlos Oliveira', 'carlos.oliveira@email.com', NULL, TRUE),
-- ('Beatriz Souza', 'beatriz.souza@email.com', '19983334444', TRUE),
-- ('Daniel Costa', 'daniel.costa@email.com', '19975556666', TRUE);

-- -- 7. INSERT de livros — 5 pts
-- -- Cadastra 6 livros com dados distintos.
-- INSERT INTO LIVRO (titulo, autor, isbn, ano_publicacao, quantidade_disponivel, editora) VALUES
-- ('Clean Code', 'Robert C. Martin', '9780132350884', 2008, 5, 'Prentice Hall'),
-- ('O Mítico Homem-Mês', 'Fred Brooks', '9780201835953', 1995, 2, 'Addison-Wesley'),
-- ('Entendendo Algoritmos', 'Aditya Bhargava', '9788575225639', 2017, 4, 'Novatec'),
-- ('Padrões de Projeto', 'Erich Gamma et al.', '9788573076103', 2000, 1, 'Bookman'),
-- ('Estruturas de Dados e Algoritmos em Java', 'Michael T. Goodrich', '9788582600184', 2021, 3, 'Bookman'),
-- ('Engenharia de Software Moderna', 'Marco Tulio Valente', '9786500019506', 2020, 6, 'Independente');

-- -- 8. INSERT de empréstimos — 4 pts
-- -- Registra 3 empréstimos com status ABERTO.
-- INSERT INTO EMPRESTIMO (data_prevista, status_emprestimo, id_usuario, id_livro) VALUES
-- ('2026-11-01', 'ABERTO', 1, 1),
-- ('2026-11-05', 'ABERTO', 2, 3),
-- ('2026-11-10', 'ABERTO', 3, 5);

-- -- 9. UPDATE — 4 pts
-- -- Localiza o usuário com SELECT e depois altera o telefone com UPDATE.
-- SELECT id_usuario, nome, telefone FROM USUARIO WHERE email = 'carlos.oliveira@email.com';
-- UPDATE USUARIO SET telefone = '19988889999' WHERE id_usuario = 2;

-- -- 10. Atualização em lote — 4 pts
-- -- Acrescenta 2 exemplares a todos os livros publicados a partir de 2020.
-- UPDATE LIVRO SET quantidade_disponivel = quantidade_disponivel + 2 WHERE ano_publicacao >= 2020;

-- -- 11. DELETE e integridade — 4 pts
-- -- Cria e exclui um usuário sem empréstimos.
-- INSERT INTO USUARIO (nome, email, telefone) VALUES ('Usuário Teste', 'teste@email.com', '19900000000');
-- DELETE FROM USUARIO WHERE email = 'teste@email.com';

-- -- Tentativa de exclusão de usuário COM histórico de empréstimo (deve falhar devido à FK ON DELETE RESTRICT):
-- -- DELETE FROM USUARIO WHERE id_usuario = 1;
-- /* 
-- EXPLICAÇÃO DO RESULTADO DA TENTATIVA DE EXCLUSÃO:
-- O comando falha com um erro de Foreign Key Constraint Violation (Erro 1451 no MySQL). 
-- Isso ocorre porque a tabela EMPRESTIMO possui uma Restrição de Integridade Referencial 
-- (FK ON DELETE RESTRICT) vinculada à tabela USUARIO. O banco bloqueia a operação para 
-- evitar a criação de registros órfãos na tabela de empréstimos (RN16).
-- */


-- -- ============================================================================
-- -- FASE 3 — DQL: CONSULTAS E ANÁLISE (30 PONTOS)
-- -- ============================================================================

-- -- 12. SELECT básico — 2 pts
-- SELECT titulo, autor, quantidade_disponivel FROM LIVRO;

-- -- 13. WHERE + ORDER BY — 3 pts
-- SELECT * FROM LIVRO 
-- WHERE quantidade_disponivel > 2 
-- ORDER BY quantidade_disponivel DESC;

-- -- 14. LIKE — 3 pts
-- SELECT * FROM LIVRO 
-- WHERE titulo LIKE '%Algoritmos%';

-- -- 15. BETWEEN — 3 pts
-- SELECT * FROM LIVRO 
-- WHERE ano_publicacao BETWEEN 2015 AND 2025;

-- -- 16. Funções agregadas — 4 pts
-- SELECT 
--     COUNT(*) AS total_livros,
--     SUM(quantidade_disponivel) AS total_exemplares,
--     AVG(quantidade_disponivel) AS media_exemplares,
--     MIN(quantidade_disponivel) AS menor_estoque,
--     MAX(quantidade_disponivel) AS maior_estoque
-- FROM LIVRO;

-- -- 17. INNER JOIN — 4 pts
-- SELECT 
--     E.id_emprestimo,
--     U.nome AS usuario,
--     L.titulo AS livro,
--     E.data_emprestimo,
--     E.status_emprestimo
-- FROM EMPRESTIMO E
-- INNER JOIN USUARIO U ON E.id_usuario = U.id_usuario
-- INNER JOIN LIVRO L ON E.id_livro = L.id_livro;

-- -- 18. JOIN + WHERE — 3 pts
-- SELECT 
--     E.id_emprestimo,
--     U.nome AS usuario,
--     L.titulo AS livro,
--     E.data_emprestimo,
--     E.status_emprestimo
-- FROM EMPRESTIMO E
-- INNER JOIN USUARIO U ON E.id_usuario = U.id_usuario
-- INNER JOIN LIVRO L ON E.id_livro = L.id_livro
-- WHERE E.status_emprestimo = 'ABERTO';

-- -- 19. GROUP BY — 4 pts
-- SELECT 
--     U.nome AS usuario,
--     COUNT(E.id_emprestimo) AS total_emprestimos
-- FROM USUARIO U
-- INNER JOIN EMPRESTIMO E ON U.id_usuario = E.id_usuario
-- GROUP BY U.id_usuario, U.nome
-- ORDER BY total_emprestimos DESC;

-- -- 20. LEFT JOIN — 4 pts
-- SELECT 
--     U.nome AS usuario,
--     COUNT(E.id_emprestimo) AS total_emprestimos
-- FROM USUARIO U
-- LEFT JOIN EMPRESTIMO E ON U.id_usuario = E.id_usuario
-- GROUP BY U.id_usuario, U.nome
-- ORDER BY total_emprestimos DESC;


-- -- ============================================================================
-- -- FASE 4 — TCL, TRANSAÇÕES E INTEGRIDADE (20 PONTOS)
-- -- ============================================================================

-- -- 21. Transação de empréstimo — 7 pts
-- START TRANSACTION;
--     -- Passo 2: Registrar novo empréstimo
--     INSERT INTO EMPRESTIMO (data_prevista, status_emprestimo, id_usuario, id_livro) 
--     VALUES ('2026-11-15', 'ABERTO', 4, 2);
    
--     -- Passo 3: Reduzir estoque em 1 (RN13)
--     UPDATE LIVRO 
--     SET quantidade_disponivel = quantidade_disponivel - 1 
--     WHERE id_livro = 2;
    
--     -- Passo 4: Consultar para conferir alterações
--     SELECT * FROM EMPRESTIMO WHERE id_usuario = 4 AND id_livro = 2;
--     SELECT id_livro, titulo, quantidade_disponivel FROM LIVRO WHERE id_livro = 2;
-- COMMIT; -- Passo 5: Finalizar

-- -- 22. ROLLBACK — 5 pts
-- START TRANSACTION;
--     -- Alteração proposital de teste
--     UPDATE LIVRO SET quantidade_disponivel = 99 WHERE id_livro = 1;
    
--     -- Consulta de conferência (mostra 99 temporariamente na sessão)
--     SELECT id_livro, titulo, quantidade_disponivel FROM LIVRO WHERE id_livro = 1;
-- ROLLBACK;

-- -- Comprovação do retorno ao valor anterior:
-- SELECT id_livro, titulo, quantidade_disponivel FROM LIVRO WHERE id_livro = 1;

-- -- 23. SAVEPOINT — 4 pts
-- START TRANSACTION;
--     -- Primeira alteração
--     UPDATE LIVRO SET quantidade_disponivel = quantidade_disponivel + 1 WHERE id_livro = 1;
    
--     SAVEPOINT ponto1;
    
--     -- Segunda alteração
--     UPDATE LIVRO SET quantidade_disponivel = quantidade_disponivel + 1 WHERE id_livro = 2;
    
--     -- Desfaz apenas a segunda alteração
--     ROLLBACK TO SAVEPOINT ponto1;
-- COMMIT; -- Confirma a primeira alteração

-- -- 24. Transação de devolução — 4 pts
-- START TRANSACTION;
--     -- Localiza empréstimo aberto, altera status, registra data de devolução e aumenta o estoque em 1 (RN15)
--     UPDATE EMPRESTIMO 
--     SET status_emprestimo = 'DEVOLVIDO', data_devolucao = CURDATE() 
--     WHERE id_emprestimo = 1 AND status_emprestimo = 'ABERTO';
    
--     UPDATE LIVRO 
--     SET quantidade_disponivel = quantidade_disponivel + 1 
--     WHERE id_livro = (SELECT id_livro FROM EMPRESTIMO WHERE id_emprestimo = 1);
-- COMMIT;


-- -- ============================================================================
-- -- 8. DESAFIO FINAL DE INTEGRIDADE
-- -- 25. ANÁLISE TÉCNICA
-- -- ============================================================================
-- /*
-- ------------------------------------------------------------------------------------------------------------------------------------------------
-- SITUAÇÃO                                  | MECANISMO ADEQUADO           | JUSTIFICATIVA TÉCNICA
-- ------------------------------------------------------------------------------------------------------------------------------------------------
-- 1. Cadastrar dois usuários com o          | Constraint (UNIQUE)          | A restrição UNIQUE garante a unicidade da coluna diretamente na tabela.
--    mesmo e-mail.                          |                              | O SGDB rejeita qualquer INSERT/UPDATE duplicado no motor do banco.

-- 2. Cadastrar dois livros com o            | Constraint (UNIQUE)          | O ISBN é o identificador único universal do livro. A constraint UNIQUE
--    mesmo ISBN.                            |                              | no DDL impede duplicações em nível de banco de dados.

-- 3. Permitir quantidade disponível         | Constraint (CHECK)           | A regra `CHECK (quantidade_disponivel >= 0)` é validada nativamente pelo 
--    negativa.                              |                              | SGBD antes de efetivar qualquer modificação do dado.

-- 4. Criar empréstimo para usuário          | Integridade Referencial (FK) | A chave estrangeira (FOREIGN KEY) valida se a chave primária de destino
--    inexistente.                           |                              | existe na tabela USUARIO antes de permitir o cadastro.

-- 5. Excluir livro com histórico            | Integridade Referencial      | A FK com a regra `ON DELETE RESTRICT` impede a exclusão da entidade pai 
--    de empréstimos.                        | (FK ON DELETE RESTRICT)      | quando houver registros filhos vinculados.

-- 6. Gravar empréstimo e falhar na          | Transação (TCL / COMMIT e    | Operações compostas dependentes devem cumprir a propriedade ACID
--    redução do estoque.                    | ROLLBACK)                    | (Atomicidade). A transação garante que ou tudo é gravado, ou é desfeito.

-- 7. Emprestar livro cuja quantidade        | Regra da Aplicação           | O banco garante não ficar negativo (CHECK), mas impedir o início do 
--    disponível seja zero.                  | (Business Rule)              | processo antes de criar o registro exige validação na camada de serviço.
-- ------------------------------------------------------------------------------------------------------------------------------------------------
-- */