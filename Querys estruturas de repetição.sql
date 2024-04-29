create table log(
	idlog int primary key auto_increment,
    log varchar(255)
);

delimiter $$
create procedure proc_while()
comment 'Exemplo de uso do while'
begin
	
    declare contador int default 1;
    
    /* operadores de comparação, podem ser conectados por operadores lógicos */
    while contador < 10 do
    
		insert into log(log)values(contador);
        
			set contador = contador + 1;
            
	end while;

end
$$
delimiter ;

call proc_while();

select * from log;


delimiter $$
create procedure proc_loop()
comment 'Exemplo de uso do loop'
begin
	
    declare z int default 1;
    declare resultado varchar(20);
    
    
    loop_tabuada: loop
    
		set resultado = concat('2 x ', z, ' = ', (2*z));
    
		insert into log(log)value(resultado);
    
		set z = z + 1;
        
        if z > 10 then
			leave loop_tabuada;
		end if;
    
    end loop loop_tabuada;

end
$$
delimiter ;

call proc_loop();

drop procedure universidade_u.proc_loop;
truncate table log;

select * from log;


delimiter $$
create procedure proc_repeat()
comment 'Exemplo de uso do repeat'
begin
	
    declare z int default 1;
    declare resultado varchar(20);
    
    
    repeat
    
		set resultado = concat('2 x ', z, ' = ', (2*z));
    
		insert into log(log)value(resultado);
    
		set z = z + 1;       
    
    until z > 10 end repeat;

end
$$
delimiter ;

call proc_repeat();

drop procedure universidade_u.proc_repeat;
truncate table log;

select * from log;