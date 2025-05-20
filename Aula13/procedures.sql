-- Programação em bd
	-- Storage Procedures

--variáveis
declare @nome varchar(10)
set @nome = 'Edson'
print(@nome)
select @nome as nome

declare @numero int
set @numero = 9
print(@numero)

if @numero < 10
begin
	print('O número é menor que 10')
end
else
begin 
	print('O número é maior ou igual a 10')
end

create procedure comparaNumero
(
	@numero int
) as
if @numero < 10
begin
	print('O número é menor que 10')
end
else
begin 
	print('O número é maior ou igual a 10')
end

comparaNumero 5

--calcular uma tabuada
alter procedure tabuada
(
	@numero int
) as
declare @cont int = 1
while @cont <= 10
begin
	print(cast(@numero as varchar) + ' X ' +
		  cast(@cont as varchar) + ' = ' +
		  cast((@numero * @cont) as varchar))
	set @cont = @cont + 1
end

tabuada 202