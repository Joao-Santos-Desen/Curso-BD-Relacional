show triggers;

show create trigger tr_before_delete_funcionario;

delimiter $$
CREATE TRIGGER `tr_before_update_funcionario` 
BEFORE UPDATE ON `funcionario` 
FOR EACH ROW 
begin 
   	insert into funcionario_log(matricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo)
    values(OLD.matricula, 'BU', OLD.funcao, NEW.funcao, OLD.telefone, NEW.telefone);
end
$$
delimiter ;

delete from funcionario where idfuncionario = 4;
alter table funcionario_log add column matricula int not null;
select * from funcionario_log where matricula = 5;
select * from funcionario;

update funcionario set funcao = 'Diretor de TI', telefone = '11 7777-9999' where idfuncionario = 5;


