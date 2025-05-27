-- 1. Selecione todos os clientes do banco de dados VendasEd.
select * from Cliente
-- 2. Selecione todos os clientes da cidade de Votorantim.
select * from Cliente where cidade = 'Votorantim'
-- 3. Mostre todos os clientes do sexo masculino da cidade de sorocaba.
select * from Cliente where sexo = 'M' and cidade = 'Sorocaba'
-- 4. Mostre todos os clientes do sexo feminino que n o possui e-mail cadastrado. 
select * from Cliente where sexo = 'F' and (email is null or email = '')
-- 5. Mostre o nome, rg, cpf e o telefone de todos os clientes que n o possui 
telefone cadastrado.
select nome, rg, cpf, telefone
from Cliente
where telefone is null or telefone = ''
-- 6. Mostre a quantidade de clientes mulheres cadastradas no sistema.
select count(*) as quantidade_mulheres
from Cliente
where sexo = 'F'
-- 7. Mostre o nome dos clientes em ordem alfab tica. 
select nome
from Cliente
order by nome
-- 8. Mostre o nome, telefone, email e endere o de todos os clientes que moram na 
rua Orlando Alvagenga do sexo feminino.
select nome, telefone, email, endereco
from cliente
where endereco like '%Orlando Alvagenga%' and sexo = 'F'
-- 9. Mostre o maior cod_cliente cadastrado.
select max(cod_cliente) as maior_codigo
from Cliente
-- 10. Mostre o menor cod_cliente cadastrado.
select min(cod_cliente) as menor_codigo
from Cliente
-- 11. Mostre o nome da cidade e a quantidade de clientes de cada cidade
cadastrada.
select cidade, COUNT(*) as quantidade
from Cliente
group by cidade
-- 12. Mostre a quantidade de clientes por cidade, sexo e estado, desconsiderando
valores nulos com o nome da cidade em ordem alfab tica. 
select cidade, sexo, estado, count(*) as quantidade
from Cliente
where cidade is not null and sexo is not null and estado is not null
group by cidade, sexo, estado
order by cidade