select * from aluno;

CREATE TABLE ENDERECO (
    idendereco int auto_increment PRIMARY KEY,
    logradouro varchar(100),
    numero varchar(10),
    complemento varchar(20),
    bairro varchar(100),
    cidade varchar(50),
    estado char(2),
    fk_idaluno int
);

ALTER TABLE ENDERECO ADD CONSTRAINT FK_ENDERECO_2
    FOREIGN KEY (fk_idaluno)
    REFERENCES ALUNO (idaluno);
    
select * from endereco;

desc endereco;

select logradouro, numero, complemento, bairro, cidade, estado, idaluno from aluno;

insert into endereco(
	logradouro, numero, complemento, bairro, cidade, estado, fk_idaluno
)
select logradouro, numero, complemento, bairro, cidade, estado, idaluno from aluno;

alter table aluno drop column logradouro;
alter table aluno drop column numero;
alter table aluno drop column complemento;
alter table aluno drop column bairro;
alter table aluno drop column cidade;
alter table aluno drop column estado;

select * from aluno;

select * from endereco where fk_idaluno = 3;

CREATE TABLE CURSO (
    idcurso int auto_increment PRIMARY KEY,
    descricao varchar(50)
);

select * from aluno_curso;
desc aluno_curso;

insert into curso(descricao) values('Curso Completo do Desenvolvedor NodeJS e MongoDB');
insert into curso(descricao) values('Desenvolvedor Multiplataforma Android e IOS');
insert into curso(descricao) values('Desenvolvimento Web e Angular');
insert into curso(descricao) values('Desenvolvimento Web Completo 2019');

CREATE TABLE ALUNO_CURSO (
    id_alunocurso int auto_increment PRIMARY KEY,
    fk_idaluno int,
    fk_idcurso int
);

select * from aluno_curso;

alter table aluno_curso add constraint fk_aluno_curso
foreign key(fk_idaluno) references aluno(idaluno);

alter table aluno_curso add constraint fk_curso_aluno
foreign key(fk_idcurso) references curso(idcurso);

select * from aluno;
select * from curso;

insert into aluno_curso(fk_idaluno, fk_idcurso) values (1, 3);
insert into aluno_curso(fk_idaluno, fk_idcurso) values (1, 4);
insert into aluno_curso(fk_idaluno, fk_idcurso) values (2, 2);
insert into aluno_curso(fk_idaluno, fk_idcurso) values (3, 1);
insert into aluno_curso(fk_idaluno, fk_idcurso) values (3, 2);
insert into aluno_curso(fk_idaluno, fk_idcurso) values (3, 3);
insert into aluno_curso(fk_idaluno, fk_idcurso) values (3, 4);
insert into aluno_curso(fk_idaluno, fk_idcurso) values (4, 1);

select * from aluno_curso;

select * from telefone;

delete from telefone where idtelefone = 2;

insert into telefone(numero, tipo, fk_idaluno) values('11 5555-2222', 'res', 1);
insert into telefone(numero, tipo, fk_idaluno) values('11 3333-4444', 'com', 1);
insert into telefone(numero, tipo, fk_idaluno) values('11 5555-5555', 'res', 4);
insert into telefone(numero, tipo, fk_idaluno) values('11 5555-7777', 'res', 3);
insert into telefone(numero, tipo, fk_idaluno) values('11 5555-8888', 'res', 3);
insert into telefone(numero, tipo, fk_idaluno) values('11 5555-9999', 'res', 3);

alter table telefone drop column tipo;
alter table telefone add tipo enum('com', 'res', 'cel');

update telefone set tipo = 'res' where idtelefone = 8;
update telefone set tipo = 'com' where idtelefone = 9;
update telefone set tipo = 'cel' where idtelefone = 10;
update telefone set tipo = 'com' where idtelefone = 12;
update telefone set tipo = 'cel' where idtelefone = 7;
update telefone set tipo = 'com' where idtelefone = 11;
