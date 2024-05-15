show variables where variable_name = 'max_connections';

/* algumas variáveis são dinâmicas e podem ser modificadas em tempo de execução */
set @@global.max_connections = 250;
set global max_connections = 300;

/* somente leitura */
set global port = 3307;

show global variables;
show session variables;

/*
	auto_increment
*/

show global variables where variable_name like 'auto_increment%';
show session variables where variable_name like 'auto_increment%';
/* auto_increment_increment -> incremento feito a cada novo registro */
/* auto_increment_offset -> valor inicial das colunas que recebem a constraint auto_increment */

/*
	----
*/

/* set @@session.auto_increment_increment = 10; -> utilizado na sessão via prompt */
/* set session auto_increment_offset = 5; -> utilizado na sessão via prompt */

create table t1(
	id int primary key auto_increment,
    msg varchar(200)
);

select * from t1;
insert into t1(msg)value('a');
insert into t1(msg)value('b');

/*
create table t2(
	id int primary key auto_increment,
    msg varchar(200)
);

insert into t2(msg)value('a');
insert into t2(msg)value('b');
*/