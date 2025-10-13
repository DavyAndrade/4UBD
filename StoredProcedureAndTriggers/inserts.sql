-- Inserts para a tabela CLIENTE
INSERT INTO
    CLIENTE (nome, email)
VALUES
    ('Ana Souza', 'ana.souza@email.com'),
    ('Carlos Pereira', 'carlos.pereira@email.com'),
    ('Mariana Oliveira', 'mariana.oliveira@email.com'),
    ('João Santos', 'joao.santos@email.com'),
    ('Fernanda Lima', 'fernanda.lima@email.com');

-- Inserts para a tabela PRODUTO
INSERT INTO
    PRODUTO (nome, preco, estoque)
VALUES
    ('Notebook Dell Inspiron', 3500.00, 10),
    ('Smartphone Samsung Galaxy', 2200.00, 15),
    ('Fone de Ouvido Bluetooth', 250.00, 30),
    ('Teclado Mecânico Redragon', 350.00, 20),
    ('Mouse Gamer Logitech', 180.00, 25),
    ('Monitor LG 24"', 900.00, 12),
    ('Cadeira Gamer ThunderX3', 1500.00, 8);

-- Inserts para a tabela PEDIDO
INSERT INTO
    PEDIDO (id_cliente, data_pedido)
VALUES
    (1, '2025-09-01 10:30:00'),
    (2, '2025-09-02 14:15:00'),
    (3, '2025-09-03 19:45:00'),
    (1, '2025-09-04 09:20:00'),
    (5, '2025-09-05 17:00:00');

-- Inserts para a tabela ITEM_PEDIDO
-- Pedido 1 da Ana Souza
INSERT INTO
    ITEM_PEDIDO (
        id_pedido,
        id_produto,
        quantidade,
        preco_unitario
    )
VALUES
    (1, 1, 1, 3500.00),
    -- Notebook
    (1, 3, 2, 250.00);

-- Fones
-- Pedido 2 do Carlos
INSERT INTO
    ITEM_PEDIDO (
        id_pedido,
        id_produto,
        quantidade,
        preco_unitario
    )
VALUES
    (2, 2, 1, 2200.00),
    -- Smartphone
    (2, 5, 1, 180.00);

-- Mouse
-- Pedido 3 da Mariana
INSERT INTO
    ITEM_PEDIDO (
        id_pedido,
        id_produto,
        quantidade,
        preco_unitario
    )
VALUES
    (3, 7, 1, 1500.00);

-- Cadeira Gamer
-- Pedido 4 da Ana (outro)
INSERT INTO
    ITEM_PEDIDO (
        id_pedido,
        id_produto,
        quantidade,
        preco_unitario
    )
VALUES
    (4, 6, 2, 900.00),
    -- 2 Monitores
    (4, 4, 1, 350.00);

-- Teclado
-- Pedido 5 da Fernanda
INSERT INTO
    ITEM_PEDIDO (
        id_pedido,
        id_produto,
        quantidade,
        preco_unitario
    )
VALUES
    (5, 2, 1, 2200.00),
    (5, 5, 2, 180.00);

-- Inserts para a tabela LOG_ESTOQUE
-- Movimentações relacionadas aos pedidos
INSERT INTO
    LOG_ESTOQUE (
        id_produto,
        quantidade_alterada,
        tipo_movimentacao,
        data_log
    )
VALUES
    (1, -1, 'SAÍDA', '2025-09-01 10:31:00'),
    (3, -2, 'SAÍDA', '2025-09-01 10:31:00'),
    (2, -1, 'SAÍDA', '2025-09-02 14:16:00'),
    (5, -1, 'SAÍDA', '2025-09-02 14:16:00'),
    (7, -1, 'SAÍDA', '2025-09-03 19:46:00'),
    (6, -2, 'SAÍDA', '2025-09-04 09:21:00'),
    (4, -1, 'SAÍDA', '2025-09-04 09:21:00'),
    (2, -1, 'SAÍDA', '2025-09-05 17:01:00'),
    (5, -2, 'SAÍDA', '2025-09-05 17:01:00'),
    -- Entradas de estoque (reposição)
    (1, 5, 'ENTRADA', '2025-09-06 10:00:00'),
    (2, 3, 'ENTRADA', '2025-09-06 10:05:00'),
    (3, 10, 'ENTRADA', '2025-09-06 10:10:00');