-- DML
	-- Select simples (Join)
	-- Insert
	-- Update
	-- Delete

Select *
from Cliente, Pedido
where Cliente.cod_cliente = Pedido.cod_cliente

Select *
from Cliente c, Pedido p
where c.cod_cliente = p.cod_cliente

select *
from Cliente c inner join 
	 Pedido p on c.cod_cliente = p.cod_cliente

-- Quando o cliente Edson realizou os seus pedidos?
select data
from Cliente c inner join 
	 Pedido p on c.cod_cliente = p.cod_cliente
where nome like 'Edson%'

-- Quem são os clientes atendidos pelo Joãozinho,
-- e quando ele atendeu?
select c.*, p.data as dataAtendimento
from Cliente c, Pedido p, Vendedor v
where c.cod_cliente = p.cod_cliente
and p.cod_vendedor = v.cod_vendedor
and v.nome = 'Joãozinho'

select c.*, p.data as dataAtendimento
from Cliente c inner join
	 Pedido p on c.cod_cliente = p.cod_cliente inner join
	 Vendedor v on v.cod_vendedor = p.cod_vendedor
where v.nome = 'Joãozinho'

-- quais os produtos comprados pelo cliente de cod: 1
select c.nome, pr.*
from Cliente c inner join
	Pedido p on c.cod_cliente = p.cod_cliente inner join
	Item_Pedido it on p.cod_pedido = it.cod_pedido inner join
	Produto pr on it.cod_produto = pr.cod_produto
where c.cod_cliente = 1

-- quanto o Edson Martin Feitosa gastou em compras?
select sum(it.quantidade * it.valor) as total 
from Cliente c inner join
	 Pedido p on c.cod_cliente = p.cod_cliente inner join
	 Item_Pedido it on p.cod_pedido = it.cod_pedido
where c.nome = 'Edson Martin Feitosa'

-- quanto cada cliente gastou?
select c.nome, sum(it.quantidade * it.valor) as total 
from Cliente c inner join
	 Pedido p on c.cod_cliente = p.cod_cliente inner join
	 Item_Pedido it on p.cod_pedido = it.cod_pedido
group by c.nome

-- Insert
 -- insert into <<tabela>> values (<<valores>>)
 -- insert into <<tabela>> (<<colunas>>) values (<<valores>>)
 select * from condicao_pagamento

 select * from Condicao_Pagamento
 --inserir a condição de pagamento via pix
 select max(cod_condicao_pagto) + 1 from Condicao_Pagamento

 insert into Condicao_Pagamento 
	values ('PIX', 'pagamento via pix')

insert into Cliente values
('Vinícius Henrique', null, null,
'444.5556', null, null, null, null, null, 
null)

 -- insert into <<tabela>> (<<colunas>>) values (<<valores>>)
 insert into Cliente (cpf, nome, email) values
 ('77895.65', 'Geralda', 'geralda@gmail.com')

 -- Update
 -- update <<tabela>> set <<campo>> = <<valor>>
 -- <<condições>>
update Cliente set 
	email = 'daniela@gmail.com'

select * from Cliente

update Cliente set
	email = 'daniela@gmail.com'
where cod_cliente = 3

-- atualizar o registro do Vinícius
update Cliente set
	telefone = '(15) 666885',
	rg = '22334',
	email = 'vini@hotmail.com'
where nome = 'Vinícius Henrique'

-- Delete
-- delete from <<tabela>> <<condições>>
select * from Condicao_Pagamento

select * 
-- delete
from Condicao_Pagamento
where cod_condicao_pagto in (5, 6)

select * from Cliente