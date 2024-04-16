select * from aluno;
select * from aluno_curso;

alter table aluno_curso add data_inscricao_curso date;
alter table aluno_curso add valor_pago_curso float(10,2);

/* pegar os dados da tabela aluno e cadastrar manualmente na tabela aluno_curso */

/* query de update com uma subquery para recuperar os dados */
select idaluno, data_inscricao_curso, valor_pago_curso from aluno where idaluno = 1;

update
	aluno_curso
set
	data_inscricao_curso = (select data_inscricao_curso from aluno where idaluno = 1),
    valor_pago_curso = (select valor_pago_curso from aluno where idaluno = 1)
where
	fk_idaluno = 1;
    
select distinct fk_idaluno from aluno_curso;

alter table aluno drop column data_inscricao_curso;
alter table aluno drop column valor_pago_curso;

select * from aluno;

alter table aluno modify column ativo_sn int default 1;

insert into aluno(nome, email, sexo, cpf, data_nascimento)
values('Jorge', 'jorge@teste.com.br', 'M', '444.111.111-15', '1989-01-06');

insert into aluno(nome, email, sexo, ativo_sn, cpf, data_nascimento)
values('Jamilton', 'jamilton@teste.com.br', 'M', 0, '444.111.111-25', '1987-07-07');

select * from aluno_curso;

desc aluno_curso;

alter table aluno_curso modify column data_inscricao_curso datetime default current_timestamp;

insert into aluno_curso(fk_idaluno, fk_idcurso, valor_pago_curso)
values(7, 3, 720);

alter table aluno_curso drop column id_alunocurso;

alter table aluno_curso add constraint pk_aluno_curso primary key(fk_idaluno, fk_idcurso, data_inscricao_curso);

create table projeto_funcionario(
	codigo_projeto int,
    matricula_funcionario int,
    nome_projeto varchar(100) not null,
    nome_funcionario varchar(50) not null,
    funcao_funcionario varchar(50) not null,
    telefone_funcionario varchar(20),
	data_criacao_projeto datetime default current_timestamp,
    horas_estimadas int not null,
    horas_realizadas int
);

alter table projeto_funcionario add constraint pk_projeto_funcionario primary key(codigo_projeto, matricula_funcionario);

alter table projeto_funcionario change column data_cricao_projeto data_criacao_projeto datetime default current_timestamp; /* mudando nome da coluna que estava errado */

desc projeto_funcionario;

insert into projeto_funcionario(
	codigo_projeto, matricula_funcionario, nome_projeto, nome_funcionario, funcao_funcionario, horas_estimadas)
values(
	1, 100, 'Matricula OnLine', 'Bianca', 'Analista de Atendimento', 200
);

insert into projeto_funcionario(
	codigo_projeto, matricula_funcionario, nome_projeto, nome_funcionario, funcao_funcionario, horas_estimadas)
values(
	1, 110, 'Matricula OnLine', 'Fátima', 'Gerente de Atendimento', 100
);

insert into projeto_funcionario(
	codigo_projeto, matricula_funcionario, nome_projeto, nome_funcionario, funcao_funcionario, horas_estimadas)
values(
	1, 127, 'Matricula OnLine', 'Miguel', 'Analista Programador Sênior', 500
);

insert into projeto_funcionario(
	codigo_projeto, matricula_funcionario, nome_projeto, nome_funcionario, funcao_funcionario, horas_estimadas)
values(
	2, 221, 'Notas OnLine', 'Laura', 'Analista Qualidade', 200
);

insert into projeto_funcionario(
	codigo_projeto, matricula_funcionario, nome_projeto, nome_funcionario, funcao_funcionario, horas_estimadas)
values(
	3, 221, 'Notas OnLine', 'Carlos', 'Analista Administrativo', 150
);

select * from projeto_funcionario;