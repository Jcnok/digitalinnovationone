-- Persistindo os registros no banco de dados Ecommerce --

-- Encontrando o caminho para subir os arquivos --
-- Comando para encontrar o caminho 'secure-file-priv', onde será necessário salvar o arquivos .csv na pasta uploads.
-- select @@global.secure_file_priv;

-- Verificando a descrição da tabela --
-- desc clients;

-- Persistindo dados de um arquivo csv na tabela Clients - Clientes --
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\cliente.csv'
into table clients
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(Fname,Minit,Lname,CPF,Address);

-- Persistindo dados de um arquivo csv na tabela products -Produtos --
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\produtos.csv'
into table products
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(Pname,Classification_kids,Category,Avaliação,Size);

-- Persistindo dados de um arquivo csv na tabela orders - Pedidos. --
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\orders.csv'
into table orders
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(idOrderClient,OrderStatus,OrderDescription,SendValue,PaymentCash);

-- Persistindo dados de um arquivo csv na tabela productstorage - Estoque --
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\productStorage.csv'
into table productstorage
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(StorageLocation,Quantity);

-- Persistindo dados de um arquivo csv na tabela supplier - Fornecedores --
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\supplier.csv'
into table supplier
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(SocialName,CNPJ,Contact);

-- Persistindo dados de um arquivo csv na tabela seller - Vendedores --
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\seller.csv'
into table seller
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(SocialName,AbstName,CNPJ,CPF,Location,Contact);

-- Persistindo dados de um arquivo csv na tabela  productseller -produto/venderdor --
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\productseller.csv'
into table productseller
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(idPseller,idPproduct,prodQuantity);

-- Persistindo dados de um arquivo csv na tabela productorder - produto/pedido.--
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\productorder.csv'
into table productorder
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(idPOproduct,idPOorder,PoQuantity);

-- Persistindo dados de um arquivo csv na tabela storagelocation estoque/produto. --
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\storagelocation.csv'
into table storagelocation
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(idLproduct,idLstorage,location);

-- Persistindo dados de um arquivo csv na tabela productsupplier - produto/forncecedor.--
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\productsupplier.csv'
into table productsupplier
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(idPsSupplier,idPsProduct,quantity);



