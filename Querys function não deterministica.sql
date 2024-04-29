drop function universidade_u.func_qtde_disciplinas;

set global log_bin_trust_function_creators = 0;

delimiter $$
create function func_qtde_disciplinas(p_idcurso int)
returns int
comment 'Function serve para retornar a quantidade de disciplinas com base em um curso'
begin
	declare qtde_disciplinas int default 0;
    
    /* lógica para recuperar registros de uma tabela */
    set qtde_disciplinas = (select count(*) as qtde_disciplinas from disciplina where fk_idcurso = p_idcurso); 
    
    return qtde_disciplinas;
end
$$
delimiter ;

select func_qtde_disciplinas(3) as qtde_disciplinas;

show function status where Db = 'universidade_u';

select 
	fk_idcurso,
    (select descricao from curso where idcurso = fk_idcurso) as descricao,
    count(*) as qtde_disciplinas
from 
	disciplina
group by
	fk_idcurso;
    
select 
	idcurso,
    descricao,
    func_qtde_disciplinas(idcurso) as qtde_disciplinas
from 
	curso;