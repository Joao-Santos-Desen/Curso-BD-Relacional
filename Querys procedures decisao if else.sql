delimiter $$
create procedure proc_ifelse()
comment 'Exemplo de uso dos condicionais ifelse'
begin

	declare sexo char(1);
    
    set sexo = (select sexo from aluno where idaluno = 3);
	if sexo = 'M' then
		select 'O aluno é do sexo masculino';
	else
		select 'A aluna é do sexo feminino';
	end if;
         
end
$$
delimiter ;

call proc_ifelse();

drop procedure universidade_u.proc_ifelse;



delimiter $$
create procedure proc_ifelse2()
comment 'Exemplo de uso dos condicionais ifelse parte 2'
begin

	declare idade int;
    
    set idade = (select timestampdiff(year, data_nascimento, curdate()) from aluno where idaluno = 5);
    
    if idade >= 0 and idade <= 15 then
		select 'Criança';
	elseif idade > 15 and idade <= 29 then
		select 'Jovem';
	elseif idade > 29 and idade <= 59 then
		select 'Adulto';
	else
		select 'Idoso';
	end if;
         
end
$$
delimiter ;

call proc_ifelse2();

drop procedure universidade_u.proc_ifelse2;