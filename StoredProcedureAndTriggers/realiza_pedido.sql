DELIMITER $ $ CREATE PROCEDURE realiza_pedido (
    IN p_id_cliente INT,
    IN p_id_produto INT,
    IN p_quantidade INT
) BEGIN DECLARE v_preco_unitario DECIMAL(10, 2);

DECLARE v_estoque_atual INT;

DECLARE v_id_pedido INT;

SELECT
    estoque,
    preco INTO v_estoque_atual,
    v_preco_unitario
FROM
    PRODUTO
WHERE
    id_produto = p_id_produto;

IF v_estoque_atual < p_quantidade THEN SIGNAL SQLSTATE '45000'
SET
    MESSAGE_TEXT = 'Estoque insuficiente!';

ELSE
INSERT INTO
    PEDIDO (id_cliente)
VALUES
    (p_id_cliente);

SET
    v_id_pedido = LAST_INSERT_ID ();

INSERT INTO
    ITEM_PEDIDO (
        id_pedido,
        id_produto,
        quantidade,
        preco_unitario
    )
VALUES
    (
        v_id_pedido,
        p_id_produto,
        p_quantidade,
        v_preco_unitario
    );

UPDATE
    PRODUTO
SET
    estoque = estoque - p_quantidade
WHERE
    id_produto = p_id_produto;

END IF;

END $ $ DELIMITER;