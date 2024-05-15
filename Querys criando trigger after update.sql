show triggers;

alter table funcionario add column salario float(9,2) not null;

alter table funcionario_log add column salario_antigo float(9,2);
alter table funcionario_log add column salario_novo float(9,2);

drop trigger universidade_u.tr_before_update_funcionario;
drop trigger universidade_u.tr_after_delete_funcionario;

show create trigger tr_before_delete_funcionario;

delimiter $$
CREATE TRIGGER `tr_after_update_funcionario` 
AFTER UPDATE ON `funcionario` 
FOR EACH ROW 
begin 
   	insert into funcionario_log
    (matricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo, salario_antigo, salario_novo)
    values(OLD.matricula, 'AU', OLD.funcao, NEW.funcao, OLD.telefone, NEW.telefone, OLD.salario, NEW.salario);
end
$$
delimiter ;

select * from funcionario;
select * from funcionario_log where matricula = 3;

update funcionario set funcao = 'Gerente Administrativo', telefone = '11 3333-7777', salario = 6000.00
	where idfuncionario = 3;
