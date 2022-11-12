# Desafio - Explorando Dados Demográficos com Serviços de Big Data na AWS

<img src="https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_athena/Diagrama_QuickSight.png?raw=true" alt="drawing" width="800" heigth="300"/>

- **Este projeto faz parte da trilha “Unimed-BH-Ciência de dados” disponibilizada pela [DIO](https://www.dio.me/).**
- **O Desafio segue as etapas de configuração de acesso aos serviços, utilização da SDK boto3 para acesso via linguagem python pelo Jupyter notebook, onde irei realizar o processo de criação de um bucket s3 para armazenar o conjunto de dados "brazil_population_2019.csv" e enviar os resultados das consultas sql que serão realizadas futuramente pelo athena.**
- **Os dados serão extraídos do bucket pelo serviço do Glue onde será realizado o crawler que irá gerar de forma automática o catálogo, schema e tabela do banco de dados.**
- **A próxima etapa será acessar o banco de dados pelo athena para realização de consultas sql, onde todos os resultados serão armazenados no bucket s3 que foi previamente criado.**
- **Por fim irei acessar o conjunto de dados do athena pelo QuickSight para realizar o dashboard de exemplo conforme a figura a seguir. Todos os passos estão documentados e disponibilizados neste repositório, para um eventual estudo ou replicação, vale ressaltar que o intuito do conteúdo é apenas didático, a fim de demonstrar todo o conhecimento adquirido durante o aprendizado.**


<img src="https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_athena/quicksight/desafio_quicksight_2.png?raw=true" alt="drawing" width="800"/>

<a name="ancora"></a>
# Nesta atividade vamos:
* **[Criar um repositório no Amazon S3 e enviar os dados.](#ancora1)**
    * [Criando o Bucket no S3](#ancora1.1)
    * [Listando os buckets.](#ancora1.2)
    * [Criando as pastas output  e population](#ancora1.3)
    * [Persistindo dados de um arquivo csv na pasta population.](#ancora1.4)
        
* **[Criar uma aplicação no Amazon Glue para extrair os dados do S3.](#ancora3)**
    * [Criando a Função IAM Policy.](#ancora3.1)
    * [Criando o  crawler.](#ancora3.2)
    * [Listando o crawler criado para confirmação.](#ancora3.3)
    * [Executando o crawler manualmente.](#ancora3.4)
    * [Visualizando as tabelas geradas.](#ancora3.5)      
        
* **[Criar uma aplicação no Amazon Athena para consultas em SQL.](#ancora4)**
    * [Como executar consultas(Queries) no Athena.](#ancora4.1)
    * [Realizando queries com Athena e Visualizando os resultados com pandas.](#ancora4.2)     
    
* **[Utilizar o Amazon QuickSight para visualizar os dados.](#ancora5)**
    * [Criando uma conta QuickSight standard.](#ancora5.10)
    * [Passo_1](#ancora5.1)
    * [Passo_2](#ancora5.2)
    * [Passo_3](#ancora5.3)
    * [Passo_4](#ancora5.4)
    * [Passo_5](#ancora5.5)
    * [Passo_6](#ancora5.6)
    * [Passo_7](#ancora5.7)
    * [Passo_8](#ancora5.8)
    * [Dash criado para aprendizagem](#ancora5.9)   

## **Criar um repositório no Amazon S3 e enviar os dados.**
<a id="ancora1"></a>
[voltar](#ancora)

### Criando o Bucket no S3
<a id="ancora1.1"></a>
[voltar](#ancora)


```python
import logging
import boto3
from botocore.exceptions import ClientError
import os

def create_bucket(bucket_name, region=None):
    """Create an S3 bucket in a specified region

    If a region is not specified, the bucket is created in the S3 default
    region (us-east-1).

    :param bucket_name: Bucket to create
    :param region: String region to create bucket in, e.g., 'us-west-2'
    :return: True if bucket created, else False
    """

    # Create bucket
    try:
        if region is None:
            s3_client = boto3.client('s3')
            s3_client.create_bucket(Bucket=bucket_name)
        else:
            s3_client = boto3.client('s3', region_name=region)
            location = {'LocationConstraint': region}
            s3_client.create_bucket(Bucket=bucket_name,
                                    CreateBucketConfiguration=location)
    except ClientError as e:
        logging.error(e)
        return False
    return True
```


```python
bucket_name = 'jcnok-athena-data'
create_bucket(bucket_name)
```




    True



![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_athena/create_bucket.png?raw=true)

### Listando os buckets.
<a id="ancora1.2"></a>
[voltar](#ancora)


```python
# Listando todos os buckets existentes no s3.
s3 = boto3.client('s3')
response = s3.list_buckets()
print('buckets existentes:')
for bucket in response['Buckets']:
    print(f'  {bucket["Name"]}')
```

    buckets existentes:
      jcnok-athena-data
    

### **Criando as pastas output  e population**.
<a id="ancora1.3"></a>
[voltar](#ancora)


```python
s3.put_object(Bucket="jcnok-athena-data", Key="output/")
s3.put_object(Bucket="jcnok-athena-data", Key="population/")
```

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_athena/create_folder.png?raw=true)

### Persistindo dados de um arquivo csv na pasta population.
<a id="ancora1.4"></a>
[voltar](#ancora)


```python
import boto3
#Creating S3 Resource From the Session.
s3 = boto3.resource('s3')

result = s3.Bucket('jcnok-athena-data').upload_file('data/brazil_population_2019.csv','population/brazil_population_2019.csv')


print(result)
```

    None
    

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_athena/upload_file.png?raw=true)


```python

```

## Criar uma aplicação no Amazon Glue para extrair os dados do S3.
<a id="ancora3"></a>
[voltar](#ancora)

###  Criando a Função IAM Policy.
<a id="ancora3.1"></a>
[voltar](#ancora)

- Antes de criar um crawler do AWS Glue, precisamos criar uma função IAM e anexar políticas do IAM a ela com as permissões corretas.


```python
import json
```

- **Criando a Policy com as devidas permissões S3**.


```python
# Função para criar a politica de acesso;
def create_iam_policy(s3_bucket_name):
    # Create IAM client
    iam = boto3.client("iam")

    # Create a policy
    glue_s3_crawler_policy = {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": ["s3:ListBucket"],
                "Resource": [f"arn:aws:s3:::{s3_bucket_name}/population"]
            },
            {
                "Effect": "Allow",
                "Action": ["s3:PutObject"],
                "Resource": [f"arn:aws:s3:::{s3_bucket_name}/population*"]
            },
            {
                "Effect": "Allow",
                "Action": ["s3:GetObject"],
                "Resource": [f"arn:aws:s3:::{s3_bucket_name}/population*"]
            }
        ]
    }

    response = iam.create_policy(
        PolicyName='glueS3CrawlerPolicy',
        PolicyDocument=json.dumps(glue_s3_crawler_policy)
    )

    return response["Policy"]["Arn"]
```

- **Criando a função IAM**.


```python
def create_iam_role():
    iam = boto3.client("iam")

    assume_role_policy_document = json.dumps({
        "Version": "2012-10-17",
        "Statement": [
            {
            "Effect": "Allow",
            "Principal": {
                "Service": "glue.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
            }
        ]
    })

    response = iam.create_role(
        RoleName = "glueS3CrawlerRole",
        AssumeRolePolicyDocument = assume_role_policy_document
    )

    return response["Role"]["RoleName"]
```

- **Anexando a policy AWSGlueServiceRole à nova função.**


```python
def attach_iam_policy(policy_arn, role_name):
    iam = boto3.client("iam")

    response = iam.attach_role_policy(
        RoleName=role_name,
        PolicyArn=policy_arn
    )

    print(response)
```

- **Executando as funções**.


```python
# Nome do meu bucket s3
s3_bucket_name = "jcnok-athena-data"

# 1. Criando o IAM policy
print("Criando o IAM policy")
policy_arn = create_iam_policy(s3_bucket_name=s3_bucket_name)

# 2. Criando o IAM role
print("Criando o IAM role")
role_name = create_iam_role()

# 3. Anexando o IAM policy
print("Anexando o IAM policy")
attach_iam_policy(policy_arn=policy_arn, role_name=role_name)

# 4. Anexando ao Glue Managed policy
service_policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
attach_iam_policy(policy_arn=service_policy_arn, role_name=role_name)
```

    Creating IAM policy
    Creating IAM role
    Attaching IAM policy
    {'ResponseMetadata': {'RequestId': 'a15713c4-1ea1-4f54-9b6b-d564233052db', 'HTTPStatusCode': 200, 'HTTPHeaders': {'x-amzn-requestid': 'a15713c4-1ea1-4f54-9b6b-d564233052db', 'content-type': 'text/xml', 'content-length': '212', 'date': 'Thu, 10 Nov 2022 20:12:33 GMT'}, 'RetryAttempts': 0}}
    {'ResponseMetadata': {'RequestId': '8bbc793a-60ec-421f-bf15-d232988394fc', 'HTTPStatusCode': 200, 'HTTPHeaders': {'x-amzn-requestid': '8bbc793a-60ec-421f-bf15-d232988394fc', 'content-type': 'text/xml', 'content-length': '212', 'date': 'Thu, 10 Nov 2022 20:12:34 GMT'}, 'RetryAttempts': 0}}
    

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_athena/GlueS3CrawlerRole.png?raw=true)

###  Criando o  crawler.
<a id="ancora3.2"></a>
[voltar](#ancora)

- **Criando uma função para criar o glue-crawler.**


```python
# Função para criar o crawler
def create_glue_crawler(crawler_name, iam_role_name, db_name, s3_path, s3_path_exclusions):
    glue_client = boto3.client("glue")

    response = glue_client.create_crawler(
        Name=crawler_name,
        Role=iam_role_name,
        DatabaseName=db_name,
        Targets={
            "S3Targets": [
                {
                    "Path": s3_path,
                    "Exclusions": s3_path_exclusions
                }
            ]
        }
    )

    print(response)
```

- **Criando o Crawler.**


```python
#nome do crawler
crawler_name = "GluePopulationCrawler"
#nome do banco de dados
glue_database_name = "GluePopulationDB"
#executando a função criar crawler
create_glue_crawler(
    crawler_name=crawler_name,
    iam_role_name=role_name, 
    db_name=glue_database_name,
    s3_path=f"s3://{s3_bucket_name}/population", # endereço do meu s3 bucket
    s3_path_exclusions=[],
)
```

    {'ResponseMetadata': {'RequestId': '9df6dacd-c109-4ce3-a968-279a3096ec89', 'HTTPStatusCode': 200, 'HTTPHeaders': {'date': 'Thu, 10 Nov 2022 20:16:41 GMT', 'content-type': 'application/x-amz-json-1.1', 'content-length': '2', 'connection': 'keep-alive', 'x-amzn-requestid': '9df6dacd-c109-4ce3-a968-279a3096ec89'}, 'RetryAttempts': 0}}
    

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_athena/create_crawler.png?raw=true)

### Listando o crawler criado para confirmação.
<a id="ancora3.3"></a>
[voltar](#ancora)


```python
glue_client.list_crawlers()['CrawlerNames']
```




    ['GluePopulationCrawler', 'testedb']



### Executando o crawler manualmente.
<a id="ancora3.4"></a>
[voltar](#ancora)


```python
def start_crawler(crawler_name):
    glue_client = boto3.client("glue")

    response = glue_client.start_crawler(
        Name=crawler_name
    )
    print(response)
```


```python
start_crawler(crawler_name)
```

    {'ResponseMetadata': {'RequestId': 'adbae97d-a6fc-4315-a9a7-3b8b794008e0', 'HTTPStatusCode': 200, 'HTTPHeaders': {'date': 'Thu, 10 Nov 2022 20:17:34 GMT', 'content-type': 'application/x-amz-json-1.1', 'content-length': '2', 'connection': 'keep-alive', 'x-amzn-requestid': 'adbae97d-a6fc-4315-a9a7-3b8b794008e0'}, 'RetryAttempts': 0}}
    

- **Checando o status do crawler**.


```python
exit_v = 0
while not(exit_v):
    response = glue_client.get_crawler(Name = crawler_name)
    if (response['Crawler']['State'] == 'STOPPING') or (response['Crawler']['State'] == 'READY'):
        exit_v = 1
        
response['Crawler']['State']
```




    'READY'



- *obs:Necessário aguardar até que fique com status READY*.

### Visualizando as tabelas geradas.
<a id="ancora3.5"></a>
[voltar](#ancora)


```python
response = glue_client.get_tables(DatabaseName=glue_database_name)
response['TableList'][0]['StorageDescriptor']['Columns']
```




    [{'Name': 'region', 'Type': 'string'},
     {'Name': 'state', 'Type': 'string'},
     {'Name': 'city', 'Type': 'string'},
     {'Name': 'state_code', 'Type': 'bigint'},
     {'Name': 'city_code', 'Type': 'bigint'},
     {'Name': 'health_region_code', 'Type': 'bigint'},
     {'Name': 'health_region', 'Type': 'string'},
     {'Name': 'population', 'Type': 'bigint'}]



![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_athena/create_table.png?raw=true)

## Criar uma aplicação no Amazon Athena para consultas em SQL.
<a id="ancora4"></a>
[voltar](#ancora)

### Como executar consultas(Queries) no Athena.
<a id="ancora4.1"></a>
[voltar](#ancora)

- Podemos usar SQL padrão para consultar a tabela. No exemplo a seguir, recuperaremos o número de linhas em nosso conjunto de dados:


```python
#Criando a função para consulta especifica.
def get_num_rows(database_name, table_name, output_location):
    athena_client = boto3.client("athena")

    query = f"SELECT COUNT(*) AS total FROM {database_name}.{table_name}"
    response = athena_client.start_query_execution(
        QueryString=query,
        ResultConfiguration={"OutputLocation": output_location}
    )

    return response["QueryExecutionId"]
```

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_athena/create_athena.png?raw=true)

- **Executando a consulta**.


```python
database_name= 'GluePopulationCrawler'
table_name= 'population'
output_location= 's3://jcnok-athena-data/output/' 
print("Querying com athena:")
execution_id = get_num_rows(database_name=database_name, table_name=table_name, output_location=output_location)
print(execution_id)
```

    Querying com athena:
    26859434-10aa-4d3d-9c27-49ef85adf6fd
    

- **Como acessar os resultados de uma consulta.**

- Os resultados de qualquer consulta são armazenados no local de saída fornecido durante a própria consulta.
    - 's3://jcnok-athena-data/output/' 

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_athena/result_sql_athena_inS3.png?raw=true)

- **Podemos acessar os resultados da consulta da seguinte forma:**


```python
def get_query_results(execution_id):
    athena_client = boto3.client("athena")

    response = athena_client.get_query_results(
        QueryExecutionId=execution_id
    )

    results = response["ResultSet"]["Rows"]
    return results
```


```python
print("recuperando resultados")
resultado = get_query_results(execution_id=execution_id)
print(resultado)
```

    recuperando resultados
    [{'Data': [{'VarCharValue': 'total'}]}, {'Data': [{'VarCharValue': '2865'}]}]
    

- **Criando uma função para realizarmos alguns testes**.


```python
athena_client = boto3.client("athena")
def consulta(output_location, query):         
        print("Realizando a consulta com athena...")
        execution_id = athena_client.start_query_execution(
        QueryString=query,
        ResultConfiguration={"OutputLocation": output_location}
    )["QueryExecutionId"]
        return execution_id
        
def resultado(execution_id):        
        print("recuperando resultados...")
        response = athena_client.get_query_results(QueryExecutionId=execution_id)  
        results = response["ResultSet"]["Rows"]
        return results
```

- **Soma de toda a população do Brasil**


```python
query = "SELECT SUM(population) as total FROM gluepopulationdb.population"
id = consulta(output_location,query)
```

    Realizando a consulta com athena...
    


```python
result = resultado(id)
rs = f"{int(result[1]['Data'][0]['VarCharValue']):,}".replace(',','.')
print(f"Soma total da população do Brasil:{rs} habitantes")
```

    recuperando resultados...
    Soma total da população do Brasil:181.728.458 habitantes
    

- **Consultando o total da população da cidade de Foz do Iguaçu.**


```python
query = "select city, population from gluepopulationdb.population where city='Foz do Iguaçu'"
id = consulta(output_location,query)
```

    Realizando a consulta com athena...
    


```python
result = resultado(id)
rs = f"{int(result[1]['Data'][1]['VarCharValue']):,}".replace(',','.')
print(f"Soma total da população da Cidade:Foz do Iguaçu:{rs} habitantes")
```

    recuperando resultados...
    Soma total da população da Cidade:Foz do Iguaçu:258.532 habitantes
    

### Realizando queries com Athena e Visualizando os resultados com pandas.
<a id="ancora4.2"></a>
[voltar](#ancora)

- **Esse método é bem interessante pois conseguimos realizar as queries e receber os resultados como um dataframe pandas.**


```python
# importando as libs necessárias.
import pyathena
from pyathena import connect
import pandas as pd
conn = connect(s3_staging_dir='s3://jcnok-athena-data/output')
import warnings
warnings.filterwarnings('ignore')
```

- **Exibindo todos os dados da tabela population**.


```python
# Exibindo todos os dados da tabela population.
df = pd.read_sql('select * from gluepopulationdb.population', conn) 
df.head()
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
      <th>region</th>
      <th>state</th>
      <th>city</th>
      <th>state_code</th>
      <th>city_code</th>
      <th>health_region_code</th>
      <th>health_region</th>
      <th>population</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Centro-Oeste</td>
      <td>Mato Grosso do Sul</td>
      <td>Alcinópolis</td>
      <td>50</td>
      <td>500025</td>
      <td>50001</td>
      <td>Campo Grande</td>
      <td>5343.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Centro-Oeste</td>
      <td>Mato Grosso do Sul</td>
      <td>Amambai</td>
      <td>50</td>
      <td>500060</td>
      <td>50003</td>
      <td>Dourados</td>
      <td>39396.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Centro-Oeste</td>
      <td>Mato Grosso do Sul</td>
      <td>Bataguassu</td>
      <td>50</td>
      <td>500190</td>
      <td>50004</td>
      <td>Três Lagoas</td>
      <td>23024.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Centro-Oeste</td>
      <td>Mato Grosso do Sul</td>
      <td>Batayporã</td>
      <td>50</td>
      <td>500200</td>
      <td>50003</td>
      <td>Dourados</td>
      <td>11329.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Centro-Oeste</td>
      <td>Mato Grosso do Sul</td>
      <td>Bela Vista</td>
      <td>50</td>
      <td>500210</td>
      <td>50001</td>
      <td>Campo Grande</td>
      <td>24629.0</td>
    </tr>
  </tbody>
</table>
</div>



- **Total da população da região Sul**.


```python
query ="select region,sum(population) as total from gluepopulationdb.population where region='Sul'group by region"
pd.read_sql(query,conn)
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
      <th>region</th>
      <th>total</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Sul</td>
      <td>24522343</td>
    </tr>
  </tbody>
</table>
</div>



- **Total da população da região Sudeste**.


```python
query ="select region,sum(population) as total from gluepopulationdb.population where region='Sudeste'group by region"
pd.read_sql(query,conn)
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
      <th>region</th>
      <th>total</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Sudeste</td>
      <td>80421777</td>
    </tr>
  </tbody>
</table>
</div>



- **Total da população da cidade de Ponta Porã - MS**.


```python
query ="select region,state, city , population from gluepopulationdb.population where city='Ponta Porã';"
pd.read_sql(query,conn)
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
      <th>region</th>
      <th>state</th>
      <th>city</th>
      <th>population</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Centro-Oeste</td>
      <td>Mato Grosso do Sul</td>
      <td>Ponta Porã</td>
      <td>92526</td>
    </tr>
  </tbody>
</table>
</div>



- **Total da população por região**.


```python
query = "select region, sum(population) as total from gluepopulationdb.population group by region"
pd.read_sql(query,conn)
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
      <th>region</th>
      <th>total</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Sudeste</td>
      <td>80421777</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Nordeste</td>
      <td>48946190</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Centro-Oeste</td>
      <td>13085364</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Sul</td>
      <td>24522343</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Norte</td>
      <td>14752784</td>
    </tr>
  </tbody>
</table>
</div>



## Utilizar o Amazon QuickSight para visualizar os dados.
<a id="ancora5"></a>
[voltar](#ancora)

### Criando uma conta QuickSight standard.
<a id="ancora5.10"></a>
[voltar](#ancora)

### - Passo 1: 

    - Escolher a mesma região do serviço athenas e s3 criado.
    - Criar um usuário e marcar Amazon Athena.
<a id="ancora5.1"></a>
[voltar](#ancora)

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_athena/quicksight/1.png?raw=true)

### - Passo 2:

    - Selecionar o bucket criado no S3 e clicar em concluir.
<a id="ancora5.2"></a>
[voltar](#ancora)        

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_athena/quicksight/2.png?raw=true)

### - Passo 3:

    - A Mensagem a seguir deve surgir, basta clicar em acessar.
    
<a id="ancora5.3"></a>
[voltar](#ancora)

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_athena/quicksight/3.png?raw=true)

### - Passo4:
    - Agora será necessário carregar o conjunto de dados Population.
    - Clique em novo conjunto de dados.
    - Clieque em conjunto de dados Athena.
<a id="ancora5.4"></a>
[voltar](#ancora)

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_athena/quicksight/4.png?raw=true)

### - Passo 5:
    - Selecione o nome da fonte criado no Athena.
    - Clique em validação para conferir.
    - Clique em criar fonte de dados.
<a id="ancora5.5"></a>
[voltar](#ancora)

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_athena/quicksight/5.png?raw=true)

### - Passo 6:
    - Selecione o Catálogo, Banco de dados e a tabela.
    - Pode selecionar pré-visualizar ou selecionar direto.
<a id="ancora5.6"></a>
[voltar](#ancora)
 

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_athena/quicksight/6.png?raw=true)

### - Passo 7:
    - Marque consulte sus dados diretamente, pois o conjunto é bem pequeno.
    - A opção Spice é mais rápida porém o custo é maior.
    - Clicle em Editar/Pre-visualizar.
<a id="ancora5.7"></a>
[voltar](#ancora)

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_athena/quicksight/7.png?raw=true)

### - Passo 8:
    - Essa é a tela para principal do QuickSight.
    - Repare que ao lado a banco de dados já está disponível.
    - Agora será necessário gastar um pouco de tempo para conhecer a ferramenta.
<a id="ancora5.8"></a>
[voltar](#ancora)

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_athena/quicksight/8.png?raw=true)

### - **Dash criado para aprendizagem**.
<a id="ancora5.9"></a>
[voltar](#ancora)

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/AWS/desafio_athena/quicksight/desafio_quicksight.png?raw=true)


```python

```
