-- comentário no SQL

-- SQL - Linguagem de Consulta Estruturada
	-- DDL - Ling. Definição de Dados
		-- Create | Drop | Alter
			-- Database | Table
	-- DML - Ling. Manipulação de Dados
		-- Select | Update | Insert | Delete
	-- DCL - Ling. Controle de Dados
		-- Grant | Revoke

--comando para excluir um banco de dados
--drop database transporteJoao

create database transporteJoao
go
use transporteJoao
go
create table veiculo
(
	placa varchar(7) primary key,
	modelo varchar(100) not null,
	ano int null,
	cor varchar(100)
)
go

create table motorista
(
	cod_motorista int identity(1, 1) primary key,
	nome varchar(300) not null,
	email varchar(350) not null,
	telefone varchar(15) not null,
	cnh varchar(200)
)
go
create table passageiro
(
	cod_passageiro int identity(1, 1) primary key,
	nome varchar(150) not null,
	rg varchar(20) null,
	email varchar(30) not null,
	telefone varchar(15) not null
)
go
create table manutencao 
(
	cod_manutencao int identity(1,1) 
		not null primary key,
	valor numeric(10,2) not null,
	nome varchar(200) not null,
	placa varchar(7) not null 
		references veiculo(placa)
)
go
create table viagem
(
	cod_viagem int identity(1,1) primary key,
	rua_origem varchar(100),
	numero_origem varchar(10),
	bairro_origem varchar(200),
	estado_origem varchar(200),
	cep_origem varchar(10),
	rua_destino varchar(100),
	numero_destino varchar(10),
	bairro_destino varchar(200),
	estado_destino varchar(200),
	cep_destino varchar(10),
	valor numeric(10,2) not null,
	data_saida datetime not null,
	data_retorno datetime,
	cod_motorista int not null 
		references motorista (cod_motorista),
	placa varchar(7) not null
		references veiculo (placa)
)
go

create table carga
(
	cod_carga int identity(1,1) primary key,
	nome varchar(50) not null,
	quantidadee int not null,
	cod_viagem int not null
		references viagem (cod_viagem)
)
go

create table passageiro_viagem
(
	cod_viagem int not null 
		references viagem (cod_viagem),
	cod_passageiro int not null
		references passageiro (cod_passageiro),
	primary key (cod_viagem, cod_passageiro)
)
