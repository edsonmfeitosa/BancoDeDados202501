IF OBJECT_ID('vw_produtos_nao_comprados') IS NOT NULL
DROP VIEW vw_produtos_nao_comprados;
GO

-- 1. Quais os produtos não comprados por clientes.
CREATE VIEW vw_produtos_nao_comprados AS
SELECT p.*
FROM Produto p
WHERE NOT EXISTS (
    SELECT 1
    FROM Pedido ped
    JOIN Item_Pedido ip ON ped.cod_pedido = ip.cod_pedido
    WHERE ip.cod_produto = p.cod_produto
);

-- 2. Mostre todos os clientes que não possuem endereço cadastrado.
CREATE VIEW vw_clientes_sem_endereco AS
SELECT * 
FROM Cliente 
WHERE endereco IS NULL OR TRIM(endereco) = '';

-- 3. Mostre a quantidade de pedidos realizados por cada cliente, cuja condição de pagamento seja em dinheiro.
CREATE VIEW vw_qtd_pedidos_dinheiro_por_cliente AS
SELECT c.cod_cliente, c.nome, COUNT(p.cod_pedido) AS quantidade_pedidos
FROM Cliente c
JOIN Pedido p ON c.cod_cliente = p.cod_cliente
JOIN Condicao_Pagamento cp ON p.cod_cond_pagamento = cp.cod_cond_pagamento
WHERE TRIM(cp.forma_pagamento) = 'Dinheiro'
GROUP BY c.cod_cliente, c.nome;

-- 4. Mostre quanto o cliente Edson gastou comprando caneta da marca BIC.
CREATE VIEW vw_gasto_edson_caneta_bic AS
SELECT SUM(ip.quantidade * ip.preco_unitario) AS total_gasto
FROM Cliente c
JOIN Pedido p ON c.cod_cliente = p.cod_cliente
JOIN Item_Pedido ip ON p.cod_pedido = ip.cod_pedido
JOIN Produto pr ON ip.cod_produto = pr.cod_produto
JOIN Marca m ON pr.cod_marca = m.cod_marca
WHERE c.nome = 'Edson'
AND LOWER(pr.nome) LIKE '%caneta%'
AND m.nome = 'BIC';

-- 5. Quantas vendas cada vendedor realizou?
CREATE VIEW vw_vendas_por_vendedor AS
SELECT v.cod_vendedor, v.nome, COUNT(p.cod_pedido) AS total_vendas
FROM Vendedor v
JOIN Pedido p ON v.cod_vendedor = p.cod_vendedor
GROUP BY v.cod_vendedor, v.nome;

-- 6. Mostre o valor total vendido separado por condição de pagamento.
CREATE VIEW vw_total_vendido_por_pagamento AS
SELECT cp.forma_pagamento, SUM(ip.quantidade * ip.preco_unitario) AS total_vendido
FROM Pedido p
JOIN Condicao_Pagamento cp ON p.cod_cond_pagamento = cp.cod_cond_pagamento
JOIN Item_Pedido ip ON p.cod_pedido = ip.cod_pedido
GROUP BY cp.forma_pagamento;

-- 7. Quais as marcas de produtos não fornecidas pelos fornecedores cadastrados.
CREATE VIEW vw_marcas_nao_fornecidas AS
SELECT m.*
FROM Marca m
WHERE NOT EXISTS (
    SELECT 1
    FROM Produto p
    WHERE p.cod_marca = m.cod_marca
    AND p.cod_fornecedor IS NOT NULL
);

-- 8. Quais os produtos que foram comprados por clientes e não foram fornecidos por fornecedores.
CREATE VIEW vw_produtos_comprados_sem_fornecedor AS
SELECT DISTINCT pr.*
FROM Produto pr
JOIN Item_Pedido ip ON pr.cod_produto = ip.cod_produto
JOIN Pedido p ON ip.cod_pedido = p.cod_pedido
WHERE pr.cod_fornecedor IS NULL;

-- 9. Todas as compras realizadas no mês de abril de 2024.
CREATE VIEW vw_compras_abril_2024 AS
SELECT *
FROM Pedido
WHERE MONTH(data_pedido) = 4 AND YEAR(data_pedido) = 2024;

-- 10. Quantos produtos a empresa possui atualmente em estoque, para casos de estoque negativo deve ser mostrado o valor 0.
CREATE VIEW vw_total_estoque_produtos AS
SELECT 
    cod_produto,
    CASE 
        WHEN COALESCE(quantidade, 0) < 0 THEN 0 
        ELSE quantidade 
    END AS quantidade_estoque
FROM Estoque;