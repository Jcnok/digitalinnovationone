# Projeto de Banco de Dados

* Contexto: Levantamento de Requisitos;
* Projeto Comercial: Modelo ER;
* Projeto Lógico: Modelo Relacional;

## Modelo de Ordem de Serviço

### Contexto: 

* **Dentro de uma empresa os clientes demandam ao helpdesk algumas ações.**
* **Essas ações são convertidas em ordem de serviço.**
* **Os clientes realizam um pedido.**
* **O pedido é convertido em ordem de serviço caso possa ser realizado.**
* **O técnico executa a ordem de serviço. Após sua finalização a mesma é arquivada.**


### Entidades:

* **Cliente, Responsável, Pedido e Ordem de Serviço.**

### Relacionamentos:

* **Solicita, Analisa, Executa, Arquiva.**

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/images/ordem%20de%20servi%C3%A7o.png?raw=true)

## Modelo - Escopo de Universidade

### Narrativa - Alunos

* **A universidade possui diversos alunos que podem estar matriculados em mais de um curso (graduação).**
* **Os alunos podem fazer cursos extras fornecidos externa e internamente (universidade) para contar como horas complementares.**
* **Os alunos podem fazer cursos extras fornecidos externa e internamente (universidade) para contar como horas complementares.**


### Narrativa - Disciplinas

* **Cada disciplina é fornecida por um professor. Restrição: apenas por este professor.**
* **Algumas disciplinas possuem pré-requisitos. Um mesmo prérequisito pode ser associado a mais de uma disciplina.**
* **As disciplinas podem ser comuns a cursos distintos. Ex: Cálculo 1 para computação e engenharia.**
* **O ciclo de vida da disciplina é semestral.**

### Narrativa - Professores

* **Os professores que ministram as disciplinas estão associados as coordenações de seus respectivos cursos. Ex: Computação, Física,Engenharia….**


### Perguntas:

* **Quais informações de aluno e professor guardar?**
* **Qual média para aprovação?**
* **Haverá restrição, ou diferentes visões ?**


![img](https://github.com/Jcnok/digitalinnovationone/blob/main/images/universidade_refinada.png?raw=true)

## Projeto de E-commerce

### Escopo

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/images/e-commerce.drawio.png?raw=true)

### Narrativa - Produto

* **Os produtos são vendidos por uma única plataforma online.Contudo, estes podem ter vendedores distintos (terceiros).**
* **Cada produto possui um fornecedor.**
* **Um ou mais produtos podem compor um pedido.**

### Narrativa - Cliente

* **O cliente pode se cadastrar no site com seu CPF ou CNPJ.**
* **O Endereço do cliente irá determinar o valor do frete.**
* **Um cliente pode comprar mais de um pedido. Este tem um período de carência para devolução do produto.**

### Narrativa - Pedido

* **O pedidos são criados por clientes e possuem informações de compra, endereço e status da entrega.**
* **Um produto ou mais compoem o pedido.**
* **O pedido pode ser cancelado.**

### Narrativa - Fornecedor & Estoque

* **Vamos pensar juntos ...**

### Modelagem

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/images/e-commerce.png?raw=true)

## Desafio 1 - Refinando o E-Commerce

* **Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações.**
* **Pagamento – Pode ter cadastrado mais de uma forma de pagamento.**
* **Entrega – Possuistatus e código de rastreio.**

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/bd_mod_3/ecommerce_ref/ecommerce_refinado.png?raw=true)

## Desafio 2 - Modelo de Oficina Mecânica 

* **Objetivo:**

    * **Criar o esquema conceitual para o contexto de oficina com base na narrativa fornecida.**

* **Narrativa:**
    * **Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica.**
    * **Clientes levam veículos à oficina mecânica para serem consertados ou para passarem por revisões  periódicas.**
    * **Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega.**
    * **A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra.**
    * **O valor de cada peça também irá compor a OS. O cliente autoriza a execução dos serviços.**
    * **A mesma equipe avalia e executa os serviços.**
    * **Os mecânicos possuem código, nome, endereço e especialidade.**
    * **Cada OS possui: n°, data de emissão, um valor, status e uma data para conclusão dos trabalhos.**


![img](https://github.com/Jcnok/digitalinnovationone/blob/main/Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/bd_mod_3/desafio_oficina_mecanica/oficina_mecanica.png?raw=true)
