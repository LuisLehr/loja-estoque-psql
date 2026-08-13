-- CRIANDO UMA VIEW QUE LISTA A QUANTIDADE E O VALOR VENDIDO POR CADA FUNCIONARIO
CREATE VIEW v_vendas_funcionarios AS
SELECT f.nome,
	   SUM(vi.quantidade) AS quantidade_vendida,
	   SUM(v.valor_total) AS valor_vendido
  FROM venda v
 INNER JOIN funcionarios f
    ON v.id_funcionario = f.id
 INNER JOIN venda_item vi
    ON v.id = vi.id_venda
 WHERE v.status = 'CONCLUIDA'
 GROUP BY f.nome;