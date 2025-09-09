DELIMITER $$

CREATE TRIGGER trg_log_saida_estoque AFTER
UPDATE ON PRODUTO FOR EACH ROW BEGIN IF NEW.estoque < OLD.estoque THEN
INSERT INTO
    LOG_ESTOQUE (
        id_produto,
        quantidade_alterada,
        tipo_movimentacao
    )
VALUES
    (
        NEW.id_produto,
        OLD.estoque - NEW.estoque,
        'SAÍDA'
    );

END IF;

END

$$ DELIMITER ;
