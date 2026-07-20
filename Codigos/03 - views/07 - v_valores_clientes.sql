-- CRIANDO UMA VIEW COM COM A QUANTIDADE E O VALOR TOTAL COMPRADO POR CADA CLIENTE
CREATE VIEW v_valores_clientes AS
SELECT c.nome,
	   SUM(vi.quantidade) AS quantidade_comprada,
	   SUM(v.valor_total) AS valor_comprado
  FROM venda v
 INNER JOIN cliente c
    ON v.id_cliente = c.id
 INNER JOIN venda_item vi
    ON v.id = vi.id_venda
 WHERE v.status = 'CONCLUIDA'
 GROUP BY c.nome;
