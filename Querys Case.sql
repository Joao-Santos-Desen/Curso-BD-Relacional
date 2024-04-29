delimiter $$
create procedure proc_case()
comment 'Exemplo de uso do case'
begin

	declare opcao int default 17;
    
    /* sintaxe simples */
    case opcao
		when 1 then select 'Instrução a ser executada é a opção 1';
        when 2 then select 'Instrução a ser executada é a opção 2';
        when 3 then select 'Instrução a ser executada é a opção 3';
        when 4 then select 'Instrução a ser executada é a opção 4';
	else
		select 'Instrução a ser executada se nenhuma opção anterior for verdadeira';
	end case;

end
$$
delimiter ;

call proc_case();

drop procedure universidade_u.proc_case;


delimiter $$
create procedure proc_case2()
comment 'Exemplo de uso do case'
begin

	declare data_teste date;
    
    set data_teste = curdate() + 500;
    
    /* sintaxe alternativa */
    case 
		when data_teste = curdate() then select curdate() as data_atual, data_teste, 'Presente';
        when data_teste < curdate() then select curdate() as data_atual, data_teste, 'Passado';
        when data_teste > curdate() then select curdate() as data_atual, data_teste, 'Futuro';
	else
		select 'Nenhuma das anteriores';
	end case;

end
$$
delimiter ;

call proc_case2();

drop procedure universidade_u.proc_case2;


select 
	a.idaluno,
    a.nome,
    case
		when a.sexo = 'M' then 'Masculino'
        else 'Feminino'
	end as sexo,
    t.numero,
    case
		when t.tipo = 'res' then 'Residencial'
        when t.tipo = 'com' then 'Comercial'
        when t.tipo = 'cel' then 'Celular'
	end	as tipo
from 
	aluno as a left join telefone as t on (a.idaluno = t.fk_idaluno);