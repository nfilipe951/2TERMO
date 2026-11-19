USE smartcoffee_procedures_nicolass;

-- AULA 13 - ATIVIDADE STORED PROCEDURES
-- Aluno: Nicolas Filipe Amancio
-- Turma: 2DEVIS



-- 1. listar_clientes_ativos()
DELIMITER $$
CREATE PROCEDURE listar_clientes_ativos()
BEGIN
    SELECT ID_CLIENTE AS CÓDIGO, NOME, EMAIL, TELEFONE
    FROM CLIENTE
    WHERE ATIVO = TRUE
    ORDER BY NOME;
END $$
DELIMITER ;

CALL listar_clientes_ativos();



-- 2. buscar_produto_por_nome(IN p_busca VARCHAR(100))
DELIMITER $$
CREATE PROCEDURE buscar_produto_por_nome(IN p_busca VARCHAR(100))
BEGIN
    SELECT ID_PRODUTO AS CÓDIGO, NOME, PRECO
    FROM PRODUTO
    WHERE NOME LIKE CONCAT('%', p_busca, '%')
      AND ATIVO = TRUE
    ORDER BY NOME;
END $$
DELIMITER ;

CALL buscar_produto_por_nome('Café');



-- 3. produtos_por_categoria(IN p_id_categoria INT)
DELIMITER $$
CREATE PROCEDURE produtos_por_categoria(IN p_id_categoria INT)
BEGIN
    SELECT ID_PRODUTO AS CÓDIGO, NOME, PRECO
    FROM PRODUTO
    WHERE ID_CATEGORIA = p_id_categoria
      AND ATIVO = TRUE
    ORDER BY NOME;
END $$
DELIMITER ;

CALL produtos_por_categoria(1);

-- 4. total_clientes(OUT p_total INT)
DELIMITER $$
CREATE PROCEDURE total_clientes(OUT p_total INT)
BEGIN
    SELECT COUNT(*)
    INTO p_total
    FROM CLIENTE
    WHERE ATIVO = TRUE;
END $$
DELIMITER ;

CALL total_clientes(@TOTAL_CLIENTES);
SELECT @TOTAL_CLIENTES;


-- 5. consultar_estoque(IN p_id_produto INT) usando variável local
DELIMITER $$
CREATE PROCEDURE consultar_estoque(IN p_id_produto INT)
BEGIN
    DECLARE V_QUANTIDADE INT;

    SELECT QUANTIDADE
    INTO V_QUANTIDADE
    FROM ESTOQUE
    WHERE ID_PRODUTO = p_id_produto;

    SELECT V_QUANTIDADE AS QUANTIDADE_ESTOQUE;
END $$
DELIMITER ;

CALL consultar_estoque(1);



-- 6. classificar estoque: 0 SEM ESTOQUE / <=5 BAIXO / >5 NORMAL
DELIMITER $$
CREATE PROCEDURE classificar_estoque(IN p_id_produto INT)
BEGIN
    DECLARE V_QUANTIDADE INT;

    SELECT QUANTIDADE
    INTO V_QUANTIDADE
    FROM ESTOQUE
    WHERE ID_PRODUTO = p_id_produto;

    IF V_QUANTIDADE = 0 THEN
        SELECT 'SEM ESTOQUE' AS SITUAÇÃO;
    ELSEIF V_QUANTIDADE <= 5 THEN
        SELECT 'ESTOQUE BAIXO' AS SITUAÇÃO;
    ELSE
        SELECT 'ESTOQUE NORMAL' AS SITUAÇÃO;
    END IF;
END $$
DELIMITER ;

CALL classificar_estoque(1);


-- 7. cadastrar_cliente(...) com três parâmetros IN
DELIMITER $$
CREATE PROCEDURE cadastrar_cliente(
    IN p_nome VARCHAR(100),
    IN p_email VARCHAR(120),
    IN p_telefone VARCHAR(20)
)
BEGIN
    INSERT INTO CLIENTE (NOME, EMAIL, TELEFONE, ATIVO)
    VALUES (p_nome, p_email, p_telefone, TRUE);

    SELECT 'CLIENTE CADASTRADO' AS MENSAGEM;
END $$
DELIMITER ;

CALL cadastrar_cliente('Carlos Amancio', 'Carlos@email.com', '19999999998');


-- 8. alterar_preco(...) impedindo valor <= 0
DELIMITER $$
CREATE PROCEDURE alterar_preco(
    IN p_id_produto INT,
    IN p_novo_preco DECIMAL(10,2)
)
BEGIN
    IF p_novo_preco > 0 THEN
        UPDATE PRODUTO
        SET PRECO = p_novo_preco
        WHERE ID_PRODUTO = p_id_produto;

        SELECT 'PREÇO ATUALIZADO' AS MENSAGEM;
    ELSE
        SELECT 'PREÇO INVÁLIDO' AS MENSAGEM;
    END IF;
END $$
DELIMITER ;

CALL alterar_preco(1, 15.50);


-- 9. criar_pedido(IN p_id_cliente INT, OUT p_id_pedido INT)
-- 10. devolver ID com LAST_INSERT_ID()
DELIMITER $$
CREATE PROCEDURE criar_pedido(
    IN p_id_cliente INT,
    OUT p_id_pedido INT
)
BEGIN
    START TRANSACTION;
    INSERT INTO PEDIDO (
        ID_CLIENTE,
        DATA_PEDIDO,
        STATUS_PEDIDO
    )
    VALUES (
        p_id_cliente, NOW(), 'ABERTO'
    );

    SET p_id_pedido = LAST_INSERT_ID();
    COMMIT;
END $$
DELIMITER ;

CALL criar_pedido(1, @PEDIDO);
SELECT @PEDIDO;


