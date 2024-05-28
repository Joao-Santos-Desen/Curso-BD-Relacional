/* function e trigger - inicia estoque */
create trigger tr_after_insert_produto_estoque
after insert on produto.tb_produto for each row
execute procedure produto.func_inicia_estoque();

create function produto.func_inicia_estoque() returns trigger as $$
begin
	insert into estoque.tb_estoque_produto(
		fk_id_produto, qtde_estoque
	)values(
		new.id_produto, 0
	);
	return new;
end
$$ language plpgsql;

select * from produto.tb_produto;
select * from estoque.tb_estoque_produto;

insert into produto.tb_produto(
	fk_id_categoria, fk_id_fabricante, produto, 
	unidade_medida, preco_compra, preco_venda
)values(
	2, 2, 'Café tradicional 500g', 'UN', 5.12, 7.48
);

insert into produto.tb_produto(
	fk_id_categoria, fk_id_fabricante, produto, 
	unidade_medida, preco_compra, preco_venda
)values(
	3, 3, 'Lã de aço', 'UN', 1.00, 1.75
);

insert into produto.tb_produto(
	fk_id_categoria, fk_id_fabricante, produto, 
	unidade_medida, preco_compra, preco_venda
)values(
	4, 4, 'Creme dental 90g', 'UN', 2.05, 2.65
);

select * from produto.tb_categoria;

/*
2	"Mercearia"
3	"Limpeza"
4	"Higiene e Perfumaria"
*/

/*
2	"3 Corações"
3	"Bombril"
4	"Colgate"
*/
select * from produto.tb_fabricante;
insert into produto.tb_fabricante(fabricante, telefone, contato)
values('3 Corações', '11 4444-4444', 'João');
insert into produto.tb_fabricante(fabricante, telefone, contato)
values('Bombril', '11 7777-7744', 'Alana');
insert into produto.tb_fabricante(fabricante, telefone, contato)
values('Colgate', '11 2222-4411', 'Mauro');