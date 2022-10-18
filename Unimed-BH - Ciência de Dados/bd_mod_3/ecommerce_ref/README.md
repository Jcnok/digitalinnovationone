# Desafio - Projeto de Banco de Dados E-Commerce refinado.

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/bd_mod_3/ecommerce_ref/ecommerce2.jpg?raw=true)

* **Este projeto faz parte da trilha “Unimed-BH-Ciência de dados” disponibilizada pela [DIO](https://www.dio.me/).**
* **O Desafio consiste na modelagem de um bando de dados para o cenário de um e-commerce, script sql para criação do schema, persistência e realização de testes utilizando queries para responder determinadas perguntas que serão elaboradas ao final do desafio.**
* **Ao navegar pelo índice, é possível visualizar todo o passo-à-passo realizado durante a elaboração do projeto.**
* **Todos os scripts estão disponibilizados neste repositório, para um eventual estudo ou replicação, vale ressaltar que intuito do conteúdo é apenas didático, a fim de demonstrar todo o conhecimento adquirido durante o aprendizado, ou seja, o conteúdo aqui disponibilizado não abrange um banco de dados para um cenário real.**


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
* [Entendimento do Negócio](#ancora5)


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

### INSERT INTO Clientes
<a id="ancora4.1"></a>
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
INSERT INTO `entregas` (`Cod`, `Status`, `ShipValue`) VALUES ('123987456', 'Em trânsito', '50');
INSERT INTO `entregas` (`Cod`, `Status`, `ShipValue`) VALUES ('852369741', 'Saiu para entrega', '28');
INSERT INTO `entregas` (`Cod`, `Status`, `ShipValue`) VALUES ('123654852', 'Entregue', '25');'''
```

### INSERT INTO CreditCards
<a id="ancora4.3"></a>
[voltar](#ancora)


```python
'''-- 3 Inserindo registros na tabela cartão de crédito --
INSERT INTO `creditcards` (`Name`, `Number`, `Flag`, `ExpDate`,`fk_idClient`) VALUES ('Julio C. Okuda', '123456789321456', 'Visa', '10-01-25', '1');
INSERT INTO `creditcards` (`Name`, `Number`, `Flag`, `ExpDate`,`fk_idClient`) VALUES ('Solange M Okita', '3579514852', 'Master', '01-02-24', '2');
INSERT INTO `creditcards` (`Name`, `Number`, `Flag`, `ExpDate`,`fk_idClient`) VALUES ('Solange M Okita', '3579518888', 'Visa', '01-05-25', '2');
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
INSERT INTO `pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `fk_idCreditCard`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('2', '1', '1', '2', 'Confirmado', 'utilizou cartão master', '9590', '15-10-22', '123654789');
INSERT INTO `pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('1', '2', '3', 'Confirmado', 'Pagou com Pix a vista', '20', '10-10-22', '13131313');
INSERT INTO `pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('3', '3', '2', 'Em Processamento', 'Aguardando o boleto ser processado', '3420', '14-10-22', '24242424');
INSERT INTO `pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `fk_idCreditCard`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('1', '4', '1', '1', 'Cancelado', 'Cancelou o pedido-cartão', '1400', '14-10-22', '12121212');
INSERT INTO `pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `fk_idCreditCard`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('2', '1', '1', '3', 'Cancelado', 'utilizou cartão visa', '2000', '14-10-22', '12365478');
INSERT INTO `pedidos` (`fk_idClient`, `fk_idDeliver`, `fk_idPayType`, `fk_idCreditCard`, `Status`, `Description`, `TotalValue`, `Date`, `NumberPayment`) VALUES ('1', '1', '1', '3', 'Confirmado', 'cartão', '20', '10-10-22', '123654');
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
INSERT INTO `produtos` (`Name`, `ClassKids`, `Category`, `Size`, `Rating`, `Price`) VALUES ('Arroz', '0', 'Alimentos', '5kg', '4', '20');'''
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
INSERT INTO `produtos_terceiros` (`fk_idSeller`, `fk_idProduct`, `Qtd`) VALUES ('4', '1', '100');'''
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

[voltar](#ancora)
