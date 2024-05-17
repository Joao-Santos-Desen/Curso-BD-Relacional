show global variables where variable_name = 'datadir';

/* criando dumps via prompt */
/*
C:\Users\Administrador>cd C:\Program Files\MySQL\MySQL Server 8.0\bin

C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump -u root -p --port=3307 --no-data universidade_u > c:\mysql_dados\dump1.sql
Enter password: *********

C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump -u root -p --port=3307 --no-create-info universidade_u > c:\mysql_dados\dump2.sql
Enter password: *********

C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump -u root -p --port=3307 universidade_u > c:\mysql_dados\dump3.sql
Enter password: *********

C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump -u root -p --port=3307 --no-data --all-databases > c:\mysql_dados\dump4.sql
Enter password: *********

C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump -u root -p --port=3307 universidade_u > c:\mysql_dados\dump_universidade_u.sql
Enter password: *********
*/

/* importando dump via prompt */
drop database universidade_u;

create database universidade_u;
/*
C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql -u root -p --port=3307 universidade_u < c:\mysql_dados\dump_universidade_u.sql
Enter password: *********
*/
use universidade_u;
show tables;

select * from aluno;

