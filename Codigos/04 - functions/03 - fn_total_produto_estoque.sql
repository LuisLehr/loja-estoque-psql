-- CRIANDO UMA FUNCTION QUE RETORNA O TOTAL DE UM PRODUTO POR LOCAIS DE ESTOQUE
CREATE OR REPLACE FUNCTION fn_total_produto_estoque(p_id_produto INTEGER)
RETURNS TABLE (p_nome TEXT, e_quantidade INTEGER, le_descricao TEXT)
LANGUAGE plpgsql
AS $$

BEGIN
    RETURN QUERY
        SELECT p.nome::TEXT,
            e.quantidade,
            le.descricao::TEXT
        FROM produtos p
        INNER JOIN estoque e
            ON p.id = e.id_produto
        INNER JOIN local_estoque le
            ON e.id_local = le.id
        WHERE p.id = p_id_produto;
END;
$$;
            