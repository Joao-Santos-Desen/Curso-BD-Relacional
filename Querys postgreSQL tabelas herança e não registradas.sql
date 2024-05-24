/* Tabelas - Herança */
create schema tabelas_avancadas;

create table tabelas_avancadas.tb_pessoa(
	id_pessoa serial primary key,
	nome varchar(100) not null,
	idade int,
	sexo char(1) constraint chk_sexo check(sexo in('M', 'F'))
);

create table tabelas_avancadas.tb_funcionario(
	id_funcionario serial primary key,
	matricula varchar(20) not null,
	departamento varchar(50) not null	
) inherits (tabelas_avancadas.tb_pessoa);

select * from tabelas_avancadas.tb_pessoa;
select * from tabelas_avancadas.tb_funcionario;

alter table tabelas_avancadas.tb_pessoa add column apelido varchar(15);

insert into tabelas_avancadas.tb_pessoa(
	nome, idade, sexo, apelido
)values(
	'Maria', 27, 'F', 'Mari'
);

insert into tabelas_avancadas.tb_funcionario(
	nome, idade, sexo, matricula, departamento, apelido
)values(
	'João', 35, 'M', 'xyz123', 'Contabilidade', 'Joãozinho'
);

update tabelas_avancadas.tb_funcionario set idade = 45 where id_funcionario = 1;
update tabelas_avancadas.tb_pessoa set nome = 'João da Silva' where id_pessoa = 2;

insert into tabelas_avancadas.tb_funcionario(
	nome, idade, sexo, matricula, departamento, apelido
)values(
	'Rosana', 20, 'F', '123abc', 'Administrativo', 'Ro'
);

delete from tabelas_avancadas.tb_funcionario where id_funcionario = 1;
delete from tabelas_avancadas.tb_pessoa where id_pessoa = 3;

/* Tabelas não registradas (UNLOGGED) */
create unlogged table tabelas_avancadas.utb_carrinho_compras(
	id_carrinho_compra serial primary key,
	fk_id_usuario int,
	dados_json text
);
select * from tabelas_avancadas.utb_carrinho_compras;