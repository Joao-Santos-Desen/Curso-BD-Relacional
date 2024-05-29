/* configuração do postgre - arquivos de configuração */
select * from pg_settings;
select distinct(context) from pg_settings;
select pg_show_all_settings();

select * from pg_settings where name in('config_file', 'hba_file');

/* arquivo de configuração - postgresql.conf */
select * from pg_settings where name in('port', 'max_connections', 'shared_buffers');
/*
max_connections = 100
port = 5432
shared_buffers = 16384
*/

/* criando, atualizando e removendo usuários */
create role jorge login password 'abcd1234';
create role maria login password '1234' valid until '2024-05-29 18:50:15';
create role joao login password 'abcd' valid until '2024-12-31' createdb createrole;
create role gustavo login password '1234' superuser;

--remover role
drop role joao;

--atualizar role
alter role maria rename to mariana;
alter role joao with password 'asdf';
alter role gustavo valid until '2024-05-29 19:30';
alter role mariana valid until 'infinity';
alter role joao nocreatedb nocreaterole;
alter role gustavo nosuperuser;
alter role jorge superuser;

--listando usuários do banco de dados
select * from pg_catalog.pg_roles;
select * from pg_catalog.pg_roles where rolcanlogin = true;
select * from pg_catalog.pg_user;