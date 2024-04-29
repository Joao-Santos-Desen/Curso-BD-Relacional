/* 
	ela vai receber uma data no formato yyyy-mm-dd e vai retornar uma string no formato dd/mm/yyyy
*/

delimiter $$
create function func_data_ptbr(p_data datetime)
returns char(10)
deterministic /* a função é determinística quando ela não afeta dados do bd, portanto é considerada segura */
comment 'Function serve para retornar datas no formato dd/mm/yyyy'
begin
	return date_format(p_data, '%d/%m/%Y');
end
$$
delimiter ;

select nome, data_nascimento from aluno;
select nome, date_format(data_nascimento, '%d/%m/%Y') as data_nascimento from aluno;
select nome, func_data_ptbr(data_nascimento) as data_nascimento from aluno;

drop function universidade_u.func_data_ptbr;