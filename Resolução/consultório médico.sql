CREATE DATABASE ConsultorioMedico
GO

USE ConsultorioMedico
GO

CREATE TABLE Paciente (
    cod_paciente INT NOT NULL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    CPF VARCHAR(11) NOT NULL,
    RG VARCHAR(9) NOT NULL
)

GO
CREATE TABLE Medico (
    CRM VARCHAR(10) NOT NULL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    CPF VARCHAR(11) NOT NULL,
    email VARCHAR(100),
    RG VARCHAR(9) NOT NULL
)

GO
CREATE TABLE Especialidade (
    cod_especialidade INT NOT NULL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
)

GO
CREATE TABLE Medico_Especialidade (
    CRM VARCHAR(10) NOT NULL REFERENCES Medico(CRM),
    cod_especialidade INT NOT NULL REFERENCES Especialidade(cod_especialidade),
    PRIMARY KEY (CRM, cod_especialidade)
)

GO
CREATE TABLE Consulta (
    cod_consulta INT NOT NULL PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    cod_paciente INT NOT NULL REFERENCES Paciente(cod_paciente),
    CRM VARCHAR(10) NOT NULL REFERENCES Medico(CRM)
)

GO
CREATE TABLE Exame (
    cod_exame INT NOT NULL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    resultado TEXT,
    cod_paciente INT NOT NULL REFERENCES Paciente(cod_paciente)
)
