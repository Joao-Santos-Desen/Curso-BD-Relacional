/* triggers e functions - venda registro movimentação */
select * from venda.tb_venda;
select * from estoque.tb_movimentacao;
select * from estoque.tb_estoque_produto;

insert into venda.tb_venda(
	fk_id_produto,
	fk_id_estoque_produto,
	qtde_venda
)values(
	3,
	(select id_estoque_produto from estoque.tb_estoque_produto where fk_id_produto = 3),
	5
);

create trigger tr_after_insert_atualiza_movimento
after insert on venda.tb_venda for each row
execute procedure estoque.func_atualiza_movimento();

create function estoque.func_atualiza_movimento() returns trigger as $$
begin
	insert into estoque.tb_movimentacao(
		fk_id_produto,
		fk_id_estoque_produto,
		qtde_movimento,
		tipo_movimento
	)values(
		new.fk_id_produto,
		new.fk_id_estoque_produto,
		new.qtde_venda,
		'saída'
	);

	return new;
end
$$ language plpgsql;

select * from estoque.tb_movimentacao;