-- CRIANDO FUNCTION QUE RETORNA O VALOR TOTAL GASTO POR UM CLIENTE ESPECIFICO
CREATE OR REPLACE FUNCTION fn_total_gasto_cliente(p_id_cliente INTEGER)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE
    v_total NUMERIC
BEGIN
    SELECT SUM(valor_total)
      INTO v_total
      FROM venda
     WHERE id_cliente = p_id_cliente
       AND status = 'CONCLUIDA';

    RETURN COALESCE(v_total, 0);
END;
$$;  
