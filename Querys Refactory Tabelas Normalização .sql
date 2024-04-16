select * from projeto_funcionario;

/* anomalias de inserção (redundância de dadoos, dados inconsistentes) */
insert into projeto_funcionario(
	codigo_projeto, matricula_funcionario, nome_projeto, nome_funcionario, funcao_funcionario, horas_estimadas)
values(
	2, 353, 'Economia de Papel', 'João', 'Analista Financeiro', 25
);

/* anomalias de exclusão (perder registros importantes) */
delete from projeto_funcionario where codigo_projeto = 3 and matricula_funcionario = 221;

/* anomalias na atualização (informações inconsistentes) */
update projeto_funcionario set nome_projeto = 'Inscrição OnLine' where codigo_projeto = 1 and matricula_funcionario = 110;

/* identificar atributos/colunas não chave */

/* quais são os atributos/colunas chaves */
/*codigo_projeto, matricula_funcionario*/

/* 2fn */

create table projeto(
	idcodigo int auto_increment,
    data_criacao datetime default current_timestamp,
    nome varchar(100) not null,
    constraint pk_projeto primary key(idcodigo)
);

desc projeto;

create table funcionario(
	idmatricula int auto_increment,
    nome varchar(50) not null,
    funcao varchar(50) not null,
    telefone varchar(20),
    constraint pk_funcionario primary key(idmatricula)
);

desc funcionario;

create table projeto_funcionario2(
	fk_idcodigo int,
    fk_idmatricula int,
    horas_estimadas int not null,
    horas_realizadas int,
    constraint pk_projeto_funcionario primary key(fk_idcodigo, fk_idmatricula)
);

desc projeto_funcionario2;

alter table projeto_funcionario2 add constraint foreign key(fk_idcodigo) references projeto(idcodigo);
alter table projeto_funcionario2 add constraint foreign key(fk_idmatricula) references funcionario(idmatricula);

select 
	matricula_funcionario,
    nome_funcionario,
    funcao_funcionario,
    telefone_funcionario
from 
	projeto_funcionario;

select * from projeto_funcionario;

insert into projeto_funcionario(
	codigo_projeto, matricula_funcionario, nome_projeto, nome_funcionario, funcao_funcionario, horas_estimadas
)values(
	2, 100, 'Economia de Papel', 'Bianca', 'Analista de Atendimento', 150
);

/* query para migração dos registros de funcionários */
insert into funcionario(idmatricula, nome, funcao, telefone)
select distinct
	matricula_funcionario,
    nome_funcionario,
    funcao_funcionario,
    telefone_funcionario
from 
	projeto_funcionario;
    
select * from funcionario;

/* query para migração dos registros de projeto */
select distinct
	codigo_projeto,
    data_criacao_projeto,
    nome_projeto
from 
	projeto_funcionario;
    
select * from projeto_funcionario where codigo_projeto = 1 order by data_criacao_projeto asc limit 1;
select * from projeto_funcionario where codigo_projeto = 2 order by data_criacao_projeto asc limit 1;
update projeto_funcionario set data_criacao_projeto = '2024-04-15 17:03:39' where codigo_projeto = 1;
update projeto_funcionario set data_criacao_projeto = '2024-04-15 17:07:21' where codigo_projeto = 2;

insert into projeto(idcodigo, data_criacao, nome)
select distinct
	codigo_projeto,
    data_criacao_projeto,
    nome_projeto
from 
	projeto_funcionario;

select * from funcionario;    
select * from projeto;

/* registros de relacionamento entre as tabelas */
select 
	codigo_projeto,
    matricula_funcionario,
    horas_estimadas,
    horas_realizadas
from 
	projeto_funcionario;

insert into projeto_funcionario2(fk_idcodigo, fk_idmatricula, horas_estimadas, horas_realizadas)
select 
	codigo_projeto,
    matricula_funcionario,
    horas_estimadas,
    horas_realizadas
from 
	projeto_funcionario;
    
select * from projeto_funcionario2;

drop table projeto_funcionario;
select * from projeto_funcionario;

rename table projeto_funcionario2 to projeto_funcionario;