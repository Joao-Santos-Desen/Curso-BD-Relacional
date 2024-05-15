create view vw_rel_alunos_cursos_contratos as
select 
	a.idaluno,
    a.nome,
    c.idcurso,
    c.descricao as curso,
    co.idcontrato,
    co.fk_data_inscricao_curso as data_inscricao,
    co.valor_total_curso
from 
	aluno as a
    left join aluno_curso as ac on (a.idaluno = ac.fk_idaluno)
    left join curso as c on (ac.fk_idcurso = c.idcurso)
    left join contrato as co on (
		ac.fk_idaluno = co.fk_idaluno 
        and ac.fk_idcurso = co.fk_idcurso
        and ac.data_inscricao_curso = co.fk_data_inscricao_curso
	);
    
show tables;

select 
	vw.nome,
    vw.curso,
    t.numero as telefone,
    e.estado
from 
	vw_rel_alunos_cursos_contratos as vw
    left join telefone as t on (vw.idaluno = t.fk_idaluno)
    left join endereco as e on (vw.idaluno = e.fk_idaluno);
    
select * from telefone where fk_idaluno in(1,2,3,4);

update telefone set fk_idaluno = 1 where fk_idaluno = 9;
update telefone set fk_idaluno = 2 where fk_idaluno = 7;