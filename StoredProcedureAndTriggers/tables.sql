CREATE DATABASE IF NOT EXISTS loja_online;

USE loja_online;

CREATE TABLE CLIENTE (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE PRODUTO (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2),
    estoque INT
);

CREATE TABLE PEDIDO (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATETIME DEFAULT NOW (),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE (id_cliente)
);

CREATE TABLE ITEM_PEDIDO (
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES PEDIDO (id_pedido),
    FOREIGN KEY (id_produto) REFERENCES PRODUTO (id_produto)
);

CREATE TABLE LOG_ESTOQUE (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    quantidade_alterada INT,
    data_log DATETIME DEFAULT NOW (),
    tipo_movimentacao ENUM ('ENTRADA', 'SAÍDA'),
    FOREIGN KEY (id_produto) REFERENCES PRODUTO (id_produto)
);