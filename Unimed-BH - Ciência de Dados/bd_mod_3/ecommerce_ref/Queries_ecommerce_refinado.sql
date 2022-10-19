-- 1 Quantos pedidos foram feitos por cada cliente?
SELECT 
    CONCAT(c.pname, ' ', c.Lname) AS Cliente,
    COUNT(*) AS qtd_pedidos
FROM
    clientes c
        JOIN
    pedidos p ON c.idClient = p.fk_idClient
GROUP BY c.idClient;

-- 2 Algum vendedor também é fornecedor?
select * from fornecedores f, vendedores v where f.CNPJ = v.CNPJ;


-- 3 Relação de produtos fornecedores e estoques --
SELECT 
    f.SocialName AS 'razão social',
    f.CNPJ,
    f.Contact AS tel_fornedor,
    p.Name AS nome,
    p.ClassKids AS kids,
    p.Category AS cat,
    p.Size,
    p.Price AS valor_unitario,
    pe.Qtd AS qtd_estoque,
    e.Name AS resposável,
    e.Local AS endereço,
    e.Contact AS tel_estoque
FROM
    fornecedores f
        JOIN
    fornecedores_produtos fp ON f.id = fp.fk_idSupplier
        JOIN
    produtos p ON fp.fk_idProduct = p.id
        JOIN
    produtos_estoques pe ON p.id = pe.fk_idProduct
        JOIN
    estoques e ON pe.fk_idStorage = e.id;   


-- 4 Relação de nomes dos fornecedores e nomes dos produtos;
SELECT 
    f.SocialName,
    f.CNPJ,
    f.Contact,
    fp.Qtd,
    p.Name,
    p.ClassKids,
    p.Category,
    p.Size,
    p.Rating,
    p.Price
FROM
    fornecedores f
        JOIN
    fornecedores_produtos fp ON f.id = fp.fk_idSupplier
        JOIN
    produtos p ON fp.fk_idProduct = p.id;
    
    -- 5 Informe todos os clientes que realizaram alguma ordem com cartão de crédito.
SELECT 
    CONCAT(cl.Pname, ' ', cl.Lname) AS cliente,
    c.Number AS cartão,
    c.Flag AS Bandeira,
    p.Date AS data_pedido,
    p.TotalValue AS total_pedido,
    p.Status,
    p.Description AS descrição,
    p.NumberPayment
FROM
    pedidos p
        JOIN
    creditcards c ON p.fk_idClient = c.fk_idClient
        AND p.fk_idCreditCard = c.id
        JOIN
    clientes cl ON cl.idClient = c.fk_idClient;

-- 6 Qual o Nome, CNPJ/CPF, quantidade vendida, nome do produto, categoria, tamanho, valor unitario, valor total e a quantidade em estoque já descontado das vendas dos terceiros.
SELECT 
    v.SocialName AS Nome,
    v.CNPJ,
    v.CPF,
    pt.Qtd AS qtd_vendas,
    p.Name AS produto,
    p.Category AS categoria,
    p.Size AS Tamanho,
    p.Price AS valor_unitario,
    pt.Qtd * p.Price AS valor_total,
    pe.Qtd - pt.Qtd AS qtd_estoque
FROM
    vendedores v
        JOIN
    produtos_terceiros pt ON v.id = pt.fk_idSeller
        JOIN
    produtos p ON p.id = pt.fk_idProduct
        JOIN
    produtos_estoques pe ON pe.fk_idProduct = p.id;
    
    -- 7 Informe todos os pedidos, a forma de pagamento, codigo do rastreio, o status da compra e do envio seguido dos seus respectivos valores ordenados pela data do pedido.
SELECT 
    p.fk_idClient AS id_cliente,
    p.Date AS data_pedido,
    p.Status AS status_pedido,
    p.TotalValue AS total,
    p.NumberPayment AS num_pedido,
    f.PayType AS forma_pagamento,
    e.Cod AS cod_rastreio,
    e.Status AS status_envio,
    e.ShipValue AS frete
FROM
    pedidos p
        JOIN
    formas_pagamentos f ON p.fk_idPayType = f.id
        JOIN
    entregas e ON p.fk_idDeliver = e.id
ORDER BY p.Date;

-- 8 Informe  endereço, responsável, o contato, a quantidade, o nome e categoria dos produtos em estoque com avaliação maior ou igual a 4 ordenado pela quantidade do maio para o menor.
SELECT 
    e.Local AS endereço,
    e.Name AS responsável,
    e.Contact AS telefone,
    pe.Qtd,
    p.Name AS nome_produto,
    p.Category AS categoria,
    p.Rating AS avaliação
FROM
    estoques e
        JOIN
    produtos_estoques pe ON pe.fk_idStorage = e.id
        JOIN
    produtos p ON p.id = pe.fk_idProduct
HAVING p.Rating >= 4
ORDER BY pe.Qtd DESC;

-- 9 Informe todos os clientes que possuem cadastro com CPF utilizando a função if;
SELECT 
    CONCAT(c.Pname, ' ', Lname) AS nome,
    IF(d.DocType = 'CPF',
        d.DocNum,
        'cliente_PJ') AS PF
FROM
    Documentos d,
    Clientes c
WHERE
    c.idClient = d.fk_idClient;

-- 10 informe o total de pedidos por tipo de pagamento;
SELECT 
    fp.Paytype AS tipo_pagamento, COUNT(*) AS qtd_pedidos
FROM
    pedidos p,
    formas_pagamentos fp
WHERE
    fp.id = p.fk_idPayType
GROUP BY (fp.PayType);

-- 11 Quais produtos o cliente de ordem =1 comprou?
SELECT 
    c.Pname AS Nome,
    p.Date,
    p.NumberPayment,
    prod.Name,
    prod.Price AS preço,
    p.Status AS pagamento,
    pr.Qtd AS qtd,
    prod.Price * pr.Qtd AS total,
    pr.Status
FROM
    pedidos AS p
        JOIN
    pedidos_produtos AS pr ON p.id = pr.fk_idOrder
        JOIN
    clientes c ON c.idClient = p.fk_idClient
        JOIN
    produtos prod ON prod.id = pr.fk_idProduct
WHERE
    p.id = 1

