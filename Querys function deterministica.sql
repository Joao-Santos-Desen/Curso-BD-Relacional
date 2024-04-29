delimiter $$
create function func_idade(p_data date)
returns int
deterministic
comment 'Function serve para retornar a idade com base na data de nascimento'
begin
	return timestampdiff(YEAR, p_data, curdate());
end
$$
delimiter ;

show function status where Db = 'universidade_u';

select nome, func_idade(data_nascimento) as idade from aluno;