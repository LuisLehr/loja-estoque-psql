-- CRIANDO UMA FUNCTION QUE RETORNA O VALOR MEDIO DAS VENDAS DENTRO DE UM PERIDO COM DATA INICIAL E DATA FINAL
CREATE OR REPLACE FUNCTION fn_ticket_medio_periodo(data_inicial DATE, data_final DATE)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$

BEGIN

    RETURN (
        SELECT ROUND(AVG(valor_total), 2)
            AS valor_medio_venda
          FROM venda
         WHERE data_venda BETWEEN data_inicial AND data_final;
    );
    
END;
$$;


