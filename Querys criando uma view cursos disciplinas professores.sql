select * from curso;
select * from disciplina;
select * from professor;

/* cursos, disciplinas e professores */
create view vw_rel_cursos_disciplinas_professores as
select 
	 c.idcurso,
     c.descricao as curso,
     d.iddisciplina,
     d.descricao as disciplina,
     d.carga_horaria,
     p.idprofessor,
     p.nome as professor
from 
	curso as c 
    left join disciplina as d on (c.idcurso = d.fk_idcurso)
    left join professor as p on (d.fk_idprofessor = p.idprofessor);
    
select * from vw_rel_cursos_disciplinas_professores where idprofessor = 3;

select curso, sum(carga_horaria) as total from vw_rel_cursos_disciplinas_professores where idcurso = 1;