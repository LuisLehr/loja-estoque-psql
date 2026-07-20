-- CRIANDO UMA VIEW QUE LISTA QUANTIDADE E VALOR VENDIDO POR MES
CREATE VIEW v_vendas_periodo AS
SELECT CASE EXTRACT(MONTH FROM v.data_venda)
  WHEN 1 THEN 'Janeiro'
  WHEN 2 THEN 'Fevereiro'
  WHEN 3 THEN 'Março'
  WHEN 4 THEN 'Abril'
  WHEN 5 THEN 'Maio'
  WHEN 6 THEN 'Junho'
  WHEN 7 THEN 'Julho'
  WHEN 8 THEN 'Agosto'
  WHEN 9 THEN 'Setembro'
  WHEN 10 THEN 'Outubro'
  WHEN 11 THEN 'Novembro'
  WHEN 12 THEN 'Dezembro'
   END || '/' || EXTRACT (YEAR FROM data_venda) AS mes,
   SUM(vi.quantidade) AS produtos_vendidos,
   SUM(v.valor_total) AS valor_vendido
  FROM venda v
 INNER JOIN venda_item vi
    ON vi.id_venda = v.id
 WHERE v.status = 'CONCLUIDA'
 GROUP BY EXTRACT(MONTH FROM v.data_venda),
          EXTRACT(YEAR FROM v.data_venda);
