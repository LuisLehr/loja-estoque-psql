-- PROCEDURE QUE LIDA COM A ENTRADA DE PRODUTOS NO ESTOQUE, AUMENTANDO O VALOR NO ESTOQUE E CRIANDO UMA MOVIMENTAÇÃO NO ESTOQUE 
-- (SOMENTE PARA PRODUTOS QUE JA EXISTEM NA TABELA PRODUTOS)

CREATE OR REPLACE PROCEDURE pr_entrada_estoque(p_id_produto INTEGER, p_quantidade INTEGER, p_local_estoque INTEGER, p_observacao VARCHAR)
LANGUAGE plpgsql
AS $$

BEGIN

    -- ATUALIZANDO O ESTOQUE    
    UPDATE estoque
       SET quantidade = quantidade + p_quantidade
     WHERE id = p_id_produto
       AND id_local = p_local_estoque;

    -- REGISTRANDO O MOVIMENTO
    INSERT INTO movimento_estoque (id_produto, id_tipo_movimento, quantidade, observacao)
    VALUES (p_id_produto, 1, p_quantidade, p_observacao);

    COMMIT;

END;
$$;

-- PARA USAR 
-- CALL pr_entrada_estoque(1, 20, 1,  'Reposição de estoque - junho/2026');