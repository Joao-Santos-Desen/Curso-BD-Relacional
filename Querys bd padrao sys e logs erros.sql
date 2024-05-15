show databases;

use sys;

show tables;

select * from information_schema.tables where table_schema = 'sys';

select * from host_summary_by_statement_latency;
select * from memory_global_total;

/* ---- logs erros ---- */

show global variables where variable_name='log_error'; /* .\LAPTOP-5L0LBFI0.err */
/* global read only */

show global variables where variable_name='datadir'; /* C:\mysql_dados\Data\ */
/* global read only */

show global variables where variable_name='log_error_verbosity';
/* global dinâmica */
SET GLOBAL log_error_verbosity = 3;

/* 
	---- valores de log_error_verbosity ----
1 -> registrar apenas os logs de erros
2 -> registrar os logs de erros e os logs de avisos (alertas)
3 -> registrar os logs de erros, avisos (alertas) e notas (informações)
*/
