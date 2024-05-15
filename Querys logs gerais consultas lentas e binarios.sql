/* --------- logs gerais ------------ */
show global variables where variable_name='general_log_file'; /* LAPTOP-5L0LBFI0.log */
/* global read only */

show global variables where variable_name='datadir'; /* C:\mysql_dados\Data\ */
/* global read only */

show global variables where variable_name='general_log'; /* OFF = desativado / ON = ativado */
/* global dinâmica */

set @@global.general_log = 'OFF';

select * from universidade_u.aluno;

use performance_schema;

/* --------- logs de consultas lentas ------------ */
show global variables where variable_name='slow_query_log_file'; /* LAPTOP-5L0LBFI0-slow.log */
/* global read only */

show global variables where variable_name='datadir'; /* C:\mysql_dados\Data\ */
/* global read only */

show global variables where variable_name='slow_query_log'; /* OFF = desativado / ON = ativado */
/* global dinâmica */

show global variables where variable_name='long_query_time'; /* segundos */
/* global dinâmica */

set global long_query_time = 4;

select sleep(5), 'Query muito lenta!!!';

/* --------- logs binários ------------ */
/*
1 - backup
2 - querys que afetaram registros no banco de dados
3 - querys que afetaram registros no banco de dados
4 - querys que afetaram registros no banco de dados
5 - querys que afetaram registros no banco de dados
6 - bd restaurado com base no bkp do dia 1
*/
show global variables where variable_name='log_bin_basename'; /* C:\mysql_dados\Data\LAPTOP-5L0LBFI0-bin */
/* global read only */

show global variables where variable_name='log_bin'; /* ON | OFF */
/* global dinâmica */

/* banco de dados é iniciado */
/* bytes */
show global variables where variable_name='max_binlog_size'; /* bytes */
/* global dinâmica */
select ((1073741824 / 1024) / 1024) / 1024;

show global variables where variable_name='binlog_expire_logs_seconds'; /* segundos */
/* global dinâmica */
select (((2592000 / 60) / 60) /24);

show binary logs;