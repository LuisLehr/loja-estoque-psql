-- CRIANDO FUNCTION QUE RETORNA TRUE CASO O ESTOQUE DE UM DETERMINADO ESTEJA NO VALOR ADEQUADO E FALSE CASO NÃO ESTEJA
CREATE OR REPLACE FUNCTION fn_quantia_estoque_adequado(p_id_produto INTEGER)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$

BEGIN
    
    RETURN EXISTS (
        SELECT 1
          FROM produtos p 
         INNER JOIN estoque e 
            ON p.id = e.id_produto
         WHERE p.id = p_id_produto
           AND e.quantidade >= e.quantidade_minima
    );
END;
$$;