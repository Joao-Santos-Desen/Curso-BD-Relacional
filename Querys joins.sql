show tables;

select * from aluno;
select * from telefone;

select
	*
from
	aluno left join telefone on (aluno.idaluno = telefone.fk_idaluno)
where
	sexo = 'F';
    
select * from curso;
select * from disciplina;
select * from professor;

select 
	*
from 
	curso left join disciplina on (curso.idcurso = disciplina.fk_idcurso)
    left join professor on (disciplina.fk_idprofessor = professor.idprofessor)
where 
	idcurso = 1;
    

/* seleção, projeção, junção e apelidos */
/* ambiguidade */
select /* projeção */
	c.idcurso, 
    c.descricao as curso, 
    d.iddisciplina, 
    d.descricao as disciplina, 
    p.idprofessor, 
    p.nome as professor, 
    now() as data_atual
from 
	curso as c left join disciplina as d on (c.idcurso = d.fk_idcurso)
    left join professor as p on (d.fk_idprofessor = p.idprofessor)
where /* seleção de um subconjunto */
	idcurso = 1;
    
    
select * from curso;
select * from disciplina;

select 
	*
from 
	disciplina as d left join curso as c on (c.idcurso = d.fk_idcurso);
    
select 
	*
from 
	curso as c right join disciplina as d on (c.idcurso = d.fk_idcurso);
    
select 
	*
from 
	telefone as t right join aluno as a on (t.fk_idaluno = a.idaluno);
    
/* inner */
select 
	* 
from 
	disciplina as d inner join professor as p on (d.fk_idprofessor = p.idprofessor);

/* full outer join */
select 
	*
from
	disciplina as d left join professor as p on (d.fk_idprofessor = p.idprofessor);