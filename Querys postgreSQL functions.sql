/* function, sem retorno (void), linguagem sql */
create function produto.func_teste_void_sql() returns void as $$
insert into produto.tb_categoria(categoria)values('Mercearia');
$$ language sql;

select * from produto.tb_categoria;
select produto.func_teste_void_sql();

/* function, sem retorno (void), linguagem plpgsql, com parâmetro */
create function produto.func_teste_void_plpgsql(p_categoria varchar(30)) returns void as $$
begin
	insert into produto.tb_categoria(categoria)values(p_categoria);
end
$$ language plpgsql;

select * from produto.tb_categoria;
select produto.func_teste_void_plpgsql('Limpeza');
select produto.func_teste_void_plpgsql('Higiene e Perfumaria');

/* function, com retorno, linguagem plpgsql, sem parâmetros */
create function produto.func_teste_return_plpgsql() returns int as $$
declare
	v_total int;
begin
	select count(*) into v_total from produto.tb_categoria;
	return v_total;
end
$$ language plpgsql;

select produto.func_teste_return_plpgsql();