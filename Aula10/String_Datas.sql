-- DML
	-- Trabalhar com string
		-- charindex, substring, replace
		-- reverse
	-- Trabalhar com Datas
		-- getdate, Year, Month, Day, datediff
	-- SQL intermediário

-- Trabalhar com string
--Charindex - encontra a posição do caracter
select nome, CHARINDEX('n', nome) as posicao
from Cliente

--substring - pega pedaço do texto
select nome, SUBSTRING(nome, 0, 6)
from Cliente

-- reverse
select nome, REVERSE(nome)
from Cliente

--replace - troca um texto
select nome, REPLACE(nome, 'martin', 'legal')
from Cliente

select cpf, replace(replace(cpf, '.', ''), '-', '')
from Cliente

update Cliente set
	cpf = replace(replace(cpf, '.', ''), '-', '')

-- alterar todos os e-mail para o padrão 
-- <primeiro_nome>.<ultimo_nome>@facens.br
select nome, charindex(' ', nome) posicaoEspaco,
substring(nome, 1, charindex(' ', nome) -1) primeiroNome
,reverse(nome) nomeInvertido,
charindex(' ', reverse(nome)) posicaoEspadoNomeInvertido,
substring(reverse(nome), 1, charindex(' ', reverse(nome)) -1)
as primeiroNomeInvertido,
reverse(substring(reverse(nome), 1, charindex(' ', reverse(nome)) -1))
as sobrenome,
substring(nome, 1, charindex(' ', nome) -1) + '.' +
reverse(substring(reverse(nome), 1, charindex(' ', reverse(nome)) -1)) +
'@facens.br' as emailInstitucional
from Cliente

-- Trabalhar com Datas
-- getdate
select getdate()


-- datediff
select DATEDIFF(SECOND, '1982-11-30 12:00:00.000', getdate())

select data, year(data) ano,
MONTH(data) mes, day(data) dia
from Pedido