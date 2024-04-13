select * from aluno;

select idaluno, nome from aluno;

select * from telefone;

alter table telefone add column fk_idaluno int;

alter table telefone add constraint fk_aluno_telefone
foreign key(fk_idaluno) references aluno(idaluno);

desc telefone;

/*

*/

/* universidade_u_logico: */


CREATE TABLE TELEFONE (
    idtelefone int auto_increment PRIMARY KEY,
    numero varchar(20),
    Campo_1 char(3),
    fk_idaluno int,
    FOREIGN KEY (fk_idaluno) REFERENCES ALUNO (idaluno)
);
 
ALTER TABLE TELEFONE ADD CONSTRAINT fk_aluno_telefone
    FOREIGN KEY (fk_idaluno)
    REFERENCES ALUNO (idaluno);
    
select * from aluno;

select * from telefone;

update telefone set fk_idaluno = 1 where numero in('11 5555-2222', '11 3333-4444');

insert into telefone(numero, tipo, fk_idaluno) values('11 5555-9999', 'res', 3);


