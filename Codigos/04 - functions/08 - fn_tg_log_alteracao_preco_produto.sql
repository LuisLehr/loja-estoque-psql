-- CRIANDO UMA FUNCTION QUE FARA UM LOG DE PRECOS DOS PRODUTOS
CREATE OR REPLACE FUNCTION fn_tg_log_alteracao_preco_produto()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

    IF NEW.preco <> OLD.preco THEN
        INSERT INTO historico_preco_produto (produto_id, preco_anterior, preco_novo)
        VALUES(OLD.id, OLD.preco, NEW.PRECO);
    END IF;

    -- CONTINUA A ATUALIZACAO
    RETURN NEW;

END;
$$;