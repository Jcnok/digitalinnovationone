-- Queries realizadas para aprendizado -- 

-- Realizando consultas --
-- 1)- Existem quantos clientes na base? --
SELECT COUNT(*) FROM clients; -- 11 clientes --
 
-- 2)- Exibir todos os clientes que possuem ordem --
SELECT * FROM clients c, orders o WHERE c.idClient = o.idOrderClient; -- 9 clientes--

-- 3)- Exibir o nome, sobrenome, id e status da ordem dos clientes que possuem alguma ordem --
SELECT Fname,Lname,idOrder,orderStatus FROM clients c, orders o WHERE c.idClient = idOrderClient;

-- 4)- Exibir o nome e sobrenome concatenado, a id e os status da ordem --
SELECT CONCAT(Fname, ' ',Lname) AS Cliente, idOrder AS Request, orderStatus AS Status FROM clients c, orders o WHERE c.idClient = idOrderClient;

-- 5)- Inserir a ordem do cliente Osvaldo Cruz com id 11, com status da ordem em default, descrição 'site', sendvalue null e paymentcash como 1. --
desc orders; -- para verificar a ordem dos atributos --
INSERT INTO orders (idOrderClient,OrderStatus,OrderDescription,SendValue,PaymentCash) VALUES (11,DEFAULT,'site',NULL,1);

-- 6)- Confira se a ordem do cliente Osvaldo foi inserida;
SELECT CONCAT(Fname, ' ',Lname) AS Cliente, idOrder AS Request, orderStatus AS Status FROM clients c, orders o WHERE c.idClient = idOrderClient;

-- 7)- Altere o status da ordem do cliente Osvaldo que possui a requisição 17 para 'Cancelado'.
UPDATE orders SET orderStatus = "Cancelado" WHERE idOrder IN (17,18) AND idOrderClient = 11;
SELECT Fname, idOrderClient,orderStatus idOrder FROM clients, orders WHERE idOrder IN (17,18) AND idOrderClient = idClient;

-- 8)- Informe a quantidade de pedidos por clientes
SELECT 
    COUNT(*) AS 'Qtd Pedidos',
    CONCAT(Fname, ' ', Lname) AS Cliente,
    orderStatus AS Status
FROM
    clients c,
    orders o
WHERE
    c.idClient = idOrderClient
GROUP BY c.idClient;
 -- outra forma para informar a quantidade de pedidos por cliente.
SELECT 
    CONCAT(Fname, ' ', Lname) AS Cliente,
    orderStatus AS Status,
    COUNT(*) AS 'qtd pedidos'
FROM
    clients c
        INNER JOIN
    orders o ON c.idClient = o.idOrderClient
GROUP BY idClient;

-- 9) - Informe a quantidade de ordens com status cancelado por clientes ordenado por nome de forma descentende;
SELECT 
    idClient AS 'id',
    CONCAT(Fname, ' ', Lname) AS 'cliente',
    OrderDescription AS 'descrição',
    OrderStatus AS 'status',
    COUNT(*) AS 'qtd'
FROM
    orders,
    clients
WHERE
    OrderStatus = 'Cancelado'
        AND IdClient = IdOrderClient
GROUP BY IdOrderClient
ORDER BY Fname DESC;

-- 10) - Informe a quantidade de produtos por categoria e por localização com avaliação maior ou igual a 4 ordenado por quantidade descendente.
SELECT 
    StorageLocation, Category, Avaliação, SUM(Quantity) AS 'qtd'
FROM
    productstorage,
    products
GROUP BY Category , StorageLocation
HAVING (Avaliação >= 4)
ORDER BY Quantity DESC;