/* criando índice clusterizado (transformando tabela heap em clusterizada) */
alter table cliente.tb_cliente add column id_cliente serial primary key;

/*
	índices clusterizados
		unique index

	índices não custerizados
		unique index

*/
/* restrição */
create unique index idx_cliente_email on cliente.tb_cliente using btree(email);

/* coluna simples indexada e múltiplas colunas indexadas */
select * from cliente.tb_cliente where id_cliente = 500;
select * from cliente.tb_cliente where nome = 'Dalton';
select * from cliente.tb_cliente where email = '???';

select * from cliente.tb_cliente where nome = 'Dalton' and email = '???' and idade > 50;

create unique index idx_cliente_nome_email_idade on cliente.tb_cliente using btree(nome, email, idade);

drop index cliente.idx_cliente_nome_email_idade;

/* índices parciais (não clusterizados) */
create index idx_cliente_idade on cliente.tb_cliente using btree(idade)
where idade between 15 and 40;

create index idx_cliente_idade on cliente.tb_cliente using btree(idade)
where idade < 40; /* exemplo */

create index idx_cliente_idade on cliente.tb_cliente using btree(idade)
where idade > 25; /* exemplo */

select * from cliente.tb_cliente where idade between 20 and 39;

/* índices de modo concorrente */
create index concurrently idx_cliente_nome_sobrenome on cliente.tb_cliente 
using btree(nome, sobrenome);