show triggers;

show create trigger tr_before_delete_funcionario;

delimiter $$
CREATE TRIGGER `tr_after_delete_funcionario` 
AFTER DELETE ON `funcionario` 
FOR EACH ROW 
begin 
   	insert into funcionario_log(matricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo)
    values(OLD.matricula, 'AD', OLD.funcao, null, OLD.telefone, null);
end
$$
delimiter ;

alter table funcionario_log add column matricula int not null;
select * from funcionario_log;

delete from funcionario where idfuncionario = 4;
select * from funcionario;

drop trigger universidade_u.tr_before_insert_funcionario;
drop trigger universidade_u.tr_after_insert_funcionario;
drop trigger universidade_u.tr_before_delete_funcionario;
drop trigger universidade_u.tr_after_delete_funcionario;