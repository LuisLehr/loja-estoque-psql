-- TRIGGER QUE REGISTRA O MOVIMENTO NO ESTOQUE
CREATE OR REPLACE TRIGGER tg_registra_movimento_estoque
AFTER INSERT ON venda_item
FOR EACH ROW
EXECUTE FUNCTION fn_tg_registra_movimento_estoque();