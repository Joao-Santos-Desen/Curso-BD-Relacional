/* listando as views */
show tables;

/* consultar o conteúdo de uma view (declaração) */
show create view universidade_u.vw_rel_cursos_disciplinas_professores;

select 
	`c`.`idcurso` AS `idcurso`,
	`c`.`descricao` AS `curso`,
	`d`.`iddisciplina` AS `iddisciplina`,
	`d`.`descricao` AS `disciplina`,
	`d`.`carga_horaria` AS `carga_horaria`,
	`p`.`idprofessor` AS `idprofessor`,
	`p`.`nome` AS `professor` 
from 
	`curso` `c` 
    left join `disciplina` `d` on(`c`.`idcurso` = `d`.`fk_idcurso`) 
    left join `professor` `p` on(`d`.`fk_idprofessor` = `p`.`idprofessor`);
    
/* alterando uma view */
alter view vw_rel_cursos_disciplinas_professores as
select 
	`c`.`idcurso` AS `idcurso`,
	`c`.`descricao` AS `curso`,
	`d`.`iddisciplina` AS `iddisciplina`,
	`d`.`descricao` AS `disciplina`,
	`d`.`carga_horaria` AS `carga_horaria`,
	`p`.`idprofessor` AS `idprofessor`,
	`p`.`nome` AS `professor`, 
    p.email as email_professor
from 
	`curso` `c` 
    left join `disciplina` `d` on(`c`.`idcurso` = `d`.`fk_idcurso`) 
    left join `professor` `p` on(`d`.`fk_idprofessor` = `p`.`idprofessor`);
    
select * from vw_rel_cursos_disciplinas_professores;

drop view vw_rel_cursos_disciplinas_professores;