/* mercado_y */
create schema produto;
create schema estoque;
create schema venda;
create schema auditoria;

CREATE TABLE produto.tb_produto (
	id_produto serial PRIMARY KEY,
	fk_id_categoria serial,
	fk_id_fabricante serial,
	produto varchar(50) not null,
	unidade_medida char(3) not null,
	preco_compra numeric(10,2) not null,
	preco_venda numeric(10,2) not null
);

CREATE TABLE produto.tb_fabricante (
	id_fabricante serial PRIMARY KEY,
	fabricante varchar(100) not null,
	telefone varchar(17),
	contato varchar(30)
);

CREATE TABLE produto.tb_categoria (
	id_categoria serial PRIMARY KEY,
	categoria varchar(30) not null
);

CREATE TABLE auditoria.tb_produto_log (
	id_produto_log serial PRIMARY KEY,
	id_produto int,
	id_categoria_new int,
	id_categoria_old int,
	id_fabricante_new int,
	id_fabricante_old int,
	produto_new varchar(50),
	produto_old varchar(50),
	preco_compra_new numeric(10,2),
	preco_compra_old numeric(10,2),
	preco_venda_new numeric(10,2),
	preco_venda_old numeric(10,2),
	data_evento timestamp default current_timestamp not null,
	evento varchar(6) constraint chk_evento check(evento in ('insert', 'update'))	
);

CREATE TABLE estoque.tb_estoque_produto (
	id_estoque_produto serial PRIMARY KEY,
	fk_id_produto serial,
	qtde_estoque int not null default 0
);

CREATE TABLE estoque.tb_movimentacao (
	id_movimentacao serial PRIMARY KEY,
	fk_id_produto serial,
	fk_id_estoque_produto serial,
	qtde_movimento int,
	tipo_movimento varchar(7)
);	

CREATE TABLE venda.tb_venda (
	id_venda serial PRIMARY KEY,
	fk_id_produto serial,
	fk_id_estoque_produto serial,
	qtde_venda int not null
);

ALTER TABLE produto.tb_produto ADD CONSTRAINT fk_produto_categoria
	FOREIGN KEY (fk_id_categoria)
	REFERENCES produto.tb_categoria (id_categoria);

ALTER TABLE produto.tb_produto ADD CONSTRAINT fk_produto_fabricante
	FOREIGN KEY (fk_id_fabricante)
	REFERENCES produto.tb_fabricante (id_fabricante);
	
ALTER TABLE estoque.tb_estoque_produto ADD CONSTRAINT fk_estoque_produto_produto
	FOREIGN KEY (fk_id_produto)
	REFERENCES produto.tb_produto (id_produto);
	
ALTER TABLE venda.tb_venda ADD CONSTRAINT fk_venda_estoque_produto
	FOREIGN KEY (fk_id_estoque_produto)
	REFERENCES estoque.tb_estoque_produto (id_estoque_produto);
	
ALTER TABLE venda.tb_venda ADD CONSTRAINT fk_venda_produto
	FOREIGN KEY (fk_id_produto)
	REFERENCES produto.tb_produto (id_produto);
	
ALTER TABLE estoque.tb_movimentacao ADD CONSTRAINT fk_tb_movimentacao_2
	FOREIGN KEY (id_movimentacao)
	REFERENCES estoque.tb_estoque_produto (id_estoque_produto);
	
ALTER TABLE estoque.tb_movimentacao ADD CONSTRAINT fk_movimentacao_produto
	FOREIGN KEY (fk_id_produto)
	REFERENCES produto.tb_produto (id_produto);
	
ALTER TABLE estoque.tb_movimentacao ADD CONSTRAINT fk_movimentacao_estoque_produto
	FOREIGN KEY(fk_id_estoque_produto)
	REFERENCES estoque.tb_estoque_produto (id_estoque_produto);
