-- Correção de exercícios
--Selecione os itens de compra da empresa cuja razão social chama-se “BlaBla Ltda” e a
--condição de pagamento foi realizada com pagamento em cheque, deve-se acrescentar
--um campo a mais na consulta que tem o valor dos itens da compra com um desconto de
--R$0,10 e esse novo campo deve-se chamar desconto

select ic.* , ic.valor - 0.10 as desconto
from Item_Compra ic inner join
	 Compra c on ic.cod_compra = c.cod_compra inner join
	 Fornecedor f on c.cod_fornecedor = f.cod_fornecedor inner join
	 Condicao_Pagamento cp on cp.cod_condicao_pagto = c.cod_condicao_pagto
where f.razao = 'BlaBla Ltda'
and cp.nome = 'cheque'

select * 
from Fornecedor