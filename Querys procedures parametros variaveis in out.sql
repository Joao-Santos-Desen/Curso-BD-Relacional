/*escopo de seção*/

/*escopo de parâmetros*/

/*escopo local*/

delimiter $$
create procedure proc_exemplo_parametros(
	in param1 int,
    out param2 varchar(50),
    inout param3 float(3,1)
)
begin
	select param1, param2, param3;
    
    set param2 = 'Parâmetro 2 foi modificado';
    set param3 = 30.3;
    /*
    param1 - será exibido pois é umparâmetro de entrada.
    param2 - será exibido null, pois o valor não é passado, é passado apenas a sua referência.
    param3 - será exibido 70.5, pois é um parâmetro de entrada e vai permitir alterar o valor da variável de sessão, 
    também é uma referência.
    */
end
$$
delimiter ;

show procedure status where Db = 'universidade_u';
drop procedure universidade_u.proc_exemplo_parametros;

set @p1 = 100;
set @p2 = 'Parâmetro 2';
set @p3 = 70.5;

select @p1, @p2, @p3;

call proc_exemplo_parametros(@p1, @p2, @p3);

select @p1, @p2, round(@p3,1);