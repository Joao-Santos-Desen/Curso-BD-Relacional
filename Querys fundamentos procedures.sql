delimiter $$
create procedure proc_oi()
begin


	select 'Oi, você acabou de executar um procedimento que está armazenado no bd! Sempre que você precisar, é só me chamar.' as msg;
    
    
    
end
$$
delimiter ;

call proc_oi();

/* processos bem definidos que são executados repetidas vezes */
/* listar procedures do BD */
show procedure status where Db = 'universidade_u';

/* mostrar o conteúdo da procedure */
show create procedure universidade_u.proc_oi;

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_oi`()
 begin
 
 
 	select 'Oi, você acabou de executar um procedimento que está armazenado no bd! Sempre que você precisar, é sóme chamar.' as msg;
     
     
     
 end;
 
 /* alterar procedure -> remover a procedure e criar novamente */
 /*alteração*/
 drop procedure universidade_u.proc_oi;
 
 delimiter $$
 CREATE PROCEDURE `proc_oi`()
 begin
 
 
 	select 'Oi, eu fui modificada!' as msg;
     
     
     
 end
$$
 delimiter ;
 
 call proc_oi();
 
 
 /* ------------------------------------- */
 DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_oi`()
begin
 
 
 	select 'Oi, eu fui modificada!' as msg;
     
     
     
 end$$
DELIMITER ;
