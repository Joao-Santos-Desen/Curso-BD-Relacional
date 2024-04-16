alter table aluno add data_nascimento date;

select * from aluno;

update aluno set data_nascimento = '1960-05-01' where idaluno = 1;
update aluno set data_nascimento = '1980-06-12' where idaluno = 2;
update aluno set data_nascimento = '1982-01-07' where idaluno = 3;
update aluno set data_nascimento = '1970-03-04' where idaluno = 4;
update aluno set data_nascimento = '1985-12-05' where idaluno = 5;
update aluno set data_nascimento = '1988-01-20' where idaluno = 7;

/* recuperar a data atual */
select curdate();
select current_date();

/* recuperar data e hora atuais */
select now();

/* formatando datas */
select date_format(curdate(), '%D/%M/%y') as data_formatada;
/*
%d - dia do mês (de 01 até 31)
%D - dia di mês com sufixo em inglês
%m - mês (de 01 a 12)
%M - nome do mês em inglês
%y - ano (dois dígitos)
%Y - ano (quator dígitos)
*/

/* extrair parte de data */
select extract(year from curdate()); /* dia(day), mês(month) ou ano(year) */

/* adicionando intervalos de tempo as datas */
select now() as data_hora_atuais, date_add(now(), interval 5 day) as data_hora_ajustada; /* second, minute, hour, day, month, year */

/* calculo de dias entre datas */
select '1990-12-05' as data_nascimento, curdate() as data_atual, datediff(curdate(), '1990-12-05') as diferença_dias,
	floor(datediff(curdate(), '1990-12-05') / 365) as idade_aproximada;
    
/* calculo de meses entre datas */
select period_diff('199504', '199402') as diferença_meses;

/* dia do ano */
select dayofyear('2015-07-12') as dia_do_ano;

-- timestamp (marca temporal) início à partir da meia-noite do dia 01/01/1970.

select timestampdiff(YEAR, '1989-01-06', curdate()) as idade;

select 
	data_nascimento,
    curdate() as data_atual,
    timestampdiff(YEAR, data_nascimento, curdate()) as idade
from 
	aluno;
    
alter table aluno drop idade;

select * from aluno;

select
	idaluno,
    nome,
    data_nascimento,
    extract(month from data_nascimento) as data_nascimento_mes,
    extract(day from data_nascimento) as data_nascimento_dia,
    
    curdate() as data_atual,
    extract(month from curdate()) as data_atual_mes,
    extract(day from curdate()) as data_atual_dia,
    timestampdiff(year, data_nascimento, curdate()) as idade
from
	aluno
where
	extract(month from data_nascimento) = extract(month from curdate()) and
    extract(day from data_nascimento) = extract(day from curdate());
    
select * from aluno;

update aluno set data_nascimento = '1960-04-15' where idaluno = 1;