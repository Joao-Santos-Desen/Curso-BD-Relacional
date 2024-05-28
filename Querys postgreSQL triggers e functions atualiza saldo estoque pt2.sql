/* triggers e functions - atualiza saldo estoque pt.2 */
select * from estoque.tb_movimentacao;
select * from estoque.tb_estoque_produto;

insert into estoque.tb_movimentacao(
	fk_id_produto,
	fk_id_estoque_produto,
	qtde_movimento,
	tipo_movimento
)values(
	3,
	(select id_estoque_produto from estoque.tb_estoque_produto where fk_id_produto = 3),
	3,
	'saída'
);

insert into estoque.tb_movimentacao(
	fk_id_produto,
	fk_id_estoque_produto,
	qtde_movimento,
	tipo_movimento
)values(
	3,
	(select id_estoque_produto from estoque.tb_estoque_produto where fk_id_produto = 3),
	15,
	'saída'
);

insert into estoque.tb_movimentacao(
	fk_id_produto,
	fk_id_estoque_produto,
	qtde_movimento,
	tipo_movimento
)values(
	3,
	(select id_estoque_produto from estoque.tb_estoque_produto where fk_id_produto = 3),
	8,
	'entrada'
);

drop function estoque.func_atualiza_estoque cascade;
	
create trigger tr_after_insert_atualiza_estoque 
after insert on estoque.tb_movimentacao for each row 
execute procedure estoque.func_atualiza_estoque();

create function estoque.func_atualiza_estoque() returns trigger as $$
begin
	if new.tipo_movimento = 'entrada'
	then
		update estoque.tb_estoque_produto
		set qtde_estoque = qtde_estoque + new.qtde_movimento
		where fk_id_produto = new.fk_id_produto;
	else
		update estoque.tb_estoque_produto
		set qtde_estoque = qtde_estoque - new.qtde_movimento
		where fk_id_produto = new.fk_id_produto;
	end if;

	return new;
end
$$ language plpgsql;