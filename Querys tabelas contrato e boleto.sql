create table contrato(
    idcontrato int not null auto_increment,
    fk_idaluno int not null,
    fk_idcurso int not null,
    fk_data_inscricao_curso datetime not null,
    valor_total_curso float(8,2) not null,
    desconto float(4,1) not null default 0,
    numero_parcelas int not null,
    processado enum('n','s') default 'n',
    constraint pk_idcontrato primary key(idcontrato)
);

alter table contrato add constraint fk_contrato_aluno_curso
foreign key(fk_idaluno, fk_idcurso, fk_data_inscricao_curso)
references aluno_curso(fk_idaluno, fk_idcurso, data_inscricao_curso);

alter table aluno_curso drop column valor_pago_curso;

create table boleto(
	idboleto int primary key auto_increment,
    fk_idcontrato int,
    data_vencimento date not null,
    valor float(8,2) not null,
    numero_parcela int not null
);

/* */
select * from aluno;
select * from curso;
select * from aluno_curso;
select * from contrato;
select * from boleto;
/* */

insert into aluno_curso(fk_idaluno, fk_idcurso, data_inscricao_curso)values(1, 2, '2019-01-07 12:00:00');
insert into aluno_curso(fk_idaluno, fk_idcurso, data_inscricao_curso)values(2, 3, '2019-01-12 17:30:00');
insert into aluno_curso(fk_idaluno, fk_idcurso, data_inscricao_curso)values(3, 1, '2019-01-09 09:45:00');
insert into aluno_curso(fk_idaluno, fk_idcurso, data_inscricao_curso)values(4, 4, '2019-02-01 13:20:00');

select * from aluno_curso;

insert into contrato(fk_idaluno, fk_idcurso, fk_data_inscricao_curso, valor_total_curso, numero_parcelas)values(1, 2, '2019-01-07 12:00:00', 1500, 12);
insert into contrato(fk_idaluno, fk_idcurso, fk_data_inscricao_curso, valor_total_curso, numero_parcelas)values(2, 3, '2019-01-12 17:30:00', 1300, 12);
insert into contrato(fk_idaluno, fk_idcurso, fk_data_inscricao_curso, valor_total_curso, numero_parcelas)values(3, 1, '2019-01-09 09:45:00', 900, 10);
insert into contrato(fk_idaluno, fk_idcurso, fk_data_inscricao_curso, valor_total_curso, numero_parcelas)values(4, 4, '2019-02-01 13:20:00', 2000, 10);

select * from contrato;