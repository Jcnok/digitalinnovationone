-- -----------------------------------------------------
-- Schema ecommerce_refinado
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ecommerce_refinado` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `ecommerce_refinado` ;

-- -----------------------------------------------------
-- Table `ecommerce_refinado`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_refinado`.`Clientes` (
  `idClient` INT NOT NULL AUTO_INCREMENT COMMENT 'id do cliente é do tipo único e auto incrementável.',
  `Pname` VARCHAR(10) NOT NULL COMMENT 'Correponde ao primeiro nome do clieinte é um dipo caractere obrigatório.',
  `Minit` CHAR(3) NULL COMMENT 'Corresponde a inicial do nome do meio é do tipo char(3).',
  `Lname` VARCHAR(20) NOT NULL COMMENT 'Corresponde ao Sobrenome do cliente, campo tipo caractere obrigatório.',
  `Address` VARCHAR(100) NOT NULL COMMENT 'Endereço do cliente, campo deve ser obrigatório.',
  `phone` VARCHAR(15) NOT NULL COMMENT 'Telefone do cliente, o campo deve ser do tipo caractare e obrigatório.',
  PRIMARY KEY (`idClient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce_refinado`.`Entregas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_refinado`.`Entregas` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'id de entrega - auto incremento e chave primaria.',
  `Cod` INT NOT NULL COMMENT 'Códido do rastreio da empresa que irá efetuar a logistica.',
  `Status` ENUM('Aguardando', 'Em preparação', 'Enviado', 'Em trânsito', 'Saiu para entrega', 'Entregue') NOT NULL DEFAULT 'Aguardando' COMMENT 'Status da entrega.(\'Aguardando\',\'Em preparação\', \'Enviado\', \'Em trânsito\', \'Saiu para entrega\', \'Entregue\') com padrão \'Aguardando\'',
  `ShipValue` FLOAT NOT NULL DEFAULT 0 COMMENT 'Valor do frete, por padrão 0.00 - tipo float e not null.',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce_refinado`.`CreditCards`
-- -----------------------------------------------------
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce_refinado`.`Formas_Pagamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_refinado`.`Formas_Pagamentos` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Id da forma de pagamento, chave primária auto incremento.',
  `PayType` VARCHAR(45) NOT NULL DEFAULT 'Pix' COMMENT 'Tipo de Pagamento. Padrão Pix.\nex: Cartão, Boleto, Débito.',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `PayType_UNIQUE` (`PayType` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce_refinado`.`Pedidos`
-- -----------------------------------------------------
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce_refinado`.`Produtos`
-- -----------------------------------------------------
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


-- -----------------------------------------------------
-- Table `ecommerce_refinado`.`Fornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_refinado`.`Fornecedores` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Id do Fornecedor o campo deve ser chave primária e auto incremento.',
  `SocialName` VARCHAR(255) NOT NULL COMMENT 'Razão Social não pode ser nulo.',
  `CNPJ` CHAR(15) NOT NULL COMMENT 'CNPJ da empresa - tipo char(15) não pode ser nulo e dever ser do tipo único.',
  `Contact` CHAR(11) NOT NULL COMMENT 'Telefone - tipo char(11) não pode ser nulo.',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC) VISIBLE,
  UNIQUE INDEX `idFornecedor_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce_refinado`.`Fornecedores_Produtos`
-- -----------------------------------------------------
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


-- -----------------------------------------------------
-- Table `ecommerce_refinado`.`Estoques`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_refinado`.`Estoques` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'id do estoque, tipo auto incremento - chave primárial.',
  `Local` VARCHAR(255) NOT NULL COMMENT 'Endereço - não pode ser nulo.',
  `Name` VARCHAR(50) NULL DEFAULT 0 COMMENT 'Nome do responsável',
  `Contact` CHAR(11) NULL COMMENT 'Telefone de Contato.',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce_refinado`.`Produtos_Estoques`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_refinado`.`Produtos_Estoques` (
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce_refinado`.`Pedidos_Produtos`
-- -----------------------------------------------------
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce_refinado`.`Vendedores`
-- -----------------------------------------------------
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce_refinado`.`Produtos_Terceiros`
-- -----------------------------------------------------
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce_refinado`.`Documentos`
-- -----------------------------------------------------
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
ENGINE = InnoDB;

