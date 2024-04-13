select * from aluno;

desc aluno; /* Comando de descrição de tabela do MySQL, outros BD´s utilizam outros comandos.*/
/* add inclusão */
alter table aluno add cpf varchar(11);

alter table aluno add email varchar(150) after idade;

/* modify modificar */
alter table aluno modify column cpf varchar(14);

/* drop remover */
alter table aluno drop column cpf;

alter table aluno add cpf varchar(14) after email;

update aluno set cpf = '111.111.111-11' where nome = 'João';
update aluno set cpf = '222.111.111-11' where nome = 'Fernanda';
update aluno set cpf = '333.111.111-11' where nome = 'José';
update aluno set cpf = '444.111.111-11' where nome = 'Maria';
update aluno set cpf = '555.111.111-11' where nome = 'Marcelo';

update aluno set nome = 'José' where cpf = '111.111.111-11';

select * from aluno where cpf = '333.111.111-11';

alter table aluno modify cpf varchar(14) primary key;

alter table aluno drop cpf;

desc aluno;

alter table aluno add column cpf varchar(14);

alter table aluno add idaluno int primary key auto_increment;

select * from aluno where idaluno = 4;

select * from aluno;

alter table aluno add logradouro varchar(100);
alter table aluno add numero varchar(10);
alter table aluno add complemento varchar(20);
alter table aluno add bairro varchar(100);
alter table aluno add cidade varchar(50);
alter table aluno add estado char(2);

update 
	aluno
set
	logradouro = 'Rua João de Abreu',
    numero = '650',
    complemento = '',
    bairro = 'Setor Oeste',
    cidade = 'Goiânia',
    estado = 'GO'
where
	idaluno = 5;

update aluno set complemento = '' where nome = 'Fernanda';

alter table aluno drop endereco;

desc aluno;

select * from aluno;

alter table aluno modify column telefone varchar(60);

update aluno set telefone = '11 5555-2222 11 3333-4444' where idaluno = 1;

create table telefone(
	idtelefone int auto_increment primary key,
    numero varchar(20),
    tipo char(3)
);

select * from telefone;

insert into telefone(numero, tipo) values('11 5555-2222', 'res');  
insert into telefone(numero, tipo) values('11 3333-4444', 'com');

alter table aluno drop column telefone;