-- CRIANDO FUNCAO QUE VERIFICA SE A QUANTIA VENDIDA EXISTE NO ESTOQUE
CREATE OR REPLACE FUNCTION fn_tg_verifica_estoque()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_quantidade_disponivel INTEGER;
BEGIN

    -- BUSCA A QUANTIDADE DISPONIVEL DO PRODUTO NO ESTOQUE (SEM LEVAR VITRINE EM CONSIDERACAO)
    SELECT quantidade 
      INTO v_quantidade_disponivel
      FROM estoque
     WHERE id_produto = NEW.id_produto
       AND id_local = 1;

    -- VERIFICA SE TEM ESTOQUE SUFICIENTE
    IF v_quantidade_disponivel < NEW.quantidade THEN
        RAISE EXCEPTION 'Estoque insuficiente para o produto %. Disponível %, Solicitado %.',
            NEW.id_produto,
            v_quantidade_disponivel,
            NEW.quantidade;
    END IF;

    RETURN NEW;

END;
$$;