--10.	Quantos produtos a empresa possui atualmente 
--em estoque, para casos de estoque negativo deve ser 
--mostrado o valor 0(zero).
create view estoque as
--quanto eu comprei de cada produto
select 
isnull(entrada.cod_produto, saida.cod_produto) cod_produto, 
isnull(entrada.nome, saida.nome) nome,
isnull(entrada.quantidade,0) qtdEntrada,
isnull(saida.quantidade,0) qtdSaida,
isnull(entrada.quantidade,0) - isnull(saida.quantidade,0) total,
iif(isnull(entrada.quantidade,0) - isnull(saida.quantidade,0) < 0, 
0, 
isnull(entrada.quantidade,0) - isnull(saida.quantidade,0)) total_atualizado
from (
select p.cod_produto, p.nome, 
	   sum(ic.quantidade) quantidade 
from Item_Compra ic inner join
	 Produto p on ic.cod_produto = p.cod_produto
group by p.cod_produto, p.nome
) entrada full join
(
--quanto eu vendi de cada produto
select p.cod_produto, p.nome,
	sum(it.quantidade) quantidade
from Item_Pedido it inner join
	 Produto p on p.cod_produto = it.cod_produto
group by p.cod_produto, p.nome
) saida on entrada.cod_produto = saida.cod_produto



select *
from estoque