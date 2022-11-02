# Desafio - Projeto de Banco de Dados E-Commerce refinado.

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/bd_mod_3/ecommerce_ref/ecommerce2.jpg?raw=true)

* **Este projeto faz parte da trilha “Unimed-BH-Ciência de dados” disponibilizada pela [DIO](https://www.dio.me/).**
* **O Desafio consiste na modelagem de um bando de dados para o cenário de um e-commerce, script sql para criação do schema, persistência e realização de testes utilizando queries para responder determinadas perguntas que serão elaboradas ao final do desafio.**
* **Ao navegar pelo índice, é possível visualizar todo o passo-à-passo realizado durante a elaboração do projeto.**
* **Todos os scripts estão disponibilizados neste repositório, para um eventual estudo ou replicação, vale ressaltar que intuito do conteúdo é apenas didático, com o propósito de demonstrar todo o conhecimento adquirido durante o aprendizado, ou seja, o conteúdo aqui disponibilizado apesar de similar, não abrange um banco de dados para um cenário real.**


<a name="ancora"></a>
# Índice
* [Contexto](#ancora1)
    * [Produtos](#ancora1.1)
    * [Clientes](#ancora1.2)
    * [Pedidos](#ancora1.3)
    * [Refinamento](#ancora1.4)
    
* [Mapeamento do Diagrama ER](#ancora2)

* [Script SQL para criação do esquema do banco de dados](#ancora3)
    * [CREATE SCHEMA](#ancora3.1)
    * [CREATE TABLE Clientes](#ancora3.2)
    * [CREATE TABLE Entregas](#ancora3.3)
    * [CREATE TABLE CreditCards](#ancora3.4)
    * [CREATE TABLE Formas_Pagamentos](#ancora3.5)
    * [CREATE TABLE Pedidos](#ancora3.6)
    * [CREATE TABLE Produtos](#ancora3.7)
    * [CREATE TABLE Fornecedores](#ancora3.8)
    * [CREATE TABLE Fornecedores_Produtos](#ancora3.9)
    * [CREATE TABLE Estoques](#ancora3.10)
    * [CREATE TABLE Produtos_Estoques](#ancora3.11)
    * [CREATE TABLE Pedidos_Produtos](#ancora3.12)
    * [CREATE TABLE Vendedores](#ancora3.13)
    * [CREATE TABLE Produtos_Terceiros](#ancora3.14)
    * [CREATE TABLE Documentos](#ancora3.15)
   
        
* [Script SQL para Persistir Registros no BD.](#ancora4)
    * [INSERT INTO Clientes](#ancora4.2)
    * [INSERT INTO Entregas](#ancora4.3)
    * [INSERT INTO CreditCards](#ancora4.4)
    * [INSERT INTO Formas_Pagamentos](#ancora4.5)
    * [INSERT INTO Pedidos](#ancora4.6)
    * [INSERT INTO Produtos](#ancora4.7)
    * [INSERT INTO Fornecedores](#ancora4.8)
    * [INSERT INTO Fornecedores_Produtos](#ancora4.9)
    * [INSERT INTO Estoques](#ancora4.10)
    * [INSERT INTO Produtos_Estoques](#ancora4.11)
    * [INSERT INTO Pedidos_Produtos](#ancora4.12)
    * [INSERT INTO Vendedores](#ancora4.13)
    * [INSERT INTO Produtos_Terceiros](#ancora4.14)
    * [INSERT INTO Documentos](#ancora4.15)
    
    
* [Script SQL para consultas(Queries)](#ancora5)
    * [Realizando a conexão com o Banco de Dados.](#ancora5.2)
    * [1-Quantos pedidos foram feitos por cada cliente?](#ancora5.3)
    * [2-Algum vendedor também é fornecedor?](#ancora5.4)
    * [3-Relação de produtos fornecedores e estoques;](#ancora5.5)
    * [4-Relação de nomes dos fornecedores e nomes dos produtos;](#ancora5.6)
    * [5-Informe todos os clientes que realizaram compras com cartão de crédito.](#ancora5.7)
    * [6-Qual o Nome, CNPJ/CPF, quantidade vendida, nome do produto, categoria, tamanho, valor unitario, valor total e a quantidade em estoque já descontado das vendas dos terceiros.](#ancora5.8)
    * [7-Informe todos os pedidos, a forma de pagamento, codigo do rastreio, o status da compra e do envio seguido dos seus respectivos valores ordenados pela data do pedido.](#ancora5.9)
    * [8-Informe  endereço, responsável, o contato, a quantidade, o nome e categoria dos produtos em estoque com avaliação maior ou igual a 4 ordenado pela quantidade do maior para o menor.](#ancora5.10)
    * [9-Informe todos os clientes que possuem cadastro com CPF utilizando a função if;](#ancora5.11)
    * [10-informe o total de pedidos por tipo de pagamento;](#ancora5.12)
    * [11-Quais produtos o cliente de ordem =1 comprou?](#ancora5.13)
    


<a name="ancora"></a>

## Contexto.
<a id="ancora1.1"></a>
[voltar](#ancora)

### Produtos
<a id="ancora1.2"></a>
[voltar](#ancora)

* Os produtos são vendidos por uma única plataforma online. Contudo, estes podem ter vendedores distintos (terceiros).
* Cada produto possui um fornecedor.
* Um ou mais produtos podem compor um pedido.

### Clientes
<a id="ancora1.3"></a>
[voltar](#ancora)

* O cliente pode se cadastrar no site com seu CPF ou CNPJ.
* O Endereço do cliente irá determinar o valor do frete.
* Um cliente pode comprar mais de um pedido. Este tem um período de carência para devolução do produto.

### Pedidos
<a id="ancora1.4"></a>
[voltar](#ancora)

* Os pedidos são criados por clientes e possuem informações de compra, endereço e status da entrega.
* Um produto ou mais compoem o pedido.
* O pedido pode ser cancelado.

### Refinamento
<a id="ancora1.5"></a>
[voltar](#ancora)

* Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações.
* Pagamento – Pode ter cadastrado mais de uma forma de pagamento.
* Entrega – Possuistatus e código de rastreio.

## Mapeamento do Diagrama ER.
<a id="ancora2"></a>
[voltar](#ancora)

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/bd_mod_3/ecommerce_ref/ecommerce_refinado.png?raw=true)

## Script SQL para criação do esquema do banco de dados.
<a id="ancora3"></a>
[voltar](#ancora)

### CREATE SCHEMA:
<a id="ancora3.1"></a>
[voltar](#ancora)


```python
'''CREATE SCHEMA IF NOT EXISTS `ecommerce_refinado` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `ecommerce_refinado` ;'''
```

### CREATE TABLE Clientes
<a id="ancora3.2"></a>
[voltar](#ancora)


```python
'''-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_refinado`.`Clientes` (
  `idClient` INT NOT NULL AUTO_INCREMENT COMMENT 'id do cliente é do tipo único e auto incrementável.',
  `Pname` VARCHAR(10) NOT NULL COMMENT 'Correponde ao primeiro nome do clieinte é um dipo caractere obrigatório.',
  `Minit` CHAR(3) NULL COMMENT 'Corresponde a inicial do nome do meio é do tipo char(3).',
  `Lname` VARCHAR(20) NOT NULL COMMENT 'Corresponde ao Sobrenome do cliente, campo tipo caractere obrigatório.',
  `Address` VARCHAR(100) NOT NULL COMMENT 'Endereço do cliente, campo deve ser obrigatório.',
  `phone` VARCHAR(15) NOT NULL COMMENT 'Telefone do cliente, o campo deve ser do tipo caractare e obrigatório.',
  PRIMARY KEY (`idClient`))
ENGINE = InnoDB;'''
```

### CREATE TABLE Entregas
<a id="ancora3.3"></a>
[voltar](#ancora)


```python
'''-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_refinado`.`Entregas` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'id de entrega - auto incremento e chave primaria.',
  `Cod` INT NOT NULL COMMENT 'Códido do rastreio da empresa que irá efetuar a logistica.',
  `Status` ENUM('Aguardando', 'Em preparação', 'Enviado', 'Em trânsito', 'Saiu para entrega', 'Entregue') NOT NULL DEFAULT 'Aguardando' COMMENT 'Status da entrega.(\'Aguardando\',\'Em preparação\', \'Enviado\', \'Em trânsito\', \'Saiu para entrega\', \'Entregue\') com padrão \'Aguardando\'',
  `ShipValue` FLOAT NOT NULL DEFAULT 0 COMMENT 'Valor do frete, por padrão 0.00 - tipo float e not null.',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;'''
```

### CREATE TABLE CreditCards
<a id="ancora3.4"></a>
[voltar](#ancora)


```python
'''-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_refinado`.`CreditCards` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'id do cartão chave primária tipo auto incremento.',
  `Name` VARCHAR(45) NOT NULL COMMENT 'Nome do Titular do cartão.\n',
  `Number` VARCHAR(15) NOT NULL COMMENT 'Número do cartão - deve ser do tipo único.',
  `Flag` VARCHAR(45) NOT NULL COMMENT 'Bandeira - visa, master etc...',
  `ExpDate` DATE NOT NULL COMMENT 'Data de validade',
  `fk_idClient` INT NOT NULL COMMENT 'Chave estrangeira do id do cliente.',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Number_UNIQUE` (`Number` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Pagamentos_Clientes1_idx` (`fk_idClient` ASC) VISIBLE,
  CONSTRAINT `fk_Pagamentos_Clientes1`
    FOREIGN KEY (`fk_idClient`)
    REFERENCES `ecommerce_refinado`.`Clientes` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;'''
```

### CREATE TABLE Formas_Pagamentos
<a id="ancora3.5"></a>
[voltar](#ancora)


```python
'''-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_refinado`.`Formas_Pagamentos` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Id da forma de pagamento, chave primária auto incremento.',
  `PayType` VARCHAR(45) NOT NULL DEFAULT 'Pix' COMMENT 'Tipo de Pagamento. Padrão Pix.\nex: Cartão, Boleto, Débito.',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `PayType_UNIQUE` (`PayType` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;'''
```

### CREATE TABLE Pedidos
<a id="ancora3.6"></a>
[voltar](#ancora)


```python
'''-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_refinado`.`Pedidos` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'id do produto, tipo chave primária auto increment.',
  `fk_idClient` INT NOT NULL COMMENT 'Chave estrangeira da tabela cliente (idClient).',
  `fk_idDeliver` INT NOT NULL COMMENT 'Chave estrangeira da tabela de entrega.',
  `fk_idPayType` INT NOT NULL COMMENT 'Chave estrangeira da tabela de tipo de pagamento.',
  `fk_idCreditCard` INT NULL COMMENT 'Chave estrangeira do cartão de crédito.',
  `Status` ENUM('Cancelado', 'Confirmado', 'Em processamento') NOT NULL DEFAULT 'Em Processamento' COMMENT 'Status do pedido pode ser: \'Cancelado\', \'Confirmado\', \'Em processamento\'.\nPor Padrão: \"Em processamento\".',
  `Description` VARCHAR(255) NULL COMMENT 'Descrição do produto, campo não é obrigatório.',
  `TotalValue` FLOAT NOT NULL COMMENT 'Valor total do pedido. tipo float, valor padrão  não pose se nulo.',
  `Date` DATE NOT NULL COMMENT 'Data do pedido, tipo datetime()',
  `NumberPayment` VARCHAR(45) NOT NULL COMMENT 'Corresponde ao registro da forma de pagamento, seja boleto, débito ou cartão de crédito.',
  PRIMARY KEY (`id`, `fk_idClient`, `fk_idDeliver`),
  INDEX `fk_Pedido_Cliente1_idx` (`fk_idClient` ASC) VISIBLE,
  INDEX `fk_Pedidos_Entregas1_idx` (`fk_idDeliver` ASC) VISIBLE,
  INDEX `fk_Pedidos_CreditCards1_idx` (`fk_idCreditCard` ASC) VISIBLE,
  INDEX `fk_Pedidos_Formas_Pagamentos1_idx` (`fk_idPayType` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`fk_idClient`)
    REFERENCES `ecommerce_refinado`.`Clientes` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedidos_Entregas1`
    FOREIGN KEY (`fk_idDeliver`)
    REFERENCES `ecommerce_refinado`.`Entregas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedidos_CreditCards1`
    FOREIGN KEY (`fk_idCreditCard`)
    REFERENCES `ecommerce_refinado`.`CreditCards` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedidos_Formas_Pagamentos1`
    FOREIGN KEY (`fk_idPayType`)
    REFERENCES `ecommerce_refinado`.`Formas_Pagamentos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;'''
```

### CREATE TABLE Produtos
<a id="ancora3.7"></a>
[voltar](#ancora)


```python
'''-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_refinado`.`Produtos` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Chave primária do tipo auto incremento, campo produto.',
  `Name` VARCHAR(20) NOT NULL COMMENT 'Nome do produto, campo obrigatório.',
  `ClassKids` TINYINT NOT NULL DEFAULT 0 COMMENT 'Tipo de classificação se True é do tipo kids se false adult, por padrão deixar como false.',
  `Category` ENUM('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') NOT NULL COMMENT 'Categoria pode ser: \'Eletrônico\', \'Vestimenta\', \'Brinquedos\', \'Alimentos\', \'Móveis\', não pode ser nulo.',
  `Size` VARCHAR(10) NULL COMMENT 'Tamanho, campo não é obrigatório',
  `Rating` FLOAT NULL DEFAULT 0 COMMENT 'Avaliações dos clientes. Padrão 0 tipo float',
  `Price` FLOAT NOT NULL COMMENT 'Preço do produto.',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;
'''
```

### CREATE TABLE Fornecedores
<a id="ancora3.8"></a>
[voltar](#ancora)


```python
'''-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_refinado`.`Fornecedores` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Id do Fornecedor o campo deve ser chave primária e auto incremento.',
  `SocialName` VARCHAR(255) NOT NULL COMMENT 'Razão Social não pode ser nulo.',
  `CNPJ` CHAR(15) NOT NULL COMMENT 'CNPJ da empresa - tipo char(15) não pode ser nulo e dever ser do tipo único.',
  `Contact` CHAR(11) NOT NULL COMMENT 'Telefone - tipo char(11) não pode ser nulo.',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC) VISIBLE,
  UNIQUE INDEX `idFornecedor_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;'''
```

### CREATE TABLE Fornecedores_Produtos
<a id="ancora3.9"></a>
[voltar](#ancora)


```python
'''-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_refinado`.`Fornecedores_Produtos` (
  `fk_idSupplier` INT NOT NULL COMMENT 'Chave estrangeira da tabela de fornecedores.',
  `fk_idProduct` INT NOT NULL COMMENT 'Chave estrangeira da tabela de produtos.',
  `Qtd` INT NOT NULL COMMENT 'Quantidade adquirida do fornecedor - não nulo.',
  PRIMARY KEY (`fk_idSupplier`, `fk_idProduct`),
  INDEX `fk_Fornecedor_has_Produto_Produto1_idx` (`fk_idProduct` ASC) VISIBLE,
  INDEX `fk_Fornecedor_has_Produto_Fornecedor1_idx` (`fk_idSupplier` ASC) VISIBLE,
  CONSTRAINT `fk_Fornecedor_has_Produto_Fornecedor1`
    FOREIGN KEY (`fk_idSupplier`)
    REFERENCES `ecommerce_refinado`.`Fornecedores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fornecedor_has_Produto_Produto1`
    FOREIGN KEY (`fk_idProduct`)
    REFERENCES `ecommerce_refinado`.`Produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
'''
```

### CREATE TABLE Estoques
<a id="ancora3.10"></a>
[voltar](#ancora)


```python
'''-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_refinado`.`Estoques` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'id do estoque, tipo auto incremento - chave primárial.',
  `Local` VARCHAR(255) NOT NULL COMMENT 'Endereço - não pode ser nulo.',
  `Name` VARCHAR(50) NULL DEFAULT 0 COMMENT 'Nome do responsável',
  `Contact` CHAR(11) NULL COMMENT 'Telefone de Contato.',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;
'''
```

### CREATE TABLE Produtos_Estoques
<a id="ancora3.11"></a>
[voltar](#ancora)


```python
'''CREATE TABLE IF NOT EXISTS `ecommerce_refinado`.`Produtos_Estoques` (
  `fk_idProduct` INT NOT NULL COMMENT 'Chave estrangeira da tabela de produtos.',
  `fk_idStorage` INT NOT NULL COMMENT 'Chave estrangeira da tabela de estoque.',
  `Qtd` INT NOT NULL COMMENT 'Quantidade em estoque.',
  PRIMARY KEY (`fk_idProduct`, `fk_idStorage`),
  INDEX `fk_Produto_has_Estoque_Estoque1_idx` (`fk_idStorage` ASC) VISIBLE,
  INDEX `fk_Produto_has_Estoque_Produto1_idx` (`fk_idProduct` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Estoque_Produto1`
    FOREIGN KEY (`fk_idProduct`)
    REFERENCES `ecommerce_refinado`.`Produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Estoque_Estoque1`
    FOREIGN KEY (`fk_idStorage`)
    REFERENCES `ecommerce_refinado`.`Estoques` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;'''
```

### CREATE TABLE Pedidos_Produtos
<a id="ancora3.12"></a>
[voltar](#ancora)


```python
'''-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_refinado`.`Pedidos_Produtos` (
  `fk_idProduct` INT NOT NULL COMMENT 'Chave estrangeira da tabela de produtos.',
  `fk_idOrder` INT NOT NULL COMMENT 'Chave estrangeira da tabela de pedidos.',
  `Qtd` INT NULL DEFAULT 1 COMMENT 'Quantidade solicitada na ordem, padrão 1.',
  `Status` ENUM('Disponível', 'Sem estoque') NOT NULL DEFAULT 'Disponível' COMMENT 'Status se produto está disponível ou sem estoque para compra.',
  PRIMARY KEY (`fk_idProduct`, `fk_idOrder`),
  INDEX `fk_Produto_has_Pedido_Pedido1_idx` (`fk_idOrder` ASC) VISIBLE,
  INDEX `fk_Produto_has_Pedido_Produto1_idx` (`fk_idProduct` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Pedido_Produto1`
    FOREIGN KEY (`fk_idProduct`)
    REFERENCES `ecommerce_refinado`.`Produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Pedido_Pedido1`
    FOREIGN KEY (`fk_idOrder`)
    REFERENCES `ecommerce_refinado`.`Pedidos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;'''
```

### CREATE TABLE Vendedores
<a id="ancora3.13"></a>
[voltar](#ancora)


```python
'''-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_refinado`.`Vendedores` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Id do venderor - auto incremento - chave primária.',
  `SocialName` VARCHAR(255) NOT NULL COMMENT 'Razão Social do vendedor, tipo não nulo.',
  `AbstName` VARCHAR(255) NULL COMMENT 'Nome Fantasia - opcional.',
  `CNPJ` CHAR(15) NULL COMMENT 'CNPJ tipo unico, não obrigatório, pois pode ser um vendedor pf.',
  `CPF` CHAR(11) NULL COMMENT 'CPF - tipo unico.',
  `Local` VARCHAR(255) NOT NULL COMMENT 'Endereço - não pode ser nulo.',
  `Contact` CHAR(11) NOT NULL COMMENT 'Telefonde de contato - Não pode ser nulo.',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC) VISIBLE,
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE)
ENGINE = InnoDB;'''
```

### CREATE TABLE Produtos_Terceiros
<a id="ancora3.14"></a>
[voltar](#ancora)


```python
'''-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_refinado`.`Produtos_Terceiros` (
  `fk_idSeller` INT NOT NULL COMMENT 'Chave estrangeira da tabela vendedores.',
  `fk_idProduct` INT NOT NULL COMMENT 'Chave estrangeira da tabela produtos.',
  `Qtd` INT NULL DEFAULT 1 COMMENT 'Quatidade vendida por terceiros.',
  PRIMARY KEY (`fk_idSeller`, `fk_idProduct`),
  INDEX `fk_Terceiros - Vendedor_has_Relação de Produto/Pedido_Rel_idx` (`fk_idProduct` ASC) VISIBLE,
  INDEX `fk_Terceiros - Vendedor_has_Relação de Produto/Pedido_Ter_idx` (`fk_idSeller` ASC) VISIBLE,
  CONSTRAINT `fk_Terceiros - Vendedor_has_Relação de Produto/Pedido_Terce1`
    FOREIGN KEY (`fk_idSeller`)
    REFERENCES `ecommerce_refinado`.`Vendedores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Terceiros - Vendedor_has_Relação de Produto/Pedido_Rela1`
    FOREIGN KEY (`fk_idProduct`)
    REFERENCES `ecommerce_refinado`.`Pedidos_Produtos` (`fk_idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;'''
```

### CREATE TABLE Documentos
<a id="ancora3.15"></a>
[voltar](#ancora)


```python
'''-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_refinado`.`Documentos` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'id do tipo de documento do cliente.',
  `DocType` ENUM('CPF', 'CNPJ') NOT NULL DEFAULT 'CPF' COMMENT 'Tipo do documento, pode ser \'CPF\' ou \'CNPJ\'.',
  `DocNum` VARCHAR(15) NOT NULL COMMENT 'O número do documento pode ser CPF ou CNPJ tipo varchar(14) tipo unico.',
  `fk_idClient` INT NOT NULL COMMENT 'Chave estrangeira da tabela cliente.',
  PRIMARY KEY (`id`, `fk_idClient`),
  INDEX `fk_Documentos_Cliente1_idx` (`fk_idClient` ASC) VISIBLE,
  UNIQUE INDEX `DocNum_UNIQUE` (`DocNum` ASC) VISIBLE,
  CONSTRAINT `fk_Documentos_Cliente1`
    FOREIGN KEY (`fk_idClient`)
    REFERENCES `ecommerce_refinado`.`Clientes` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;'''
```


```python

```

## Script SQL para Persistir Registros no BD.
<a id="ancora4"></a>
[voltar](#ancora)


```python
'''-- 1 inserindo registros na tabela Clientes --
INSERT INTO `Clientes` (`Pname`, `Minit`, `Lname`, `Address`, `phone`) VALUES ('Julio', 'C.', 'Okuda', 'SP', '11912345614');
INSERT INTO `Clientes` (`Pname`, `Minit`, `Lname`, `Address`, `phone`) VALUES ('Solange ', 'M.', 'Okita', 'RJ', '2145678996');
INSERT INTO `Clientes` (`Pname`, `Minit`, `Lname`, `Address`, `phone`) VALUES ('Lucas', 'Y.', 'Yudy', 'MS', '6725896325');'''
```

### INSERT INTO Entregas
<a id="ancora4.2"></a>
[voltar](#ancora)


```python
'''-- 11 Inserindo registros na tabela Entregas -- 
INSERT INTO `entregas` (`Cod`, `Status`, `ShipValue`) VALUES ('1122334455', 'Aguardando', '20');
INSERT INTO `entregas` (`Cod`, `Status`, `ShipValue`) VALUES ('78965412', 'Enviado', '35');
INSERT INTO `entregas` (`Cod`, `Status`, `ShipValue`) VALUES ('123987456', 'Em trânsito', '30');
INSERT INTO `entregas` (`Cod`, `Status`, `ShipValue`) VALUES ('852369741', 'Saiu para entrega', '28');
INSERT INTO `entregas` (`Cod`, `Status`, `ShipValue`) VALUES ('123654852', 'Entregue', '25');'''
```

### INSERT INTO CreditCards
<a id="ancora4.3"></a>
[voltar](#ancora)


```python
'''-- 3 Inserindo registros na tabela cartão de crédito --
INSERT INTO `creditcards` (`Name`, `Number`, `Flag`, `ExpDate`,`fk_idClient`) VALUES ('Julio C. Okuda', '123456789321456', 'Visa', '25-01-10', '1');
INSERT INTO `creditcards` (`Name`, `Number`, `Flag`, `ExpDate`,`fk_idClient`) VALUES ('Solange M Okita', '3579514852', 'Master', '24-01-02', '2');
INSERT INTO `creditcards` (`Name`, `Number`, `Flag`, `ExpDate`,`fk_idClient`) VALUES ('Solange M Okita', '3579518888', 'Visa', '25-01-05', '2');
'''
```

### INSERT INTO Formas_Pagamentos
<a id="ancora4.4"></a>
[voltar](#ancora)


```python
'''-- 4 Inserindo registros na tabela formas de pagamentos --
INSERT INTO `formas_pagamentos` (`PayType`) VALUES ('Credito');
INSERT INTO `formas_pagamentos` (`PayType`) VALUES ('Boleto');
INSERT INTO `formas_pagamentos` (`PayType`) VALUES ('Pix');
INSERT INTO `formas_pagamentos` (`PayType`) VALUES ('Debito');'''
```

### INSERT INTO Pedidos
<a id="ancora4.5"></a>
[voltar](#ancora)


```python
'''-- 12 Inserindo registros na tabela de Pedidos --
INSERT INTO `pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `fk_idCreditCard`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('2', '2', '1', '2', 'Confirmado', 'utilizou cartão master', '9590', '22-10-15', '123654789');
INSERT INTO `pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('1', '4', '3', 'Confirmado', 'Pagou com Pix a vista', '399', '22-10-10', '13131313');
INSERT INTO `pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('3', '1', '2', 'Em Processamento', 'Aguardando o boleto ser processado', '3420', '22-10-14', '24242424');
INSERT INTO `pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `fk_idCreditCard`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('1', '1', '1', '1', 'Cancelado', 'Cancelou o pedido-cartão', '1400', '22-10-14', '12121212');
INSERT INTO `pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `fk_idCreditCard`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('2', '1', '1', '3', 'Cancelado', 'utilizou cartão visa', '2000', '22-10-14', '12365478');
INSERT INTO `pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `fk_idCreditCard`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('1', '3', '1', '3', 'Confirmado', 'cartão', '399', '22-10-10', '123654');
'''
```

### INSERT INTO Produtos
<a id="ancora4.6"></a>
[voltar](#ancora)


```python
'''-- 6 Inserindo registros na tabela Produtos -- 
INSERT INTO `produtos` (`Name`, `ClassKids`, `Category`, `Size`, `Rating`, `Price`) VALUES ('Fraldas', '1', 'Vestimenta', 'P', '5', '95');
INSERT INTO `produtos` (`Name`, `ClassKids`, `Category`, `Size`, `Rating`, `Price`) VALUES ('Monitor', '0', 'Eletrônico', '19"', '4', '2000');
INSERT INTO `produtos` (`Name`, `ClassKids`, `Category`, `Size`, `Rating`, `Price`) VALUES ('Sofá', '0', 'Móveis', '3LUG', '3', '1400');
INSERT INTO `produtos` (`Name`, `ClassKids`, `Category`, `Size`, `Rating`, `Price`) VALUES ('Cesta_Basica', '0', 'Alimentos', '1_fardo', '4', '399');'''
```




    '-- 6 Inserindo registros na tabela Produtos -- \nINSERT INTO `produtos` (`Name`, `ClassKids`, `Category`, `Size`, `Rating`, `Price`) VALUES (\'Fraldas\', \'1\', \'Vestimenta\', \'P\', \'5\', \'95\');\nINSERT INTO `produtos` (`Name`, `ClassKids`, `Category`, `Size`, `Rating`, `Price`) VALUES (\'Monitor\', \'0\', \'Eletrônico\', \'19"\', \'4\', \'2000\');\nINSERT INTO `produtos` (`Name`, `ClassKids`, `Category`, `Size`, `Rating`, `Price`) VALUES (\'Sofá\', \'0\', \'Móveis\', \'3LUG\', \'3\', \'1400\');\nINSERT INTO `produtos` (`Name`, `ClassKids`, `Category`, `Size`, `Rating`, `Price`) VALUES (\'Arroz\', \'0\', \'Alimentos\', \'5kg\', \'4\', \'20\');'



### INSERT INTO Fornecedores
<a id="ancora4.7"></a>
[voltar](#ancora)


```python
'''-- 5 Inserindo registros na tabela Fornecedores --
INSERT INTO `fornecedores` (`SocialName`, `CNPJ`, `Contact`) VALUES ('Nihontech', '123654985632569', '119849849');
INSERT INTO `fornecedores` (`SocialName`, `CNPJ`, `Contact`) VALUES ('Techbyte', '123321123321122', '21988787878');'''
```

### INSERT INTO Fornecedores_Produtos
<a id="ancora4.8"></a>
[voltar](#ancora)


```python
'''-- 7 Inserindo registros na tabela fornecedores_produtos --
INSERT INTO `fornecedores_produtos` (`fk_idSupplier`, `fk_idProduct`, `Qtd`) VALUES ('1', '1', '100');
INSERT INTO `fornecedores_produtos` (`fk_idSupplier`, `fk_idProduct`, `Qtd`) VALUES ('2', '2', '50');
INSERT INTO `fornecedores_produtos` (`fk_idSupplier`, `fk_idProduct`, `Qtd`) VALUES ('1', '3', '200');
INSERT INTO `fornecedores_produtos` (`fk_idSupplier`, `fk_idProduct`, `Qtd`) VALUES ('1', '4', '2000');'''
```

### INSERT INTO Estoques
<a id="ancora4.9"></a>
[voltar](#ancora)


```python
'''-- 8 Inserindo registros na tabela de estoques --
INSERT INTO `estoques` (`Local`, `Name`, `Contact`) VALUES ('Rio de Janeiro - RJ','João','21965324123');
INSERT INTO `estoques` (`Local`, `Name`, `Contact`) VALUES ('São Paulo - SP','Laura Pausini','11965324512');
INSERT INTO `estoques` (`Local`, `Name`, `Contact`) VALUES ('Salvador - BA','Rafael Silva','77956238574');
INSERT INTO `estoques` (`Local`, `Name`, `Contact`) VALUES ('Curitiba - PR','Takao K.','41985749632');
INSERT INTO `estoques` (`Local`, `Name`, `Contact`) VALUES ('Uberlândia - MG','Patrick O.','31956234578');
INSERT INTO `estoques` (`Local`, `Name`, `Contact`) VALUES ('Campinas - SP','Cristiano O.','19978453265');'''
```

### INSERT INTO Produtos_Estoques
<a id="ancora4.10"></a>
[voltar](#ancora)


```python
'''-- 9 Inserindo registros na tabela de produtos_estoques -- 
INSERT INTO `produtos_estoques` (`fk_idProduct`, `fk_idStorage`, `Qtd`) VALUES ('1','1', '100');
INSERT INTO `produtos_estoques` (`fk_idProduct`, `fk_idStorage`, `Qtd`) VALUES ('2','2', '50');
INSERT INTO `produtos_estoques` (`fk_idProduct`, `fk_idStorage`, `Qtd`) VALUES ('3','3', '200');
INSERT INTO `produtos_estoques` (`fk_idProduct`, `fk_idStorage`, `Qtd`) VALUES ('4','4', '2000');'''
```

### INSERT INTO Pedidos_Produtos
<a id="ancora4.11"></a>
[voltar](#ancora)


```python
'''-- 13 Inserindo registros na tabela pedidos_produtos --
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
'''
```

### INSERT INTO Vendedores
<a id="ancora4.12"></a>
[voltar](#ancora)


```python
'''-- 10 Inserindo registros na tabela de Terceiros/Vendedores --
INSERT INTO `vendedores` (`SocialName`, `AbstName`, `CNPJ`, `CPF`, `Local`, `Contact`) VALUES ('Tech eletronics',NULL,'963258741369852',NULL,'Rio de Janeiro','21963258763');
INSERT INTO `vendedores` (`SocialName`, `AbstName`, `CNPJ`, `CPF`, `Local`, `Contact`) VALUES ('Boticário',NULL,'753159852951753',NULL,'São Paulo','11985265453');
INSERT INTO `vendedores` (`SocialName`, `AbstName`, `CNPJ`, `CPF`, `Local`, `Contact`) VALUES ('JCNOK',NULL,NULL,'88899966621','Mato Grosso','67952654232');
INSERT INTO `vendedores` (`SocialName`, `AbstName`, `CNPJ`, `CPF`, `Local`, `Contact`) VALUES ('Bar do zé',NULL,NULL,'96325875362','São Paulo','11965412548');
INSERT INTO `vendedores` (`SocialName`, `AbstName`, `CNPJ`, `CPF`, `Local`, `Contact`) VALUES ('Boutique',NULL,'358952789654111',NULL,'Minas Gerais','31963524122');'''
```

### INSERT INTO Produtos_Terceiros
<a id="ancora4.13"></a>
[voltar](#ancora)


```python
'''-- 14 Inserindo registros na tabela Produtos_Terceiros;
INSERT INTO `produtos_terceiros` (`fk_idSeller`, `fk_idProduct`, `Qtd`) VALUES ('1', '2', '10');
INSERT INTO `produtos_terceiros` (`fk_idSeller`, `fk_idProduct`, `Qtd`) VALUES ('2', '3', '5');
INSERT INTO `produtos_terceiros` (`fk_idSeller`, `fk_idProduct`, `Qtd`) VALUES ('3', '4', '15');
INSERT INTO `produtos_terceiros` (`fk_idSeller`, `fk_idProduct`, `Qtd`) VALUES ('4', '1', '50');'''
```

### INSERT INTO Documentos
<a id="ancora4.14"></a>
[voltar](#ancora)


```python
'''-- 2 Inserindo registros na tabela Documentos --
INSERT INTO `Documentos` (`DocType`, `DocNum`, `fk_idClient`) VALUES ('CNPJ', '123456789456123', '1');
INSERT INTO `Documentos` (`DocNum`, `fk_idClient`) VALUES ('36985214785', '2');
INSERT INTO `Documentos` (`DocNum`, `fk_idClient`) VALUES ('35795174123', '3');'''
```


```python

```

## Respondendo as Perguntas com Queries.
<a id="ancora5"></a>
[voltar](#ancora)

### Realizando a conexão com o Banco de Dados.
<a id="ancora5.2"></a>
[voltar](#ancora)


```python
#importação das bibliotecas para conexão 1
import mysql.connector
import pandas as pd
import warnings
warnings.filterwarnings('ignore')
```


```python
# Testando a conexão, nesse caso criei um usuário sem senha para teste.
con = mysql.connector.connect(host='localhost',database='ecommerce_refinado',user='julio',password='')
if con.is_connected():
    db_info = con.get_server_info()
    print("Conectado ao servidor MySQL versão ",db_info)
    cursor = con.cursor()
    cursor.execute("select database();")
    linha = cursor.fetchone()
    print("Conectado ao banco de dados ",linha)
if con.is_connected():
    cursor.close()
    con.close()
    print("Conexão ao MySQL foi encerrada")
```

    Conectado ao servidor MySQL versão  8.0.30
    Conectado ao banco de dados  ('ecommerce_refinado',)
    Conexão ao MySQL foi encerrada
    


```python
# Exibindo as tabelas do banco de dados.
con = mysql.connector.connect(host='localhost',database='ecommerce_refinado',user='julio',password='')
cursor = con.cursor()
cursor.execute('SHOW TABLES')
for i in cursor:
  print(i)
```

    ('clientes',)
    ('creditcards',)
    ('documentos',)
    ('entregas',)
    ('estoques',)
    ('formas_pagamentos',)
    ('fornecedores',)
    ('fornecedores_produtos',)
    ('pedidos',)
    ('pedidos_produtos',)
    ('produtos',)
    ('produtos_estoques',)
    ('produtos_terceiros',)
    ('vendedores',)
    

### 1-Quantos pedidos foram feitos por cada cliente?
<a id="ancora5.3"></a>
[voltar](#ancora)


```python
query ='''
SELECT 
    CONCAT(c.pname, ' ', c.Lname) AS Cliente,
    COUNT(*) AS qtd_pedidos
FROM
    clientes c
        JOIN
    pedidos p ON c.idClient = p.fk_idClient
GROUP BY c.idClient;
'''
pd.read_sql(query,con)
```




<div>

<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Cliente</th>
      <th>qtd_pedidos</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Julio Okuda</td>
      <td>3</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Solange  Okita</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Lucas Yudy</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>



### 2-Algum vendedor também é fornecedor?
<a id="ancora5.4"></a>
[voltar](#ancora)


```python
query='''
SELECT 
    f.SocialName,
    f.CNPJ
FROM
    fornecedores f,
    vendedores v
WHERE
    f.CNPJ = v.CNPJ;
'''
pd.read_sql(query,con)
```




<div>

<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>SocialName</th>
      <th>CNPJ</th>
    </tr>
  </thead>
  <tbody>
  </tbody>
</table>
</div>



* *Neste caso não existe nehum vendedor que também é fornecedor*.

### 3-Relação de produtos fornecedores e estoques;
<a id="ancora5.5"></a>
[voltar](#ancora)


```python
query='''
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
    '''
pd.read_sql(query,con)
```




<div>

<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>razão social</th>
      <th>CNPJ</th>
      <th>tel_fornedor</th>
      <th>nome</th>
      <th>kids</th>
      <th>cat</th>
      <th>Size</th>
      <th>valor_unitario</th>
      <th>qtd_estoque</th>
      <th>resposável</th>
      <th>endereço</th>
      <th>tel_estoque</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Nihontech</td>
      <td>123654985632569</td>
      <td>119849849</td>
      <td>Fraldas</td>
      <td>1</td>
      <td>Vestimenta</td>
      <td>P</td>
      <td>95.0</td>
      <td>100</td>
      <td>João</td>
      <td>Rio de Janeiro - RJ</td>
      <td>21965324123</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Nihontech</td>
      <td>123654985632569</td>
      <td>119849849</td>
      <td>Sofá</td>
      <td>0</td>
      <td>Móveis</td>
      <td>3LUG</td>
      <td>1400.0</td>
      <td>200</td>
      <td>Rafael Silva</td>
      <td>Salvador - BA</td>
      <td>77956238574</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Nihontech</td>
      <td>123654985632569</td>
      <td>119849849</td>
      <td>Cesta_Basica</td>
      <td>0</td>
      <td>Alimentos</td>
      <td>1 fardo</td>
      <td>399.0</td>
      <td>2000</td>
      <td>Takao K.</td>
      <td>Curitiba - PR</td>
      <td>41985749632</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Techbyte</td>
      <td>123321123321122</td>
      <td>21988787878</td>
      <td>Monitor</td>
      <td>0</td>
      <td>Eletrônico</td>
      <td>19"</td>
      <td>2000.0</td>
      <td>50</td>
      <td>Laura Pausini</td>
      <td>São Paulo - SP</td>
      <td>11965324512</td>
    </tr>
  </tbody>
</table>
</div>



* *Temos apenas 2 fornecedores onde aparentemente Nihontech trabalha com as categorias de Vestimenta, Móveis e Alimentos*.
* *Enquanto que Techbye trabalha com a parte de Eletrônicos*.
* *Os estoques possuem endereços distintos, vestimenta no RJ, Móveis na BA, Alimentos no PR e Eletrônicos em SP*.

### 4-Relação de nomes dos fornecedores e nomes dos produtos;
<a id="ancora5.6"></a>
[voltar](#ancora)


```python
query='''
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
'''
pd.read_sql(query,con)
```




<div>

<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>SocialName</th>
      <th>CNPJ</th>
      <th>Contact</th>
      <th>Qtd</th>
      <th>Name</th>
      <th>ClassKids</th>
      <th>Category</th>
      <th>Size</th>
      <th>Rating</th>
      <th>Price</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Nihontech</td>
      <td>123654985632569</td>
      <td>119849849</td>
      <td>100</td>
      <td>Fraldas</td>
      <td>1</td>
      <td>Vestimenta</td>
      <td>P</td>
      <td>5.0</td>
      <td>95.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Nihontech</td>
      <td>123654985632569</td>
      <td>119849849</td>
      <td>200</td>
      <td>Sofá</td>
      <td>0</td>
      <td>Móveis</td>
      <td>3LUG</td>
      <td>3.0</td>
      <td>1400.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Nihontech</td>
      <td>123654985632569</td>
      <td>119849849</td>
      <td>2000</td>
      <td>Cesta_Basica</td>
      <td>0</td>
      <td>Alimentos</td>
      <td>1 fardo</td>
      <td>4.0</td>
      <td>399.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Techbyte</td>
      <td>123321123321122</td>
      <td>21988787878</td>
      <td>50</td>
      <td>Monitor</td>
      <td>0</td>
      <td>Eletrônico</td>
      <td>19"</td>
      <td>4.0</td>
      <td>2000.0</td>
    </tr>
  </tbody>
</table>
</div>



### 5-Informe todos os clientes que realizaram compras com cartão de crédito.
<a id="ancora5.7"></a>
[voltar](#ancora)


```python
query='''
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
'''
pd.read_sql(query,con)
```




<div>

<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>cliente</th>
      <th>cartão</th>
      <th>Bandeira</th>
      <th>data_pedido</th>
      <th>total_pedido</th>
      <th>Status</th>
      <th>descrição</th>
      <th>NumberPayment</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Julio Okuda</td>
      <td>123456789321456</td>
      <td>Visa</td>
      <td>2022-10-14</td>
      <td>1400.0</td>
      <td>Cancelado</td>
      <td>Cancelou o pedido-cartão</td>
      <td>12121212</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Solange  Okita</td>
      <td>3579514852</td>
      <td>Master</td>
      <td>2022-10-15</td>
      <td>9590.0</td>
      <td>Confirmado</td>
      <td>utilizou cartão master</td>
      <td>123654789</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Solange  Okita</td>
      <td>3579518888</td>
      <td>Visa</td>
      <td>2022-10-14</td>
      <td>2000.0</td>
      <td>Cancelado</td>
      <td>utilizou cartão visa</td>
      <td>12365478</td>
    </tr>
  </tbody>
</table>
</div>



* *Foram realizados 3 pedidos porém dois estão com status Cancelado*.

### 6-Qual o Nome, CNPJ/CPF, quantidade vendida, nome do produto, categoria, tamanho, valor unitario, valor total e a quantidade em estoque já descontado das vendas dos terceiros.
<a id="ancora5.8"></a>
[voltar](#ancora)


```python
query= '''
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
'''
pd.read_sql(query,con)
```




<div>

<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Nome</th>
      <th>CNPJ</th>
      <th>CPF</th>
      <th>qtd_vendas</th>
      <th>produto</th>
      <th>categoria</th>
      <th>Tamanho</th>
      <th>valor_unitario</th>
      <th>valor_total</th>
      <th>qtd_estoque</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Tech eletronics</td>
      <td>963258741369852</td>
      <td>None</td>
      <td>10</td>
      <td>Monitor</td>
      <td>Eletrônico</td>
      <td>19"</td>
      <td>2000.0</td>
      <td>20000.0</td>
      <td>40</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Boticário</td>
      <td>753159852951753</td>
      <td>None</td>
      <td>5</td>
      <td>Sofá</td>
      <td>Móveis</td>
      <td>3LUG</td>
      <td>1400.0</td>
      <td>7000.0</td>
      <td>195</td>
    </tr>
    <tr>
      <th>2</th>
      <td>JCNOK</td>
      <td>None</td>
      <td>88899966621</td>
      <td>15</td>
      <td>Cesta_Basica</td>
      <td>Alimentos</td>
      <td>1 fardo</td>
      <td>399.0</td>
      <td>5985.0</td>
      <td>1985</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Bar do zé</td>
      <td>None</td>
      <td>96325875362</td>
      <td>50</td>
      <td>Fraldas</td>
      <td>Vestimenta</td>
      <td>P</td>
      <td>95.0</td>
      <td>4750.0</td>
      <td>50</td>
    </tr>
  </tbody>
</table>
</div>



* *Temos 2 vendedores PJ e 2 PF, esse setor certamente possui melhorias, pois poderíamos criar uma tabela para os PJs e PFs separadamente ou criar um método para o cliente selecionar o tipo de documento etc...*

### 7-Informe todos os pedidos, a forma de pagamento, codigo do rastreio, o status da compra e do envio seguido dos seus respectivos valores ordenados pela data do pedido.
<a id="ancora5.9"></a>
[voltar](#ancora)


```python
query='''
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
'''
pd.read_sql(query,con)
```




<div>

<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>id_cliente</th>
      <th>data_pedido</th>
      <th>status_pedido</th>
      <th>total</th>
      <th>num_pedido</th>
      <th>forma_pagamento</th>
      <th>cod_rastreio</th>
      <th>status_envio</th>
      <th>frete</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>2022-10-10</td>
      <td>Confirmado</td>
      <td>399.0</td>
      <td>123654</td>
      <td>Credito</td>
      <td>123987456</td>
      <td>Em trânsito</td>
      <td>30.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>2022-10-14</td>
      <td>Confirmado</td>
      <td>399.0</td>
      <td>13131313</td>
      <td>Pix</td>
      <td>852369741</td>
      <td>Saiu para entrega</td>
      <td>28.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>2022-10-14</td>
      <td>Em processamento</td>
      <td>3420.0</td>
      <td>24242424</td>
      <td>Boleto</td>
      <td>1122334455</td>
      <td>Aguardando</td>
      <td>20.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1</td>
      <td>2022-10-14</td>
      <td>Cancelado</td>
      <td>1400.0</td>
      <td>12121212</td>
      <td>Credito</td>
      <td>1122334455</td>
      <td>Aguardando</td>
      <td>20.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2</td>
      <td>2022-10-14</td>
      <td>Cancelado</td>
      <td>2000.0</td>
      <td>12365478</td>
      <td>Credito</td>
      <td>1122334455</td>
      <td>Aguardando</td>
      <td>20.0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>2</td>
      <td>2022-10-15</td>
      <td>Confirmado</td>
      <td>9590.0</td>
      <td>123654789</td>
      <td>Credito</td>
      <td>78965412</td>
      <td>Enviado</td>
      <td>35.0</td>
    </tr>
  </tbody>
</table>
</div>



### 8-Informe  endereço, responsável, o contato, a quantidade, o nome e categoria dos produtos em estoque com avaliação maior ou igual a 4 ordenado pela quantidade do maior para o menor.
<a id="ancora5.10"></a>
[voltar](#ancora)


```python
query='''
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
'''
pd.read_sql(query,con)
```




<div>

<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>endereço</th>
      <th>responsável</th>
      <th>telefone</th>
      <th>Qtd</th>
      <th>nome_produto</th>
      <th>categoria</th>
      <th>avaliação</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Curitiba - PR</td>
      <td>Takao K.</td>
      <td>41985749632</td>
      <td>2000</td>
      <td>Cesta_Basica</td>
      <td>Alimentos</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Rio de Janeiro - RJ</td>
      <td>João</td>
      <td>21965324123</td>
      <td>100</td>
      <td>Fraldas</td>
      <td>Vestimenta</td>
      <td>5.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>São Paulo - SP</td>
      <td>Laura Pausini</td>
      <td>11965324512</td>
      <td>50</td>
      <td>Monitor</td>
      <td>Eletrônico</td>
      <td>4.0</td>
    </tr>
  </tbody>
</table>
</div>



* *As informações de quantidade são do estoque inicial, não foram subtraídas dos pedidos e dos vendedores terceirizados*.

### 9-Informe todos os clientes que possuem cadastro com CPF utilizando a função if;
<a id="ancora5.11"></a>
[voltar](#ancora)


```python
query='''
SELECT 
    CONCAT(c.Pname, ' ', Lname) AS nome,
    IF(d.DocType = 'CPF',
        d.DocNum,
        'não é PF') AS PF
FROM
    Documentos d,
    Clientes c
WHERE
    c.idClient = d.fk_idClient;
'''
pd.read_sql(query,con)
```




<div>

<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>nome</th>
      <th>PF</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Julio Okuda</td>
      <td>não é PF</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Solange  Okita</td>
      <td>36985214785</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Lucas Yudy</td>
      <td>35795174123</td>
    </tr>
  </tbody>
</table>
</div>



* *Existem formas mais simples para realizar o filtro, achei interessante a função IF apenas para fins didatico.*

### 10-informe o total de pedidos por tipo de pagamento;
<a id="ancora5.12"></a>
[voltar](#ancora)


```python
query='''
SELECT 
    fp.Paytype AS tipo_pagamento, COUNT(*) AS qtd_pedidos
FROM
    pedidos p,
    formas_pagamentos fp
WHERE
    fp.id = p.fk_idPayType
GROUP BY (fp.PayType);
'''
pd.read_sql(query,con)
```




<div>

<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>tipo_pagamento</th>
      <th>qtd_pedidos</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Credito</td>
      <td>4</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Boleto</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Pix</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>



* *Tivemos 4 pedidos com cartão de crédito, 1 por boleto e 1 por Pix.*

### 11-Quais produtos o cliente de ordem =1 comprou?
<a id="ancora5.13"></a>
[voltar](#ancora)


```python
query='''
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
'''
display(pd.read_sql(query,con));
```


<div>

<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Nome</th>
      <th>Date</th>
      <th>NumberPayment</th>
      <th>Name</th>
      <th>preço</th>
      <th>pagamento</th>
      <th>qtd</th>
      <th>total</th>
      <th>Status</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Solange</td>
      <td>2022-10-15</td>
      <td>123654789</td>
      <td>Fraldas</td>
      <td>95.0</td>
      <td>Confirmado</td>
      <td>2</td>
      <td>190.0</td>
      <td>Disponível</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Solange</td>
      <td>2022-10-15</td>
      <td>123654789</td>
      <td>Monitor</td>
      <td>2000.0</td>
      <td>Confirmado</td>
      <td>4</td>
      <td>8000.0</td>
      <td>Disponível</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Solange</td>
      <td>2022-10-15</td>
      <td>123654789</td>
      <td>Sofá</td>
      <td>1400.0</td>
      <td>Confirmado</td>
      <td>1</td>
      <td>1400.0</td>
      <td>Disponível</td>
    </tr>
  </tbody>
</table>
</div>


* *Assim podemos confirmar que o cliente pode comprar mais de um produto em um único pedido.*
