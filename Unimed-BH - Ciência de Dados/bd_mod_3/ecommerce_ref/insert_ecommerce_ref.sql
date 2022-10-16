show databases;
use e_commerce_ref;
show tables;
-- select * from Documentos;
-- alter table Documentos auto_increment=1;
-- select * from Clientes;
-- select * from formas_pagamentos;
-- select * from creditcards;
-- desc payments_types;
-- alterando o tipo de cpf/cnpj
-- alter table card_payments modify Number varchar(15) NOT NULL; 
-- select * from fornecedores;
-- select * from produtos;
-- select * from `fornecedores/produtos`;
-- 1 inserindo registros na tabela Clientes --
INSERT INTO `e_commerce_ref`.`Clientes` (`Pname`, `Minit`, `Lname`, `Address`, `phone`) VALUES ('Julio', 'C.', 'Okuda', 'SP', '11912345614');
INSERT INTO `e_commerce_ref`.`Clientes` (`Pname`, `Minit`, `Lname`, `Address`, `phone`) VALUES ('Solange ', 'M.', 'Okita', 'RJ', '2145678996');
INSERT INTO `e_commerce_ref`.`Clientes` (`Pname`, `Minit`, `Lname`, `Address`, `phone`) VALUES ('Lucas', 'Y.', 'Yudy', 'MS', '6725896325');

-- 2 Inserindo registros na tabela Documentos --
INSERT INTO `e_commerce_ref`.`Documentos` (`DocType`, `DocNum`, `fk_idClient`) VALUES ('CNPJ', '123456789456123', '1');
INSERT INTO `e_commerce_ref`.`Documentos` (`DocNum`, `fk_idClient`) VALUES ('36985214785', '2');
INSERT INTO `e_commerce_ref`.`Documentos` (`DocNum`, `fk_idClient`) VALUES ('35795174123', '3');

-- 3 Inserindo registros na tabela cartão de crédito --
INSERT INTO `e_commerce_ref`.`creditcards` (`Name`, `Number`, `Flag`, `ExpirationDate`,`fk_idClient`) VALUES ('Julio C. Okuda', '123456789321456', 'Visa', '10-01-25', '1');
INSERT INTO `e_commerce_ref`.`creditcards` (`Name`, `Number`, `Flag`, `ExpirationDate`,`fk_idClient`) VALUES ('Solange M Okita', '3579514852', 'Master', '01-02-24', '2');
INSERT INTO `e_commerce_ref`.`creditcards` (`Name`, `Number`, `Flag`, `ExpirationDate`,`fk_idClient`) VALUES ('Solange M Okita', '3579518888', 'Visa', '01-05-25', '2');

-- 4 Inserindo registros na tabela formas_Paymentos --
INSERT INTO `e_commerce_ref`.`formas_pagamentos` (`PayType`) VALUES ('Credito');
INSERT INTO `e_commerce_ref`.`formas_pagamentos` (`PayType`) VALUES ('Boleto');
INSERT INTO `e_commerce_ref`.`formas_pagamentos` (`PayType`) VALUES ('Pix');
INSERT INTO `e_commerce_ref`.`formas_pagamentos` (`PayType`) VALUES ('Debito');

-- 5 Inserindo registros na tabela Fornecedores --
INSERT INTO `e_commerce_ref`.`fornecedores` (`SocialName`, `CNPJ`, `Contact`) VALUES ('Nihontech', '123654985632569', '119849849');
INSERT INTO `e_commerce_ref`.`fornecedores` (`SocialName`, `CNPJ`, `Contact`) VALUES ('Techbyte', '123321123321122', '21988787878');

-- 6 Inserindo registros na tabela Produtos -- 
INSERT INTO `e_commerce_ref`.`produtos` (`Name`, `ClassKids`, `Category`, `Size`, `Ratings`, `Price`) VALUES ('Fraldas', '1', 'Vestimenta', 'P', '5', '95');
INSERT INTO `e_commerce_ref`.`produtos` (`Name`, `ClassKids`, `Category`, `Size`, `Ratings`, `Price`) VALUES ('Monitor', '0', 'Eletrônico', '19"', '4', '2000');
INSERT INTO `e_commerce_ref`.`produtos` (`Name`, `ClassKids`, `Category`, `Size`, `Ratings`, `Price`) VALUES ('Sofá', '0', 'Móveis', '3LUG', '3', '1400');
INSERT INTO `e_commerce_ref`.`produtos` (`Name`, `ClassKids`, `Category`, `Size`, `Ratings`, `Price`) VALUES ('Arroz', '0', 'Alimentos', '5kg', '4', '20');

-- 7 Inserindo registros na tabela fornecedores/produtos --
INSERT INTO `e_commerce_ref`.`fornecedores/produtos` (`fk_idSupplier`, `fk_idProduct`, `Quantity`) VALUES ('1', '1', '100');
INSERT INTO `e_commerce_ref`.`fornecedores/produtos` (`fk_idSupplier`, `fk_idProduct`, `Quantity`) VALUES ('2', '2', '50');
INSERT INTO `e_commerce_ref`.`fornecedores/produtos` (`fk_idSupplier`, `fk_idProduct`, `Quantity`) VALUES ('1', '3', '200');
INSERT INTO `e_commerce_ref`.`fornecedores/produtos` (`fk_idSupplier`, `fk_idProduct`, `Quantity`) VALUES ('1', '4', '2000');

-- 8 Inserindo registros na tabela de estoques --
-- select * from estoques;
INSERT INTO `e_commerce_ref`.`estoques` (`StorageLocation`, `Local`) VALUES ('1', 'RJ');
INSERT INTO `e_commerce_ref`.`estoques` (`StorageLocation`, `Local`) VALUES ('2', 'SP');
INSERT INTO `e_commerce_ref`.`estoques` (`StorageLocation`, `Local`) VALUES ('3 ', 'BA');
INSERT INTO `e_commerce_ref`.`estoques` (`StorageLocation`, `Local`) VALUES ('4 ', 'PR');
INSERT INTO `e_commerce_ref`.`estoques` (`StorageLocation`, `Local`) VALUES ('5', 'MG');
INSERT INTO `e_commerce_ref`.`estoques` (`StorageLocation`, `Local`) VALUES ('6', 'SP');

-- 9 Inserindo registros na tabela de produtos/estoques -- 
INSERT INTO `e_commerce_ref`.`produtos/estoques` (`fk_idProduct`, `fk_idStorage`, `Quantity`) VALUES ('1','1', '200');
INSERT INTO `e_commerce_ref`.`produtos/estoques` (`fk_idProduct`, `fk_idStorage`, `Quantity`) VALUES ('2','2', '1000');
INSERT INTO `e_commerce_ref`.`produtos/estoques` (`fk_idProduct`, `fk_idStorage`, `Quantity`) VALUES ('3','3', '500');
INSERT INTO `e_commerce_ref`.`produtos/estoques` (`fk_idProduct`, `fk_idStorage`, `Quantity`) VALUES ('4','4', '500');

-- 10 Inserindo registros na tabela de Terceiros/Vendedores --
-- select * from `terceiros/ vendedores`;
-- alter table `terceiros/ vendedores` auto_increment=1;
INSERT INTO `e_commerce_ref`.`terceiros/ vendedores` (`SocialName`, `AbstName`, `CNPJ`, `CPF`, `Local`, `Contact`) VALUES ('Tech eletronics',NULL,'963258741369852',NULL,'Rio de Janeiro','21963258763');
INSERT INTO `e_commerce_ref`.`terceiros/ vendedores` (`SocialName`, `AbstName`, `CNPJ`, `CPF`, `Local`, `Contact`) VALUES ('Boticário',NULL,'753159852951753',NULL,'São Paulo','11985265453');
INSERT INTO `e_commerce_ref`.`terceiros/ vendedores` (`SocialName`, `AbstName`, `CNPJ`, `CPF`, `Local`, `Contact`) VALUES ('JCNOK',NULL,NULL,'88899966621','Mato Grosso','67952654232');
INSERT INTO `e_commerce_ref`.`terceiros/ vendedores` (`SocialName`, `AbstName`, `CNPJ`, `CPF`, `Local`, `Contact`) VALUES ('Bar do zé',NULL,NULL,'96325875362','São Paulo','11965412548');
INSERT INTO `e_commerce_ref`.`terceiros/ vendedores` (`SocialName`, `AbstName`, `CNPJ`, `CPF`, `Local`, `Contact`) VALUES ('Boutique',NULL,'358952789654111',NULL,'Minas Gerais','31963524122');

-- 11 Inserindo registros na tabela Entregas -- 
show tables;
select * from `entregas`;
INSERT INTO `e_commerce_ref`.`entregas` (`Cod`, `Status`, `ShippingValue`) VALUES ('1122334455', 'Aguardando', '20');
INSERT INTO `e_commerce_ref`.`entregas` (`Cod`, `Status`, `ShippingValue`) VALUES ('78965412', 'Enviado', '35');
INSERT INTO `e_commerce_ref`.`entregas` (`Cod`, `Status`, `ShippingValue`) VALUES ('123987456', 'Em trânsito', '50');
INSERT INTO `e_commerce_ref`.`entregas` (`Cod`, `Status`, `ShippingValue`) VALUES ('852369741', 'Saiu para entrega', '28');
INSERT INTO `e_commerce_ref`.`entregas` (`Cod`, `Status`, `ShippingValue`) VALUES ('123654852', 'Entregue', '25');

-- 12 Inserindo registros na tabela de Pedidos --
select * from pedidos;
INSERT INTO `e_commerce_ref`.`pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `fk_idCreditCard`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('2', '1', '1', '2', 'Confirmado', 'utilizou o segundo cartão', '300', '15-10-22', '123654789');
INSERT INTO `e_commerce_ref`.`pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('1', '2', '3', 'Confirmado', 'Pagou com Pix a vista', '1200', '10-10-22', '13131313');
INSERT INTO `e_commerce_ref`.`pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('3', '3', '2', 'Em Processamento', 'Aguardando o boleto ser processado', '899', '14-10-22', '24242424');
INSERT INTO `e_commerce_ref`.`pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `fk_idCreditCard`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('1', '4', '1', '1', 'Cancelado', 'Cancelou o pedido-cartão', '1200', '14-10-22', '12121212');
INSERT INTO `e_commerce_ref`.`pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `fk_idCreditCard`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('2', '1', '1', '3', 'Cancelado', 'Cliente não possui cartão', '500', '14-10-22', '12365478');

-- INSERT INTO `e_commerce_ref`.`pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `fk_idCreditCard`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('1', '1', '1', '3', 'Confirmado', 'cartão', '900', '10-10-22', '123654');
--  INTO `e_commerce_ref`.`pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `fk_idCreditCard`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('3', '1', '1', '1', 'Confirmado', 'Cartão', '1000', '10-10-22', '36985674');
-- INSERT INTO `e_commerce_ref`.`pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `fk_idCreditCard`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('3', '1', '1', '4', 'Confirmado', 'Cartao', '200', '10-10-22', '32489510')


-- conferindo todos os pedido realizados com cartão de crédito pelo clientes --
select * from pedidos p join creditcards c on p.fk_idClient = c.fk_idClient and p.fk_idCreditCard = c.id; --

select * from clientes c join creditcards d on c.idClient = d.fk_idClient;