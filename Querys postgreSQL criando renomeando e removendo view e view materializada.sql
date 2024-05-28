/* criando uma visão de estoque */
create view estoque.vw_posicao_estoque as
select
	prod.id_produto,
	prod.produto,
	cat.categoria,
	fab.fabricante,
	prod.unidade_medida,
	prod.preco_venda,
	prod.preco_compra,
	estp.qtde_estoque
from
	estoque.tb_estoque_produto as estp
	left join produto.tb_produto as prod on(estp.fk_id_produto = prod.id_produto)
	left join produto.tb_categoria as cat on (prod.fk_id_categoria = cat.id_categoria)
	left join produto.tb_fabricante as fab on (prod.fk_id_fabricante = fab.id_fabricante);

select * from estoque.vw_posicao_estoque_2 where qtde_estoque < 100;

/* removendo a view -> drop view <nome> */
drop view estoque.vw_posicao_estoque;

/* renomear uma view */
alter view estoque.vw_posicao_estoque_2 rename to vw_posicao_estoque;

/* view materializada */
create materialized view produto.vwm_produto as
select
	prod.produto,
	cat.categoria,
	fab.fabricante
from
	produto.tb_produto as prod
	left join produto.tb_categoria as cat on (prod.fk_id_categoria = cat.id_categoria)
	left join produto.tb_fabricante as fab on (prod.fk_id_fabricante = fab.id_fabricante)
with no data;

select * from produto.vwm_produto;
refresh materialized view produto.vwm_produto; /* todo dia de madrugada */

/* renomeando view materializada */
alter materialized view produto.vwm rename to vwm_produto;

/* removendo view materializada */
drop materialized view produto.vwm_produto;