show databases;

create database universidade_u;

drop database universidade_u;

create database universidade_u;

use universidade_u;

CREATE TABLE ALUNO (
    sexo char(1),
    idade int,
    data_inscricao_curso date,
    telefone varchar(20),
    valor_pago_curso float(10,2),
    ativo_sn int,
    endereco text,
    nome varchar(25)
);

insert into aluno(
	sexo, idade, data_inscricao_curso, telefone, valor_pago_curso,
    ativo_sn, endereco, nome
)values(
	'M', 55, '2018-12-01', '11 5555-2222', 645.22, 
    1, 'Avenida Paulista, 1500, ap315 - São Paulo - SP', 'João'
);

insert into aluno(
	data_inscricao_curso, telefone, valor_pago_curso,
    ativo_sn, endereco, nome, 
    sexo, idade
)values(
	'2018-11-01', '11 3333-2222', 589.12, 
    1, 'Rua Francisco Sá, 10 - Belo Horizonte - MG', 'Fernanda', 
    'F', 30
);


insert into aluno(
	data_inscricao_curso, telefone, valor_pago_curso,
    ativo_sn, endereco, nome, 
    sexo, idade
)values(
	'2018-12-02', '11 3333-7777', 600.55, 
    0, 'Avenida Dom Manuel, 300 - Fortaleza - CE', 'José', 
    'M', 29
);


insert into aluno(
	data_inscricao_curso, telefone, valor_pago_curso,
    ativo_sn, endereco, nome, 
    sexo, idade
)values(
	'2018-12-02', '11 7777-7777', 655.45, 
    1, 'Rua Miramar, 1200, ap112 - Natal - RN', 'Maria', 
    'F', 42
);


insert into aluno(
	data_inscricao_curso, telefone, valor_pago_curso,
    ativo_sn, endereco, nome, 
    sexo, idade
)values(
	'2018-11-15', '11 1111-7777', 612.99, 
    1, 'Rua João de Abreu, 650 - Goiânia - GO', 'Marcelo', 
    'M', 37
);

select * from aluno;

select idade, telefone, nome from aluno;

select idade, telefone, nome from aluno;

select * from aluno where sexo = 'F';

select * from aluno where valor_pago_curso < 600;
select * from aluno where valor_pago_curso > 600;
select * from aluno where valor_pago_curso <= 600.55;
select * from aluno where valor_pago_curso >= 600.55;

select * from aluno;
select * from aluno where sexo = 'M' AND ativo_sn = 1  AND valor_pago_curso <= 625;
select * from aluno where sexo = 'F' OR idade >=40;

select * from aluno where data_inscricao_curso between '2018-11-01' and '2018-11-30';

select * from aluno where nome = 'Fernanda' OR nome = 'Maria' OR nome = 'Marcelo';

select * from aluno where nome in ('Fernanda', 'Maria', 'Marcelo');

select * from aluno where nome not in ('Fernanda', 'Maria', 'Marcelo');

select * from aluno where nome like '%o';

select * from aluno where nome like '%r%';

select * from aluno where nome like 'm%';

select * from aluno where nome like '_osé';

select * from aluno where nome like '_oã_';

select * from aluno where nome like '%d_';

select * from aluno order by nome ASC;

select * from aluno order by valor_pago_curso ASC;

select * from aluno order by valor_pago_curso DESC;

select * from aluno order by sexo ASC, idade DESC;

update aluno set ativo_sn = 0 where nome ='João';

update aluno set ativo_sn = 1, valor_pago_curso = 750 where nome ='José';

update aluno set telefone = '11 8888-4444' where telefone ='11 7777-7777';

delete from aluno where ativo_sn = 0;

delete from aluno where idade in (30,29);

delete from aluno where idade in (30,29) or sexo = 'F';

delete from aluno where nome = 'Marcelo';

insert into aluno(
	sexo, idade, data_inscricao_curso, telefone, valor_pago_curso,
    ativo_sn, endereco, nome
)values(
	'M', 55, '2018-12-01', '11 5555-2222', 645.22, 
    1, 'Avenida Paulista, 1500, ap315 - São Paulo - SP', 'João'
);

insert into aluno(
	data_inscricao_curso, telefone, valor_pago_curso,
    ativo_sn, endereco, nome, 
    sexo, idade
)values(
	'2018-11-01', '11 3333-2222', 589.12, 
    1, 'Rua Francisco Sá, 10 - Belo Horizonte - MG', 'Fernanda', 
    'F', 30
);


insert into aluno(
	data_inscricao_curso, telefone, valor_pago_curso,
    ativo_sn, endereco, nome, 
    sexo, idade
)values(
	'2018-12-02', '11 3333-7777', 600.55, 
    0, 'Avenida Dom Manuel, 300 - Fortaleza - CE', 'José', 
    'M', 29
);


insert into aluno(
	data_inscricao_curso, telefone, valor_pago_curso,
    ativo_sn, endereco, nome, 
    sexo, idade
)values(
	'2018-12-02', '11 7777-7777', 655.45, 
    1, 'Rua Miramar, 1200, ap112 - Natal - RN', 'Maria', 
    'F', 42
);


insert into aluno(
	data_inscricao_curso, telefone, valor_pago_curso,
    ativo_sn, endereco, nome, 
    sexo, idade
)values(
	'2018-11-15', '11 1111-7777', 612.99, 
    1, 'Rua João de Abreu, 650 - Goiânia - GO', 'Marcelo', 
    'M', 37
);