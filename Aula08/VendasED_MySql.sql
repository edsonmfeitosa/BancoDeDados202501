-- Criação do banco de dados
CREATE DATABASE VendasED;
USE VendasED;

-- Tabela Cliente
CREATE TABLE Cliente (
    cod_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NULL,
    rg VARCHAR(10) NULL,
    cpf VARCHAR(15) NOT NULL,
    email VARCHAR(50) NULL,
    sexo CHAR(1),
    endereco VARCHAR(50),
    bairro VARCHAR(30),
    cidade VARCHAR(30),
    estado CHAR(2)
);

-- Tabela Pedido
CREATE TABLE Pedido (
    cod_pedido INT AUTO_INCREMENT PRIMARY KEY,
    cod_cliente INT NOT NULL,
    cod_vendedor INT NOT NULL,
    cod_condicao_pagto INT NOT NULL,
    data DATETIME NOT NULL
);

-- Tabela Item_Pedido
CREATE TABLE Item_Pedido (
    cod_pedido INT NOT NULL,
    cod_produto INT NOT NULL,
    quantidade INT,
    valor DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (cod_pedido, cod_produto)
);

-- Tabela Vendedor
CREATE TABLE Vendedor (
    cod_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    telefone VARCHAR(15) NULL,
    rg VARCHAR(10) NULL,
    cpf VARCHAR(15) NOT NULL,
    email VARCHAR(50) NULL,
    sexo CHAR(1)
);

-- Tabela Condicao_Pagamento
CREATE TABLE Condicao_Pagamento (
    cod_condicao_pagto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    descricao VARCHAR(300)
);

-- Tabela Marca
CREATE TABLE Marca (
    cod_marca INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- Tabela Produto
CREATE TABLE Produto (
    cod_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(300),
    cod_marca INT,
    FOREIGN KEY (cod_marca) REFERENCES Marca(cod_marca)
);

-- Tabela Produto_Fornecedor
CREATE TABLE Produto_Fornecedor (
    cod_produto_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    cod_produto INT NOT NULL,
    cod_fornecedor INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

-- Tabela Item_Compra
CREATE TABLE Item_Compra (
    cod_item_compra INT AUTO_INCREMENT PRIMARY KEY,
    cod_compra INT NOT NULL,
    cod_produto INT NOT NULL,
    quantidade INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

-- Tabela Fornecedor
CREATE TABLE Fornecedor (
    cod_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(15) NULL,
    nome VARCHAR(30) NULL,
    telefone VARCHAR(15) NOT NULL,
    cnpj VARCHAR(30) NULL,
    razao VARCHAR(50) NULL
);

-- Tabela Compra
CREATE TABLE Compra (
    cod_compra INT AUTO_INCREMENT PRIMARY KEY,
    cod_fornecedor INT NOT NULL,
    cod_condicao_pagto INT NOT NULL,
    data DATETIME NOT NULL
);

-- Relacionamentos
ALTER TABLE Pedido 
    ADD CONSTRAINT fk_pedido_cliente FOREIGN KEY (cod_cliente) REFERENCES Cliente(cod_cliente),
    ADD CONSTRAINT fk_pedido_condicao_pagto FOREIGN KEY (cod_condicao_pagto) REFERENCES Condicao_Pagamento(cod_condicao_pagto),
    ADD CONSTRAINT fk_pedido_vendedor FOREIGN KEY (cod_vendedor) REFERENCES Vendedor(cod_vendedor);

ALTER TABLE Item_Pedido 
    ADD CONSTRAINT fk_item_pedido_pedido FOREIGN KEY (cod_pedido) REFERENCES Pedido(cod_pedido),
    ADD CONSTRAINT fk_item_pedido_produto FOREIGN KEY (cod_produto) REFERENCES Produto(cod_produto);

ALTER TABLE Produto_Fornecedor 
    ADD CONSTRAINT fk_produto_fornecedor_produto FOREIGN KEY (cod_produto) REFERENCES Produto(cod_produto),
    ADD CONSTRAINT fk_produto_fornecedor_fornecedor FOREIGN KEY (cod_fornecedor) REFERENCES Fornecedor(cod_fornecedor);

ALTER TABLE Item_Compra 
    ADD CONSTRAINT fk_item_compra_produto FOREIGN KEY (cod_produto) REFERENCES Produto(cod_produto),
    ADD CONSTRAINT fk_item_compra_compra FOREIGN KEY (cod_compra) REFERENCES Compra(cod_compra);

ALTER TABLE Compra 
    ADD CONSTRAINT fk_compra_condicao_pagto FOREIGN KEY (cod_condicao_pagto) REFERENCES Condicao_Pagamento(cod_condicao_pagto),
    ADD CONSTRAINT fk_compra_fornecedor FOREIGN KEY (cod_fornecedor) REFERENCES Fornecedor(cod_fornecedor);

-- Inserção de dados
INSERT INTO Cliente (nome, telefone, rg, cpf, email, sexo, endereco, bairro, cidade, estado) VALUES
('edson martin feitosa', '(15)1234-5678', '12234565', '222.222.333-50', 'edsonfeitosa@ig.com.br', 'M', 'Rua Orlando Alvagenga, 1', 'Jd. Vera Cruz', 'Sorocaba', 'SP'),
('rafael moreno', '(15)0000-0000', NULL, '222.622.332-50', 'rafael@terra.com.br', 'M', 'Rua Mario Quintana, 123', 'Jd. Vera Cruz', 'São Roque', 'SP'),
('daniela martin feitosa', NULL, NULL, '222.622.332-50', NULL, 'F', 'Rua Guilherme Oliveira, 12', 'Jd. Vera das Acássicas', 'Votorantim', 'SP'),
('renata cristina scudeler', '(15)0001-0300', '246886', '111.622.332-50', 'renatacristina@uol.com', 'F', 'Rua Orlando Alvagenga, 1', 'Jd. Vera Cruz', 'Sorocaba', 'SP');

-- Continue a inserção conforme necessário...
