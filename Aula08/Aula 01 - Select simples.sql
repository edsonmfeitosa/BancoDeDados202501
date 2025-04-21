-- DML - Linguagem de Manipulação de Dados
	-- Select (simples | uma tabela)
		-- seleciona colunas específicas
		-- condições de seleção
		-- Curingas do like
		-- trabalhando com Null
		-- ordenação de dados
		-- funções básicas (Count | Sum | Min | Max)
		-- agrupamento
		

-- Quem são os meus clientes
select * -- mostra todas as colunas
from Cliente

-- Qual é o nome, telefone e e-mail de 
-- todos os clientes
select nome, telefone, email
from Cliente

--Quem são os clientes da cidade de Sorocaba
select *
from Cliente
where cidade = 'Sorocaba'

--Quem são os clientes da cidade de Sorocaba
-- do sexo feminino

-- E -> and
-- Ou -> or
-- não -> not

select *
from Cliente
where cidade = 'Sorocaba'
and sexo = 'F'

-- Quem são os clientes do sexo masculino
-- da cidade de Sorocaba ou Votorantim
select * 
from Cliente
where sexo = 'M'
and (cidade = 'Sorocaba'
or cidade = 'Votorantim')

select * 
from Cliente
where sexo = 'M'
and cidade in ('Sorocaba', 'Votorantim')

-- Curingas do like
	-- % (qualquer coisa)

--mostre o nome de todos os clientes
-- que começa com Edson
select nome
from Cliente
where nome like 'Edson%'

--todos os clientes que tenham no nome
-- a palavra Martin

select *
from Cliente
where nome like '%martin%'

-- Segundo curinga do like
	-- _ significa qualquer letra
-- mostre o nome de todos os clientes
-- que a segunda letra é o A
select *
from Cliente
where nome like '_a%'

-- quem são os clientes que cadastraram o
-- e-mail errado
select *
from Cliente
where email not like '_%@_%._%'

-- terceiro curinga do like
	-- [] delimita a letra ou número
-- os telefones estão no padrão correto?
select *
from Cliente
where telefone like '([0-9][0-9])[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'

-- mostre os nomes que começam com a letra de A até E
select *
from Cliente
where nome like '[a-e]%'

-- quarto curinga do like
	-- ^ negação
-- mostre os nomes que NÃO começam com a letra de A até E
select *
from Cliente
where nome like '[^a-e]%'

-- SINAIS DE COMPARAÇÃO
	-- = IGUAL
	-- > MAIOR
	-- < MENOR
	-- >= MAIOR OU IGUAL
	-- <= MENOR OU IGUAL
	-- <> DIFERENTE
	-- != DIFERENTE

-- MOSTRE OS CLIENTES QUE NÃO SÃO DA CIDADE DE SOROCABA
select * 
from cliente
where cidade != 'Sorocaba'

--- trabalhando com Null
-- mostre todos os telefones não cadastrados
select nome,telefone
from Cliente
where telefone = ''
or telefone is null

-- ordenação de dados
select * 
from Cliente
order by nome asc --ascendente

select * 
from Cliente
order by nome desc --decrescente

-- ordenar por cidade e nome
select nome, cidade
from Cliente
order by cidade desc, nome asc

-- funções básicas (Count | Sum | Min | Max | AVG)
-- Quantos clientes eu tenho?
select count(*) as qtde
from Cliente

select nome as nomeCompleto from Cliente

select 3 * 4 as resultado

select valor, valor / 2 as resultado 
from Item_Pedido

-- sum
select sum(valor) total
from Item_Pedido

--min
select min(valor)
from Item_Pedido

--max
select max(valor)
from Item_Pedido

select avg(valor) media
from Item_Pedido

-- Agrupamento de dados
-- quantos homens e mulheres eu tenho como clientes?
select sexo, count(*) as qtd
from Cliente
group by sexo

-- quantos clientes do sexo masculino e feminino
-- eu tenho em cada cidade?
select cidade, sexo, count(*) quantidade
from Cliente
group by cidade, sexo
order by cidade