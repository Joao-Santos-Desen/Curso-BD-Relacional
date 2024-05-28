/* triggers e functions - atualiza saldo estoque */
select * from estoque.tb_movimentacao;
select * from estoque.tb_estoque_produto where fk_id_produto = 3;

insert into estoque.tb_movimentacao(
	fk_id_produto, fk_id_estoque_produto, qtde_movimento, tipo_movimento
)values(
	3, 
	(select id_estoque_produto from estoque.tb_estoque_produto where fk_id_produto = 3),
	25,
	'entrada'
);

insert into estoque.tb_movimentacao(
	fk_id_produto, fk_id_estoque_produto, qtde_movimento, tipo_movimento
)values(
	3, 
	(select id_estoque_produto from estoque.tb_estoque_produto where fk_id_produto = 3),
	10,
	'entrada'
);
select * from produto.tb_produto;

create trigger tr_after_insert_atualiza_estoque 
after insert on estoque.tb_movimentacao for each row 
execute procedure estoque.func_atualiza_estoque();

create function estoque.func_atualiza_estoque() returns trigger as $$
begin
	update estoque.tb_estoque_produto
	set qtde_estoque = qtde_estoque + new.qtde_movimento
	where fk_id_produto = new.fk_id_produto;

	return new;
end
$$ language plpgsql;