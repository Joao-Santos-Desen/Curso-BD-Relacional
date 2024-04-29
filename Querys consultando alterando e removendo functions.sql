/* listando as functions do banco de dados */
show function status where Db = 'universidade_u';

/* mostrar o conteúdo de um function */
show create function universidade_u.func_data_ptbr;
 
 /* alterar function -> remover a function e criar novamente */
 delimiter $$
 CREATE FUNCTION `func_data_ptbr`(p_data datetime) 
 RETURNS varchar(255) 
     DETERMINISTIC
     COMMENT 'Function serve para retornar datas no formato dd/mm/yyyy'
 begin
 	return date_format(p_data, '--%d/%m/%Y--');
 end
 $$
 delimiter ;
 
 /* remover function */
 drop function universidade_u.func_data_ptbr;
 
 select func_data_ptbr('2017-03-27 00:00:00') as data_formatada;