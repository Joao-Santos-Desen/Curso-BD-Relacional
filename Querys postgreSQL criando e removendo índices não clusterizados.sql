/* criando índices não clusterizados */
select * from cliente.tb_cliente where nome = 'Dalton';
/* 0.134 */
/* 
0.041 (scan no indice) 
0.046
*/
create index idx_cliente_nome on cliente.tb_cliente using btree(nome);

select * from cliente.tb_cliente where email = 'cursus.diam@consectetuer.co.uk';

create index idx_cliente_email on cliente.tb_cliente using btree(email);

/* removendo índices */
drop index cliente.idx_cliente_email;