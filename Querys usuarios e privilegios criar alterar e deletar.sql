/* usuários e privilégios */
select * from mysql.user;
select * from mysql.db;
select * from mysql.tables_priv;
select * from mysql.columns_priv;
select * from mysql.procs_priv;

/* criando usuário para o bd */
create user joao@'localhost' identified by '1234';

create user maria@'222.222.222.222' identified by '1234';

create user jose@'%' identified by '1234';

create user joao@'111.111.111.111' identified by '1234';

select * from mysql.user;

/* alterando (dando) privilégios para usuários */
grant SELECT on universidade_u.aluno to joao@'localhost';
grant INSERT on universidade_u.aluno to joao@'localhost';
grant UPDATE, DELETE, ALTER, DROP, CREATE on universidade_u.aluno to joao@'localhost';

/* revogando permissões para usuários */
revoke drop, delete on universidade_u.aluno from joao@'localhost';

show grants for joao@'localhost';

/* alterando senhas */
/* 1º - senha antiga = 1234 */
set password for joao@'localhost' = '4321';
/* 2º - senha antiga = 4321 */
alter user joao@'localhost' identified by 'abcd';

/* removendo usuários */
select * from mysql.user;
drop user joao@'llocalhost';
drop user joao@'111.111.111.111';
drop user maria@'222.222.222.222';
