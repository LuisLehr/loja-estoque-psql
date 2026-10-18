--  CRIANDO UMA FUNCTION QUE REGISTRA O MOVIMENTO DE VENDA NO ESTOQUE
CREATE OR REPLACE FUNCTION fn_tg_registra_movimento_estoque()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

    INSERT INTO movimento_estoque (id_produto, id_venda_item, id_tipo_movimento, quantidade, data_movimento, observacao)
    VALUES (NEW.id_produto, NEW.id_venda_item, 2, NEW.quantidade, now(), null);

    -- CONTINUA O REGISTRO
    RETURN NEW;

END;
$$;