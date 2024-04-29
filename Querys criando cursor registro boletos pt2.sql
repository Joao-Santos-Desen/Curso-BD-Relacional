delimiter $$
create procedure proc_boleto()
comment 'Procedure para processamento dos contratos e geração dos registros de boletos'
begin
	
    declare v_fim_loop int default 0;
    declare v_log text;
    
	declare v_idcontrato, v_fk_idaluno, v_fk_idcurso int;
    declare v_data_inscricao_curso datetime;
    declare v_valor_total_curso float(8,2);
    declare v_desconto float(4,1);
    declare v_numero_parcelas int;
    declare v_processado char(1);
    
	declare c_contratos cursor for(
		select 
			idcontrato,
			fk_idaluno,
			fk_idcurso,
			fk_data_inscricao_curso,
			valor_total_curso,
			desconto,
			numero_parcelas,
			processado
		from 
			contrato
		);
        
	/* manipulador (handler) de continuidade do laço */
    declare continue handler for not found set v_fim_loop = 1;
       
	open c_contratos; /* abrir ocursor */
		
	repeat        
		fetch c_contratos into v_idcontrato, v_fk_idaluno, v_fk_idcurso, v_data_inscricao_curso, v_valor_total_curso,
		v_desconto, v_numero_parcelas, v_processado;
        
	if v_fim_loop = 0 then
		set v_log =concat(
			v_fim_loop, ' *** ', v_idcontrato, ' - ', v_fk_idaluno, ' - ', v_fk_idcurso, ' - ', v_data_inscricao_curso, ' - ', v_valor_total_curso, ' - ',
            v_desconto, ' - ', v_numero_parcelas, ' - ', v_processado
        );
        
		insert into log(log)value(v_log);
	end if;
        
    until v_fim_loop > 0 end repeat; /* (quando a condição for verdadeira o laço será interrompido) */
   
	close c_contratos; /* fechar o cursor */
end
$$
delimiter ;

call proc_boleto();

select * from log;
truncate table log;

drop procedure universidade_u.proc_boleto;