
show global status where variable_name in('uptime', 'bytes_received', 'bytes_sent');
show local status where variable_name in('uptime', 'bytes_received', 'bytes_sent');

show global variables where variable_name = 'datadir';
show databases;

set global datadir = 'C:/mysql_dados/Data/';

select * from aluno;

show databases;

use mysql;

show tables;

/* permissões de usuários */
select * from user;

/* estatísticas das tabelas do bd */
select * from innodb_table_stats;
select count(*) from universidade_u.aluno;

/* logs */
select * from slow_log;
select * from general_log;

/* ajuda */
select * from help_topic where name like 'JOIN%';