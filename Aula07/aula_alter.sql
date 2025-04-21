-- DDL
	-- Alter | Drop
-- Alterar a tabela para:
	-- inserir novos campos
	-- alterar os campos existentes
	-- excluir campos
--Alterar o nome:
	-- campo
	-- tabela
	-- Banco de dados
--Drop
	-- Table
	-- Database

-- Alterar a tabela de manutenção colocando o
-- campo descrição
alter table manutencao 
	add descricao varchar(max) not null

-- Alterar a tabela passageiro, onde a coluna
-- telefone deve aceitar 20 caracteres e o 
--campo aceita nulo
alter table passageiro 
	alter column telefone varchar(20) null

-- Excluir a coluna cnh da tabela de motorista
alter table motorista drop column cnh

-- alterar o nome de um campo
 -- tabela carga alterar o nome de 
 -- quantidadee para qtde
 sp_rename 'carga.quantidadee', 'qtde'

 --alterar o nome de uma tabela
 -- passageiro_viagem para viagem_passageiro
 sp_rename 'passageiro_viagem', 'viagem_passageiro'

 --alterar o nome do banco de dados
 -- de transporteJoao para transporteVans
 use master
 alter database transporteJoao
	modify name = transporteVans
use transporteVans

-- Comando Drop
drop table manuntencao

use master
drop database transporteVans