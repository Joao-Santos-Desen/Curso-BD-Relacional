/* estados com mais alunos - alunos por estado */
select 
	estado, count(*) as total
from 
	endereco
group by
	estado
order by 
	total desc
limit 3;


/* cursos mais vendidos - alunos por curso */
select 
	fk_idcurso, count(*) as total
from 
	aluno_curso
group by
	fk_idcurso
    
create table gasto(
	idgasto int primary key auto_increment,
    ano int not null,
    tipo enum('previsto', 'realizado') not null,
    jan float(10, 2),
    fev float(10, 2),
    mar float(10, 2),
    abr float(10, 2),
    mai float(10, 2),
    jun float(10, 2),
    jul float(10, 2),
    ago float(10, 2),
    `set` float(10, 2),
    `out` float(10, 2),
    nov float(10, 2),
    dez float(10, 2)
);

select * from gasto;

/* soma */
select (144 + 257) as total;

/* subtração */
select (144 - 257) as total;

/* multiplicação */
select (144 * 257) as total;

/* divisão */
select (144 / 257) as total;

select * from gasto;

insert into gasto(ano, tipo, jan, fev, mar, abr, mai, jun, jul, ago, `set`, `out`, nov, dez)
values('2019', 'previsto', 18000, 17000, 19000, 20000, 17000, 18000, 18500, 18500, 1800, 17500, 18000, 17000);
insert into gasto(ano, tipo, jan)values('2019', 'realizado', 18353.20);
update gasto set fev = 17555.55 where idgasto = 2;
update gasto set mar = 19435.73 where idgasto = 2;
update gasto set abr = 22753.12 where idgasto = 2;
update gasto set mai = 16198.12 where idgasto = 2;
update gasto set jun = 17451.88 where idgasto = 2;
update gasto set jul = 18975.40 where idgasto = 2;
update gasto set ago = 19163.84 where idgasto = 2;
update gasto set `set` = 18132.56 where idgasto = 2;
update gasto set `out` = 17667.91 where idgasto = 2;
update gasto set nov = 17936.33 where idgasto = 2;
update gasto set dez = 17125.88 where idgasto = 2;

select
	truncate(((jan + fev + mar + abr + mai + jun + jul + ago + `set` + `out` + nov + dez) / 12), 2) as media
from
	gasto
where
	idgasto = 2;
    
select * from gasto;

select idgasto from gasto where ano = 2019 and tipo = 'realizado';
select idgasto from gasto where ano = 2019 and tipo = 'previsto';

select
	(select jan from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'previsto')) -
	(select jan from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'realizado')) as resultado_jan,
    
    (select fev from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'previsto')) -
	(select fev from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'realizado')) as resultado_fev,
    
    (select mar from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'previsto')) -
	(select mar from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'realizado')) as resultado_mar,
    
    (select abr from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'previsto')) -
	(select abr from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'realizado')) as resultado_abr,
    
    (select mai from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'previsto')) -
	(select mai from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'realizado')) as resultado_mai,
    
    (select jun from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'previsto')) -
	(select jun from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'realizado')) as resultado_jun,
    
    (select jul from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'previsto')) -
	(select jul from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'realizado')) as resultado_jul,
    
    (select ago from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'previsto')) -
	(select ago from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'realizado')) as resultado_ago,
    
    (select `set` from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'previsto')) -
	(select `set` from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'realizado')) as resultado_set,
    
    (select `out` from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'previsto')) -
	(select `out` from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'realizado')) as resultado_out,
    
    (select nov from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'previsto')) -
	(select nov from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'realizado')) as resultado_nov,
    
    (select dez from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'previsto')) -
	(select dez from gasto where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'realizado')) as resultado_dez;
   
