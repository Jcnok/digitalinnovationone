# Desafio - Projeto de Banco de Dados Oficina Mecânica.

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/bd_mod_3/desafio_oficina_mecanica/OIUFTH0.png?raw=true)

* **Este projeto faz parte da trilha “Unimed-BH-Ciência de dados” disponibilizada pela [DIO](https://www.dio.me/).**
* **O Desafio consiste na modelagem de um banco de dados para o cenário de uma oficina mecânica, script sql para criação do schema, persistência e realização de testes utilizando queries para responder determinadas perguntas que serão elaboradas ao final do desafio.**
* **Ao navegar pelo índice, é possível visualizar todo o passo-à-passo realizado durante a elaboração do projeto.**
* **Todos os scripts estão disponibilizados neste repositório, para um eventual estudo ou replicação, vale ressaltar o que intuito do conteúdo é apenas didático, com o propósito de demonstrar todo o conhecimento adquirido durante o aprendizado, ou seja, o conteúdo aqui disponibilizado apesar de similar, não abrange um banco de dados para um cenário real.**
* **Foram utilizados os Softwares: Workbench para a modelagem, Mysql para o BD, além do Jupyter Notebook(Anaconda) e as bibliotecas 'mysql.connector' para conexão com o banco de dados e o 'pandas' para melhor exibição das tabelas e seus resultados.**


<a name="ancora"></a>
# Índice
* [Contexto](#ancora1)
    * [Ordem de Serviço](#ancora1.1)
    * [Clientes](#ancora1.2)
    * [Veículo](#ancora1.3)
    * [Equipe](#ancora1.4)
    * [Mecânicos](#ancora1.5)
    * [Tabela de Serviços](#ancora1.6)
    
* [Mapeamento do Diagrama ER](#ancora2)

* [Script SQL para criação do esquema do banco de dados](#ancora3)
    * [Criando o SCHEMA](#ancora3.1)
    * [Tabela Serviço](#ancora3.2)
    * [Tabela Peça](#ancora3.3)
    * [Tabela Equipe](#ancora3.4)
    * [Tabela Cliente_PJ](#ancora3.5)
    * [Tabela Cliente_PF](#ancora3.6)
    * [Tabela Veiculo](#ancora3.7)
    * [Tabela Orçamento](#ancora3.8)
    * [Tabela OS](#ancora3.9)
    * [Tabela Funcionario](#ancora3.10)
    * [Tabela Equipe_Orçamento](#ancora3.11)
    * [Tabela Serviço_Peça](#ancora3.12)       
        
* [Script SQL para Persistir Registros no BD.](#ancora4)
    * [Tabela cliente_pf.](#ancora4.2)
    * [Tabela cliente_pj.](#ancora4.3)
    * [Tabela veiculo.](#ancora4.4)
    * [Tabela orçamento.](#ancora4.5)
    * [Tabela equipe.](#ancora4.6)
    * [Tabela funcionario.](#ancora4.7)
    * [Tabela equipe_orçamento.](#ancora4.8)
    * [Tabela peça.](#ancora4.9)
    * [Tabela serviço.](#ancora4.10)
    * [Tabela serviço_peça.](#ancora4.11)
    * [Tabela OS.](#ancora4.12)    
    
* [Script SQL para consultas(Queries)](#ancora5)
    * [Realizando a conexão com o Banco de Dados.](#ancora5.2)
    * [1-Consulta_1](#ancora5.3)
    * [2-Consulta_2](#ancora5.4)
    * [3-Consulta_3](#ancora5.5)
    * [4-Consulta_4](#ancora5.6)
    * [5-Consulta_5](#ancora5.7)
    * [6-Consulta_6](#ancora5.8)
    * [7-Consulta_7](#ancora5.9)
    * [8-Consulta_8](#ancora5.10)
    * [9-Consulta_9](#ancora5.11)
    * [10-Consulta_10](#ancora5.12)
    * [11-Consulta_11](#ancora5.13)
    * [12-Consulta_12](#ancora5.14)
    * [13-Consulta_13](#ancora5.15)
    * [14-Consulta_14](#ancora5.16)
    * [15-Consulta_15](#ancora5.17)
    


<a name="ancora"></a>

## Contexto.
<a id="ancora1"></a>
[voltar](#ancora)

* Etapas:
    * 1-O cliente realiza o cadastro com o atendente;
    * 2-O cliente realiza o cadastro do veículo com o atendente;
    * 3-O atendente atribui uma equipe ao veículo;
    * 4-A equipe realiza as devidas verificações e incluí os serviços e peças necessárias;
    * 5-O atendente confere e entrega ao cliente o orçamento com a sua validade e prazo estimado;
    * 6-O cliente autoriza ou não os reparos ou revisões;
    * 7-O atendente direciona os orçamentos aceitos à equipe responsável, que executa os serviços e realiza a baixa das peças a serem utilizadas;
    * 8-A equipe emite a OS com os dados necessários;
    * 9-O atendente informa ao cliente para realizar os devidos testes, forma de pagamento, garantia etc...
    
* Para o Desafio foram solicitados alguns requisitos minimos conforme os levantamentos abaixo.    

### Ordem de Serviço
<a id="ancora1.1"></a>
[voltar](#ancora)

* Deve ser vinculada a um tipo de trabalho a ser executado (conserto ou revisão).
* Valor do serviço.
* Cada peça tambem irá compor a OS.
* Numero, data de emissão, valor, status e data para conclusão dos trabalhos.
* Pode ser composta por vários serviços e um mesmo serviço pode estar contido em mais de uma OS.
* Uma OS pode ter vários tipos de peças e uma peça pode estar presente em mais de uma OS.

### Clientes
<a id="ancora1.2"></a>
[voltar](#ancora)

* O cliente pode ser PF ou PJ.
* O cliente pode ter mais de um veículo.
* O cliente Autoriza ou não a execução dos serviços.

### Veículo
<a id="ancora1.3"></a>
[voltar](#ancora)

* O veículo pode ser de clientes PJ ou PFs.
* O mesmo veículo pode possuir vários clientes, em caso de venda, transferência etc...
* Não podem haver veículos com a mesma placa.

### Equipe
<a id="ancora1.4"></a>
[voltar](#ancora)

* Possuir o numero de funcionários da equipe em questão.
* Cada um executa uma tarefa - especialidade etc...
* A Equipe(líder) deve Preencher o Orçamento com as peças e mão de obra ou revisão.
* A Equipe(líder) deve Preencher a OS com data de entrega.

### Mecânicos
<a id="ancora1.5"></a>
[voltar](#ancora)

* Possuir o código, nome, especialidade do funcionário.

### Tabela de Serviços
<a id="ancora1.6"></a>
[voltar](#ancora)

* Possuir Tipo de serviço a ser executado, valor do serviço, peças utilizadas, tempo de entrega do serviço.


```python

```

## Mapeamento do Diagrama ER.
<a id="ancora2"></a>
[voltar](#ancora)

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/bd_mod_3/desafio_oficina_mecanica/oficina_mecanica.png?raw=true)

## Script SQL para criação do esquema do banco de dados.
<a id="ancora3"></a>
[voltar](#ancora)


```python
#importação das bibliotecas para conexão com o banco de dados mysql.
import mysql.connector
import pandas as pd
import warnings
warnings.filterwarnings('ignore')
```


```python
# Realizando a conexão e visualizando os databases;
con = mysql.connector.connect(host='localhost',user='julio',password='')
cursor = con.cursor()
cursor.execute('SHOW databases')
for i in cursor:
  print(i)
```

    ('company',)
    ('company_constraints',)
    ('e-commerce-ref',)
    ('e_commerce_ref',)
    ('ecommerce',)
    ('ecommerce_refinado',)
    ('first_example',)
    ('information_schema',)
    ('manipulation',)
    ('mydb',)
    ('mysql',)
    ('performance_schema',)
    ('sakila',)
    ('sys',)
    ('world',)
    

### Criando o SCHEMA:
<a id="ancora3.1"></a>
[voltar](#ancora)


```python
# Criando o schema oficina_mec;
criar='''
CREATE SCHEMA IF NOT EXISTS `oficina_mec` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;'''
con = mysql.connector.connect(host='localhost',user='julio',password='')
cursor = con.cursor()
cursor.execute(criar)
cursor.execute('SHOW databases')
for i in cursor:
  print(i)
```

    ('company',)
    ('company_constraints',)
    ('e-commerce-ref',)
    ('e_commerce_ref',)
    ('ecommerce',)
    ('ecommerce_refinado',)
    ('first_example',)
    ('information_schema',)
    ('manipulation',)
    ('mydb',)
    ('mysql',)
    ('oficina_mec',)
    ('performance_schema',)
    ('sakila',)
    ('sys',)
    ('world',)
    


```python
# Conectando ao database oficina_me recém criada
con = mysql.connector.connect(host='localhost',database='oficina_mec',user='julio',password='')
cursor = con.cursor()
```

### Tabela Serviço
<a id="ancora3.2"></a>
[voltar](#ancora)


```python
# Criando a tabela de Serviços;
criar='''
CREATE TABLE IF NOT EXISTS `oficina_mec`.`Serviço` (
  `idServiço` INT NOT NULL AUTO_INCREMENT,
  `Tipo do Serviço` ENUM('Manutenção', 'Revisão') NOT NULL DEFAULT 'Revisão',
  `Nome_Serviço` VARCHAR(45) NOT NULL,
  `Duração` INT NOT NULL,
  `Descrição` VARCHAR(255) NOT NULL,
  `Mão_de_Obra` FLOAT(9,2) NOT NULL,
  PRIMARY KEY (`idServiço`),
  UNIQUE INDEX `idServiço_UNIQUE` (`idServiço` ASC) VISIBLE)
ENGINE = InnoDB;'''
cursor.execute(criar)
cursor.execute('SHOW tables')
for i in cursor:
  print(i)
```

    ('serviço',)
    

### Tabela Peça
<a id="ancora3.3"></a>
[voltar](#ancora)


```python
#Criando a tabela de peças;
criar='''
CREATE TABLE IF NOT EXISTS `oficina_mec`.`Peça` (
  `idPeça` INT NOT NULL AUTO_INCREMENT,
  `Nome_peça` VARCHAR(45) NOT NULL,
  `Descrição` VARCHAR(45) NOT NULL,
  `Quantidade_Disponível` INT NOT NULL,
  `Valor_Unitário` FLOAT(9,2) NOT NULL,
  PRIMARY KEY (`idPeça`),
  UNIQUE INDEX `idEstoque_UNIQUE` (`idPeça` ASC) VISIBLE)
ENGINE = InnoDB;'''
cursor.execute(criar)
cursor.execute('SHOW tables')
for i in cursor:
  print(i)
```

    ('peça',)
    ('serviço',)
    

### Tabela Equipe
<a id="ancora3.4"></a>
[voltar](#ancora)


```python
# Criando a tabela de Equipes;
criar='''
CREATE TABLE IF NOT EXISTS `oficina_mec`.`Equipe` (
  `idEquipe` INT NOT NULL AUTO_INCREMENT,
  `Num_Func` INT NOT NULL COMMENT 'Numero de Funcionários.',
  `Equipe` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEquipe`),
  UNIQUE INDEX `idEquipes_UNIQUE` (`idEquipe` ASC) VISIBLE)
ENGINE = InnoDB;'''
cursor.execute(criar)
cursor.execute('SHOW tables')
for i in cursor:
  print(i)
```

    ('equipe',)
    ('peça',)
    ('serviço',)
    

### Tabela Cliente_PJ
<a id="ancora3.5"></a>
[voltar](#ancora)


```python
#Criando a tabel de Clientes pessoa Juridica;
criar='''
CREATE TABLE IF NOT EXISTS `oficina_mec`.`Cliente_PJ` (
  `idCliente_PJ` INT NOT NULL AUTO_INCREMENT,
  `Razão_Social` VARCHAR(45) NOT NULL,
  `Nome_Fantasia` VARCHAR(45) NOT NULL,
  `CNPJ` CHAR(15) NOT NULL,
  `Responsavel` VARCHAR(45) NOT NULL,
  `Data Cadastro` DATE NOT NULL,
  `Telefone` VARCHAR(11) NOT NULL,
  `E-mail` VARCHAR(45) NULL,
  `Endereço` VARCHAR(255) NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Estado` CHAR(2) NOT NULL,
  PRIMARY KEY (`idCliente_PJ`),
  UNIQUE INDEX `idCliente PJ_UNIQUE` (`idCliente_PJ` ASC) VISIBLE,
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC) VISIBLE)
ENGINE = InnoDB;'''
cursor.execute(criar)
cursor.execute('SHOW tables')
for i in cursor:
  print(i)
```

    ('cliente_pj',)
    ('equipe',)
    ('peça',)
    ('serviço',)
    

### Tabela Cliente_PF
<a id="ancora3.6"></a>
[voltar](#ancora)


```python
# Criando a tabela de Clientes Pessoa Física
criar='''
CREATE TABLE IF NOT EXISTS `oficina_mec`.`Cliente_PF` (
  `idCliente_PF` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `CPF` CHAR(11) NOT NULL,
  `Data_Nasc` DATE NOT NULL,
  `Data Cadastro` DATE NOT NULL,
  `Telefone` VARCHAR(11) NOT NULL,
  `E-mail` VARCHAR(45) NULL,
  `Endereço` VARCHAR(255) NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Estado` CHAR(2) NOT NULL,
  PRIMARY KEY (`idCliente_PF`),
  UNIQUE INDEX `idCliente PF_UNIQUE` (`idCliente_PF` ASC) VISIBLE,
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE)
ENGINE = InnoDB;'''
cursor.execute(criar)
cursor.execute('SHOW tables')
for i in cursor:
  print(i)
```

    ('cliente_pf',)
    ('cliente_pj',)
    ('equipe',)
    ('peça',)
    ('serviço',)
    

### Tabela Veiculo
<a id="ancora3.7"></a>
[voltar](#ancora)


```python
# Criando a tabela Veículos;
criar='''
CREATE TABLE IF NOT EXISTS `oficina_mec`.`Veiculo` (
  `idVeiculo` INT NOT NULL AUTO_INCREMENT,
  `Tipo de Veiculo` VARCHAR(45) NOT NULL,
  `Placa` VARCHAR(45) NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `Modelo` VARCHAR(45) NOT NULL,
  `Ano` INT NOT NULL,
  `KM` VARCHAR(7) NOT NULL,
  `fk_idCliente_PJ` INT NULL,
  `fk_idCliente_PF` INT NULL,
  PRIMARY KEY (`idVeiculo`),
  UNIQUE INDEX `idVeiculo_UNIQUE` (`idVeiculo` ASC) VISIBLE,
  UNIQUE INDEX `Placa_UNIQUE` (`Placa` ASC) VISIBLE,
  INDEX `fk_Veiculo_Cliente_ PJ1_idx` (`fk_idCliente_PJ` ASC) VISIBLE,
  INDEX `fk_Veiculo_Cliente_PF1_idx` (`fk_idCliente_PF` ASC) VISIBLE,
  CONSTRAINT `fk_Veiculo_Cliente_ PJ1`
    FOREIGN KEY (`fk_idCliente_PJ`)
    REFERENCES `oficina_mec`.`Cliente_PJ` (`idCliente_PJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Veiculo_Cliente_PF1`
    FOREIGN KEY (`fk_idCliente_PF`)
    REFERENCES `oficina_mec`.`Cliente_PF` (`idCliente_PF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
'''
cursor.execute(criar)
cursor.execute('SHOW tables')
for i in cursor:
  print(i)
```

    ('cliente_pf',)
    ('cliente_pj',)
    ('equipe',)
    ('peça',)
    ('serviço',)
    ('veiculo',)
    

### Tabela Orçamento
<a id="ancora3.8"></a>
[voltar](#ancora)


```python
#Criando a tabela de orçamentos;
criar='''
CREATE TABLE IF NOT EXISTS `oficina_mec`.`Orçamento` (
  `idOrçamento` INT NOT NULL AUTO_INCREMENT,
  `Numero_Orçamento` VARCHAR(45) NOT NULL,
  `Aprovado` ENUM('SIM', 'NÃO') NOT NULL DEFAULT 'NÃO' COMMENT 'Aprovado pelo Cliente',
  `Valor` FLOAT(9,2) NOT NULL COMMENT 'Valor total do orçamento peça + mão de obra',
  `Data` DATE NOT NULL COMMENT 'Data do Orçamento.',
  `Validade` VARCHAR(45) NOT NULL,
  `fk_idVeiculo` INT NOT NULL,
  `Cod_Funcionário` INT NOT NULL COMMENT 'Código do funcionário que emitiu o orçamento',
  PRIMARY KEY (`idOrçamento`, `fk_idVeiculo`),
  UNIQUE INDEX `idOrçamento_UNIQUE` (`idOrçamento` ASC) VISIBLE,
  UNIQUE INDEX `Numero do Orçamento_UNIQUE` (`Numero_Orçamento` ASC) VISIBLE,
  INDEX `fk_Orçamento_Veiculo1_idx` (`fk_idVeiculo` ASC) VISIBLE,
  CONSTRAINT `fk_Orçamento_Veiculo1`
    FOREIGN KEY (`fk_idVeiculo`)
    REFERENCES `oficina_mec`.`Veiculo` (`idVeiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;'''
cursor.execute(criar)
cursor.execute('SHOW tables')
for i in cursor:
  print(i)
```

    ('cliente_pf',)
    ('cliente_pj',)
    ('equipe',)
    ('orçamento',)
    ('peça',)
    ('serviço',)
    ('veiculo',)
    

### Tabela OS
<a id="ancora3.9"></a>
[voltar](#ancora)


```python
#Criando a tabela de Ordem de Serviço;
criar='''
CREATE TABLE IF NOT EXISTS `oficina_mec`.`OS` (
  `idOrdem` INT NOT NULL AUTO_INCREMENT,
  `Numero` INT NOT NULL,
  `Data_Emissão` DATE NOT NULL,
  `Desconto` FLOAT(9,2) NOT NULL DEFAULT 5.0 COMMENT 'Desconto padrão 5%, à vista 10%.',
  `Data_Conclusão` DATE NOT NULL,
  `Obs` VARCHAR(255) NULL,
  `fk_idOrçamento` INT NOT NULL,
  `Forma_Pagamento` ENUM('Crédito', 'Débito', 'Dinheiro') NOT NULL DEFAULT 'Débito',
  PRIMARY KEY (`idOrdem`, `fk_idOrçamento`),
  INDEX `fk_Ordem de Serviço_Orçamento1_idx` (`fk_idOrçamento` ASC) VISIBLE,
  UNIQUE INDEX `idOrdem_UNIQUE` (`idOrdem` ASC) VISIBLE,
  CONSTRAINT `fk_Ordem de Serviço_Orçamento1`
    FOREIGN KEY (`fk_idOrçamento`)
    REFERENCES `oficina_mec`.`Orçamento` (`idOrçamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
'''
cursor.execute(criar)
cursor.execute('SHOW tables')
for i in cursor:
  print(i)
```

    ('cliente_pf',)
    ('cliente_pj',)
    ('equipe',)
    ('orçamento',)
    ('os',)
    ('peça',)
    ('serviço',)
    ('veiculo',)
    

### Tabela Funcionario
<a id="ancora3.10"></a>
[voltar](#ancora)


```python
# Criando a tabela de Funcionários;
criar='''
CREATE TABLE IF NOT EXISTS `oficina_mec`.`Funcionario` (
  `idFunc` INT NOT NULL AUTO_INCREMENT,
  `fk_idEquipe` INT NOT NULL,
  `Código` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `CPF` CHAR(11) NOT NULL,
  `data_nasc` DATE NOT NULL COMMENT 'data do nascimento.',
  `Endereço` VARCHAR(45) NOT NULL,
  `Cargo` VARCHAR(45) NOT NULL,
  `Especialidade` VARCHAR(45) NOT NULL,
  `Contratação` DATE NOT NULL COMMENT 'data da contratação',
  `Telefone` INT NOT NULL,
  `E-mail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFunc`, `fk_idEquipe`),
  INDEX `fk_Funcionarios_Equipes1_idx` (`fk_idEquipe` ASC) VISIBLE,
  UNIQUE INDEX `idFunc_UNIQUE` (`idFunc` ASC) VISIBLE,
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionarios_Equipes1`
    FOREIGN KEY (`fk_idEquipe`)
    REFERENCES `oficina_mec`.`Equipe` (`idEquipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
'''
cursor.execute(criar)
cursor.execute('SHOW tables')
for i in cursor:
  print(i)
```

    ('cliente_pf',)
    ('cliente_pj',)
    ('equipe',)
    ('funcionario',)
    ('orçamento',)
    ('os',)
    ('peça',)
    ('serviço',)
    ('veiculo',)
    

### Tabela Equipe_Orçamento
<a id="ancora3.11"></a>
[voltar](#ancora)


```python
# Criando a tabela de equipe/orçamento;
criar='''
CREATE TABLE IF NOT EXISTS `oficina_mec`.`Equipe_Orçamento` (
  `fk_idEquipe` INT NOT NULL,
  `fk_idOrçamento` INT NOT NULL,
  PRIMARY KEY (`fk_idEquipe`, `fk_idOrçamento`),
  INDEX `fk_Equipe_has_Orçamento_Orçamento1_idx` (`fk_idOrçamento` ASC) VISIBLE,
  INDEX `fk_Equipe_has_Orçamento_Equipe1_idx` (`fk_idEquipe` ASC) VISIBLE,
  CONSTRAINT `fk_Equipe_has_Orçamento_Equipe1`
    FOREIGN KEY (`fk_idEquipe`)
    REFERENCES `oficina_mec`.`Equipe` (`idEquipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Equipe_has_Orçamento_Orçamento1`
    FOREIGN KEY (`fk_idOrçamento`)
    REFERENCES `oficina_mec`.`Orçamento` (`idOrçamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;'''
cursor.execute(criar)
cursor.execute('SHOW tables')
for i in cursor:
  print(i)
```

    ('cliente_pf',)
    ('cliente_pj',)
    ('equipe',)
    ('equipe_orçamento',)
    ('funcionario',)
    ('orçamento',)
    ('os',)
    ('peça',)
    ('serviço',)
    ('veiculo',)
    

### Tabela Serviço_Peça
<a id="ancora3.12"></a>
[voltar](#ancora)


```python
#Criando a tabela Serviços/Peças;
criar='''
CREATE TABLE IF NOT EXISTS `oficina_mec`.`Serviço_Peça` (
  `fk_idOrçamento` INT NOT NULL,
  `fk_idServiço` INT NOT NULL,
  `fk_idPeça` INT NOT NULL,
  `Qtd_Peça` INT NOT NULL,
  `Qtd_Serviço` INT NOT NULL,
  PRIMARY KEY (`fk_idOrçamento`, `fk_idServiço`, `fk_idPeça`),
  INDEX `fk_Serviço_has_Peça_Peça1_idx` (`fk_idPeça` ASC) VISIBLE,
  INDEX `fk_Serviço_has_Peça_Serviço1_idx` (`fk_idServiço` ASC) VISIBLE,
  INDEX `fk_Serviço_Peça_Orçamento1_idx` (`fk_idOrçamento` ASC) VISIBLE,
  CONSTRAINT `fk_Serviço_has_Peça_Serviço1`
    FOREIGN KEY (`fk_idServiço`)
    REFERENCES `oficina_mec`.`Serviço` (`idServiço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Serviço_has_Peça_Peça1`
    FOREIGN KEY (`fk_idPeça`)
    REFERENCES `oficina_mec`.`Peça` (`idPeça`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Serviço_Peça_Orçamento1`
    FOREIGN KEY (`fk_idOrçamento`)
    REFERENCES `oficina_mec`.`Orçamento` (`idOrçamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;'''
cursor.execute(criar)
cursor.execute('SHOW tables')
for i in cursor:
  print(i)
```

    ('cliente_pf',)
    ('cliente_pj',)
    ('equipe',)
    ('equipe_orçamento',)
    ('funcionario',)
    ('orçamento',)
    ('os',)
    ('peça',)
    ('serviço',)
    ('serviço_peça',)
    ('veiculo',)
    

## Script SQL para Persistir Registros no BD.
<a id="ancora4"></a>
[voltar](#ancora)

* **Realizando a conexão com o banco de dados e visualizando as tabelas que foram criadas**.


```python
# Realizando a conexão e visualizando as tabelas recém criadas;
con = mysql.connector.connect(host='localhost',database='oficina_mec',user='julio',password='')
cursor = con.cursor()
cursor.execute('SHOW tables')
for i in cursor:
  print(i)
```

    ('cliente_pf',)
    ('cliente_pj',)
    ('equipe',)
    ('equipe_orçamento',)
    ('funcionario',)
    ('orçamento',)
    ('os',)
    ('peça',)
    ('serviço',)
    ('serviço_peça',)
    ('veiculo',)
    

* **As 11 tabelas foram criadas corretamente, agora vamos persistir algumas informações para realizarmos os testes com as queries.**


```python
#cursor.execute('delete from `oficina_mec`.`serviço_peça`;'); # deleta uma tabela
#cursor.execute('alter table `oficina_mec`.`serviço_peça` auto_increment=1;'); # reseta o auto incremento
```

### Tabela cliente_pf.
<a id="ancora4.1"></a>
[voltar](#ancora)


```python
#-- 1 inserindo registros na tabela cliente_pf --
inserir='''
INSERT INTO `oficina_mec`.`cliente_pf` (`Nome`, `CPF`, `Data_Nasc`, `Data Cadastro`, `Telefone`, `E-mail`, `Endereço`, `Cidade`, `Estado`) VALUES 
                                       ('Julio Cesar', '12345678945', '79-11-06', '22-10-20', '119857412', 'julio.okuda@gmail.com', 'r. gal edson figueira, 222', 'São Paulo', 'SP'),
                                       ('Roberto', '96325874589', '76-04-21', '22-10-20', '679562345', 'roberto@gmail.com', 'r. Batista de azevedo, 1114', 'Ponta Porã', 'MS');
'''
cursor.execute(inserir) # inserir os dados
query='''select * from `oficina_mec`.`cliente_pf`;''' 
pd.read_sql(query,con) # Visualizar os dados inseridos em formato de dataframe.

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>idCliente_PF</th>
      <th>Nome</th>
      <th>CPF</th>
      <th>Data_Nasc</th>
      <th>Data Cadastro</th>
      <th>Telefone</th>
      <th>E-mail</th>
      <th>Endereço</th>
      <th>Cidade</th>
      <th>Estado</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Julio Cesar</td>
      <td>12345678945</td>
      <td>1979-11-06</td>
      <td>2022-10-20</td>
      <td>119857412</td>
      <td>julio.okuda@gmail.com</td>
      <td>r. gal edson figueira, 222</td>
      <td>São Paulo</td>
      <td>SP</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Roberto</td>
      <td>96325874589</td>
      <td>1976-04-21</td>
      <td>2022-10-20</td>
      <td>679562345</td>
      <td>roberto@gmail.com</td>
      <td>r. Batista de azevedo, 1114</td>
      <td>Ponta Porã</td>
      <td>MS</td>
    </tr>
  </tbody>
</table>
</div>



### Tabela cliente_pj.
<a id="ancora4.2"></a>
[voltar](#ancora)


```python
# -- 2 Inserindo registros na tabela cliente_pj -- 
inserir='''
INSERT INTO `oficina_mec`.`cliente_pj` (`Razão_Social`, `Nome_Fantasia`, `CNPJ`, `Responsavel`, `Data Cadastro`, `Telefone`, `E-mail`, `Endereço`, `Cidade`, `Estado`) VALUES
                                       ('Nihontech ltda', 'Nihonte', '123654789654123', 'Julio', '22-10-20', '119236589', 'nihontech@gmail.com', 'r. batista de azevedo, 1105', 'São Paulo', 'SP'),
                                       ('Kibon', 'Kibon', '369852147896541', 'Gustavo', '22-10-10', '213698521', 'vendedor@kibon.com', 'av. jucelino, 1500', 'Rio de Janeiro', 'RJ');
'''
cursor.execute(inserir) # inserindo os registros
query='''select * from `oficina_mec`.`cliente_pj`;''' 
pd.read_sql(query,con) # Visualizar os dados inseridos em formato de dataframe.
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>idCliente_PJ</th>
      <th>Razão_Social</th>
      <th>Nome_Fantasia</th>
      <th>CNPJ</th>
      <th>Responsavel</th>
      <th>Data Cadastro</th>
      <th>Telefone</th>
      <th>E-mail</th>
      <th>Endereço</th>
      <th>Cidade</th>
      <th>Estado</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Nihontech ltda</td>
      <td>Nihonte</td>
      <td>123654789654123</td>
      <td>Julio</td>
      <td>2022-10-20</td>
      <td>119236589</td>
      <td>nihontech@gmail.com</td>
      <td>r. batista de azevedo, 1105</td>
      <td>São Paulo</td>
      <td>SP</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Kibon</td>
      <td>Kibon</td>
      <td>369852147896541</td>
      <td>Gustavo</td>
      <td>2022-10-10</td>
      <td>213698521</td>
      <td>vendedor@kibon.com</td>
      <td>av. jucelino, 1500</td>
      <td>Rio de Janeiro</td>
      <td>RJ</td>
    </tr>
  </tbody>
</table>
</div>



### Tabela veiculo.
<a id="ancora4.3"></a>
[voltar](#ancora)


```python
# 3-- Inserindo registros na tabela veiculo --
inserir='''
INSERT INTO `oficina_mec`.`veiculo` (`Tipo de Veiculo`, `Placa`, `Marca`, `Modelo`, `Ano`, `KM`, `fk_idCliente_PJ`, `fk_idCliente_PF`) VALUES 
                                    ('Sedã', 'eqc2115', 'Renault', 'Logan', '2020', '85.000',1,NULL),
                                    ('hatch', 'bra1313', 'Fiat', 'Argo', '2022', '10.000',NULL,2),
                                    ('Perua', 'ecp1026', 'Toyota', 'Fielder', '2008', '300.000',2,NULL),
                                    ('SUV', 'cra4545', 'Hyundai', 'Creta', '2022', '5.000',NULL,1),
                                    ('Picape', 'def5897', 'Volkswagen', 'Amarok', '2021', '50.000',2,NULL),
                                    ('Minivan', 'jcn2154', 'Nissan', 'Gran Livina', '2014', '70.000',NULL,2),
                                    ('Sedã', 'ocr4542', 'Chevrolet', 'Cobalt', '2020', '95.000',1,NULL);
'''
cursor.execute(inserir) # inserindo os registros
query='''select * from `oficina_mec`.`veiculo`;''' 
pd.read_sql(query,con) # Visualizar os dados inseridos em formato de dataframe.
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>idVeiculo</th>
      <th>Tipo de Veiculo</th>
      <th>Placa</th>
      <th>Marca</th>
      <th>Modelo</th>
      <th>Ano</th>
      <th>KM</th>
      <th>fk_idCliente_PJ</th>
      <th>fk_idCliente_PF</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Sedã</td>
      <td>eqc2115</td>
      <td>Renault</td>
      <td>Logan</td>
      <td>2020</td>
      <td>85.000</td>
      <td>1.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>hatch</td>
      <td>bra1313</td>
      <td>Fiat</td>
      <td>Argo</td>
      <td>2022</td>
      <td>10.000</td>
      <td>NaN</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>Perua</td>
      <td>ecp1026</td>
      <td>Toyota</td>
      <td>Fielder</td>
      <td>2008</td>
      <td>300.000</td>
      <td>2.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>SUV</td>
      <td>cra4545</td>
      <td>Hyundai</td>
      <td>Creta</td>
      <td>2022</td>
      <td>5.000</td>
      <td>NaN</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Picape</td>
      <td>def5897</td>
      <td>Volkswagen</td>
      <td>Amarok</td>
      <td>2021</td>
      <td>50.000</td>
      <td>2.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>Minivan</td>
      <td>jcn2154</td>
      <td>Nissan</td>
      <td>Gran Livina</td>
      <td>2014</td>
      <td>70.000</td>
      <td>NaN</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>Sedã</td>
      <td>ocr4542</td>
      <td>Chevrolet</td>
      <td>Cobalt</td>
      <td>2020</td>
      <td>95.000</td>
      <td>1.0</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>



### Tabela orçamento.
<a id="ancora4.4"></a>
[voltar](#ancora)


```python
# 4-- Inserindo registros na tabela orçamentos --
inserir='''
INSERT INTO `oficina_mec`.`orçamento` (`Numero_Orçamento`, `Aprovado`, `Data`, `Valor`, `Validade`, `fk_idVeiculo`,`Cod_Funcionário`) VALUES 
                                      ('123654', 'SIM', '22-10-20', '1520', '90 dias', '1','100'),
                                      ('55555', 'SIM', '22-10-10', '1750', '90 dias', '2','100'),
                                      ('4444', 'NÃO', '22-10-20', '1456', '90 dias', '3','101'),
                                      ('3333', 'SIM', '22-10-18', '810', '90 dias', '4','101'),
                                      ('2222', 'SIM', '22-10-15', '930', '60 dias', '5','101');
'''
cursor.execute(inserir) # inserindo os registros
query='''select * from `oficina_mec`.`orçamento`;''' 
pd.read_sql(query,con) # Visualizar os dados inseridos em formato de dataframe.
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>idOrçamento</th>
      <th>Numero_Orçamento</th>
      <th>Aprovado</th>
      <th>Valor</th>
      <th>Data</th>
      <th>Validade</th>
      <th>fk_idVeiculo</th>
      <th>Cod_Funcionário</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>123654</td>
      <td>SIM</td>
      <td>1520.0</td>
      <td>2022-10-20</td>
      <td>90 dias</td>
      <td>1</td>
      <td>100</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>55555</td>
      <td>SIM</td>
      <td>1750.0</td>
      <td>2022-10-10</td>
      <td>90 dias</td>
      <td>2</td>
      <td>100</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>4444</td>
      <td>NÃO</td>
      <td>1456.0</td>
      <td>2022-10-20</td>
      <td>90 dias</td>
      <td>3</td>
      <td>101</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>3333</td>
      <td>SIM</td>
      <td>810.0</td>
      <td>2022-10-18</td>
      <td>90 dias</td>
      <td>4</td>
      <td>101</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>2222</td>
      <td>SIM</td>
      <td>930.0</td>
      <td>2022-10-15</td>
      <td>60 dias</td>
      <td>5</td>
      <td>101</td>
    </tr>
  </tbody>
</table>
</div>



### Tabela equipe.
<a id="ancora4.5"></a>
[voltar](#ancora)


```python
# 5-- Inserindo registros na tabela de equipe --
inserir='''
INSERT INTO `oficina_mec`.`equipe` (`Num_Func`, `Equipe`) VALUES 
                                   ('5', 'A'),
                                   ('5', 'B'),
                                   ('5', 'ADM');
'''
cursor.execute(inserir) # inserindo os registros
query='''select * from `oficina_mec`.`equipe`;''' 
pd.read_sql(query,con) # Visualizar os dados inseridos em formato de dataframe.
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>idEquipe</th>
      <th>Num_Func</th>
      <th>Equipe</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>5</td>
      <td>A</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>5</td>
      <td>B</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>5</td>
      <td>ADM</td>
    </tr>
  </tbody>
</table>
</div>



### Tabela funcionario.
<a id="ancora4.6"></a>
[voltar](#ancora)


```python
# 6-- Inserindo registros na tabela funcionario --
inserir='''
INSERT INTO `oficina_mec`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES 
                                        ('1', '3', 'João P.', '12395175385', '81-10-20', 'av. Interlagos, 1500', 'Mecânico', 'Mecânica', '20-01-01', '119632587', 'joao@mecanica.com'),
                                        ('1', '2', 'Alex G.', '96325874125', '85-02-13', 'r. Alvarenga, 234', 'Auxiliar', 'Mecânica', '21-10-12', '119874598', 'alex@mecanica.com'),
                                        ('1', '1', 'Pedro A.', '95175385296', '79-12-25', 'av.Yervant, 345', 'Lider', 'Mecânica', '19-01-10', '119652354', 'pedro@mecanica.com'),
                                        ('1', '4', 'Jonas Y.', '74187498765', '81-06-12', 'av. Cupecê', 'Mecânico', 'Elétrica', '20-02-02', '119875874', 'jonas@mecanica.com'),
                                        ('1', '5', 'Diogo M.', '96385274185', '86-04-01', 'r. sem nome', 'Mecânico', 'Hidráulica', '21-01-10', '119698596', 'diogo@mecanica.com'),
                                        ('2', '6', 'Amauri J.', '95175385777', '81-01-12', 'av. Interlagos, 1500', 'Mecânico', 'Mecânica', '20-01-01', '119632511', 'amauri@mecanica.com'),
                                        ('2', '7', 'Dorival P.', '95175385666', '85-02-13', 'av. Cupecê, 12', 'Auxiliar', 'Mecânica', '21-10-12', '119632533', 'dorival@mecanica.com'),
                                        ('2', '8', 'Gabriel O.', '95175385667', '79-03-25', 'av.Yervant, 444', 'Lider', 'Mecânica', '20-02-02', '119632599', 'gabriel@mecanica.com'),
                                        ('2', '9', 'Pedro H.', '95175385456', '86-04-15', 'r. Alvarenga, 150', 'Mecânico', 'Elétrica', '21-01-10', '119632588', 'pedroh@mecanica.com'),
                                        ('2', '10', 'William A.', '95175385123', '86-05-10', 'av. Cupecê, 100', 'Mecânico', 'Hidráulica', '21-10-12', '119632577', 'william@mecanica.com'),
                                        ('3', '100', 'Laura Y.', '95175385998', '00-06-15', 'r. Alvarenga, 222', 'Atendimento', 'Atendente', '21-01-10', '119632777', 'laura@mecanica.com'),
                                        ('3', '101', 'Luana N.', '95175385326', '00-07-19', 'av. Cupecê, 333', 'Atendimento', 'Atendente', '21-10-12', '119632258', 'luana@mecanica.com');
'''
cursor.execute(inserir) # inserindo os registros
query='''select * from `oficina_mec`.`funcionario`;''' 
pd.read_sql(query,con) # Visualizar os dados inseridos em formato de dataframe.
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>idFunc</th>
      <th>fk_idEquipe</th>
      <th>Código</th>
      <th>Nome</th>
      <th>CPF</th>
      <th>data_nasc</th>
      <th>Endereço</th>
      <th>Cargo</th>
      <th>Especialidade</th>
      <th>Contratação</th>
      <th>Telefone</th>
      <th>E-mail</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
      <td>3</td>
      <td>João P.</td>
      <td>12395175385</td>
      <td>1981-10-20</td>
      <td>av. Interlagos, 1500</td>
      <td>Mecânico</td>
      <td>Mecânica</td>
      <td>2020-01-01</td>
      <td>119632587</td>
      <td>joao@mecanica.com</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>1</td>
      <td>2</td>
      <td>Alex G.</td>
      <td>96325874125</td>
      <td>1985-02-13</td>
      <td>r. Alvarenga, 234</td>
      <td>Auxiliar</td>
      <td>Mecânica</td>
      <td>2021-10-12</td>
      <td>119874598</td>
      <td>alex@mecanica.com</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>1</td>
      <td>1</td>
      <td>Pedro A.</td>
      <td>95175385296</td>
      <td>1979-12-25</td>
      <td>av.Yervant, 345</td>
      <td>Lider</td>
      <td>Mecânica</td>
      <td>2019-01-10</td>
      <td>119652354</td>
      <td>pedro@mecanica.com</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>1</td>
      <td>4</td>
      <td>Jonas Y.</td>
      <td>74187498765</td>
      <td>1981-06-12</td>
      <td>av. Cupecê</td>
      <td>Mecânico</td>
      <td>Elétrica</td>
      <td>2020-02-02</td>
      <td>119875874</td>
      <td>jonas@mecanica.com</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>1</td>
      <td>5</td>
      <td>Diogo M.</td>
      <td>96385274185</td>
      <td>1986-04-01</td>
      <td>r. sem nome</td>
      <td>Mecânico</td>
      <td>Hidráulica</td>
      <td>2021-01-10</td>
      <td>119698596</td>
      <td>diogo@mecanica.com</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>2</td>
      <td>6</td>
      <td>Amauri J.</td>
      <td>95175385777</td>
      <td>1981-01-12</td>
      <td>av. Interlagos, 1500</td>
      <td>Mecânico</td>
      <td>Mecânica</td>
      <td>2020-01-01</td>
      <td>119632511</td>
      <td>amauri@mecanica.com</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>2</td>
      <td>7</td>
      <td>Dorival P.</td>
      <td>95175385666</td>
      <td>1985-02-13</td>
      <td>av. Cupecê, 12</td>
      <td>Auxiliar</td>
      <td>Mecânica</td>
      <td>2021-10-12</td>
      <td>119632533</td>
      <td>dorival@mecanica.com</td>
    </tr>
    <tr>
      <th>7</th>
      <td>8</td>
      <td>2</td>
      <td>8</td>
      <td>Gabriel O.</td>
      <td>95175385667</td>
      <td>1979-03-25</td>
      <td>av.Yervant, 444</td>
      <td>Lider</td>
      <td>Mecânica</td>
      <td>2020-02-02</td>
      <td>119632599</td>
      <td>gabriel@mecanica.com</td>
    </tr>
    <tr>
      <th>8</th>
      <td>9</td>
      <td>2</td>
      <td>9</td>
      <td>Pedro H.</td>
      <td>95175385456</td>
      <td>1986-04-15</td>
      <td>r. Alvarenga, 150</td>
      <td>Mecânico</td>
      <td>Elétrica</td>
      <td>2021-01-10</td>
      <td>119632588</td>
      <td>pedroh@mecanica.com</td>
    </tr>
    <tr>
      <th>9</th>
      <td>10</td>
      <td>2</td>
      <td>10</td>
      <td>William A.</td>
      <td>95175385123</td>
      <td>1986-05-10</td>
      <td>av. Cupecê, 100</td>
      <td>Mecânico</td>
      <td>Hidráulica</td>
      <td>2021-10-12</td>
      <td>119632577</td>
      <td>william@mecanica.com</td>
    </tr>
    <tr>
      <th>10</th>
      <td>11</td>
      <td>3</td>
      <td>100</td>
      <td>Laura Y.</td>
      <td>95175385998</td>
      <td>2000-06-15</td>
      <td>r. Alvarenga, 222</td>
      <td>Atendimento</td>
      <td>Atendente</td>
      <td>2021-01-10</td>
      <td>119632777</td>
      <td>laura@mecanica.com</td>
    </tr>
    <tr>
      <th>11</th>
      <td>12</td>
      <td>3</td>
      <td>101</td>
      <td>Luana N.</td>
      <td>95175385326</td>
      <td>2000-07-19</td>
      <td>av. Cupecê, 333</td>
      <td>Atendimento</td>
      <td>Atendente</td>
      <td>2021-10-12</td>
      <td>119632258</td>
      <td>luana@mecanica.com</td>
    </tr>
  </tbody>
</table>
</div>



### Tabela equipe_orçamento.
<a id="ancora4.7"></a>
[voltar](#ancora)


```python
# 7-- Inserindo registros na tabela equipe_orçamento --
inserir='''
INSERT INTO `oficina_mec`.`equipe_orçamento` (`fk_idEquipe`, `fk_idOrçamento`) VALUES 
('1', '1'),
('1', '2'),
('1', '3'),
('2', '4'),
('2', '5');
'''
cursor.execute(inserir) # inserindo os registros
query='''select * from `oficina_mec`.`equipe_orçamento`;''' 
pd.read_sql(query,con) # Visualizar os dados inseridos em formato de dataframe.
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>fk_idEquipe</th>
      <th>fk_idOrçamento</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>3</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2</td>
      <td>4</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2</td>
      <td>5</td>
    </tr>
  </tbody>
</table>
</div>



### Tabela peça.
<a id="ancora4.8"></a>
[voltar](#ancora)


```python
# 8-- Inserindo registros na tabela peça --
inserir='''
INSERT INTO `oficina_mec`.`peça` (`Nome_peça`, `Descrição`, `Quantidade_Disponível`, `Valor_Unitário`) VALUES 
('Disco de Freio', 'Disco ventilado', '20', '306'),
('Pastilhas', 'Pastilhas Jogo', '100', '110'),
('Reparo Amortecedor', 'Conjunto', '150', '700'),
('Bandeja', 'Conjunto dir/esq', '100', '400'),
('Amortecedor dianteiro', 'Conjunto', '100', '800'),
('Cabo de vela', 'Jogo', '100', '200'),
('Vela', 'Jogo', '100', '300'),
('Óleo Motor', '1Litro', '150', '30'),
('Óleo Cambio', '1Litro', '100', '200'),
('Pneu ', '185/65r15', '100', '300'),
('Revisão', 'somente revisão', '0', '0');
'''
cursor.execute(inserir) # inserindo os registros
query='''select * from `oficina_mec`.`peça`;''' 
pd.read_sql(query,con) # Visualizar os dados inseridos em formato de dataframe.
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>idPeça</th>
      <th>Nome_peça</th>
      <th>Descrição</th>
      <th>Quantidade_Disponível</th>
      <th>Valor_Unitário</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Disco de Freio</td>
      <td>Disco ventilado</td>
      <td>20</td>
      <td>306.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Pastilhas</td>
      <td>Pastilhas Jogo</td>
      <td>100</td>
      <td>110.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>Reparo Amortecedor</td>
      <td>Conjunto</td>
      <td>150</td>
      <td>700.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>Bandeja</td>
      <td>Conjunto dir/esq</td>
      <td>100</td>
      <td>400.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Amortecedor dianteiro</td>
      <td>Conjunto</td>
      <td>100</td>
      <td>800.0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>Cabo de vela</td>
      <td>Jogo</td>
      <td>100</td>
      <td>200.0</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>Vela</td>
      <td>Jogo</td>
      <td>100</td>
      <td>300.0</td>
    </tr>
    <tr>
      <th>7</th>
      <td>8</td>
      <td>Óleo Motor</td>
      <td>1Litro</td>
      <td>150</td>
      <td>30.0</td>
    </tr>
    <tr>
      <th>8</th>
      <td>9</td>
      <td>Óleo Cambio</td>
      <td>1Litro</td>
      <td>100</td>
      <td>200.0</td>
    </tr>
    <tr>
      <th>9</th>
      <td>10</td>
      <td>Pneu</td>
      <td>185/65r15</td>
      <td>100</td>
      <td>300.0</td>
    </tr>
    <tr>
      <th>10</th>
      <td>11</td>
      <td>Revisão</td>
      <td>somente revisão</td>
      <td>0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>



### Tabela serviço.
<a id="ancora4.9"></a>
[voltar](#ancora)


```python
# 9-- Inserindo registros na tabela serviço --
inserir='''
INSERT INTO `oficina_mec`.`serviço` (`Tipo do Serviço`, `Nome_Serviço`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES 
('Revisão', 'Revisão Basica', '1', 'Revisão de 15 itens', '80'),
('Revisão', 'Revisão Completa', '2', 'Revisão de 25 itens', '120'),
('Manutenção', 'Troca de Disco', '1', 'Troca do par de discos', '150'),
('Manutenção', 'Freios', '1', 'Troca conjuto de pastilhas', '100'),
('Manutenção', 'rep_Suspensão', '2', 'Reparo do conjunto de amortecedores dianteiros', '150'),
('Manutenção', 'Bandeja', '1', 'Reparo do conjunto de bandeja dianteira', '200'),
('Manutenção', 'Amortecedores', '3', 'Troca dos amortecedores dianteiros', '200'),
('Manutenção', 'cabos', '1', 'troca do conjunto de cabos', '50'),
('Manutenção', 'Óleo Motor', '1', 'Troca de óleo motor', '80'),
('Manutenção', 'Óleo Cambio', '1', 'Troca do óleo Cambio', '150'),
('Manutenção', 'Pneu', '1', 'Troca pneu por unidade', '50'),
('Manutenção', 'Vela_elétrica', '1', 'Troca do conjunto de velas', '50.00');
'''
cursor.execute(inserir) # inserindo os registros
query='''select * from `oficina_mec`.`serviço`;''' 
pd.read_sql(query,con) # Visualizar os dados inseridos em formato de dataframe.
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>idServiço</th>
      <th>Tipo do Serviço</th>
      <th>Nome_Serviço</th>
      <th>Duração</th>
      <th>Descrição</th>
      <th>Mão_de_Obra</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Revisão</td>
      <td>Revisão Basica</td>
      <td>1</td>
      <td>Revisão de 15 itens</td>
      <td>80.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Revisão</td>
      <td>Revisão Completa</td>
      <td>2</td>
      <td>Revisão de 25 itens</td>
      <td>120.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>Manutenção</td>
      <td>Troca de Disco</td>
      <td>1</td>
      <td>Troca do par de discos</td>
      <td>150.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>Manutenção</td>
      <td>Freios</td>
      <td>1</td>
      <td>Troca conjuto de pastilhas</td>
      <td>100.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Manutenção</td>
      <td>rep_Suspensão</td>
      <td>2</td>
      <td>Reparo do conjunto de amortecedores dianteiros</td>
      <td>150.0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>Manutenção</td>
      <td>Bandeja</td>
      <td>1</td>
      <td>Reparo do conjunto de bandeja dianteira</td>
      <td>200.0</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>Manutenção</td>
      <td>Amortecedores</td>
      <td>3</td>
      <td>Troca dos amortecedores dianteiros</td>
      <td>200.0</td>
    </tr>
    <tr>
      <th>7</th>
      <td>8</td>
      <td>Manutenção</td>
      <td>cabos</td>
      <td>1</td>
      <td>troca do conjunto de cabos</td>
      <td>50.0</td>
    </tr>
    <tr>
      <th>8</th>
      <td>9</td>
      <td>Manutenção</td>
      <td>Óleo Motor</td>
      <td>1</td>
      <td>Troca de óleo motor</td>
      <td>80.0</td>
    </tr>
    <tr>
      <th>9</th>
      <td>10</td>
      <td>Manutenção</td>
      <td>Óleo Cambio</td>
      <td>1</td>
      <td>Troca do óleo Cambio</td>
      <td>150.0</td>
    </tr>
    <tr>
      <th>10</th>
      <td>11</td>
      <td>Manutenção</td>
      <td>Pneu</td>
      <td>1</td>
      <td>Troca pneu por unidade</td>
      <td>50.0</td>
    </tr>
    <tr>
      <th>11</th>
      <td>12</td>
      <td>Manutenção</td>
      <td>Vela_elétrica</td>
      <td>1</td>
      <td>Troca do conjunto de velas</td>
      <td>50.0</td>
    </tr>
  </tbody>
</table>
</div>



### Tabela serviço_peça.
<a id="ancora4.10"></a>
[voltar](#ancora)


```python
# 10-- Inserindo registros na tabela de serviço_peça --
inserir=''' 
INSERT INTO `oficina_mec`.`serviço_peça` (`fk_idOrçamento`, `fk_idServiço`, `fk_idPeça`,`Qtd_Peça`,`Qtd_Serviço`) VALUES 
('1', '2','11','1','1'),
('1','11','10','4','4'),
('2', '8', '6','1','1'),
('2','12', '7','1','1'),
('2', '9', '8','4','1'),
('2','10', '9','4','1'),
('3', '3', '1','1','1'),
('3', '7', '5','1','1'),
('4', '4', '2','1','1'),
('4', '6', '4','1','1'),
('5', '5', '3','1','1'),
('5', '1','11','1','1');
'''
cursor.execute(inserir) # inserindo os registros
query='''select * from `oficina_mec`.`serviço_peça`;''' 
pd.read_sql(query,con) # Visualizar os dados inseridos em formato de dataframe.
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>fk_idOrçamento</th>
      <th>fk_idServiço</th>
      <th>fk_idPeça</th>
      <th>Qtd_Peça</th>
      <th>Qtd_Serviço</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>2</td>
      <td>11</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>11</td>
      <td>10</td>
      <td>4</td>
      <td>4</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>8</td>
      <td>6</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2</td>
      <td>9</td>
      <td>8</td>
      <td>4</td>
      <td>1</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2</td>
      <td>10</td>
      <td>9</td>
      <td>4</td>
      <td>1</td>
    </tr>
    <tr>
      <th>5</th>
      <td>2</td>
      <td>12</td>
      <td>7</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>6</th>
      <td>3</td>
      <td>3</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>7</th>
      <td>3</td>
      <td>7</td>
      <td>5</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>8</th>
      <td>4</td>
      <td>4</td>
      <td>2</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>9</th>
      <td>4</td>
      <td>6</td>
      <td>4</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>10</th>
      <td>5</td>
      <td>1</td>
      <td>11</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>11</th>
      <td>5</td>
      <td>5</td>
      <td>3</td>
      <td>1</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>



### Tabela OS.
<a id="ancora4.11"></a>
[voltar](#ancora)


```python
# 11-- Inserindo registros na tabela Ordem de Serviço --
inserir='''
INSERT INTO `oficina_mec`.`OS` (`Numero`, `Data_Emissão`, `Desconto`, `Data_Conclusão`, `fk_idOrçamento`, `Forma_Pagamento`) VALUES 
('12345', '2022-10-20', '10', '2022-10-21', '1', 'Dinheiro'),
('12356', '2022-10-21', '5', '2022-10-21', '2', 'Crédito'),
('12378', '2022-10-19', '10', '2022-10-19', '4', 'Débito'),
('12389', '2022-10-21', '5', '2022-10-22', '5', 'Crédito');
'''
cursor.execute(inserir) # inserindo os registros
query='''select * from `oficina_mec`.`OS`;''' 
pd.read_sql(query,con) # Visualizar os dados inseridos em formato de dataframe.
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>idOrdem</th>
      <th>Numero</th>
      <th>Data_Emissão</th>
      <th>Desconto</th>
      <th>Data_Conclusão</th>
      <th>Obs</th>
      <th>fk_idOrçamento</th>
      <th>Forma_Pagamento</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>12345</td>
      <td>2022-10-20</td>
      <td>10.0</td>
      <td>2022-10-21</td>
      <td>None</td>
      <td>1</td>
      <td>Dinheiro</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>12356</td>
      <td>2022-10-21</td>
      <td>5.0</td>
      <td>2022-10-21</td>
      <td>None</td>
      <td>2</td>
      <td>Crédito</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>12378</td>
      <td>2022-10-19</td>
      <td>10.0</td>
      <td>2022-10-19</td>
      <td>None</td>
      <td>4</td>
      <td>Débito</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>12389</td>
      <td>2022-10-21</td>
      <td>5.0</td>
      <td>2022-10-22</td>
      <td>None</td>
      <td>5</td>
      <td>Crédito</td>
    </tr>
  </tbody>
</table>
</div>




```python

```

## Respondendo as Perguntas com Queries.
<a id="ancora5"></a>
[voltar](#ancora)

### Realizando a conexão com o Banco de Dados.
<a id="ancora5.2"></a>
[voltar](#ancora)


```python
# Exibindo as tabelas do banco de dados.
con = mysql.connector.connect(host='localhost',database='oficina_mec',user='julio',password='')
cursor = con.cursor()
cursor.execute('SHOW TABLES')
for i in cursor:
  print(i)
```

    ('cliente_pf',)
    ('cliente_pj',)
    ('equipe',)
    ('equipe_orçamento',)
    ('funcionario',)
    ('orçamento',)
    ('os',)
    ('peça',)
    ('serviço',)
    ('serviço_peça',)
    ('veiculo',)
    

### 1- Informe todos os clientes pf e seus respectivos veículos?
<a id="ancora5.3"></a>
[voltar](#ancora)


```python
query ='''
SELECT 
    c.Nome, c.CPF, v.Modelo, v.Marca, v.Placa
FROM
    cliente_pf c
        JOIN
    veiculo v ON c.idCliente_pf = v.fk_idCliente_pf;
'''
pd.read_sql(query,con)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Nome</th>
      <th>CPF</th>
      <th>Modelo</th>
      <th>Marca</th>
      <th>Placa</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Julio Cesar</td>
      <td>12345678945</td>
      <td>Creta</td>
      <td>Hyundai</td>
      <td>cra4545</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Roberto</td>
      <td>96325874589</td>
      <td>Argo</td>
      <td>Fiat</td>
      <td>bra1313</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Roberto</td>
      <td>96325874589</td>
      <td>Gran Livina</td>
      <td>Nissan</td>
      <td>jcn2154</td>
    </tr>
  </tbody>
</table>
</div>



* *Conforme os requisitos 'O cliente pode ter mais de um veículo'.*
* *Roberto possui 2 veículos em seu nome.*

### 2- Informe todos os clientes pj e seus respectivos veículos?
<a id="ancora5.4"></a>
[voltar](#ancora)


```python
query='''
SELECT 
    c.Nome_Fantasia,c.CNPJ,v.Modelo, v.Marca,v.Placa
FROM
    cliente_pj c
        JOIN
    veiculo v ON c.idCliente_pj = v.fk_idCliente_pj;
'''
pd.read_sql(query,con)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Nome_Fantasia</th>
      <th>CNPJ</th>
      <th>Modelo</th>
      <th>Marca</th>
      <th>Placa</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Nihonte</td>
      <td>123654789654123</td>
      <td>Logan</td>
      <td>Renault</td>
      <td>eqc2115</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Nihonte</td>
      <td>123654789654123</td>
      <td>Cobalt</td>
      <td>Chevrolet</td>
      <td>ocr4542</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Kibon</td>
      <td>369852147896541</td>
      <td>Fielder</td>
      <td>Toyota</td>
      <td>ecp1026</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Kibon</td>
      <td>369852147896541</td>
      <td>Amarok</td>
      <td>Volkswagen</td>
      <td>def5897</td>
    </tr>
  </tbody>
</table>
</div>



* *Ambas empresas possuem dois veículos cadastrados*.
* *Conforme os requisitos, temos clientes pf ou pj*.

### 3- O veículo de placa 'eqc2115' pertence a qual  cliente pj?
<a id="ancora5.5"></a>
[voltar](#ancora)


```python
query='''
SELECT 
    c.Razão_Social, c.CNPJ, c.Responsavel,c.Telefone,
    v.Modelo,v.Marca,v.`Tipo de Veiculo`, v.Placa, v.Ano, v.KM
FROM
    cliente_pj c
        JOIN
    veiculo v ON c.idcliente_pj = v.fk_idCliente_pj
WHERE
    v.Placa = 'eqc2115'; 
    '''
pd.read_sql(query,con)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Razão_Social</th>
      <th>CNPJ</th>
      <th>Responsavel</th>
      <th>Telefone</th>
      <th>Modelo</th>
      <th>Marca</th>
      <th>Tipo de Veiculo</th>
      <th>Placa</th>
      <th>Ano</th>
      <th>KM</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Nihontech ltda</td>
      <td>123654789654123</td>
      <td>Julio</td>
      <td>119236589</td>
      <td>Logan</td>
      <td>Renault</td>
      <td>Sedã</td>
      <td>eqc2115</td>
      <td>2020</td>
      <td>85.000</td>
    </tr>
  </tbody>
</table>
</div>



* *O veículo peretence a empresa Nihontech sob responsabilidade de Julio*.

### 4- Crie um relatório, com o nome do cliente pf, nome, marca, tipo, ano e km do veículo, seguido do numero do orçamento, data, valor e validade.
<a id="ancora5.6"></a>
[voltar](#ancora)


```python
query='''
SELECT 
    c.Nome,
    v.Modelo,
    v.Marca,
    v.Ano,
    v.KM,
    o.Numero_Orçamento,
    o.Data,
    o.Valor,
    o.Validade
FROM
    `orçamento` o
        JOIN
    `veiculo` v ON o.fk_idVeiculo = v.idVeiculo
        JOIN
    cliente_pf c ON c.idCliente_pf = v.fk_idCliente_pf;
'''
pd.read_sql(query,con)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Nome</th>
      <th>Modelo</th>
      <th>Marca</th>
      <th>Ano</th>
      <th>KM</th>
      <th>Numero_Orçamento</th>
      <th>Data</th>
      <th>Valor</th>
      <th>Validade</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Julio Cesar</td>
      <td>Creta</td>
      <td>Hyundai</td>
      <td>2022</td>
      <td>5.000</td>
      <td>3333</td>
      <td>2022-10-18</td>
      <td>810.0</td>
      <td>90 dias</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Roberto</td>
      <td>Argo</td>
      <td>Fiat</td>
      <td>2022</td>
      <td>10.000</td>
      <td>55555</td>
      <td>2022-10-10</td>
      <td>1750.0</td>
      <td>90 dias</td>
    </tr>
  </tbody>
</table>
</div>



### 5- Crie um relatório, com o nome do cliente pf, nome, modelo, tipo, ano e km do veículo, seguido do numero do orçamento, data, valor, validade e a equipe.
<a id="ancora5.7"></a>
[voltar](#ancora)


```python
query='''
SELECT 
    c.Nome,
    v.Modelo,
    v.Marca,
    v.Ano,
    v.KM,
    o.Numero_Orçamento,
    o.Data,
    o.Valor,
    o.Validade,
    e.Equipe
FROM
    orçamento o
        JOIN
    veiculo v ON o.fk_idVeiculo = v.idVeiculo
        JOIN
    cliente_pf c ON c.idCliente_pf = v.fk_idCliente_pf
        JOIN
    equipe_orçamento eo ON eo.fk_idorçamento = o.idOrçamento
        JOIN
    equipe e ON e.idEquipe = eo.fk_idEquipe;
'''
pd.read_sql(query,con)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Nome</th>
      <th>Modelo</th>
      <th>Marca</th>
      <th>Ano</th>
      <th>KM</th>
      <th>Numero_Orçamento</th>
      <th>Data</th>
      <th>Valor</th>
      <th>Validade</th>
      <th>Equipe</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Julio Cesar</td>
      <td>Creta</td>
      <td>Hyundai</td>
      <td>2022</td>
      <td>5.000</td>
      <td>3333</td>
      <td>2022-10-18</td>
      <td>810.0</td>
      <td>90 dias</td>
      <td>B</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Roberto</td>
      <td>Argo</td>
      <td>Fiat</td>
      <td>2022</td>
      <td>10.000</td>
      <td>55555</td>
      <td>2022-10-10</td>
      <td>1750.0</td>
      <td>90 dias</td>
      <td>A</td>
    </tr>
  </tbody>
</table>
</div>



* *Temos 2 orçamentos PFs*.

### 6-Crie um relatório, com o nome do cliente pj, nome, modelo, tipo, ano e km do veículo, seguido do numero do orçamento, data, valor e validade e a equipe.
<a id="ancora5.8"></a>
[voltar](#ancora)


```python
query= '''
SELECT 
    c.Razão_Social,
    v.Modelo,
    v.Marca,
    v.Ano,
    v.KM,
    o.Numero_Orçamento,
    o.Data,
    o.Valor,
    o.Validade,
    e.Equipe
FROM
    orçamento o
        JOIN
    veiculo v ON o.fk_idVeiculo = v.idVeiculo
        JOIN
    cliente_pj c ON c.idCliente_pj = v.fk_idCliente_pj
        JOIN
    equipe_orçamento eo ON eo.fk_idorçamento = o.idOrçamento
        JOIN
    equipe e ON e.idEquipe = eo.fk_idEquipe;
'''
pd.read_sql(query,con)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Razão_Social</th>
      <th>Modelo</th>
      <th>Marca</th>
      <th>Ano</th>
      <th>KM</th>
      <th>Numero_Orçamento</th>
      <th>Data</th>
      <th>Valor</th>
      <th>Validade</th>
      <th>Equipe</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Nihontech ltda</td>
      <td>Logan</td>
      <td>Renault</td>
      <td>2020</td>
      <td>85.000</td>
      <td>123654</td>
      <td>2022-10-20</td>
      <td>1520.0</td>
      <td>90 dias</td>
      <td>A</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Kibon</td>
      <td>Fielder</td>
      <td>Toyota</td>
      <td>2008</td>
      <td>300.000</td>
      <td>4444</td>
      <td>2022-10-20</td>
      <td>1456.0</td>
      <td>90 dias</td>
      <td>A</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Kibon</td>
      <td>Amarok</td>
      <td>Volkswagen</td>
      <td>2021</td>
      <td>50.000</td>
      <td>2222</td>
      <td>2022-10-15</td>
      <td>930.0</td>
      <td>60 dias</td>
      <td>B</td>
    </tr>
  </tbody>
</table>
</div>



* *Temos 3 orçamentos PJs*

### 7- Informe a quantidade de funcionários de cada equipe.
<a id="ancora5.9"></a>
[voltar](#ancora)


```python
query='''
SELECT 
    e.Equipe AS equipe, COUNT(*) AS qtd_funcionario
FROM
    equipe e
        JOIN
    funcionario f ON e.idEquipe = f.fk_idEquipe
GROUP BY e.Equipe;
'''
pd.read_sql(query,con)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>equipe</th>
      <th>qtd_funcionario</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>A</td>
      <td>5</td>
    </tr>
    <tr>
      <th>1</th>
      <td>B</td>
      <td>5</td>
    </tr>
    <tr>
      <th>2</th>
      <td>ADM</td>
      <td>2</td>
    </tr>
  </tbody>
</table>
</div>



* *A equipe A e B possuem 5 funcionários enquanto que a equipe de ADM possui 2.*

### 8- Informe o valor total da Mão de Obra por orçamentos ordenado pelo id do orçamento.
<a id="ancora5.10"></a>
[voltar](#ancora)


```python
query='''
SELECT
     o.`idOrçamento`, o.`Numero_Orçamento`, 
     SUM(sp.`Qtd_Serviço` * s.`Mão_de_Obra`) AS Total_Mão_de_Obra 
FROM
    `orçamento` o 
        JOIN
    `serviço_peça` sp ON o.`idOrçamento` = sp.`fk_idOrçamento` 
        JOIN
    `serviço` s ON sp.`fk_idServiço` = s.`idServiço` 
 GROUP BY
    o.`Numero_Orçamento` 
 ORDER BY o.`idOrçamento`;
'''
pd.read_sql(query,con)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>idOrçamento</th>
      <th>Numero_Orçamento</th>
      <th>Total_Mão_de_Obra</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>123654</td>
      <td>320.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>55555</td>
      <td>330.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>4444</td>
      <td>350.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>3333</td>
      <td>300.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>2222</td>
      <td>230.0</td>
    </tr>
  </tbody>
</table>
</div>



### 9- Informe o valor total das peças por orçamentos ordenado pelo id do orçamento.
<a id="ancora5.11"></a>
[voltar](#ancora)


```python
query='''
SELECT
    o.idOrçamento, o.Numero_Orçamento, 
    SUM(sp.Qtd_Peça * p.Valor_Unitário) AS Total_Peças 
FROM
    orçamento o 
        JOIN 
    serviço_peça sp ON o.idOrçamento = sp.fk_idOrçamento 
        JOIN
    peça p ON sp.fk_idPeça = p.idPeça 
GROUP BY 
    o.Numero_Orçamento 
ORDER BY 
    o.idOrçamento;
'''
pd.read_sql(query,con)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>idOrçamento</th>
      <th>Numero_Orçamento</th>
      <th>Total_Peças</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>123654</td>
      <td>1200.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>55555</td>
      <td>1420.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>4444</td>
      <td>1106.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>3333</td>
      <td>510.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>2222</td>
      <td>700.0</td>
    </tr>
  </tbody>
</table>
</div>



### 10- Informe o valor total gasto com a mão de obra e peças de cada orçamento ordenado pelo id do orçamento.
<a id="ancora5.12"></a>
[voltar](#ancora)


```python
query='''
SELECT 
    o.idOrçamento, o.Numero_Orçamento,
    SUM(sp.Qtd_Peça * p.Valor_Unitário) AS Total_Peças,
    SUM(sp.Qtd_Serviço * s.Mão_de_Obra) AS Total_Mão_de_Obra,
    SUM(sp.Qtd_Peça * p.Valor_Unitário) + sum(sp.Qtd_Serviço * s.Mão_de_Obra) AS Total_Geral
FROM 
    orçamento o 
        JOIN 
    serviço_peça sp ON o.idOrçamento = sp.fk_idOrçamento, serviço s, peça p 
WHERE 
    sp.fk_idServiço = s.idServiço 
AND 
    sp.fk_idPeça = p.idPeça 
GROUP BY 
    o.Numero_Orçamento 
ORDER BY 
    o.idOrçamento;
'''
pd.read_sql(query,con)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>idOrçamento</th>
      <th>Numero_Orçamento</th>
      <th>Total_Peças</th>
      <th>Total_Mão_de_Obra</th>
      <th>Total_Geral</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>123654</td>
      <td>1200.0</td>
      <td>320.0</td>
      <td>1520.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>55555</td>
      <td>1420.0</td>
      <td>330.0</td>
      <td>1750.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>4444</td>
      <td>1106.0</td>
      <td>350.0</td>
      <td>1456.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>3333</td>
      <td>510.0</td>
      <td>300.0</td>
      <td>810.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>2222</td>
      <td>700.0</td>
      <td>230.0</td>
      <td>930.0</td>
    </tr>
  </tbody>
</table>
</div>



### 11- Informe os orçamentos das pessoas fisicas com as informações, do veículo, cod do funcionário, data do orçamento,Status, validade, tipo de serviço, descrição dos serviços, mão de obra, quantidade, nome das peças, descrição das peças, valor unitário e quantidade das peças. Ao final informe o total  da mão de obra e das peças de cadas item pela quantidade.
<a id="ancora5.13"></a>
[voltar](#ancora)


```python
query='''
SELECT cpf.Nome AS nome_cliente, cpf.Telefone AS contato,
    v.Modelo, v.Placa,
    v.Ano, v.KM, o.Numero_Orçamento AS n_orç,
    o.Cod_Funcionário AS cod_func,
    o.Data, o.Validade,`s`.`Tipo do Serviço`,
    o.Aprovado,
    s.Descrição AS Desc_Serviço,
    s.Mão_de_Obra, sp.Qtd_Serviço,
    p.Nome_peça AS Peças, p.Descrição AS Desc_Peça,
    p.Valor_unitário, sp.Qtd_Peça,
    (s.Mão_de_Obra * sp.Qtd_Serviço + p.Valor_Unitário * sp.Qtd_Peça) AS Total
FROM 
    orçamento o 
        JOIN 
    serviço_peça sp ON o.idOrçamento = sp.fk_idOrçamento, serviço s, peça p, veiculo v, cliente_pf cpf
WHERE 
    sp.fk_idServiço = s.idServiço 
        AND 
    sp.fk_idpeça = p.idPeça 
        AND 
    o.fk_idVeiculo = v.idVeiculo 
        AND 
    v.fk_idCliente_pf = cpf.idCliente_pf;
'''
display(pd.read_sql(query,con));
```


<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>nome_cliente</th>
      <th>contato</th>
      <th>Modelo</th>
      <th>Placa</th>
      <th>Ano</th>
      <th>KM</th>
      <th>n_orç</th>
      <th>cod_func</th>
      <th>Data</th>
      <th>Validade</th>
      <th>Tipo do Serviço</th>
      <th>Aprovado</th>
      <th>Desc_Serviço</th>
      <th>Mão_de_Obra</th>
      <th>Qtd_Serviço</th>
      <th>Peças</th>
      <th>Desc_Peça</th>
      <th>Valor_unitário</th>
      <th>Qtd_Peça</th>
      <th>Total</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Roberto</td>
      <td>679562345</td>
      <td>Argo</td>
      <td>bra1313</td>
      <td>2022</td>
      <td>10.000</td>
      <td>55555</td>
      <td>100</td>
      <td>2022-10-10</td>
      <td>90 dias</td>
      <td>Manutenção</td>
      <td>SIM</td>
      <td>troca do conjunto de cabos</td>
      <td>50.0</td>
      <td>1</td>
      <td>Cabo de vela</td>
      <td>Jogo</td>
      <td>200.0</td>
      <td>1</td>
      <td>250.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Roberto</td>
      <td>679562345</td>
      <td>Argo</td>
      <td>bra1313</td>
      <td>2022</td>
      <td>10.000</td>
      <td>55555</td>
      <td>100</td>
      <td>2022-10-10</td>
      <td>90 dias</td>
      <td>Manutenção</td>
      <td>SIM</td>
      <td>Troca de óleo motor</td>
      <td>80.0</td>
      <td>1</td>
      <td>Óleo Motor</td>
      <td>1Litro</td>
      <td>30.0</td>
      <td>4</td>
      <td>200.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Roberto</td>
      <td>679562345</td>
      <td>Argo</td>
      <td>bra1313</td>
      <td>2022</td>
      <td>10.000</td>
      <td>55555</td>
      <td>100</td>
      <td>2022-10-10</td>
      <td>90 dias</td>
      <td>Manutenção</td>
      <td>SIM</td>
      <td>Troca do óleo Cambio</td>
      <td>150.0</td>
      <td>1</td>
      <td>Óleo Cambio</td>
      <td>1Litro</td>
      <td>200.0</td>
      <td>4</td>
      <td>950.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Roberto</td>
      <td>679562345</td>
      <td>Argo</td>
      <td>bra1313</td>
      <td>2022</td>
      <td>10.000</td>
      <td>55555</td>
      <td>100</td>
      <td>2022-10-10</td>
      <td>90 dias</td>
      <td>Manutenção</td>
      <td>SIM</td>
      <td>Troca do conjunto de velas</td>
      <td>50.0</td>
      <td>1</td>
      <td>Vela</td>
      <td>Jogo</td>
      <td>300.0</td>
      <td>1</td>
      <td>350.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Julio Cesar</td>
      <td>119857412</td>
      <td>Creta</td>
      <td>cra4545</td>
      <td>2022</td>
      <td>5.000</td>
      <td>3333</td>
      <td>101</td>
      <td>2022-10-18</td>
      <td>90 dias</td>
      <td>Manutenção</td>
      <td>SIM</td>
      <td>Troca conjuto de pastilhas</td>
      <td>100.0</td>
      <td>1</td>
      <td>Pastilhas</td>
      <td>Pastilhas Jogo</td>
      <td>110.0</td>
      <td>1</td>
      <td>210.0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Julio Cesar</td>
      <td>119857412</td>
      <td>Creta</td>
      <td>cra4545</td>
      <td>2022</td>
      <td>5.000</td>
      <td>3333</td>
      <td>101</td>
      <td>2022-10-18</td>
      <td>90 dias</td>
      <td>Manutenção</td>
      <td>SIM</td>
      <td>Reparo do conjunto de bandeja dianteira</td>
      <td>200.0</td>
      <td>1</td>
      <td>Bandeja</td>
      <td>Conjunto dir/esq</td>
      <td>400.0</td>
      <td>1</td>
      <td>600.0</td>
    </tr>
  </tbody>
</table>
</div>


* *Conforme requisitos, uma ordem pode possuir mais de um serviço e um serviço pode pertencer a várias ordens;*
* *Uma OS pode ter vários tipos de peças e vice-versa;*
* *Existe a quantidade de serviços, pois temos serviços que são unitários como troca de pneu, alinhamento, balanceamento etc...;*
* *O mesmo ocorre para peças, como pneu, óleo etc...;*
* *Caso o cliente aprove será gerado um OS;*

### 12- Informe todos os orçamentos, com o número, Valor, Data, Validade, Nome do atendente, a equipe de mecânicos que realizaram os respectivos orçamentos bem como as informações do veículo.

<a id="ancora5.14"></a>
[voltar](#ancora)


```python
query='''
SELECT 
    o.Numero_Orçamento AS N_Orçamento,
    o.Valor, o.Data, o.Validade, f.Nome AS atendente,
    e.Equipe AS Equipe_mecânicos, v.Modelo, v.Marca, v.Ano, 
    v.Placa, v.KM 
FROM 
    orçamento o, funcionario f, equipe e, equipe_orçamento eo, veiculo v 
WHERE 
    o.Cod_Funcionário = f.Código 
        AND 
    eo.fk_idOrçamento = o.idOrçamento 
        AND 
    eo.fk_idEquipe = e.idEquipe 
        AND 
    v.idVeiculo = o.fk_idVeiculo;
'''
display(pd.read_sql(query,con));
```


<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>N_Orçamento</th>
      <th>Valor</th>
      <th>Data</th>
      <th>Validade</th>
      <th>atendente</th>
      <th>Equipe_mecânicos</th>
      <th>Modelo</th>
      <th>Marca</th>
      <th>Ano</th>
      <th>Placa</th>
      <th>KM</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>55555</td>
      <td>1750.0</td>
      <td>2022-10-10</td>
      <td>90 dias</td>
      <td>Laura Y.</td>
      <td>A</td>
      <td>Argo</td>
      <td>Fiat</td>
      <td>2022</td>
      <td>bra1313</td>
      <td>10.000</td>
    </tr>
    <tr>
      <th>1</th>
      <td>123654</td>
      <td>1520.0</td>
      <td>2022-10-20</td>
      <td>90 dias</td>
      <td>Laura Y.</td>
      <td>A</td>
      <td>Logan</td>
      <td>Renault</td>
      <td>2020</td>
      <td>eqc2115</td>
      <td>85.000</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2222</td>
      <td>930.0</td>
      <td>2022-10-15</td>
      <td>60 dias</td>
      <td>Luana N.</td>
      <td>B</td>
      <td>Amarok</td>
      <td>Volkswagen</td>
      <td>2021</td>
      <td>def5897</td>
      <td>50.000</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3333</td>
      <td>810.0</td>
      <td>2022-10-18</td>
      <td>90 dias</td>
      <td>Luana N.</td>
      <td>B</td>
      <td>Creta</td>
      <td>Hyundai</td>
      <td>2022</td>
      <td>cra4545</td>
      <td>5.000</td>
    </tr>
    <tr>
      <th>4</th>
      <td>4444</td>
      <td>1456.0</td>
      <td>2022-10-20</td>
      <td>90 dias</td>
      <td>Luana N.</td>
      <td>A</td>
      <td>Fielder</td>
      <td>Toyota</td>
      <td>2008</td>
      <td>ecp1026</td>
      <td>300.000</td>
    </tr>
  </tbody>
</table>
</div>


* *Temos data assim como as informações do atendente e da equipe que realizaram os orçamentos.*

### 13- Informe todos os orçamentos com status aprovado.
<a id="ancora5.15"></a>
[voltar](#ancora)


```python
display(pd.read_sql("SELECT * FROM orçamento WHERE Aprovado = 'SIM'",con))
```


<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>idOrçamento</th>
      <th>Numero_Orçamento</th>
      <th>Aprovado</th>
      <th>Valor</th>
      <th>Data</th>
      <th>Validade</th>
      <th>fk_idVeiculo</th>
      <th>Cod_Funcionário</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>123654</td>
      <td>SIM</td>
      <td>1520.0</td>
      <td>2022-10-20</td>
      <td>90 dias</td>
      <td>1</td>
      <td>100</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>55555</td>
      <td>SIM</td>
      <td>1750.0</td>
      <td>2022-10-10</td>
      <td>90 dias</td>
      <td>2</td>
      <td>100</td>
    </tr>
    <tr>
      <th>2</th>
      <td>4</td>
      <td>3333</td>
      <td>SIM</td>
      <td>810.0</td>
      <td>2022-10-18</td>
      <td>90 dias</td>
      <td>4</td>
      <td>101</td>
    </tr>
    <tr>
      <th>3</th>
      <td>5</td>
      <td>2222</td>
      <td>SIM</td>
      <td>930.0</td>
      <td>2022-10-15</td>
      <td>60 dias</td>
      <td>5</td>
      <td>101</td>
    </tr>
  </tbody>
</table>
</div>


### 14- Informe o número da ordem, nome do cliente pf, contato, nome do funcionário, data de emissão, data de conclusão, nome do serviço, previsão em horas, Descrição do serviço, Mão de obra, quantidade, nome da peça, descrição da peça, quantidade de peças e valor unitário, modelo do veiculo, marca, ano, placa km.
<a id="ancora5.16"></a>
[voltar](#ancora)


```python
query='''
SELECT 
    os.Numero AS OS,
    cpf.Nome AS cliente,
    cpf.Telefone AS contato,
    f.Nome AS atendente,
    os.Data_Emissão AS emissão,
    os.Data_Conclusão AS conclusão,
    s.Nome_Serviço AS serviço,
    s.Duração AS tempo_estimado,
    s.Descrição AS desc_serviço,
    s.Mão_de_Obra,
    sp.Qtd_Serviço AS qtd_serviço,
    p.Nome_peça AS peça,
    p.Descrição AS desc_peça,
    sp.Qtd_Peça AS qtd_peças,
    p.Valor_Unitário AS valor_unit,
    v.Modelo,
    v.Marca,
    v.Placa,
    v.Ano,
    v.KM    
FROM
    `OS` os
        JOIN
    orçamento o ON os.fk_idOrçamento = o.idOrçamento
        JOIN
    serviço_peça sp ON os.fk_idOrçamento = sp.fk_idOrçamento,
    serviço s,
    peça p,
    veiculo v,
    cliente_pf cpf,
    funcionario f
WHERE
    sp.fk_idServiço = s.idServiço
        AND sp.fk_idpeça = p.idPeça
        AND o.fk_idVeiculo = v.idVeiculo
        AND v.fk_idCliente_pf = cpf.idCliente_pf
        AND f.Código = o.Cod_Funcionário;
'''
display(pd.read_sql(query,con));
```


<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>OS</th>
      <th>cliente</th>
      <th>contato</th>
      <th>atendente</th>
      <th>emissão</th>
      <th>conclusão</th>
      <th>serviço</th>
      <th>tempo_estimado</th>
      <th>desc_serviço</th>
      <th>Mão_de_Obra</th>
      <th>qtd_serviço</th>
      <th>peça</th>
      <th>desc_peça</th>
      <th>qtd_peças</th>
      <th>valor_unit</th>
      <th>Modelo</th>
      <th>Marca</th>
      <th>Placa</th>
      <th>Ano</th>
      <th>KM</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>12356</td>
      <td>Roberto</td>
      <td>679562345</td>
      <td>Laura Y.</td>
      <td>2022-10-21</td>
      <td>2022-10-21</td>
      <td>cabos</td>
      <td>1</td>
      <td>troca do conjunto de cabos</td>
      <td>50.0</td>
      <td>1</td>
      <td>Cabo de vela</td>
      <td>Jogo</td>
      <td>1</td>
      <td>200.0</td>
      <td>Argo</td>
      <td>Fiat</td>
      <td>bra1313</td>
      <td>2022</td>
      <td>10.000</td>
    </tr>
    <tr>
      <th>1</th>
      <td>12356</td>
      <td>Roberto</td>
      <td>679562345</td>
      <td>Laura Y.</td>
      <td>2022-10-21</td>
      <td>2022-10-21</td>
      <td>Óleo Motor</td>
      <td>1</td>
      <td>Troca de óleo motor</td>
      <td>80.0</td>
      <td>1</td>
      <td>Óleo Motor</td>
      <td>1Litro</td>
      <td>4</td>
      <td>30.0</td>
      <td>Argo</td>
      <td>Fiat</td>
      <td>bra1313</td>
      <td>2022</td>
      <td>10.000</td>
    </tr>
    <tr>
      <th>2</th>
      <td>12356</td>
      <td>Roberto</td>
      <td>679562345</td>
      <td>Laura Y.</td>
      <td>2022-10-21</td>
      <td>2022-10-21</td>
      <td>Óleo Cambio</td>
      <td>1</td>
      <td>Troca do óleo Cambio</td>
      <td>150.0</td>
      <td>1</td>
      <td>Óleo Cambio</td>
      <td>1Litro</td>
      <td>4</td>
      <td>200.0</td>
      <td>Argo</td>
      <td>Fiat</td>
      <td>bra1313</td>
      <td>2022</td>
      <td>10.000</td>
    </tr>
    <tr>
      <th>3</th>
      <td>12356</td>
      <td>Roberto</td>
      <td>679562345</td>
      <td>Laura Y.</td>
      <td>2022-10-21</td>
      <td>2022-10-21</td>
      <td>Vela_elétrica</td>
      <td>1</td>
      <td>Troca do conjunto de velas</td>
      <td>50.0</td>
      <td>1</td>
      <td>Vela</td>
      <td>Jogo</td>
      <td>1</td>
      <td>300.0</td>
      <td>Argo</td>
      <td>Fiat</td>
      <td>bra1313</td>
      <td>2022</td>
      <td>10.000</td>
    </tr>
    <tr>
      <th>4</th>
      <td>12378</td>
      <td>Julio Cesar</td>
      <td>119857412</td>
      <td>Luana N.</td>
      <td>2022-10-19</td>
      <td>2022-10-19</td>
      <td>Freios</td>
      <td>1</td>
      <td>Troca conjuto de pastilhas</td>
      <td>100.0</td>
      <td>1</td>
      <td>Pastilhas</td>
      <td>Pastilhas Jogo</td>
      <td>1</td>
      <td>110.0</td>
      <td>Creta</td>
      <td>Hyundai</td>
      <td>cra4545</td>
      <td>2022</td>
      <td>5.000</td>
    </tr>
    <tr>
      <th>5</th>
      <td>12378</td>
      <td>Julio Cesar</td>
      <td>119857412</td>
      <td>Luana N.</td>
      <td>2022-10-19</td>
      <td>2022-10-19</td>
      <td>Bandeja</td>
      <td>1</td>
      <td>Reparo do conjunto de bandeja dianteira</td>
      <td>200.0</td>
      <td>1</td>
      <td>Bandeja</td>
      <td>Conjunto dir/esq</td>
      <td>1</td>
      <td>400.0</td>
      <td>Creta</td>
      <td>Hyundai</td>
      <td>cra4545</td>
      <td>2022</td>
      <td>5.000</td>
    </tr>
  </tbody>
</table>
</div>


### 15- Informe a os, atendente, emissão, conclusão, o modelo, marca, placa, ano e km do veículo, valor, desconto e o total com o desconto já aplicado e por fim informa a equipe responsável. 
<a id="ancora5.17"></a>
[voltar](#ancora)


```python
query='''
SELECT 
    os.Numero AS OS,
    f.Nome AS atendente,
    os.Data_Emissão AS emissão,
    os.Data_Conclusão AS conclusão,       
    v.Modelo,
    v.Marca,
    v.Placa,
    v.Ano,
    v.KM,
    o.Valor,
    os.Desconto AS 'desc%',
    round(o.Valor - (o.Valor * (os.Desconto/100)),2) as Total,
    e.Equipe AS equipe_responsável
FROM
    `OS` os
        JOIN
    orçamento o ON os.fk_idOrçamento = o.idOrçamento,        
    veiculo v,    
    funcionario f,
    equipe_orçamento eo,
    equipe e    
WHERE
    o.fk_idVeiculo = v.idVeiculo        
    AND f.Código = o.Cod_Funcionário
    AND o.idOrçamento = eo.fk_idOrçamento
    AND eo.fk_idEquipe = e.idEquipe;
'''
display(pd.read_sql(query,con));
```


<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>OS</th>
      <th>atendente</th>
      <th>emissão</th>
      <th>conclusão</th>
      <th>Modelo</th>
      <th>Marca</th>
      <th>Placa</th>
      <th>Ano</th>
      <th>KM</th>
      <th>Valor</th>
      <th>desc%</th>
      <th>Total</th>
      <th>equipe_responsável</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>12356</td>
      <td>Laura Y.</td>
      <td>2022-10-21</td>
      <td>2022-10-21</td>
      <td>Argo</td>
      <td>Fiat</td>
      <td>bra1313</td>
      <td>2022</td>
      <td>10.000</td>
      <td>1750.0</td>
      <td>5.0</td>
      <td>1662.5</td>
      <td>A</td>
    </tr>
    <tr>
      <th>1</th>
      <td>12345</td>
      <td>Laura Y.</td>
      <td>2022-10-20</td>
      <td>2022-10-21</td>
      <td>Logan</td>
      <td>Renault</td>
      <td>eqc2115</td>
      <td>2020</td>
      <td>85.000</td>
      <td>1520.0</td>
      <td>10.0</td>
      <td>1368.0</td>
      <td>A</td>
    </tr>
    <tr>
      <th>2</th>
      <td>12389</td>
      <td>Luana N.</td>
      <td>2022-10-21</td>
      <td>2022-10-22</td>
      <td>Amarok</td>
      <td>Volkswagen</td>
      <td>def5897</td>
      <td>2021</td>
      <td>50.000</td>
      <td>930.0</td>
      <td>5.0</td>
      <td>883.5</td>
      <td>B</td>
    </tr>
    <tr>
      <th>3</th>
      <td>12378</td>
      <td>Luana N.</td>
      <td>2022-10-19</td>
      <td>2022-10-19</td>
      <td>Creta</td>
      <td>Hyundai</td>
      <td>cra4545</td>
      <td>2022</td>
      <td>5.000</td>
      <td>810.0</td>
      <td>10.0</td>
      <td>729.0</td>
      <td>B</td>
    </tr>
  </tbody>
</table>
</div>



```python

```
