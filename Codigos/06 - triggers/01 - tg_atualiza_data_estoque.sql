CREATE OR REPLACE TRIGGER tg_atualiza_data_estoque
BEFORE UPDATE
ON estoque
FOR EACH ROW
EXECUTE FUNCTION fn_tg_atualiza_data_estoque();