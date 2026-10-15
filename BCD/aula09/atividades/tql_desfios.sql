
100%
-- ATIVIDADE PRATICA - AULA 10
-- Aluno(a): _Nicolas Filipe Amancio ________
-- Regra: valide sempre antes de COMMIT.


-- 01. Consulte produto 2 e seu preço.
SELECT * FROM produtos 
WHERE id_produto = 2;

-- 02. START TRANSACTION e aumente produto 2 em R$3,00.
START TRANSACTION;
UPDATE produtos
SET preco = preco + 3.00
 WHERE id_produto = 2;

-- 03. Consulte dentro da transação.
SELECT * FROM produtos WHERE id_produto  = 2;

-- 04. ROLLBACK.
ROLLBACK;
-- 05. Consulte e comprove retorno.
SELECT * FROM produtos 
WHERE id_produto = 2;

-- 06. Repita a alteração e finalize com COMMIT.
START TRANSACTION;
UPDATE produtos
SET preco = preco + 3.00
 WHERE id_produto = 2;

-- 07. START TRANSACTION e aumente produto 3 em 10%.

START TRANSACTION;
UPDATE produtos
SET preco = preco * 1.10
WHERE id_produto = 3;

-- 08. SAVEPOINT ajuste_produto3.

SAVEPOINT ajuste_produto3;


-- 09. Aumente produto 4 em 50%.

UPDATE produtos
SET preco = preco * 1.50
WHERE id_produto = 4;


-- 10. Consulte os dois.

SELECT * FROM produtos 
WHERE id_produto IN (3,4);


-- 11. ROLLBACK TO SAVEPOINT ajuste_produto3.

ROLLBACK 
TO SAVEPOINT ajuste_produto3;

-- 12. COMMIT e explique em comentário qual alteração permaneceu.

commit

-- Comentário: O COMMIT confirma e consolida permanentemente todas as alterações realizadas antes dele na transação corrente.

-- 13. START TRANSACTION.

START TRANSACTION;

-- 14. Crie pedido para cliente 1 e salve o id em @novo_pedido.

INSERT INTO pedido (id_cliente, data_pedido, status) 
VALUES (1, NOW(), 'PENDENTE');

SET @novo_pedido = LAST_INSERT_ID();

-- 15. Insira dois itens válidos.

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario)


-- 16. Registre pagamento válido.

INSERT INTO pagamento (id_pedido, valor, forma_pagamento, status) 
VALUES (@novo_pedido, 35.50, 'CARTAO', 'APROVADO');

-- 17. Consulte pedido, itens e pagamento.

SELECT * FROM pedido WHERE id = @novo_pedido;
SELECT * FROM item_pedido WHERE id_pedido = @novo_pedido;
SELECT * FROM pagamento WHERE id_pedido = @novo_pedido;

-- 18. COMMIT.
commit

-- 19. START TRANSACTION e crie pedido para cliente 2.
START TRANSACTION;
INSERT INTO pedido (id_cliente, data_pedido, status) 
VALUES (2, NOW(), 'EM ANDAMENTO');

-- 20. Salve o id em @pedido_com_erro.

SET @pedido_com_erro = LAST_INSERT_ID();

-- 21. Tente inserir item com id_produto inexistente.
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) 
VALUES (@pedido_com_erro, 999999, 1, 10.00);

-- 22. Após observar a FK, ROLLBACK.

rollback;


-- 23. Consulte @pedido_com_erro e comprove que não permaneceu.
SELECT * FROM pedido WHERE id = @pedido_com_erro;

-- 24. Tente excluir uma categoria que possui produtos.
-- Explique em comentário por que foi bloqueado.
DELETE FROM categoria WHERE id = 1;
Comentário: A exclusão foi bloqueada devido à restrição de chave estrangeira

--  (Foreign Key / RESTRICT). 
-- Como existem produtos vinculados a esta categoria, a integridade referencial impede a remoção do registro pai.

-- 25. Crie em uma transação um pedido temporário com dois itens,
-- exclua o pedido e observe ON DELETE CASCADE.
-- Finalize com ROLLBACK para preservar a base.

-- DESAFIO EXTRA - CAIXA DO SMARTCOFFEE

START TRANSACTION;

INSERT INTO pedido (id_cliente, data_pedido, status) VALUES (1, NOW(), 'TEMPORARIO');
SET @pedido_temp = LAST_INSERT_ID();

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) 
VALUES 
  (@pedido_temp, 1, 1, 12.00),
  (@pedido_temp, 2, 1, 8.00);

-- Ao excluir o pedido, os registros associados em item_pedido são removidos automaticamente via ON DELETE CASCADE:
DELETE FROM pedido WHERE id = @pedido_temp;

-- Consulta para verificar se os itens foram removidos em cascata:
SELECT * FROM item_pedido WHERE id_pedido = @pedido_temp;

ROLLBACK;

-- DESAFIO EXTRA - CAIXA DO SMARTCOFFEE
-- Em UMA transação:
-- a) pedido; b) 3 itens; c) baixa de estoque;
-- d) SAVEPOINT; e) pagamento; f) status FINALIZADO;
-- g) consultas; h) COMMIT.



