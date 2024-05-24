/* Triggers e Functions - Auditoria - Atualização */
select * from produto.tb_produto;
select * from auditoria.tb_produto_log;

create trigger tr_before_update_produto before update on produto.tb_produto
for each row execute procedure produto.func_log_produto_update();

drop function produto.func_log_produto_update cascade;

create function produto.func_log_produto_update() returns trigger as $$
begin
	insert into auditoria.tb_produto_log(
		id_produto,
		id_categoria_new, id_categoria_old,
		id_fabricante_new, id_fabricante_old,
		produto_new, produto_old,
		preco_compra_new, preco_compra_old,
		preco_venda_new, preco_venda_old,
		evento
	)values(
		old.id_produto,
		new.fk_id_categoria, old.fk_id_categoria,
		new.fk_id_fabricante, old.fk_id_fabricante,
		new.produto, old.produto,
		new.preco_compra, old.preco_compra,
		new.preco_venda, old.preco_venda,
		'update'
	);
	return new;
end
$$ language plpgsql;

update 
	produto.tb_produto 
set 
	produto = 'Refrigerante Coca-Cola 2L',
	preco_compra = 3.95,
	preco_venda = 6.35
where
	id_produto = 1;

select * from auditoria.tb_produto_log;