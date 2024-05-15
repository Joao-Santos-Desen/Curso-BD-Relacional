/* listamos as triggers do bd */
show triggers where `table` =  'funcionario';

/* instrução para recuperar a trigger (bloco lógico) */
show create trigger universidade_u.tr_before_insert_funcionario;

/* alterar - remover a trigger e criar a trigger novamente */
delimiter $$
CREATE TRIGGER `tr_before_insert_funcionario` BEFORE INSERT ON `funcionario` FOR EACH ROW 
begin 
 	 insert into funcionario_log(fk_idmatricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo)
     values(null, 'BI', null, NEW.funcao, null, NEW.telefone);
 end
 $$
 delimiter ;
 /* remover as triggers */
 drop trigger universidade_u.tr_before_insert_funcionario;

create table funcionario_log(
	idfuncionario_log int auto_increment,
    fk_idmatricula int,
    data_log datetime default current_timestamp,
    tipo_log char(2) not null,
    funcao_antiga varchar(50),
    funcao_nova varchar(50),
    telefone_antigo varchar(20),
    telefone_novo varchar(20),
    constraint pk_idfuncionario_log primary key(idfuncionario_log),
    constraint pk_funcionario_funcionario_log foreign key(fk_idmatricula) references funcionario(idmatricula)
);

select * from funcionario;
select * from funcionario_log;

delimiter $$
create trigger tr_before_insert_funcionario
before insert on funcionario
for each row
begin

	/*---- NEW ---- AÇÃO */
        
	insert into funcionario_log(fk_idmatricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo)
    values(null, 'BI', null, NEW.funcao, null, NEW.telefone);
end
$$
delimiter ;

insert into funcionario(nome, funcao, telefone)values('Alana', 'Assistente Administrativo', '11 98888-7777');

select * from funcionario;
select * from funcionario_log;