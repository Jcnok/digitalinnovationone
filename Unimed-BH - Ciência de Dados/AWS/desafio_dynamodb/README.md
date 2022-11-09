# Desafio dynamodb

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_dynamodb/dynamo_boto3_python.jpg?raw=true)

* **O Amazon DynamoDB é um serviço de banco de dados NoSQl totalmente gerenciado que fornece um desempenho rápido e previsível com escalabilidade integrada. Por ser gerenciado, trata de todo o provisionamento, instalação, configuração de hardware, replicação, correção de software e escalabilidade de cluster.**
* **Para o projeto foram utilizados a biblioteca [boto3](https://boto3.amazonaws.com/v1/documentation/api/latest/guide/dynamodb.html) uma sdk da aws para conexão ao dynamodb pelo jupyter notebook, utilizei também o console [aws CLI](https://docs.aws.amazon.com/pt_br/cli/latest/userguide/getting-started-install.html), um usuário com as devidas permissões de acesso ao dynamoDB da AWS. Todos os aquivos do projeto estão disponíveis no reposistório.**
* **O objetivo do desafio é colocar em prática todo o aprendizado do curso, nesse projeto irei realizar a conexão com o dynamoDB e demonstrar como criar, inserir, realizar update, consultas e deletar uma tabela via terminal e pelo boto3.**

### **Conexão com o dynamoDB AWS.**

- **realizando a importação da biblioteca boto3**.
- **use o comando !pip install boto3 para instalação prévia.**


```python
import boto3
import tqdm
```

- **Realizando a conexão como o dynamoDB.**
    - **Necessário possuir as seguintes informações da conta aws com as devidas permissões:** 
        - aws_access_key_id;
        - aws_secret_access_key;
        - region_name;

- **Segue um exemplo hipotético para se ter uma base**.


```python
dynamodb = boto3.resource(service_name = 'dynamodb',region_name = 'us-east-1',
              aws_access_key_id = 'AKIABCEDFGHIJKLMNO',
              aws_secret_access_key = 'J876dspHuCTrmTzZfZ6cjcACLLSACDyj/JCNOKACAG/d')
```

### **Criar uma tabela**.


```python
table = dynamodb.create_table(
        TableName='Music',
        KeySchema=[
            {
                'AttributeName': 'Artist',
                'KeyType': 'HASH'  # Partition key
            },
            {
                'AttributeName': 'SongTitle',
                'KeyType': 'RANGE'  # Sort key
            }
        ],
        AttributeDefinitions=[
            {
                'AttributeName': 'Artist',
                'AttributeType': 'S'
            },
            {
                'AttributeName': 'SongTitle',
                'AttributeType': 'S'
            },
 
        ],
        ProvisionedThroughput={
            'ReadCapacityUnits': 10,
            'WriteCapacityUnits': 5
        }
    )        
print("Table status:", table.table_status)
```

    Table status: CREATING
    

- **A tabela foi criada com sucesso na aws conforme o print abaixo.**

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_dynamodb/create_table.png?raw=true)

### **Inserir um item**.

- **Primeiro vamos visualizar o arquivo .json que será utilizado para inserir 1 registro na tabela.**


```python
# Acessando o arquivo json
import json
file = open('src/itemmusic1.json','r')
file = file.read()
data_file = json.loads(file)
data_file
```




    {'Artist': 'Iron Maiden',
     'SongTitle': 'Chains of Misery',
     'AlbumTitle': 'Fear of the Dark',
     'SongYear': '1992'}



- **Agora vamos realizar a conexão com a tabela Music.**


```python
### Acessando a tabela Music
music_table = dynamodb.Table('Music')
music_table.table_status
```




    'ACTIVE'



- **Por fim vamos inserir o registro do arquivo json na tabela Music**.


```python
# Inserindo um item.
response = music_table.put_item(Item = data_file )
```

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_dynamodb/item_create.png?raw=true)

### **Inserir múltiplos itens**.

- **Visualizando os registros do arquivo .json**.


```python
# Acessando o arquivo json
import json
file = open('src/batchmusic1.json','r')
file = file.read()
data_file = json.loads(file)
data_file
```




    [{'Artist': 'Iron Maiden',
      'SongTitle': 'Wasting Love',
      'AlbumTitle': 'Fear of the Dark Live',
      'SongYear': '1992'},
     {'Artist': 'Iron Maiden',
      'SongTitle': 'Weekend Warrior',
      'AlbumTitle': 'Fear of the Dark',
      'SongYear': '1992'},
     {'Artist': 'Iron Maiden',
      'SongTitle': 'Fear of the Dark',
      'AlbumTitle': 'Fear of the Dark Tour',
      'SongYear': '1992'}]



- **Inserindo todos os registros de uma só vez**.


```python
# Criando multiplos items com batch
with music_table.batch_writer() as batch:
    for record in tqdm.tqdm(data_file):
        batch.put_item(Item = record)
```

    100%|████████████████████████████████████████████████████████████████████████████████████████████| 3/3 [00:00<?, ?it/s]
    

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_dynamodb/create_multiple_item.png?raw=true)

### **Criar um index global secundário baseado no título do álbum**.

- **O objetivo do index secundário é permitir realizar consultas diretas sem a necessidde do indice primário**.


```python
table = dynamodb.Table('Music') 
response = table.update(
    AttributeDefinitions=[
        {
            'AttributeName': 'AlbumTitle',
            'AttributeType': 'S'
        },
    ],
    GlobalSecondaryIndexUpdates=[
          {              
              'Create': {
                  'IndexName': 'AlbumTitle-index',
                  'KeySchema': [
                      {
                          'AttributeName': 'AlbumTitle',
                          'KeyType': 'HASH'
                      },
                  ],
                  'Projection': {
                      'ProjectionType': 'ALL'                      
                  },
                  'ProvisionedThroughput': {
                      'ReadCapacityUnits': 10,
                      'WriteCapacityUnits': 5
                  }
              },
              
          },
      ],
)
```

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_dynamodb/index_global_sec_album_title.png?raw=true)

###  **Criar um index global secundário baseado no nome do artista e no título do álbum**.


```python
table = dynamodb.Table('Music') 
response = table.update(
    AttributeDefinitions=[
        {
            'AttributeName': 'Artist',
            'AttributeType': 'S'
        },
        {
            'AttributeName': 'AlbumTitle',
            'AttributeType': 'S'
        },
    ],
    GlobalSecondaryIndexUpdates=[
          {              
              'Create': {
                  'IndexName': 'ArtistAlbumTitle-index',
                  'KeySchema': [
                      {
                          'AttributeName': 'Artist',
                          'KeyType': 'HASH'
                      },
                      {
                          'AttributeName': 'AlbumTitle',
                          'KeyType': 'RANGE'
                      },
                  ],
                  'Projection': {
                      'ProjectionType': 'ALL'                      
                  },
                  'ProvisionedThroughput': {
                      'ReadCapacityUnits': 10,
                      'WriteCapacityUnits': 5
                  }
              },
              
          },
      ],
)
```

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_dynamodb/index_global_sec_album_artist.png?raw=true)

### **Criar um index global secundário baseado no título da música e no ano**.


```python
table = dynamodb.Table('Music') 
response = table.update(
    AttributeDefinitions=[
        {
            'AttributeName': 'SongTitle',
            'AttributeType': 'S'
        },
        {
            'AttributeName': 'SongYear',
            'AttributeType': 'S'
        },
    ],
    GlobalSecondaryIndexUpdates=[
          {              
              'Create': {
                  'IndexName': 'SongTitleYear-index',
                  'KeySchema': [
                      {
                          'AttributeName': 'SongTitle',
                          'KeyType': 'HASH'
                      },
                      {
                          'AttributeName': 'SongYear',
                          'KeyType': 'RANGE'
                      },
                  ],
                  'Projection': {
                      'ProjectionType': 'ALL'                      
                  },
                  'ProvisionedThroughput': {
                      'ReadCapacityUnits': 10,
                      'WriteCapacityUnits': 5
                  }
              },
              
          },
      ],
)
```

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_dynamodb/index_global_songtitleyear.png?raw=true)

### **Pesquisar item por artista e titulo da musíca**.

- **Existem algumas formas de realizar as consultas, essa parte acredito ser uma das mais importantes para o Cientista de Dados, e esse foi um dos motivos que me levaram a pesquisar sobre o boto3 para realizar as queries por script python ou nesse caso, diretamente aqui pelo jupyter notebook**.
- **Irei demonstrar algumas alternativas de consulta**.

- **Acessando o arquivo .json para consulta**.


```python
# Acessando o arquivo json
import json
file = open('src/keyconditions.json','r')
file = file.read()
data_file = json.loads(file)
data_file
```




    {':artist': {'S': 'Iron Maiden'}, ':title': {'S': 'Weekend Warrior'}}



- **Rodando a consulta via terminal pelo jupyter notebook**.


```python
!aws dynamodb query \
    --table-name Music \
    --key-condition-expression "Artist = :artist and SongTitle = :title" \
    --expression-attribute-values file://src//keyconditions.json
```

    {

    Associa‡Æo de arquivo nÆo encontrada para a extensÆo .py
    

    
        "Items": [
            {
                "AlbumTitle": {
                    "S": "Fear of the Dark"
                },
                "Artist": {
                    "S": "Iron Maiden"
                },
                "SongYear": {
                    "S": "1992"
                },
                "SongTitle": {
                    "S": "Weekend Warrior"
                }
            }
        ],
        "Count": 1,
        "ScannedCount": 1,
        "ConsumedCapacity": null
    }
    

- **Print da consulta realizada pelo terminal**.
*obs:executar o script na pasta raiz do arquivo json conforme a imagem abaixo.


```python
#Script via CLI aws.
'''
aws dynamodb query \
    --table-name Music \
    --key-condition-expression "Artist = :artist and SongTitle = :title" \
    --expression-attribute-values file://keyconditions.json
'''
```

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_dynamodb/consulta1.png?raw=true)

- **Executando a mesma consulta usando a lib boto3 direto no jupyter notebook.**
- **Essa acredito ser uma das formas mais interessantes, pois podemos ter acesso aos dados de forma imediata para uma Análise Exploratória por exemplo.**


```python
import boto3
from boto3.dynamodb.conditions import Key, Attr
dynamodb = boto3.resource('dynamodb', region_name='us-east-1')
table = dynamodb.Table('Music')
response = table.scan(
    FilterExpression=Attr('Artist').eq("Iron Maiden") & Attr('SongTitle').eq('Weekend Warrior')
)
items = response['Items']
print(items)
```

    [{'AlbumTitle': 'Fear of the Dark', 'Artist': 'Iron Maiden', 'SongYear': '1992', 'SongTitle': 'Weekend Warrior'}]
    

- **Utilizando o atributo get para mesma consulta**.


```python
response = table.get_item(
    Key={
        'Artist': 'Iron Maiden',
        'SongTitle': 'Weekend Warrior'
    }
)
item = response['Item']
print(item)
```

    {'AlbumTitle': 'Fear of the Dark', 'Artist': 'Iron Maiden', 'SongYear': '1992', 'SongTitle': 'Weekend Warrior'}
    

### **Pesquisa pelo index secundário baseado no título do álbum**.

- **Não seria possível a consulta dessa forma se não tivéssemos criado os índices secundários**.


```python
# Acessando o arquivo json
import json
file = open('src/AlbumTitle.json','r')
file = file.read()
data_file = json.loads(file)
data_file
```




    {':name': {'S': 'Fear of the Dark'}}



- **Realizando a pesquisa via terminal**.


```python
# Realizando a consulta via terminal
!aws dynamodb query \
    --table-name Music \
    --index-name AlbumTitle-index \
    --key-condition-expression "AlbumTitle = :name" \
    --expression-attribute-values file://src//AlbumTitle.json
```

    {
        "Items": [
            {
                "AlbumTitle": {
                    "S": "Fear of the Dark"
                },
                "Artist": {
                    "S": "Iron Maiden"
                },
                "SongYear": {
                    "S": "1992"
                },
                "SongTitle": {
                    "S": "Weekend Warrior"
                }
            },
            {
                "AlbumTitle": {
                    "S": "Fear of the Dark"
                },
                "Artist": {
                    "S": "Iron Maiden"
                },
                "SongYear": {
                    "S": "1992"
                },
                "SongTitle": {
                    "S": "Chains of Misery"
                }
            }
        ],
        "Count": 2,
        "ScannedCount": 2,
        "ConsumedCapacity": null
    }
    

    Associa‡Æo de arquivo nÆo encontrada para a extensÆo .py
    

- **Realizando a pesquisa com a biblioteca boto3 via jupyter notebook**.


```python
import boto3
from boto3.dynamodb.conditions import Key, Attr
dynamodb = boto3.resource('dynamodb', region_name='us-east-1')
table = dynamodb.Table('Music')
response = table.query(IndexName='AlbumTitle-index',KeyConditionExpression=Key('AlbumTitle').eq('Fear of the Dark'))
items = response['Items']
print(items)
```

    [{'AlbumTitle': 'Fear of the Dark', 'Artist': 'Iron Maiden', 'SongYear': '1992', 'SongTitle': 'Weekend Warrior'}, {'AlbumTitle': 'Fear of the Dark', 'Artist': 'Iron Maiden', 'SongYear': '1992', 'SongTitle': 'Chains of Misery'}]
    

### **Pesquisa pelo index secundário baseado no nome do artista e no título do álbum**

- **Realizando a consulta pelo terminal via jupyter**.


```python
# Realizando a consulta via terminal
!aws dynamodb query \
    --table-name Music \
    --index-name ArtistAlbumTitle-index \
    --key-condition-expression "Artist = :v_artist and AlbumTitle = :v_title" \
    --expression-attribute-values file://src//artist_albumtitle.json
```

    {
        "Items": [
            {
                "AlbumTitle": {
                    "S": "Fear of the Dark"
                },
                "Artist": {
                    "S": "Iron Maiden"
                },
                "SongYear": {
                    "S": "1992"
                },
                "SongTitle": {
                    "S": "Chains of Misery"
                }
            },
            {
                "AlbumTitle": {
                    "S": "Fear of the Dark"
                },
                "Artist": {
                    "S": "Iron Maiden"
                },
                "SongYear": {
                    "S": "1992"
                },
                "SongTitle": {
                    "S": "Weekend Warrior"
                }
            }
        ],
        "Count": 2,
        "ScannedCount": 2,
        "ConsumedCapacity": null
    }
    

    Associa‡Æo de arquivo nÆo encontrada para a extensÆo .py
    

- **Realizando a pesquisa com a biblioteca boto3 via jupyter notebook**.


```python
# Acessando o arquivo json
import json
file = open('src/artist_albumtitle.json','r')
file = file.read()
data_file = json.loads(file)
data_file
```




    {':v_artist': {'S': 'Iron Maiden'}, ':v_title': {'S': 'Fear of the Dark'}}




```python
# Realizando a query
import boto3
from boto3.dynamodb.conditions import Key, Attr
dynamodb = boto3.resource('dynamodb', region_name='us-east-1')
table = dynamodb.Table('Music')
response = table.query(IndexName='ArtistAlbumTitle-index',KeyConditionExpression=
                       Key('Artist').eq('Iron Maiden')&
                       Key('AlbumTitle').eq('Fear of the Dark'))
items = response['Items']
print(items)
```

    [{'AlbumTitle': 'Fear of the Dark', 'Artist': 'Iron Maiden', 'SongYear': '1992', 'SongTitle': 'Chains of Misery'}, {'AlbumTitle': 'Fear of the Dark', 'Artist': 'Iron Maiden', 'SongYear': '1992', 'SongTitle': 'Weekend Warrior'}]
    

### **Pesquisa pelo index secundário baseado no título da música e no ano**.  

- **Realizando a consulta pelo terminal via jupyter.**


```python
!aws dynamodb query \
    --table-name Music \
    --index-name SongTitleYear-index \
    --key-condition-expression "SongTitle = :v_song and SongYear = :v_year" \
    --expression-attribute-values  file://src//songtitle_year.json
```

    {
        "Items": [
            {
                "AlbumTitle": {
                    "S": "Fear of the Dark Live"
                },
                "Artist": {
                    "S": "Iron Maiden"
                },
                "SongTitle": {
                    "S": "Wasting Love"
                },
                "SongYear": {
                    "S": "1992"
                }
            }
        ],
        "Count": 1,
        "ScannedCount": 1,
        "ConsumedCapacity": null
    }
    

    Associa‡Æo de arquivo nÆo encontrada para a extensÆo .py
    

- **Realizando a pesquisa com a biblioteca boto3 via jupyter notebook**.


```python
# Acessando o arquivo json
import json
file = open('src/songtitle_year.json','r')
file = file.read()
data_file = json.loads(file)
data_file
```




    {':v_song': {'S': 'Wasting Love'}, ':v_year': {'S': '1992'}}




```python
# Realizando a query
import boto3
from boto3.dynamodb.conditions import Key, Attr
dynamodb = boto3.resource('dynamodb', region_name='us-east-1')
table = dynamodb.Table('Music')
response = table.query(IndexName='SongTitleYear-index',KeyConditionExpression=
                       Key('SongTitle').eq('Wasting Love')&
                       Key('SongYear').eq('1992'))
items = response['Items']
print(items)
```

    [{'AlbumTitle': 'Fear of the Dark Live', 'Artist': 'Iron Maiden', 'SongTitle': 'Wasting Love', 'SongYear': '1992'}]
    

### **Deletando a tabela**

* **deletando a tabela Music com o skd boto3**.


```python
import boto3
client = boto3.client('dynamodb')
response = client.delete_table(
    TableName='Music'
)
```

* **Com isso finalizo o desafio dynamoDB do módulo 4 - Imersão Cloud Computer**.
* **Caso alguém tenha interesse em se aprofundar segue o link da documentação do [boto3](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html)**.
