/* limpando tabelas com truncate e reiniciando colunas serial */
truncate table auditoria.tb_produto_log;
select * from auditoria.tb_produto_log;

/*
mysql -> truncate remove os registros e "reseta" as colunas auto_increment
postgre -> truncate remove os registros, porém ele não "reseta" as colunas serial
*/

alter sequence auditoria.tb_produto_log_id_produto_log_seq restart with 1;

truncate table estoque.tb_movimentacao;
alter sequence estoque.tb_movimentacao_id_movimentacao_seq restart with 1;

truncate table venda.tb_venda;
alter sequence venda.tb_venda_id_venda_seq restart with 1;

truncate table estoque.tb_estoque_produto cascade;
alter sequence estoque.tb_estoque_produto_id_estoque_produto_seq restart with 1;

truncate table produto.tb_produto cascade;
alter sequence produto.tb_produto_id_produto_seq restart with 1;

truncate table produto.tb_categoria cascade;
alter sequence produto.tb_categoria_id_categoria_seq restart with 1;

truncate table produto.tb_fabricante cascade;
alter sequence produto.tb_fabricante_id_fabricante_seq restart with 1;