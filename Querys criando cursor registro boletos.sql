delimiter $$
create procedure proc_boleto()
comment 'Procedure para processamento dos contratos e geração dos registros de boletos'
begin
	
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
       
	open c_contratos; /* abrir ocursor */
		
	fetch c_contratos into v_idcontrato, v_fk_idaluno, v_fk_idcurso, v_data_inscricao_curso, v_valor_total_curso,
		v_desconto, v_numero_parcelas, v_processado;
        
	fetch c_contratos into v_idcontrato, v_fk_idaluno, v_fk_idcurso, v_data_inscricao_curso, v_valor_total_curso,
		v_desconto, v_numero_parcelas, v_processado;
        
	fetch c_contratos into v_idcontrato, v_fk_idaluno, v_fk_idcurso, v_data_inscricao_curso, v_valor_total_curso,
		v_desconto, v_numero_parcelas, v_processado;
        
	select v_idcontrato, v_fk_idaluno, v_fk_idcurso, v_data_inscricao_curso, v_valor_total_curso,
		v_desconto, v_numero_parcelas, v_processado;
   
	close c_contratos; /* fechar o cursor */
end
$$
delimiter ;

call proc_boleto();

drop procedure universidade_u.proc_boleto;

