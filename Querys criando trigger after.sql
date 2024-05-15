show triggers;
show create trigger universidade_u.tr_before_insert_funcionario;

delimiter $$
CREATE TRIGGER `tr_after_insert_funcionario` 
AFTER INSERT ON `funcionario` 
FOR EACH ROW 
begin 
  	 insert into funcionario_log(fk_idmatricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo)
      values(NEW.idmatricula, 'AI', null, NEW.funcao, null, NEW.telefone);
  end
  $$
  delimiter ;

select * from funcionario;
select * from funcionario_log;
insert into funcionario(nome, funcao, telefone)values('Elton', 'Auxiliar Contábil', '11 3333-4444');