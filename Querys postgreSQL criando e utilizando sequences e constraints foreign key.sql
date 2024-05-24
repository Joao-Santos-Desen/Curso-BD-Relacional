/* criando e utilizando sequences */
create sequence produto.sequence_x_1 increment 100 start 10000;

create table produto.tb_teste_1(
	id_teste int default nextval('produto.sequence_x_1') primary key,
	teste varchar(100)
);

insert into produto.tb_teste_1(teste)values('Teste 500');
select * from produto.tb_teste_1;
select * from produto.tb_teste_2;

create table produto.tb_teste_2(
	id_teste_2 int default nextval('produto.sequence_x_1') primary key,
	teste varchar(100)
);
drop table produto.tb_teste_1;
drop table produto.tb_teste_2;
drop sequence produto.sequence_x_1;

/* constraints - foreign key */
drop table produto.tb_categoria;
drop table produto.tb_fabricante;
drop table produto.tb_produto;

/* modelo_logico_mercado_y: */
CREATE TABLE produto.tb_categoria (
    id_categoria serial primary key,
    categoria varchar(30)
);

CREATE TABLE produto.tb_fabricante (
    id_fabricante serial primary key,
    fabricante varchar(100) not null,
    telefone varchar(17),
    contato varchar(30)
);

CREATE TABLE produto.tb_produto (
    id_produto serial primary key,
    fk_id_categoria int references produto.tb_categoria(id_categoria),
    fk_id_fabricante int,
    produto varchar(50) not null,
    unidade_medida char(3) not null,
    preco_compra  numeric(10,2) not null,
    preco_venda numeric(10,2) not null,
	foreign key(fk_id_fabricante) references produto.tb_fabricante(id_fabricante)
);
drop table produto.tb_produto;

CREATE TABLE produto.tb_produto (
    id_produto serial primary key,
    fk_id_categoria int constraint fk_tb_produto_fk_id_categoria references produto.tb_categoria(id_categoria),
    fk_id_fabricante int,
    produto varchar(50) not null,
    unidade_medida char(3) not null,
    preco_compra  numeric(10,2) not null,
    preco_venda numeric(10,2) not null,
	constraint fk_tb_produto_fk_id_fabricante foreign key(fk_id_fabricante) references produto.tb_fabricante(id_fabricante)
);

drop table produto.tb_produto;

CREATE TABLE produto.tb_produto (
    id_produto serial primary key,
    fk_id_categoria int,
    fk_id_fabricante int,
    produto varchar(50) not null,
    unidade_medida char(3) not null,
    preco_compra  numeric(10,2) not null,
    preco_venda numeric(10,2) not null	
);

alter table produto.tb_produto add constraint
fk_tb_produto_fk_id_categoria foreign key(fk_id_categoria)
references produto.tb_categoria(id_categoria);

alter table produto.tb_produto add constraint
fk_tb_produto_fk_id_fabricante foreign key(fk_id_fabricante)
references produto.tb_fabricante(id_fabricante);