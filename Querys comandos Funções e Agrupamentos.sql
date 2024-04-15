/* cout */
select * from aluno;

select count(*) from aluno where sexo = 'F';

select count(distinct nome) from aluno;

/* max */
select max(valor_pago_curso) from aluno where idade < 40;

/* min */
select min(valor_pago_curso) from aluno where ativo_sn != 0;

/* avg */
select avg(valor_pago_curso) from aluno where nome = 'José';

/* sum*/
select sum(valor_pago_curso) from aluno where nome = 'José';

select 
	max(valor_pago_curso) as maior_valor, 
    min(valor_pago_curso) as menor_valor, 
    avg(valor_pago_curso) as media, 
    sum(valor_pago_curso) as soma 
    from aluno
where ativo_sn = 1;

select valor_pago_curso as valor_curso, nome from aluno;

/* ceil - arredonda o valor para cima */
select ceil(17.4) as valor;

/* floor - arredonda o valor para baixo */
select floor(19.555) as valor;

/* truncate - trunca a fração */
select truncate(22.7573333, 2) as valor;

/* round - arredondamento */
select round(55.755, 2) as valor; /* < 5 = para baixo, >= 5 para cima */

select 
	round(avg(valor_pago_curso), 2) as valor_pago_curso
from 
	aluno 
where 
	idaluno in(1, 4, 5);
    
/* Group by */
select 
	nome, count(*) repeticao_nome_agrupamento 
from 
	aluno
group by
	nome;
    
select 
	ativo_sn, count(*) as repeticao_ativo_sn_agrupamento 
from 
	aluno
group by
	ativo_sn;
    
select 
	ativo_sn, nome, count(*) as repeticao_agrupamento
from
	aluno
group by
	ativo_sn,nome;
    
update aluno set nome = 'Rosa' where nome = 'Maria';

select 
	ativo_sn, round(avg(valor_pago_curso), 2) as media_por_agrupamento 
from 
	aluno
group by
	ativo_sn;
    
select 
	sexo, floor(avg(idade)) as media_idade_por_sexo 
from 
	aluno
group by
	sexo;
    
select 
	sexo, 
    min(idade) as menor_idade_do_agrupamento,
    max(idade) as maior_idade_do_agrupamento
from 
	aluno
group by
	sexo;
    
select 
	estado, count(*) as total_por_estado
from 
	endereco
group by
	estado;
    
select 
	tipo, count(*) as total_por_tipo
from 
	telefone
group by
	tipo;