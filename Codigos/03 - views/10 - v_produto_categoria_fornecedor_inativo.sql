-- CRIANDO UMA VIEW COM TODOS OS REGISTROS INATIVOS DAS TABELAS PRODUTOS, CATEGORIA E FORNECEDOR_UNIDADE
CREATE VIEW v_produto_categoria_fornecedor_inativo AS
SELECT 'PRODUTOS' AS tipo, nome, ativo from PRODUTOS WHERE ativo = 'I'
UNION ALL
SELECT 'CATEGORIA' AS tipo, nome, ativo FROM categoria WHERE ativo = 'I'
UNION ALL
SELECT 'FORNECEDOR_UNIDADE' AS tipo, razao_social, ativo FROM fornecedor_unidade WHERE ativo = 'I'