-- CRIANDO UMA VIEW COM OS PRODUTOS MAIS VENDIDOS (SOMENTE DE VENDAS CONCLUIDAS)
CREATE VIEW v_mais_vendidos AS
SELECT p.nome, 
       SUM(vi.quantidade) AS total_vendido 
  FROM venda_item vi
 INNER JOIN produtos p
    ON vi.id_produto = p.id
 INNER JOIN venda v   
    ON v.id = vi.id_venda
 WHERE v.status = 'CONCLUIDA'   
 GROUP BY nome;
