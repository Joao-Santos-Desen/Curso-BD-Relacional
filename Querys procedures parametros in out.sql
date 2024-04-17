set @x = 10;
set @y = 15;
set @Nome = 'João';

set @y = 25;
set @resultado = @x + @y;

select @x;
select @y;
select @Nome as teste;
select @resultado as teste;

/* declarar uma variável que contenha o cpf de um aluno */
set @cpf = '555.555.555-55';
select * from aluno;
/* descobrir o id do aluno */
set @idaluno = (select idaluno from aluno where cpf = @cpf);
/* recuperar os registros de telefones de alunos */
select @idaluno;
select * from telefone where fk_idaluno = @idaluno;

drop procedure universidade_u.proc_variaveis_escopo_local1;

delimiter $$
create procedure proc_variaveis_escopo_local1()
begin
	declare x int default 10;
    declare papagaio float(8,2);
    
    /*lógica procedure*/
    set papagaio = 20.45;
    set x = 'João';
    /*tipagem forte*/
    
    select papagaio as variavel_escopo_local;
end
$$
delimiter ;

show procedure status where Db = 'universidade_u';
call proc_variaveis_escopo_local1();

/* tipagem forte / fraca */
set @nome = 'João';
set @nome = 10;
select @nome;


delimiter $$
create procedure proc_variaveis_escopo_local2()
begin
	declare total_professores int;
    
    set total_professores = (select count(*) from professor);
    select total_professores as teste;
end
$$
delimiter ;
call proc_variaveis_escopo_local2();

drop procedure universidade_u.proc_variaveis_escopo_local2;

delimiter $$
create procedure proc_variaveis_escopo_local2()
begin
	declare total_professores int;
    
    select count(*) into total_professores from professor;
    select total_professores as teste;
end
$$
delimiter ;
call proc_variaveis_escopo_local2();


delimiter $$
create procedure proc_variaveis_escopo_parametro(param1 int, out param2 varchar(100))
begin
	select param1, param2;
    set param2 = 'Parâmetro 2 foi modificado e exportado pela procedure';
end
$$
delimiter ;

show procedure status where Db = 'universidade_u';

set @param2 = 'Parâmetro 2';
select @param2;
call proc_variaveis_escopo_parametro(100, @param2);
select @param2;