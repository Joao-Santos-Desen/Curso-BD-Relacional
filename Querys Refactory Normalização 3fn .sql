create table disciplina(
	iddisciplina int auto_increment,
    descricao varchar(50) not null,
    carga_horaria int,
    codigo_professor int,
    nome_professor varchar(50),
    email_professor varchar(100),
    fk_idcurso int,
    constraint pk_iddisciplina primary key(iddisciplina)
);

desc disciplina;

alter table disciplina add constraint fk_curso_disciplina foreign key(fk_idcurso) references curso(idcurso);

select * from disciplina;
select * from curso;

/* Curso Completo do Desenvolvedor NodeJS e MongoDB */
insert into disciplina(
	descricao, carga_horaria, codigo_professor, nome_professor, email_professor, fk_idcurso
)values(
	'NodeJs', 7, 100, 'Jorge', 'jorge@teste.com.br', 1
);

insert into disciplina(
	descricao, carga_horaria, codigo_professor, nome_professor, email_professor, fk_idcurso
)values(
	'Express', 2, 120, 'Pedro', 'pedro@teste.com.br', 1
);

insert into disciplina(
	descricao, carga_horaria, codigo_professor, nome_professor, email_professor, fk_idcurso
)values(
	'MongoDB', 5, 130, 'Julia', 'julia@teste.com.br', 1
);

/* anomalias de inserção (redudância de dados, dados inconsistentes) */
insert into disciplina(
	descricao, carga_horaria, codigo_professor, nome_professor, email_professor, fk_idcurso
)values(
	'EJS', 3, 100, 'Jorge', 'jorge1010@teste.com.br', 1
);

/* anomalias de exclusão (perder registros importantes) */
delete from disciplina where codigo_professor = 120 and descricao = 'Express';

/* anomalias de atualização (informações inconsistentes, redundância no update) */
update disciplina set nome_professor = 'George' where codigo_professor = 100;

/*
2fn - testamos a dependência funcional total (campos não-chave -> pk compostas)
3fn - testamos a dependência transitiva (campos não-chave -> campos não chave)
*/
create table professor(
	idprofessor int auto_increment,
    nome varchar(50) not null,
    email varchar(100),
    constraint pk_professor primary key(idprofessor)
);

desc professor;

select distinct
	codigo_professor, 
    nome_professor,
    email_professor 
from 
	disciplina;
    
update disciplina set email_professor = 'jorge@teste.com.br' where codigo_professor = 100;

insert into professor(
	idprofessor,
    nome,
    email
)
select distinct
	codigo_professor, 
    nome_professor,
    email_professor 
from 
	disciplina;
    
select * from professor;
select * from disciplina;
alter table disciplina drop column nome_professor;
alter table disciplina drop column email_professor;

alter table disciplina rename column codigo_professor to fk_idprofessor;

alter table disciplina add constraint fk_disciplina_professor foreign key(fk_idprofessor) references professor(idprofessor);

desc disciplina;