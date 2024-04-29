delimiter $$
create procedure proc_boleto()
comment 'Procedure para processamento dos contratos e geração dos registros de boletos'
begin
	
    declare v_fim_loop int default 0;
    declare v_log text;
    
	declare v_idcontrato, v_fk_idaluno, v_fk_idcurso int;
    declare v_fk_data_inscricao_curso datetime;
    declare v_valor_total_curso float(8,2);
    declare v_desconto float(4,1);
    declare v_numero_parcelas int;
    declare v_processado char(1);
    
    declare v_boleto_loop_parcelas int;
    declare v_boleto_valor_parcela float(8,2);
    declare v_boleto_data_vencimento datetime;
    
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
		where
			processado = 'n'
		);
        
	/* manipulador (handler) de continuidade do laço */
    declare continue handler for not found set v_fim_loop = 1;
       
	open c_contratos; /* abrir ocursor */
		
	repeat        
		fetch c_contratos into v_idcontrato, v_fk_idaluno, v_fk_idcurso, v_fk_data_inscricao_curso, v_valor_total_curso,
		v_desconto, v_numero_parcelas, v_processado;
        
	if v_fim_loop = 0 then
		set v_log = concat(
			v_fim_loop, ' *** ', v_idcontrato, ' - ', v_fk_idaluno, ' - ', v_fk_idcurso, ' - ', v_fk_data_inscricao_curso, ' - ', v_valor_total_curso, ' - ',
            v_desconto, ' - ', v_numero_parcelas, ' - ', v_processado
        );
        
		insert into log(log)value(v_log);
        
        /* estrutura de repetição */
        set v_boleto_loop_parcelas = 1;
        while v_boleto_loop_parcelas <= v_numero_parcelas do
        
			set v_boleto_valor_parcela = v_valor_total_curso / v_numero_parcelas;
            set v_boleto_data_vencimento = date_add(v_fk_data_inscricao_curso,interval v_boleto_loop_parcelas month);
        
			insert into boleto(fk_idcontrato, data_vencimento, valor, numero_parcela)
            values(v_idcontrato, v_boleto_data_vencimento, v_boleto_valor_parcela, v_boleto_loop_parcelas);
                    
			set v_boleto_loop_parcelas = v_boleto_loop_parcelas + 1;
            
        end while;
        
        update contrato set processado = 's' where idcontrato = v_idcontrato;
	end if;
        
    until v_fim_loop > 0 end repeat; /* (quando a condição for verdadeira o laço será interrompido) */
   
	close c_contratos; /* fechar o cursor */
end
$$
delimiter ;

call proc_boleto();

select * from contrato;
select * from boleto;
select * from log;
truncate table log;
truncate table boleto;

drop procedure universidade_u.proc_boleto;