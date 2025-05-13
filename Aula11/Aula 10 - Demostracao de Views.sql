-- Aula sobre criação de Views

-- quais as datas que o cliente fez o pedido
-- cod_cli | nome | email | cod_pedido
-- cod_vend | data
create view PedidosCliente 
as
select c.cod_cliente, c.nome,
       c.email, p.cod_pedido, cod_vendedor,
	   data
from cliente c inner join
	 Pedido p on c.cod_cliente = p.cod_cliente

--utilizando a View
select * from PedidosCliente

-- View pode ser usada junto na consulta
-- Quem atendeu o cliente Victor Gabriel
select distinct v.* 
from PedidosCliente pc inner join
	Vendedor v on pc.cod_vendedor = v.cod_vendedor
where pc.nome = 'victor gabriel'

--alteração da View
-- Precisa colocar o cod_condicao_pagto e 
-- nome_condicao_pagto
sp_helptext PedidosCliente

alter view PedidosCliente   
as  
select c.cod_cliente, c.nome,  
       c.email, p.cod_pedido, cod_vendedor,  
    data, p.cod_condicao_pagto, cp.descricao
from cliente c inner join  
  Pedido p on c.cod_cliente = p.cod_cliente inner join
  Condicao_Pagamento cp on p.cod_condicao_pagto = 
						cp.cod_condicao_pagto

-- Exemplo de View usando uma view internamente						
-- Crie uma view da quantidade de produtos por pedido
create view ProdutosQuantidade as
select pr.cod_produto, pc.cod_pedido, 
		it.quantidade, pr.nome
from PedidosCliente pc inner join
Item_Pedido it on pc.cod_pedido = it.cod_pedido inner join
Produto pr on it.cod_produto = pr.cod_produto

select * from ProdutosQuantidade


	 