--SQL intermediário
	-- Tipos de Join
	-- Subselect
	-- Teoria dos Conjuntos

--mostre todos os clientes
-- que realizaram pedidos
select c.* 
from Cliente c inner join
     Pedido p on c.cod_cliente = p.cod_cliente

--mostre todos os clientes
-- que NÃO realizaram pedidos

-- Tipos de Join
	-- Inner join
	-- Left join
	-- rigth join
	-- full join
	-- cross join
select c.* 
from Cliente c left join
     Pedido p on c.cod_cliente = p.cod_cliente
where p.cod_cliente is null

select c.* 
from Cliente c full join
     Pedido p on c.cod_cliente = p.cod_cliente
where p.cod_cliente is null

--Sub-select
select *
from Cliente
where cod_cliente not in
(
	select c.cod_cliente
	from Cliente c inner join
		 Pedido p on c.cod_cliente = p.cod_cliente
)

select *
from Cliente 
where not exists (
	select null
	from Cliente c inner join
		 Pedido p on c.cod_cliente = p.cod_cliente
	where Cliente.cod_cliente = c.cod_cliente
)

-- Teoria dos conjuntos
-- exemplo de União
select cod_vendedor cod,  nome
from Vendedor
union
select cod_cliente cod, nome
from Cliente

-- Exemplo de intersecção
select * 
from Cliente
where cidade in ('Sorocaba', 'Votorantim')
intersect
select *
from Cliente
where sexo = 'F'

-- Exceção
select * from Cliente
except
select c.*
from Cliente c inner join
	 Pedido p on c.cod_cliente = p.cod_cliente
