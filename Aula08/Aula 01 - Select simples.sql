-- DML - Linguagem de Manipula��o de Dados
	-- Select (simples | uma tabela)
		-- seleciona colunas espec�ficas
		-- condi��es de sele��o
		-- Curingas do like
		-- trabalhando com Null
		-- ordena��o de dados
		-- fun��es b�sicas (Count | Sum | Min | Max)
		-- agrupamento
		

-- Quem s�o os meus clientes
select * -- mostra todas as colunas
from Cliente

-- Qual � o nome, telefone e e-mail de 
-- todos os clientes
select nome, telefone, email
from Cliente

--Quem s�o os clientes da cidade de Sorocaba
select *
from Cliente
where cidade = 'Sorocaba'

--Quem s�o os clientes da cidade de Sorocaba
-- do sexo feminino

-- E -> and
-- Ou -> or
-- n�o -> not

select *
from Cliente
where cidade = 'Sorocaba'
and sexo = 'F'

-- Quem s�o os clientes do sexo masculino
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
-- que come�a com Edson
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
-- que a segunda letra � o A
select *
from Cliente
where nome like '_a%'

-- quem s�o os clientes que cadastraram o
-- e-mail errado
select *
from Cliente
where email not like '_%@_%._%'

-- terceiro curinga do like
	-- [] delimita a letra ou n�mero
-- os telefones est�o no padr�o correto?
select *
from Cliente
where telefone like '([0-9][0-9])[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'

-- mostre os nomes que come�am com a letra de A at� E
select *
from Cliente
where nome like '[a-e]%'

-- quarto curinga do like
	-- ^ nega��o
-- mostre os nomes que N�O come�am com a letra de A at� E
select *
from Cliente
where nome like '[^a-e]%'

-- SINAIS DE COMPARA��O
	-- = IGUAL
	-- > MAIOR
	-- < MENOR
	-- >= MAIOR OU IGUAL
	-- <= MENOR OU IGUAL
	-- <> DIFERENTE
	-- != DIFERENTE

-- MOSTRE OS CLIENTES QUE N�O S�O DA CIDADE DE SOROCABA
select * 
from cliente
where cidade != 'Sorocaba'

--- trabalhando com Null
-- mostre todos os telefones n�o cadastrados
select nome,telefone
from Cliente
where telefone = ''
or telefone is null

-- ordena��o de dados
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

-- fun��es b�sicas (Count | Sum | Min | Max | AVG)
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