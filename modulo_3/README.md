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

![img](https://github.com/Jcnok/digitalinnovationone/blob/main/images/e-commerce-refinado.png?raw=true)


```python

```
