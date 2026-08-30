-- PROCEDURE QUE MOVIMENTA A QUANTIA INFORMADA DE UM PRODUTO DE UM LOCAL_ESTOQUE PARA OUTRO (SOMENTE A QUANTIA TOTAL)
CREATE OR REPLACE PROCEDURE pr_troca_local_estoque(p_id_produto INTEGER, p_local_inicial INTEGER, p_local_final INTEGER)
LANGUAGE plpgsql
AS $$
DECLARE
    v_quantidade_movimento INTEGER;
BEGIN

    -- DANDO VALOR A VARIAVEL
    SELECT quantidade 
      INTO v_quantidade_movimento
      FROM estoque 
     WHERE id_produto = p_id_produto
       AND id_local = p_local_inicial;

    -- ATUALIZANDO O ESTOQUE
    UPDATE estoque 
       SET id_local = p_local_final
     WHERE id_produto = p_id_produto
       AND id_local = p_local_inicial;

    -- MOVIMENTANDO O ESTOQUE
    INSERT INTO movimento_estoque (id_produto, id_tipo_movimento, quantidade, observacao)
    VALUES (p_id_produto, 5, v_quantidade_movimento, 'Troca de local de estoque'); 

    COMMIT; 

END;
$$;