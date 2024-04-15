select * from telefone;

desc telefone;

CREATE TABLE TELEFONE (
    idtelefone int auto_increment PRIMARY KEY,
    numero varchar(20) not null,
    tipo enum('res', 'com', 'cel') not null,
    fk_idaluno int not null
);

alter table telefone modify column numero varchar(20) not null;
alter table telefone modify column tipo enum('res', 'com', 'cel') not null;
alter table telefone modify column fk_idaluno int not null;

CREATE TABLE ENDERECO (
    idendereco int auto_increment PRIMARY KEY,
    logradouro varchar(100) not null,
    numero varchar(10) not null,
    complemento varchar(20),
    bairro varchar(100) not null,
    cidade varchar(50) not null,
    estado char(2) not null,
    fk_idaluno int not null
);

alter table endereco modify column logradouro varchar(100) not null;
alter table endereco modify column numero varchar(10) not null;
alter table endereco modify column bairro varchar(100) not null;
alter table endereco modify column cidade varchar(50) not null;
alter table endereco modify column estado char(2) not null;
alter table endereco modify column fk_idaluno int not null;

desc endereco;

alter table aluno add constraint uc_aluno_cpf unique(cpf);

select * from aluno where cpf = '333.111.111-11';

update aluno set cpf = '333.111.111-19' where idaluno = 3;

select * from aluno;

insert into aluno(sexo, idade, email, data_inscricao_curso, valor_pago_curso, ativo_sn, nome, cpf)
values ('F', 25, 'rosa@teste.com.br', '2019-01-05', 625, 1, 'Rosa', '444.111.111-12');

desc aluno;

select * from aluno;

alter table aluno add constraint uc_aluno_email unique(email);

select * from aluno;
select * from endereco;

insert into endereco(logradouro, numero, complemento, bairro, cidade, estado, fk_idaluno)
values('Avenida Paulista', 500, null, 'Bela Vista', 'São Paulo', 'SP', 7);

desc endereco;

alter table endereco add constraint uc_endereco_fkidaluno unique(fk_idaluno);