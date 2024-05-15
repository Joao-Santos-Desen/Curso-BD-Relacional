show triggers;
show create trigger universidade_u.tr_before_insert_funcionario;

delimiter $$
CREATE TRIGGER tr_before_delete_funcionario 
before delete ON `funcionario` 
FOR EACH ROW 
begin 
  	 insert into funcionario_log(fk_idmatricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo)
      values(null, 'BD', OLD.funcao, null, OLD.telefone, null);
  end
  $$
  delimiter ;

select * from funcionario;
select * from funcionario_log;

set foreign_key_checks = 0;
delete from funcionario where idmatricula = 1;
set foreign_key_checks = 1;

drop trigger universidade_u.tr_before_delete_funcionario;