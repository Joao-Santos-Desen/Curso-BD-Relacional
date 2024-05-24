/* constraint unique */
drop table produto.tb_fabricante;

/* modelo_logico_mercado_y: */
CREATE TABLE produto.tb_fabricante (
    id_fabricante int,
    fabricante varchar(100) not null,
    telefone varchar(17),
    contato varchar(30),
	email varchar(120) constraint uc_tb_fabricante_email unique
);

drop table produto.tb_fabricante;

CREATE TABLE produto.tb_fabricante (
    id_fabricante int,
    fabricante varchar(100) not null,
    telefone varchar(17),
    contato varchar(30),
	email varchar(120), 
	constraint uc_tb_fabricante_email unique(email)
);

--
alter table produto.tb_fabricante add column email varchar(120) 
constraint uc_tb_fabricante_email unique;

--
insert into produto.tb_fabricante (
	id_fabricante, fabricante, telefone, contato, email
)values(
	2, 'Teste 2', '11 5555-4444', 'José', 'jose@teste.com.br'
);

select * from produto.tb_fabricante;

/* constraint primary key simples */
/* primary key é unique e not null */
/* MySQL = auto_increment / postgreSQL = serial */
drop table produto.tb_categoria;
drop table produto.tb_fabricante;
drop table produto.tb_produto;

/* modelo_logico_mercado_y: */
CREATE TABLE produto.tb_produto (
    id_produto serial primary key,
    fk_id_categoria int,
    fk_id_fabricante int,
    produto varchar(50) not null,
    unidade_medida char(3) not null,
    preco_compra  numeric(10,2) not null,
    preco_venda numeric(10,2) not null
);

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

select * from produto.tb_categoria;
insert into produto.tb_categoria(categoria)values('Teste 2');

/* constraint primary key composta */
create table produto.tb_exemplo(
	coluna_id_1 int,
	coluna_id_2 int,
	coluna_3 varchar(100),
	coluna_4 numeric(8,2),
	constraint pk_tb_exemplo primary key (coluna_id_1, coluna_id_2)
);

drop table produto.tb_exemplo;