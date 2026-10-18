-- PROCEDURE QUE CANCELA VENDA E MOVE AS QUANTIAS PARA OS LOCAIS ORIGINAIS
CREATE OR REPLACE PROCEDURE pr_cancela_venda(p_id_venda INTEGER)
LANGUAGE plpgsql
AS $$
DECLARE
    v_item RECORD;

BEGIN

    -- ATUALIZANDO A TABELA VENDA 
    UPDATE venda
       SET status = 'CANCELADA',
           observacao = 'Cancelada'
     WHERE id = p_id_venda;

    -- ATUALIZANDO A TABELA DE PAGAMENTOS
    UPDATE pagamento
       SET status = 'ESTORNADO'
     WHERE id_venda = p_id_venda;

    -- PERCORRENDO CADA ITEM DA VENDA
    FOR v_item IN SELECT id_produto, quantidade FROM venda_item WHERE id_venda = p_id_venda
    LOOP

        -- DEVOLVENDO A QUANTIDADE AO ESTOQUE
        UPDATE estoque 
           SET quantidade = quantidade + v_item.quantidade
         WHERE id_produto = v_item.id_produto
           AND id_local = 1;

        -- REGISTRANDO MOVIMENTO PARA CADA ITEM DA VENDA
        INSERT INTO movimento_estoque(id_produto, id_tipo_movimento, quantidade, observacao)
        VALUES (v_item.id_produto, 3, v_item.quantidade, 'Venda cancelada - estorno');
    END LOOP; 

    COMMIT;

END;
$$;

-- COMO USAR: CALL pr_cancela_venda(6);