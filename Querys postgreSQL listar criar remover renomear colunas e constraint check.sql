/* renomeando tabelas e campos já existentes*/
alter table produto.tb_produto rename to tb_produto_novo;
alter table produto.tb_produto_novo rename to tb_produto;

select * from information_schema.columns 
where table_name = 'tb_produto' and table_catalog = 'mercado_y' and table_schema = 'produto';

alter table produto.tb_produto rename column unidade_medida to um;
alter table produto.tb_produto rename column um to unidade_medida;

/* incluindo e removendo colunas em uma tabela já existente */
alter table produto.tb_fabricante add column endereco varchar(200);
alter table produto.tb_fabricante drop column endereco;

/* constraint check */
drop table produto.tb_produto;

/* modelo_logico_mercado_y: */

CREATE TABLE produto.tb_produto (
    id_produto int,
    fk_id_categoria int,
    fk_id_fabricante int,
    produto varchar(50) not null,
    unidade_medida char(3) not null,
    preco_compra numeric(10,2) not null 
	constraint chk_tb_produto_preco_compra check(preco_compra >= 0),
    preco_venda numeric(10,2) not null
	constraint chk_tb_produto_preco_venda check(preco_venda >= 0),
	constraint chk_tb_produto_preco_venda_2 check(preco_venda > preco_compra)
);

drop table produto.tb_produto;
CREATE TABLE produto.tb_produto (
    id_produto int,
    fk_id_categoria int,
    fk_id_fabricante int,
    produto varchar(50) not null,
    unidade_medida char(3) not null
);
alter table produto.tb_produto add column preco_compra numeric(10,2) 
not null constraint chk_tb_produto_preco_compra check(preco_compra >= 0);

alter table produto.tb_produto add column preco_venda numeric(10,2) not null
constraint chk_tb_produto_preco_venda check(preco_venda >= preco_compra);

insert into produto.tb_produto(
	id_produto, fk_id_categoria, fk_id_fabricante,
	produto, unidade_medida, preco_compra, preco_venda
)values(
	1, 1, 1, 
	'XYZ', 'UN', 5, 10
);

select * from produto.tb_produto;
update produto.tb_produto set preco_compra = 2 where id_produto = 1;