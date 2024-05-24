/* Triggers - Auditoria Inclusão */
insert into produto.tb_categoria(categoria)values('Bebidas');
select * from produto.tb_categoria;

insert into produto.tb_fabricante(fabricante, telefone, contato) 
values('Coca-Cola', '11 5555-4444', 'Maria');
select * from produto.tb_fabricante;

insert into produto.tb_produto(fk_id_categoria, fk_id_fabricante, produto, 
	unidade_medida, preco_compra, preco_venda)
values(1, 1, 'Refrigerante Coca-Cola 2,5L', 'UN', 4.10, 6.85);

create trigger tr_after_insert_produto after insert on produto.tb_produto 
for each row execute procedure produto.func_log_produto();
/*
	new -> insert / update
	e
	old -> update / delete
*/
create function produto.func_log_produto() returns trigger as $$ 
begin
	insert into auditoria.tb_produto_log(
		id_produto,
		id_categoria_new, id_categoria_old, 
		id_fabricante_new, id_fabricante_old, 
		produto_new, produto_old, preco_compra_new, 
		preco_compra_old, preco_venda_new, preco_venda_old, 
		evento
	)values(
		new.id_produto,
		new.fk_id_categoria, null, 
		new.fk_id_fabricante, null, 
		new.produto, null, new.preco_compra, 
		null, new.preco_venda, null, 
		'insert'
	);
	return new;
end
$$ language plpgsql;

select * from produto.tb_produto;
select * from auditoria.tb_produto_log;

insert into produto.tb_produto(
	fk_id_categoria,
	fk_id_fabricante,
	produto,
	unidade_medida,
	preco_compra,
	preco_venda
)values(
	1,
	1,
	'Refrigerante Coca-Cola 2,5L',
	'UN',
	4.25,
	6.75
);

select * from produto.tb_categoria;