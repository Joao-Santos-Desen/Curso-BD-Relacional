
select * from funcionario;

insert into funcionario(nome, funcao, telefone)
values('Rubens', 'Assistente Administrativo', '11 3333-4444');
insert into funcionario(nome, funcao, telefone)
values('Mõnica', 'Gerente de Atendimento', '11 4444-4444');
insert into funcionario(nome, funcao, telefone)
values('Marcelo', 'Técnico de Informática', '11 3333-3333');

/* - FUNCIONARIO - */

/* incluir uma nova coluna para matrícula */
alter table funcionario add column matricula int not null after idmatricula;

/* atualizar o valor de matrícula combase em idmatricula */
update funcionario set matricula = idmatricula;

/* - REMOVER CONSTRAINTS PARA RENOMEAR A COLUNA IDMATRICULA */

show create table projeto_funcionario;
/* remover constraint entre projeto_funcionario e funcionario */
alter table projeto_funcionario drop foreign key projeto_funcionario_ibfk_2;

show create table funcionario_log;
/* remover a constraint entre funcionario_log e funcionario */
alter table funcionario_log drop foreign key pk_funcionario_funcionario_log;
alter table funcionario_log drop foreign key fk_funcionario_log_funcionario;
alter table funcionario_log drop foreign key fk_projeto_log_funcionario;


show create table funcionario;
/* remover a constraint entre funcionario e funcionario (auto relacionamento) */
alter table funcionario drop foreign key fk_funcionario_supervisor;

/* - RENOMEAR A COLUNA IDMATRICULA PARA IDFUNCIONARIO - */
alter table funcionario change idmatricula idfuncionario int auto_increment;
alter table funcionario_log change fk_idmatricula idfuncionario int;
alter table projeto_funcionario change fk_idmatricula idfuncionario int;

alter table funcionario_log change idfuncionario fk_idfuncionario int;
alter table projeto_funcionario change idfuncionario fk_idfuncionario int;
alter table funcionario change fk_idmatricula_supervisor fk_idfuncionario_supervisor int;

desc projeto_funcionario;
desc funcionario_log;
desc funcionario;

/* - RECRIAR AS CONSTRAINTS DE RELACIONAMENTO ENTRE AS TABELAS */
alter table projeto_funcionario add constraint fk_projeto_funcionario_funcionario
foreign key(fk_idfuncionario) references funcionario(idfuncionario);

alter table funcionario_log add constraint fk_projeto_log_funcionario
foreign key(fk_idfuncionario) references funcionario(idfuncionario);

alter table funcionario add constraint fk_funcionario_supervisor
foreign key(fk_idfuncionario_supervisor) references funcionario(idfuncionario);

