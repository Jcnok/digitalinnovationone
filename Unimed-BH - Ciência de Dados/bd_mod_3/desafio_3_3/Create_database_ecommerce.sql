-- Criação do Banco de Dados para o cenário de E-commerce --
create database ecommerce;
use ecommerce;

-- Criar a tabala de cliente
CREATE TABLE clients(
	idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(20),
    Minit CHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    Address VARCHAR(30),
    CONSTRAINT unique_cpf_client UNIQUE(CPF) -- cpf é do tipo unico e está relacionado a constraint unique_cpf_client --
);

-- Criar a tabela produto --
CREATE TABLE products (
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(10) NOT NULL,
    Classification_Kids BOOL DEFAULT FALSE,
    Category ENUM('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') NOT NULL,
    Avaliação FLOAT DEFAULT 0,
    Size VARCHAR(10)
);

-- Criar a tabela pagamentos --
-- Para ser continuado no desafio: termine de implementar a tabela e cria a conexão com as tabelas necessárias
-- Além disso, reflita essa modificação no diagrama de esquema relacional
CREATE TABLE payments (
    idClient INT,
    idPayment INT,
    TypePayment ENUM('Boleto', 'Cartão', 'Dois cartões'),
    LimitAvailable FLOAT,
    PRIMARY KEY (idClient , idPayment)
);

-- Criar a tabela pedido --
CREATE TABLE orders (
    idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT,
    OrderStatus ENUM('Cancelado', 'Confirmado', 'Em processamento') DEFAULT 'Em Processamento',
    OrderDescription VARCHAR(255),
    SendValue FLOAT DEFAULT 10,
    PaymentCash BOOL DEFAULT FALSE,
    CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient)
        REFERENCES clients (idClient)
);


-- Criar a tabela estoque
CREATE TABLE productstorage (
    idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
    StorageLocation VARCHAR(255),
    Quantity INT DEFAULT 0
);

-- Criar a tabela fornecedor
CREATE TABLE supplier (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    Contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE (CNPJ)
);

-- Criar tabela vendedor
CREATE TABLE seller (
    idSeller INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    AbstName VARCHAR(255),
    CNPJ CHAR(15),
    CPF CHAR(11),
    Location VARCHAR(255),
    Contact CHAR(11) NOT NULL,
    CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ),
    CONSTRAINT unique_cpf_seller UNIQUE (CPF)
);

-- Criar a tabela produto/vendedor
CREATE TABLE productseller (
    idPseller INT,
    idPproduct INT,
    prodQuantity INT DEFAULT 1,
    PRIMARY KEY (idPseller , idPproduct),
    CONSTRAINT fk_product_seller FOREIGN KEY (idPseller)
        REFERENCES seller (idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY (idPproduct)
        REFERENCES products (idProduct)
);

-- Criar a tabela produto/pedido
CREATE TABLE productorder (
    idPOproduct INT,
    idPOorder INT,
    PoQuantity INT DEFAULT 1,
    PoStatus ENUM('Disponível', 'Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (idPOproduct , idPOorder),
    CONSTRAINT fk_productorder_seller FOREIGN KEY (idPOproduct)
        REFERENCES products (idProduct),
    CONSTRAINT fk_productorder_product FOREIGN KEY (idPOorder)
        REFERENCES orders (idOrder)
);

-- Criar a tabela estoque/produto
CREATE TABLE storagelocation (
    idLproduct INT,
    idLstorage INT,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (idLproduct , idLstorage),
    CONSTRAINT fk_productstorage_seller FOREIGN KEY (idLproduct)
        REFERENCES products (idProduct),
    CONSTRAINT fk_productstorage_product FOREIGN KEY (idLstorage)
        REFERENCES productstorage (idProdStorage)
);

-- Criar tabela produto/fornededor
CREATE TABLE productsupplier (
    idPsSupplier INT,
    idPsProduct INT,
    quantity INT NOT NULL,
    PRIMARY KEY (idPsSupplier , idPsProduct),
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPsSupplier)
        REFERENCES supplier (idSupplier),
    CONSTRAINT fk_product_supplier_product FOREIGN KEY (idPsProduct)
        REFERENCES products (idProduct)
);

