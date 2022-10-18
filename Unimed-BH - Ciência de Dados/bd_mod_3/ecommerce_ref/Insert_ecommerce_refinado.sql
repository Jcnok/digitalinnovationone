show databases;
use ecommerce_refinado;
show tables;

-- 1 inserindo registros na tabela Clientes --
INSERT INTO `Clientes` (`Pname`, `Minit`, `Lname`, `Address`, `phone`) VALUES ('Julio', 'C.', 'Okuda', 'SP', '11912345614');
INSERT INTO `Clientes` (`Pname`, `Minit`, `Lname`, `Address`, `phone`) VALUES ('Solange ', 'M.', 'Okita', 'RJ', '2145678996');
INSERT INTO `Clientes` (`Pname`, `Minit`, `Lname`, `Address`, `phone`) VALUES ('Lucas', 'Y.', 'Yudy', 'MS', '6725896325');

-- 2 Inserindo registros na tabela Documentos --
INSERT INTO `Documentos` (`DocType`, `DocNum`, `fk_idClient`) VALUES ('CNPJ', '123456789456123', '1');
INSERT INTO `Documentos` (`DocNum`, `fk_idClient`) VALUES ('36985214785', '2');
INSERT INTO `Documentos` (`DocNum`, `fk_idClient`) VALUES ('35795174123', '3');

-- 3 Inserindo registros na tabela cartão de crédito --
INSERT INTO `creditcards` (`Name`, `Number`, `Flag`, `ExpDate`,`fk_idClient`) VALUES ('Julio C. Okuda', '123456789321456', 'Visa', '10-01-25', '1');
INSERT INTO `creditcards` (`Name`, `Number`, `Flag`, `ExpDate`,`fk_idClient`) VALUES ('Solange M Okita', '3579514852', 'Master', '01-02-24', '2');
INSERT INTO `creditcards` (`Name`, `Number`, `Flag`, `ExpDate`,`fk_idClient`) VALUES ('Solange M Okita', '3579518888', 'Visa', '01-05-25', '2');

-- 4 Inserindo registros na tabela formas de pagamentos --
INSERT INTO `formas_pagamentos` (`PayType`) VALUES ('Credito');
INSERT INTO `formas_pagamentos` (`PayType`) VALUES ('Boleto');
INSERT INTO `formas_pagamentos` (`PayType`) VALUES ('Pix');
INSERT INTO `formas_pagamentos` (`PayType`) VALUES ('Debito');

-- 5 Inserindo registros na tabela Fornecedores --
INSERT INTO `fornecedores` (`SocialName`, `CNPJ`, `Contact`) VALUES ('Nihontech', '123654985632569', '119849849');
INSERT INTO `fornecedores` (`SocialName`, `CNPJ`, `Contact`) VALUES ('Techbyte', '123321123321122', '21988787878');

-- 6 Inserindo registros na tabela Produtos -- 
INSERT INTO `produtos` (`Name`, `ClassKids`, `Category`, `Size`, `Rating`, `Price`) VALUES ('Fraldas', '1', 'Vestimenta', 'P', '5', '95');
INSERT INTO `produtos` (`Name`, `ClassKids`, `Category`, `Size`, `Rating`, `Price`) VALUES ('Monitor', '0', 'Eletrônico', '19"', '4', '2000');
INSERT INTO `produtos` (`Name`, `ClassKids`, `Category`, `Size`, `Rating`, `Price`) VALUES ('Sofá', '0', 'Móveis', '3LUG', '3', '1400');
INSERT INTO `produtos` (`Name`, `ClassKids`, `Category`, `Size`, `Rating`, `Price`) VALUES ('Arroz', '0', 'Alimentos', '5kg', '4', '20');

-- 7 Inserindo registros na tabela fornecedores_produtos --
INSERT INTO `fornecedores_produtos` (`fk_idSupplier`, `fk_idProduct`, `Qtd`) VALUES ('1', '1', '100');
INSERT INTO `fornecedores_produtos` (`fk_idSupplier`, `fk_idProduct`, `Qtd`) VALUES ('2', '2', '50');
INSERT INTO `fornecedores_produtos` (`fk_idSupplier`, `fk_idProduct`, `Qtd`) VALUES ('1', '3', '200');
INSERT INTO `fornecedores_produtos` (`fk_idSupplier`, `fk_idProduct`, `Qtd`) VALUES ('1', '4', '2000');

-- 8 Inserindo registros na tabela de estoques --
-- select * from estoques;
INSERT INTO `estoques` (`Local`, `Name`, `Contact`) VALUES ('Rio de Janeiro - RJ','João','21965324123');
INSERT INTO `estoques` (`Local`, `Name`, `Contact`) VALUES ('São Paulo - SP','Laura Pausini','11965324512');
INSERT INTO `estoques` (`Local`, `Name`, `Contact`) VALUES ('Salvador - BA','Rafael Silva','77956238574');
INSERT INTO `estoques` (`Local`, `Name`, `Contact`) VALUES ('Curitiba - PR','Takao K.','41985749632');
INSERT INTO `estoques` (`Local`, `Name`, `Contact`) VALUES ('Uberlândia - MG','Patrick O.','31956234578');
INSERT INTO `estoques` (`Local`, `Name`, `Contact`) VALUES ('Campinas - SP','Cristiano O.','19978453265');

-- 9 Inserindo registros na tabela de produtos_estoques -- 
INSERT INTO `produtos_estoques` (`fk_idProduct`, `fk_idStorage`, `Qtd`) VALUES ('1','1', '100');
INSERT INTO `produtos_estoques` (`fk_idProduct`, `fk_idStorage`, `Qtd`) VALUES ('2','2', '50');
INSERT INTO `produtos_estoques` (`fk_idProduct`, `fk_idStorage`, `Qtd`) VALUES ('3','3', '200');
INSERT INTO `produtos_estoques` (`fk_idProduct`, `fk_idStorage`, `Qtd`) VALUES ('4','4', '2000');

-- 10 Inserindo registros na tabela de Terceiros/Vendedores --
INSERT INTO `vendedores` (`SocialName`, `AbstName`, `CNPJ`, `CPF`, `Local`, `Contact`) VALUES ('Tech eletronics',NULL,'963258741369852',NULL,'Rio de Janeiro','21963258763');
INSERT INTO `vendedores` (`SocialName`, `AbstName`, `CNPJ`, `CPF`, `Local`, `Contact`) VALUES ('Boticário',NULL,'753159852951753',NULL,'São Paulo','11985265453');
INSERT INTO `vendedores` (`SocialName`, `AbstName`, `CNPJ`, `CPF`, `Local`, `Contact`) VALUES ('JCNOK',NULL,NULL,'88899966621','Mato Grosso','67952654232');
INSERT INTO `vendedores` (`SocialName`, `AbstName`, `CNPJ`, `CPF`, `Local`, `Contact`) VALUES ('Bar do zé',NULL,NULL,'96325875362','São Paulo','11965412548');
INSERT INTO `vendedores` (`SocialName`, `AbstName`, `CNPJ`, `CPF`, `Local`, `Contact`) VALUES ('Boutique',NULL,'358952789654111',NULL,'Minas Gerais','31963524122');

-- 11 Inserindo registros na tabela Entregas -- 
INSERT INTO `entregas` (`Cod`, `Status`, `ShipValue`) VALUES ('1122334455', 'Aguardando', '20');
INSERT INTO `entregas` (`Cod`, `Status`, `ShipValue`) VALUES ('78965412', 'Enviado', '35');
INSERT INTO `entregas` (`Cod`, `Status`, `ShipValue`) VALUES ('123987456', 'Em trânsito', '50');
INSERT INTO `entregas` (`Cod`, `Status`, `ShipValue`) VALUES ('852369741', 'Saiu para entrega', '28');
INSERT INTO `entregas` (`Cod`, `Status`, `ShipValue`) VALUES ('123654852', 'Entregue', '25');

-- 12 Inserindo registros na tabela de Pedidos --
INSERT INTO `pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `fk_idCreditCard`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('2', '1', '1', '2', 'Confirmado', 'utilizou cartão master', '9590', '15-10-22', '123654789');
INSERT INTO `pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('1', '2', '3', 'Confirmado', 'Pagou com Pix a vista', '20', '10-10-22', '13131313');
INSERT INTO `pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('3', '3', '2', 'Em Processamento', 'Aguardando o boleto ser processado', '3420', '14-10-22', '24242424');
INSERT INTO `pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `fk_idCreditCard`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('1', '4', '1', '1', 'Cancelado', 'Cancelou o pedido-cartão', '1400', '14-10-22', '12121212');
INSERT INTO `pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `fk_idCreditCard`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('2', '1', '1', '3', 'Cancelado', 'utilizou cartão visa', '2000', '14-10-22', '12365478');
INSERT INTO `pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `fk_idCreditCard`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('1', '1', '1', '3', 'Confirmado', 'cartão', '20', '10-10-22', '123654');

-- 13 Inserindo registros na tabela pedidos_produtos --
INSERT INTO `pedidos_produtos` (`fk_idProduct`, `fk_idOrder`, `Qtd`, `Status`) VALUES ('1', '1', '2', 'Disponível');
INSERT INTO `pedidos_produtos` (`fk_idProduct`, `fk_idOrder`, `Qtd`, `Status`) VALUES ('2', '1', '4', 'Disponível');
INSERT INTO `pedidos_produtos` (`fk_idProduct`, `fk_idOrder`, `Qtd`, `Status`) VALUES ('3', '1', '1', 'Disponível');
INSERT INTO `pedidos_produtos` (`fk_idProduct`, `fk_idOrder`, `Qtd`, `Status`) VALUES ('4', '2', '1', 'Disponível');
INSERT INTO `pedidos_produtos` (`fk_idProduct`, `fk_idOrder`, `Qtd`, `Status`) VALUES ('4', '3', '1', 'Disponível');
INSERT INTO `pedidos_produtos` (`fk_idProduct`, `fk_idOrder`, `Qtd`, `Status`) VALUES ('2', '3', '1', 'Disponível');
INSERT INTO `pedidos_produtos` (`fk_idProduct`, `fk_idOrder`, `Qtd`, `Status`) VALUES ('3', '3', '1', 'Disponível');
INSERT INTO `pedidos_produtos` (`fk_idProduct`, `fk_idOrder`, `Qtd`, `Status`) VALUES ('3', '4', '1', 'Disponível');
INSERT INTO `pedidos_produtos` (`fk_idProduct`, `fk_idOrder`, `Qtd`, `Status`) VALUES ('2', '6', '1', 'Disponível');
INSERT INTO `pedidos_produtos` (`fk_idProduct`, `fk_idOrder`, `Qtd`, `Status`) VALUES ('4', '6', '1', 'Disponível');

-- 14 Inserindo registros na tabela Produtos_Terceiros;
INSERT INTO `produtos_terceiros` (`fk_idSeller`, `fk_idProduct`, `Qtd`) VALUES ('1', '2', '10');
INSERT INTO `produtos_terceiros` (`fk_idSeller`, `fk_idProduct`, `Qtd`) VALUES ('2', '3', '5');
INSERT INTO `produtos_terceiros` (`fk_idSeller`, `fk_idProduct`, `Qtd`) VALUES ('3', '4', '15');
INSERT INTO `produtos_terceiros` (`fk_idSeller`, `fk_idProduct`, `Qtd`) VALUES ('4', '1', '100');

