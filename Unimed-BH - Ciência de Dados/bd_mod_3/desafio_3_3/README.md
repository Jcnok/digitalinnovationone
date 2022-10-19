## Projeto e-commerce

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/bd_mod_3/desafio_3_3/ecommerce.jpg?raw=true)

* **Este projeto faz parte da trilha “Unimed-BH-Ciência de dados” disponibilizada pela [DIO](https://www.dio.me/).**
* **Esse projeto foi elaborado de acordo com as aulas do módulo de Banco de Dados e consiste na modelagem ER, script sql para criação do schema, persistência e realização de testes utilizando queries.**
* **Ao navegar pelo índice, é possível visualizar todo o passo-à-passo realizado durante o acompanhamento das aulas.**

<a name="ancora"></a>
# Índice
* [Contexto](#ancora1)
    * [Produtos](#ancora1.1)
    * [Clientes](#ancora1.2)
    * [Pedidos](#ancora1.3)
        
* [Diagrama EER - ecommerce](#ancora2)

* [Script SQL para criação do BD.](#ancora3)
    * [Criar a tabela de cliente.](#ancora3.1)
    * [Criar a tabela produto.](#ancora3.2)
    * [Criar a tabela Pedido.](#ancora3.3)
    * [Criar a tabela estoque.](#ancora3.4)
    * [Criar a tabela fornecedor.](#ancora3.5)
    * [Criar tabela vendedor.](#ancora3.6)
    * [Criar a tabela produto/vendedor.](#ancora3.7)
    * [Criar a tabela produto/pedido.](#ancora3.8)
    * [Criar a tabela estoque/produto.](#ancora3.9)
    * [Criar tabela produto/fornecedor.](#ancora3.10)
       
        
* [Script para Inserir Registros no BD.](#ancora4)
    * [Persistindo dados de um arquivo csv na tabela Clients - Clientes.](#ancora4.2)
    * [Persistindo dados de um arquivo csv na tabela products - Produtos.](#ancora4.3)
    * [Persistindo dados de um arquivo csv na tabela orders - Pedidos.](#ancora4.4)
    * [Persistindo dados de um arquivo csv na tabela productstorage - Estoque.](#ancora4.5)
    * [Persistindo dados de um arquivo csv na tabela supplier - Fornecedores.](#ancora4.6)
    * [Persistindo dados de um arquivo csv na tabela seller - Vendedores.](#ancora4.7)
    * [Persistindo dados de um arquivo csv na tabela  productseller - produto/vendedor.](#ancora4.8)
    * [Persistindo dados de um arquivo csv na tabela productorder - produto/pedido.](#ancora4.9)
    * [Persistindo dados de um arquivo csv na tabela storagelocation - estoque/produto.](#ancora4.10)
    * [Persistindo dados de um arquivo csv na tabela productsupplier - produto/forncecedor.](#ancora4.11)
       
    
* [Script para consultas(Queries)](#ancora5)
    * [Realizando a conexão com o Banco de Dados.](#ancora5.1)
    * [1-Exiba a tabela clients.](#ancora5.2)
    * [2-Informe a quantidade de clientes da tabela 'clients'.](#ancora5.3)
    * [3-Exibir todos os clientes que possuem um pedido.](#ancora5.4)
    * [4-Exibir o nome, sobrenome, id e status da ordem dos clientes que possuem alguma pedido.](#ancora5.5)
    * [5-Exibir o nome e sobrenome concatenado, a id e o status da ordem.](#ancora5.6)
    * [6-Inserir a ordem do cliente Osvaldo Cruz com id 11, com status da ordem em default, descrição 'site', sendvalue null e paymentcash como 1.](#ancora5.7)
    * [7-Confira se a ordem do cliente Osvaldo foi inserida.](#ancora5.8)
    * [8-Altere o status da ordem do cliente Osvaldo que possui a requisição núm:17 e 18 para 'Cancelado'.](#ancora5.9)
    * [9-Confira se a ordem do cliente Osvaldo foi alterada conforme solicitado.](#ancora5.10)
    * [10-Informe a quantidade de pedidos por clientes.](#ancora5.11)
    * [11-Informe a quantidade de ordens com status cancelado por clientes ordenado por nome de forma descentende.](#ancora5.12)
    * [12-Informe a quantidade de produtos por categoria e por localização com avaliação maior ou igual a 4 ordenado por quantidade descendente.](#ancora5.13)    

### Contexto.
<a id="ancora1.1"></a>
[voltar](#ancora).

#### Produtos
<a id="ancora1.2"></a>
[voltar](#ancora)

* Os produtos são vendidos por uma única plataforma online. Contudo, estes podem ter vendedores distintos (terceiros).
* Cada produto possui um fornecedor.
* Um ou mais produtos podem compor um pedido.

#### Clientes
<a id="ancora1.3"></a>
[voltar](#ancora)

* O cliente pode se cadastrar no site com seu CPF ou CNPJ.
* O Endereço do cliente irá determinar o valor do frete.
* Um cliente pode comprar mais de um pedido. Este tem um período de carência para devolução do produto.

#### Pedidos
<a id="ancora1.4"></a>
[voltar](#ancora)

* Os pedidos são criados por clientes e possuem informações de compra, endereço e status da entrega.
* Um produto ou mais compoem o pedido.
* O pedido pode ser cancelado.

### Diagrama EER - ecommerce.
<a id="ancora2"></a>
[voltar](#ancora).

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/images/modelo_ecommerce_EER.png?raw=true)

### Script SQL para criação do BD.
<a id="ancora3"></a>
[voltar](#ancora).

####  **Criar a tabela de cliente.**  
<a id="ancora3.1"></a>
[voltar](#ancora).


```python

'''CREATE TABLE clients(
        idClient INT AUTO_INCREMENT PRIMARY KEY,
        Fname VARCHAR(20),
        Minit CHAR(3),
        Lname VARCHAR(20),
        CPF CHAR(11) NOT NULL,
        Address VARCHAR(30),
        CONSTRAINT unique_cpf_client UNIQUE(CPF)
);'''
```

####  **Criar a tabela produto.**
<a id="ancora3.2"></a>
[voltar](#ancora).


```python
'''CREATE TABLE products (
        idProduct INT AUTO_INCREMENT PRIMARY KEY,
        Pname VARCHAR(10) NOT NULL,
        Classification_Kids BOOL DEFAULT FALSE,
        Category ENUM('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') NOT NULL,
        Avaliação FLOAT DEFAULT 0,
        Size VARCHAR(10)
);'''
```

####  **Criar a tabela Pedido.**
<a id="ancora3.3"></a>
[voltar](#ancora).


```python
''' TABLE orders (
        idOrder INT AUTO_INCREMENT PRIMARY KEY,
        idOrderClient INT,
        OrderStatus ENUM('Cancelado', 'Confirmado', 'Em processamento') DEFAULT 'Em Processamento',
        OrderDescription VARCHAR(255),
        SendValue FLOAT DEFAULT 10,
        PaymentCash BOOL DEFAULT FALSE,
        CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient)
            REFERENCES clients (idClient)
);'''
```

####  **Criar a tabela estoque.**
<a id="ancora3.4"></a>
[voltar](#ancora).


```python
'''CREATE TABLE productstorage (
        idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
        StorageLocation VARCHAR(255),
        Quantity INT DEFAULT 0
);'''
```

####  **Criar a tabela fornecedor.**
<a id="ancora3.5"></a>
[voltar](#ancora).


```python
'''CREATE TABLE supplier (
        idSupplier INT AUTO_INCREMENT PRIMARY KEY,
        SocialName VARCHAR(255) NOT NULL,
        CNPJ CHAR(15) NOT NULL,
        Contact CHAR(11) NOT NULL,
        CONSTRAINT unique_supplier UNIQUE (CNPJ)
);'''
```

####  **Criar tabela vendedor.**
<a id="ancora3.6"></a>
[voltar](#ancora).


```python
'''CREATE TABLE seller (
        idSeller INT AUTO_INCREMENT PRIMARY KEY,
        SocialName VARCHAR(255) NOT NULL,
        AbstName VARCHAR(255),
        CNPJ CHAR(15),
        CPF CHAR(11),
        Location VARCHAR(255),
        Contact CHAR(11) NOT NULL,
        CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ),
        CONSTRAINT unique_cpf_seller UNIQUE (CPF)
);'''
```

####  **Criar a tabela produto/vendedor.**
<a id="ancora3.7"></a>
[voltar](#ancora).


```python
'''CREATE TABLE productseller (
        idPseller INT,
        idPproduct INT,
        prodQuantity INT DEFAULT 1,
        PRIMARY KEY (idPseller , idPproduct),
        CONSTRAINT fk_product_seller FOREIGN KEY (idPseller)
            REFERENCES seller (idSeller),
        CONSTRAINT fk_product_product FOREIGN KEY (idPproduct)
            REFERENCES products (idProduct)
);'''
```

####  **Criar a tabela produto/pedido.**
<a id="ancora3.8"></a>
[voltar](#ancora).


```python
'''CREATE TABLE productorder (
        idPOproduct INT,
        idPOorder INT,
        PoQuantity INT DEFAULT 1,
        PoStatus ENUM('Disponível', 'Sem estoque') DEFAULT 'Disponível',
        PRIMARY KEY (idPOproduct , idPOorder),
        CONSTRAINT fk_productorder_seller FOREIGN KEY (idPOproduct)
            REFERENCES products (idProduct),
        CONSTRAINT fk_productorder_product FOREIGN KEY (idPOorder)
            REFERENCES orders (idOrder)
);'''
```

####  **Criar a tabela estoque/produto.**
<a id="ancora3.9"></a>
[voltar](#ancora).


```python
'''CREATE TABLE storagelocation (
        idLproduct INT,
        idLstorage INT,
        location VARCHAR(255) NOT NULL,
        PRIMARY KEY (idLproduct , idLstorage),
        CONSTRAINT fk_productstorage_seller FOREIGN KEY (idLproduct)
            REFERENCES products (idProduct),
        CONSTRAINT fk_productstorage_product FOREIGN KEY (idLstorage)
            REFERENCES productstorage (idProdStorage)
);'''
```

####  **Criar tabela produto/fornecedor.**
<a id="ancora3.10"></a>
[voltar](#ancora).


```python
'''CREATE TABLE productsupplier (
        idPsSupplier INT,
        idPsProduct INT,
        quantity INT NOT NULL,
        PRIMARY KEY (idPsSupplier , idPsProduct),
        CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPsSupplier)
            REFERENCES supplier (idSupplier),
        CONSTRAINT fk_product_supplier_product FOREIGN KEY (idPsProduct)
            REFERENCES products (idProduct)
);'''
```

### Script para Inserir Registros no BD.
<a id="ancora4"></a>
[voltar](#ancora).

* **Todos os Scripts estão disponíveis no repositório.**
* **Foram utilizados os softwares: Workbench para modelagem e MySQL para o bando de dados.**
* **Os arquivos foram salvos na pasta 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\' do Sistema, pois está possui as devidas permissões por padrão.**
* **Para localizar o caminho da pasta no sistema utilize o comando: SELECT @@global.secure_file_priv;**


#### **Persistindo dados de um arquivo csv na tabela Clients - Clientes.**
<a id="ancora4.2"></a>
[voltar](#ancora).


```python
'''load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\cliente.csv'
        into table clients
        fields terminated by ';'
        enclosed by '"'
        lines terminated by '\n'
        ignore 1 rows
        (Fname,Minit,Lname,CPF,Address);

-- conferindo se os dados foram persistidos --
SELECT * FROM clients;'''
```

#### **Persistindo dados de um arquivo csv na tabela products - Produtos.**
<a id="ancora4.3"></a>
[voltar](#ancora).


```python
'''load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\produtos.csv'
        into table products
        fields terminated by ';'
        enclosed by '"'
        lines terminated by '\n'
        ignore 1 rows
        (Pname,Classification_kids,Category,Avaliação,Size);

-- Verficando se os dados foram persistidos. --
SELECT * FROM products;'''
```

#### **Persistindo dados de um arquivo csv na tabela orders - Pedidos.**
<a id="ancora4.4"></a>
[voltar](#ancora).


```python
'''load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\orders.csv'
        into table orders
        fields terminated by ';'
        enclosed by '"'
        lines terminated by '\n'
        ignore 1 rows
        (idOrderClient,OrderStatus,OrderDescription,SendValue,PaymentCash);

-- Verficando se os dados foram persistidos. --
SELECT * FROM orders; '''
```

#### **Persistindo dados de um arquivo csv na tabela productstorage - Estoque.**
<a id="ancora4.5"></a>
[voltar](#ancora).


```python
'''load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\productStorage.csv'
        into table productstorage
        fields terminated by ';'
        enclosed by '"'
        lines terminated by '\n'
        ignore 1 rows
        (StorageLocation,Quantity);

-- Verficando se os dados foram persistidos. --
SELECT * FROM productstorage; '''
```

#### **Persistindo dados de um arquivo csv na tabela supplier - Fornecedores.**
<a id="ancora4.6"></a>
[voltar](#ancora).


```python
'''load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\supplier.csv'
        into table supplier
        fields terminated by ';'
        enclosed by '"'
        lines terminated by '\n'
        ignore 1 rows
        (SocialName,CNPJ,Contact);

-- Verficando se os dados foram persistidos. --
SELECT * FROM supplier; '''
```

#### **Persistindo dados de um arquivo csv na tabela seller - Vendedores.**
<a id="ancora4.7"></a>
[voltar](#ancora).


```python
'''load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\seller.csv'
        into table seller
        fields terminated by ';'
        enclosed by '"'
        lines terminated by '\n'
        ignore 1 rows
        (SocialName,AbstName,CNPJ,CPF,Location,Contact);

-- Verficando se os dados foram persistidos. --
SELECT * FROM seller; '''
```

#### **Persistindo dados de um arquivo csv na tabela  productseller - produto/vendedor.**
<a id="ancora4.8"></a>
[voltar](#ancora).


```python
'''load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\productseller.csv'
        into table productseller
        fields terminated by ';'
        enclosed by '"'
        lines terminated by '\n'
        ignore 1 rows
        (idPseller,idPproduct,prodQuantity);

-- Verficando se os dados foram persistidos. --
SELECT * FROM productseller; '''
```

#### **Persistindo dados de um arquivo csv na tabela productorder - produto/pedido.**
<a id="ancora4.9"></a>
[voltar](#ancora).


```python
'''load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\productorder.csv'
        into table productorder
        fields terminated by ';'
        enclosed by '"'
        lines terminated by '\n'
        ignore 1 rows
        (idPOproduct,idPOorder,PoQuantity);

-- Verficando se os dados foram persistidos. --
SELECT * FROM productorder; '''
```

#### **Persistindo dados de um arquivo csv na tabela storagelocation - estoque/produto.**
<a id="ancora4.10"></a>
[voltar](#ancora).


```python
'''load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\storagelocation.csv'
        into table storagelocation
        fields terminated by ';'
        enclosed by '"'
        lines terminated by '\n'
        ignore 1 rows
        (idLproduct,idLstorage,location);

-- Verficando se os dados foram persistidos. --
SELECT * FROM storagelocation;'''
```

#### **Persistindo dados de um arquivo csv na tabela productsupplier - produto/forncecedor.**
<a id="ancora4.11"></a>
[voltar](#ancora).


```python
'''load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\productsupplier.csv'
        into table productsupplier
        fields terminated by ';'
        enclosed by '"'
        lines terminated by '\n'
        ignore 1 rows
        (idPsSupplier,idPsProduct,quantity);

-- Verficando se os dados foram persistidos. --
SELECT * FROM productsupplier; '''
```

### Script para consultas(Queries).
<a id="ancora5"></a>
[voltar](#ancora).

#### **Realizando a conexão com o Banco de Dados.**
<a id="ancora5.1"></a>
[voltar](#ancora).


```python
#importação das bibliotecas para conexão 1
import mysql.connector
import pandas as pd
import warnings
warnings.filterwarnings('ignore')
```


```python
# Testando a conexão, nesse caso crieu um usuário sem senha para teste.
con = mysql.connector.connect(host='localhost',database='ecommerce',user='julio',password='')
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
    Conectado ao banco de dados  ('ecommerce',)
    Conexão ao MySQL foi encerrada
    


```python
# Exibindo as tabelas do banco de dados.
con = mysql.connector.connect(host='localhost',database='ecommerce',user='julio',password='')
cursor = con.cursor()
cursor.execute('SHOW TABLES')
for i in cursor:
  print(i)
```

    ('clients',)
    ('orders',)
    ('payments',)
    ('productorder',)
    ('products',)
    ('productseller',)
    ('productstorage',)
    ('productsupplier',)
    ('seller',)
    ('storagelocation',)
    ('supplier',)
    


```python
# Consultando uma tabela.
cursor = con.cursor()
cursor.execute('SELECT * FROM clients')
result = cursor.fetchall()
for i in result:
    print(i)
```

    (1, 'Roberto', 'A', 'Notario', '12312312312', 'Ponta Porã - MS')
    (2, 'Solange', 'M', 'Okita', '45678912396', 'São Paulo - SP')
    (3, 'Laura', 'Y', 'Okuda', '96325874145', 'São Paulo - SP')
    (4, 'Lucas ', 'y', 'Okuda', '78965412396', 'Takasaki - JP')
    (5, 'Luana', 'N', 'Okuda', '75395145', 'São Paulo - SP')
    (6, 'Jeferson', 'C', 'Silva', '95185275325', 'SP\r')
    (7, 'Murilo', 'A', 'Costa', '35145896411', 'MS\r')
    (8, 'Maria', 'M', 'Silva', '38475985214', 'SP\r')
    (9, 'Sandar', 'Y', 'Marques', '98745635778', 'SP\r')
    (10, 'Rafael', 'y', 'Duarte', '85796836245', 'Takasaki\r')
    (11, 'Osvaldo', 'N', 'Cruz', '86235714569', 'SP\r')
    

#### **1) - Exiba a tabela clients.**
<a id="ancora5.2"></a>
[voltar](#ancora).


```python
# Convertendo as consulta para o tipo pandas dataset - apenas para facilitar a visualização.
pd.read_sql('SELECT * FROM clients',con=con)
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
      <th>idClient</th>
      <th>Fname</th>
      <th>Minit</th>
      <th>Lname</th>
      <th>CPF</th>
      <th>Address</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Roberto</td>
      <td>A</td>
      <td>Notario</td>
      <td>12312312312</td>
      <td>Ponta Porã - MS</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Solange</td>
      <td>M</td>
      <td>Okita</td>
      <td>45678912396</td>
      <td>São Paulo - SP</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>Laura</td>
      <td>Y</td>
      <td>Okuda</td>
      <td>96325874145</td>
      <td>São Paulo - SP</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>Lucas</td>
      <td>y</td>
      <td>Okuda</td>
      <td>78965412396</td>
      <td>Takasaki - JP</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Luana</td>
      <td>N</td>
      <td>Okuda</td>
      <td>75395145</td>
      <td>São Paulo - SP</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>Jeferson</td>
      <td>C</td>
      <td>Silva</td>
      <td>95185275325</td>
      <td>SP\r</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>Murilo</td>
      <td>A</td>
      <td>Costa</td>
      <td>35145896411</td>
      <td>MS\r</td>
    </tr>
    <tr>
      <th>7</th>
      <td>8</td>
      <td>Maria</td>
      <td>M</td>
      <td>Silva</td>
      <td>38475985214</td>
      <td>SP\r</td>
    </tr>
    <tr>
      <th>8</th>
      <td>9</td>
      <td>Sandar</td>
      <td>Y</td>
      <td>Marques</td>
      <td>98745635778</td>
      <td>SP\r</td>
    </tr>
    <tr>
      <th>9</th>
      <td>10</td>
      <td>Rafael</td>
      <td>y</td>
      <td>Duarte</td>
      <td>85796836245</td>
      <td>Takasaki\r</td>
    </tr>
    <tr>
      <th>10</th>
      <td>11</td>
      <td>Osvaldo</td>
      <td>N</td>
      <td>Cruz</td>
      <td>86235714569</td>
      <td>SP\r</td>
    </tr>
  </tbody>
</table>
</div>



#### **2) - Informe a quantidade de clientes da tabela 'clients'.**
<a id="ancora5.3"></a>
[voltar](#ancora).


```python
query ="SELECT COUNT(*) AS 'QTD_clientes' FROM clients;"
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
      <th>QTD_clientes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>11</td>
    </tr>
  </tbody>
</table>
</div>



#### **3) - Exibir todos os clientes que possuem um pedido.**
<a id="ancora5.4"></a>
[voltar](#ancora).


```python
query ="SELECT * FROM clients c, orders o WHERE c.idClient = o.idOrderClient;"
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
      <th>idClient</th>
      <th>Fname</th>
      <th>Minit</th>
      <th>Lname</th>
      <th>CPF</th>
      <th>Address</th>
      <th>idOrder</th>
      <th>idOrderClient</th>
      <th>OrderStatus</th>
      <th>OrderDescription</th>
      <th>SendValue</th>
      <th>PaymentCash</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Roberto</td>
      <td>A</td>
      <td>Notario</td>
      <td>12312312312</td>
      <td>Ponta Porã - MS</td>
      <td>1</td>
      <td>1</td>
      <td>Cancelado</td>
      <td>compra pelo app</td>
      <td>0.0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Solange</td>
      <td>M</td>
      <td>Okita</td>
      <td>45678912396</td>
      <td>São Paulo - SP</td>
      <td>2</td>
      <td>2</td>
      <td>Confirmado</td>
      <td>compra pelo app</td>
      <td>50.0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>Laura</td>
      <td>Y</td>
      <td>Okuda</td>
      <td>96325874145</td>
      <td>São Paulo - SP</td>
      <td>3</td>
      <td>3</td>
      <td>Em processamento</td>
      <td>loja</td>
      <td>10.0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>Lucas</td>
      <td>y</td>
      <td>Okuda</td>
      <td>78965412396</td>
      <td>Takasaki - JP</td>
      <td>4</td>
      <td>4</td>
      <td>Confirmado</td>
      <td>loja</td>
      <td>30.0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Luana</td>
      <td>N</td>
      <td>Okuda</td>
      <td>75395145</td>
      <td>São Paulo - SP</td>
      <td>5</td>
      <td>5</td>
      <td>Cancelado</td>
      <td>site</td>
      <td>0.0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>Jeferson</td>
      <td>C</td>
      <td>Silva</td>
      <td>95185275325</td>
      <td>SP\r</td>
      <td>6</td>
      <td>6</td>
      <td>Confirmado</td>
      <td>site</td>
      <td>40.0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>Murilo</td>
      <td>A</td>
      <td>Costa</td>
      <td>35145896411</td>
      <td>MS\r</td>
      <td>7</td>
      <td>7</td>
      <td>Em processamento</td>
      <td>compra pelo app</td>
      <td>20.0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>7</th>
      <td>8</td>
      <td>Maria</td>
      <td>M</td>
      <td>Silva</td>
      <td>38475985214</td>
      <td>SP\r</td>
      <td>8</td>
      <td>8</td>
      <td>Cancelado</td>
      <td>compra pelo app</td>
      <td>0.0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>8</th>
      <td>9</td>
      <td>Sandar</td>
      <td>Y</td>
      <td>Marques</td>
      <td>98745635778</td>
      <td>SP\r</td>
      <td>9</td>
      <td>9</td>
      <td>Em processamento</td>
      <td>site</td>
      <td>40.0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>9</th>
      <td>11</td>
      <td>Osvaldo</td>
      <td>N</td>
      <td>Cruz</td>
      <td>86235714569</td>
      <td>SP\r</td>
      <td>16</td>
      <td>11</td>
      <td>Em processamento</td>
      <td>site</td>
      <td>NaN</td>
      <td>1</td>
    </tr>
    <tr>
      <th>10</th>
      <td>11</td>
      <td>Osvaldo</td>
      <td>N</td>
      <td>Cruz</td>
      <td>86235714569</td>
      <td>SP\r</td>
      <td>17</td>
      <td>11</td>
      <td>Em processamento</td>
      <td>site</td>
      <td>NaN</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>



#### **4) - Exibir o nome, sobrenome, id e status da ordem dos clientes que possuem alguma pedido.**
<a id="ancora5.5"></a>
[voltar](#ancora).


```python
query ="SELECT Fname,Lname,idOrder,orderStatus FROM clients c, orders o WHERE c.idClient = idOrderClient;"
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
      <th>Fname</th>
      <th>Lname</th>
      <th>idOrder</th>
      <th>orderStatus</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Roberto</td>
      <td>Notario</td>
      <td>1</td>
      <td>Cancelado</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Solange</td>
      <td>Okita</td>
      <td>2</td>
      <td>Confirmado</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Laura</td>
      <td>Okuda</td>
      <td>3</td>
      <td>Em processamento</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Lucas</td>
      <td>Okuda</td>
      <td>4</td>
      <td>Confirmado</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Luana</td>
      <td>Okuda</td>
      <td>5</td>
      <td>Cancelado</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Jeferson</td>
      <td>Silva</td>
      <td>6</td>
      <td>Confirmado</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Murilo</td>
      <td>Costa</td>
      <td>7</td>
      <td>Em processamento</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Maria</td>
      <td>Silva</td>
      <td>8</td>
      <td>Cancelado</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Sandar</td>
      <td>Marques</td>
      <td>9</td>
      <td>Em processamento</td>
    </tr>
    <tr>
      <th>9</th>
      <td>Osvaldo</td>
      <td>Cruz</td>
      <td>16</td>
      <td>Em processamento</td>
    </tr>
    <tr>
      <th>10</th>
      <td>Osvaldo</td>
      <td>Cruz</td>
      <td>17</td>
      <td>Em processamento</td>
    </tr>
  </tbody>
</table>
</div>



#### **5) - Exibir o nome e sobrenome concatenado, a id e o status da ordem.**
<a id="ancora5.6"></a>
[voltar](#ancora).


```python
query ="SELECT CONCAT(Fname, ' ',Lname) AS Cliente,\
idOrder AS Request, orderStatus AS Status FROM clients c,\
orders o WHERE c.idClient = idOrderClient;"
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
      <th>Cliente</th>
      <th>Request</th>
      <th>Status</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Roberto Notario</td>
      <td>1</td>
      <td>Cancelado</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Solange Okita</td>
      <td>2</td>
      <td>Confirmado</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Laura Okuda</td>
      <td>3</td>
      <td>Em processamento</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Lucas  Okuda</td>
      <td>4</td>
      <td>Confirmado</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Luana Okuda</td>
      <td>5</td>
      <td>Cancelado</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Jeferson Silva</td>
      <td>6</td>
      <td>Confirmado</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Murilo Costa</td>
      <td>7</td>
      <td>Em processamento</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Maria Silva</td>
      <td>8</td>
      <td>Cancelado</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Sandar Marques</td>
      <td>9</td>
      <td>Em processamento</td>
    </tr>
    <tr>
      <th>9</th>
      <td>Osvaldo Cruz</td>
      <td>16</td>
      <td>Em processamento</td>
    </tr>
    <tr>
      <th>10</th>
      <td>Osvaldo Cruz</td>
      <td>17</td>
      <td>Em processamento</td>
    </tr>
  </tbody>
</table>
</div>



#### **6) - Inserir a ordem do cliente Osvaldo Cruz com id 11, com status da ordem em default, descrição 'site', sendvalue null e paymentcash como 1.**
<a id="ancora5.7"></a>
[voltar](#ancora).


```python
add ="INSERT INTO orders (idOrderClient,OrderStatus,OrderDescription,SendValue,PaymentCash) VALUES (11,DEFAULT,'site',NULL,1);"
meucursor = con.cursor()
meucursor.execute(add)

con.commit()

print("Uma linha foi inserida, ID:", meucursor.lastrowid)
```

    Uma linha foi inserida, ID: 19
    

#### **7) - Confira se a ordem do cliente Osvaldo foi inserida.**
<a id="ancora5.8"></a>
[voltar](#ancora).


```python
query ="SELECT CONCAT(Fname, ' ',Lname) AS Cliente, idOrder AS Request,\
orderStatus AS Status FROM clients c, orders o WHERE c.idClient = idOrderClient;"
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
      <th>Cliente</th>
      <th>Request</th>
      <th>Status</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Roberto Notario</td>
      <td>1</td>
      <td>Cancelado</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Solange Okita</td>
      <td>2</td>
      <td>Confirmado</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Laura Okuda</td>
      <td>3</td>
      <td>Em processamento</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Lucas  Okuda</td>
      <td>4</td>
      <td>Confirmado</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Luana Okuda</td>
      <td>5</td>
      <td>Cancelado</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Jeferson Silva</td>
      <td>6</td>
      <td>Confirmado</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Murilo Costa</td>
      <td>7</td>
      <td>Em processamento</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Maria Silva</td>
      <td>8</td>
      <td>Cancelado</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Sandar Marques</td>
      <td>9</td>
      <td>Em processamento</td>
    </tr>
    <tr>
      <th>9</th>
      <td>Osvaldo Cruz</td>
      <td>16</td>
      <td>Em processamento</td>
    </tr>
    <tr>
      <th>10</th>
      <td>Osvaldo Cruz</td>
      <td>17</td>
      <td>Cancelado</td>
    </tr>
    <tr>
      <th>11</th>
      <td>Osvaldo Cruz</td>
      <td>18</td>
      <td>Cancelado</td>
    </tr>
    <tr>
      <th>12</th>
      <td>Osvaldo Cruz</td>
      <td>19</td>
      <td>Cancelado</td>
    </tr>
  </tbody>
</table>
</div>



#### **8) - Altere o status da ordem do cliente Osvaldo que possui a requisição núm:17 e 18 para 'Cancelado'.**
<a id="ancora5.9"></a>
[voltar](#ancora).


```python
change = "UPDATE orders SET orderStatus = 'Cancelado' WHERE idOrder IN (17,18) AND idOrderClient = 11;"
meucursor = con.cursor()
meucursor.execute(change)

con.commit()

print("Ordem foi alterada com sucesso, ID:", meucursor.lastrowid)
```

    Ordem foi alterada com sucesso, ID: 0
    

#### **9) - Confira se a ordem do cliente Osvaldo foi alterada conforme solicitado.**
<a id="ancora5.10"></a>
[voltar](#ancora).


```python
query = "SELECT Fname, idOrderClient,orderStatus idOrder FROM clients, \
orders WHERE idOrder IN (17,18) AND idOrderClient = idClient;"
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
      <th>Fname</th>
      <th>idOrderClient</th>
      <th>idOrder</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Osvaldo</td>
      <td>11</td>
      <td>Cancelado</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Osvaldo</td>
      <td>11</td>
      <td>Cancelado</td>
    </tr>
  </tbody>
</table>
</div>



#### **10) - Informe a quantidade de pedidos por clientes.**
<a id="ancora5.11"></a>
[voltar](#ancora).


```python
query ="SELECT COUNT(*) AS 'Qtd Pedidos',CONCAT(Fname, ' ', Lname) AS Cliente,\
orderStatus AS Status FROM clients c, orders o WHERE c.idClient = idOrderClient GROUP BY c.idClient;"
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
      <th>Qtd Pedidos</th>
      <th>Cliente</th>
      <th>Status</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Roberto Notario</td>
      <td>Cancelado</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>Solange Okita</td>
      <td>Confirmado</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>Laura Okuda</td>
      <td>Em processamento</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1</td>
      <td>Lucas  Okuda</td>
      <td>Confirmado</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1</td>
      <td>Luana Okuda</td>
      <td>Cancelado</td>
    </tr>
    <tr>
      <th>5</th>
      <td>1</td>
      <td>Jeferson Silva</td>
      <td>Confirmado</td>
    </tr>
    <tr>
      <th>6</th>
      <td>1</td>
      <td>Murilo Costa</td>
      <td>Em processamento</td>
    </tr>
    <tr>
      <th>7</th>
      <td>1</td>
      <td>Maria Silva</td>
      <td>Cancelado</td>
    </tr>
    <tr>
      <th>8</th>
      <td>1</td>
      <td>Sandar Marques</td>
      <td>Em processamento</td>
    </tr>
    <tr>
      <th>9</th>
      <td>4</td>
      <td>Osvaldo Cruz</td>
      <td>Em processamento</td>
    </tr>
  </tbody>
</table>
</div>



#### **11) - Informe a quantidade de ordens com status cancelado por clientes ordenado por nome de forma descentende.**
<a id="ancora5.12"></a>
[voltar](#ancora).


```python
query ="SELECT idClient AS 'id', CONCAT(Fname, ' ',Lname) AS 'cliente',\
OrderDescription AS 'descrição', OrderStatus AS 'status', COUNT(*) AS 'qtd' FROM Orders,\
Clients WHERE OrderStatus = 'Cancelado' AND IdClient = IdOrderClient GROUP BY IdOrderClient ORDER BY Fname DESC;"
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
      <th>id</th>
      <th>cliente</th>
      <th>descrição</th>
      <th>status</th>
      <th>qtd</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Roberto Notario</td>
      <td>compra pelo app</td>
      <td>Cancelado</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>11</td>
      <td>Osvaldo Cruz</td>
      <td>site</td>
      <td>Cancelado</td>
      <td>3</td>
    </tr>
    <tr>
      <th>2</th>
      <td>8</td>
      <td>Maria Silva</td>
      <td>compra pelo app</td>
      <td>Cancelado</td>
      <td>1</td>
    </tr>
    <tr>
      <th>3</th>
      <td>5</td>
      <td>Luana Okuda</td>
      <td>site</td>
      <td>Cancelado</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>



#### **12) - Informe a quantidade de produtos por categoria e por localização com avaliação maior ou igual a 4 ordenado por quantidade descendente.**
<a id="ancora5.13"></a>
[voltar](#ancora).


```python
query ="SELECT StorageLocation, Category, Avaliação, SUM(Quantity) AS 'qtd'FROM productstorage,\
products GROUP BY Category, StorageLocation HAVING (Avaliação >= 4) ORDER BY Quantity DESC;"
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
      <th>StorageLocation</th>
      <th>Category</th>
      <th>Avaliação</th>
      <th>qtd</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>São Paulo</td>
      <td>Vestimenta</td>
      <td>4.0</td>
      <td>5400.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>São Paulo</td>
      <td>Brinquedos</td>
      <td>4.0</td>
      <td>1800.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>São Paulo</td>
      <td>Alimentos</td>
      <td>5.0</td>
      <td>1800.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>São Paulo</td>
      <td>Eletrônico</td>
      <td>4.0</td>
      <td>1800.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Paraná</td>
      <td>Vestimenta</td>
      <td>4.0</td>
      <td>2400.0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Paraná</td>
      <td>Brinquedos</td>
      <td>4.0</td>
      <td>800.0</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Paraná</td>
      <td>Alimentos</td>
      <td>5.0</td>
      <td>800.0</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Paraná</td>
      <td>Eletrônico</td>
      <td>4.0</td>
      <td>800.0</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Minas Gerais</td>
      <td>Vestimenta</td>
      <td>4.0</td>
      <td>1800.0</td>
    </tr>
    <tr>
      <th>9</th>
      <td>Minas Gerais</td>
      <td>Brinquedos</td>
      <td>4.0</td>
      <td>600.0</td>
    </tr>
    <tr>
      <th>10</th>
      <td>Minas Gerais</td>
      <td>Alimentos</td>
      <td>5.0</td>
      <td>600.0</td>
    </tr>
    <tr>
      <th>11</th>
      <td>Minas Gerais</td>
      <td>Eletrônico</td>
      <td>4.0</td>
      <td>600.0</td>
    </tr>
    <tr>
      <th>12</th>
      <td>Rio de Janeiro</td>
      <td>Vestimenta</td>
      <td>4.0</td>
      <td>2400.0</td>
    </tr>
    <tr>
      <th>13</th>
      <td>Rio de Janeiro</td>
      <td>Brinquedos</td>
      <td>4.0</td>
      <td>800.0</td>
    </tr>
    <tr>
      <th>14</th>
      <td>Rio de Janeiro</td>
      <td>Alimentos</td>
      <td>5.0</td>
      <td>800.0</td>
    </tr>
    <tr>
      <th>15</th>
      <td>Rio de Janeiro</td>
      <td>Eletrônico</td>
      <td>4.0</td>
      <td>800.0</td>
    </tr>
    <tr>
      <th>16</th>
      <td>Bahia</td>
      <td>Vestimenta</td>
      <td>4.0</td>
      <td>600.0</td>
    </tr>
    <tr>
      <th>17</th>
      <td>Bahia</td>
      <td>Brinquedos</td>
      <td>4.0</td>
      <td>200.0</td>
    </tr>
    <tr>
      <th>18</th>
      <td>Bahia</td>
      <td>Alimentos</td>
      <td>5.0</td>
      <td>200.0</td>
    </tr>
    <tr>
      <th>19</th>
      <td>Bahia</td>
      <td>Eletrônico</td>
      <td>4.0</td>
      <td>200.0</td>
    </tr>
  </tbody>
</table>
</div>




```python

```
