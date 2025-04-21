--1. Selecione todos os clientes do banco de dados VendasEd. 
select * 
from Cliente 

--2. Selecione todos os clientes da cidade de Votorantim.
select *
from Cliente
where cidade = 'Votorantim'

--3. Mostre todos os clientes do sexo masculino da cidade de sorocaba.
select *
from Cliente
where cidade = 'Sorocaba'
and sexo = 'M'

--4. Mostre todos os clientes do sexo feminino que n�o possui e-mail cadastrado.
select * 
from Cliente
where sexo = 'F'
and email = ''
or email is null

--5. Mostre o nome, rg, cpf e o telefone de todos os clientes que n�o possui telefone cadastrado.
select nome, rg, cpf, telefone
from Cliente
where telefone not like '([0-9][0-9])[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'

--6. Mostre a quantidade de clientes mulheres cadastradas no sistema. 
select sexo, count(*) as qtde 
from Cliente
where sexo = 'M'
group by sexo


--7. Mostre o nome dos clientes em ordem alfab�tica
select nome
from Cliente
order by nome asc 

--8. Mostre o nome, telefone, email e endere�o de todos os clientes que moram na rua Orlando Alvagenga do sexo feminino
select nome, telefone, email, endereco
from Cliente
where sexo = 'F'
and endereco like '%Orlando Alvagenga%'

--9. Mostre o maior cod_cliente cadastrado
select min(cod_cliente) as codigo
from Cliente
group by cod_cliente 

--10. Mostre o menor cod_cliente cadastrado
select MIN(cod_cliente) AS menor_cod_cliente
from Cliente;

--11. Mostre o nome da cidade e a quantidade de clientes de cada cidade cadastrada
select cidade, COUNT(*) AS quantidade_clientes
from Cliente
group by cidade;

--12. Mostre a quantidade de clientes por cidade, sexo e estado, desconsiderando valores nulos com o nome da cidade em ordem alfab�tica
select cidade, sexo, estado, COUNT(*) AS quantidade_clientes
from Cliente
where cidade IS NOT NULL AND sexo IS NOT NULL AND estado IS NOT NULL
group by cidade, sexo, estado
order by cidade asc;

