show databases;
use oficina_mec;
show tables;

select * from `cliente_pf`;
INSERT INTO `oficina_mec`.`cliente_pf` (`Nome`, `CPF`, `Data_Nasc`, `Data Cadastro`, `Telefone`, `E-mail`, `Endereço`, `Cidade`, `Estado`) VALUES ('Julio Cesar', '12345678945', '79-11-06', '22-10-20', '119857412', 'julio.okuda@gmail.com', 'r. gal edson figueira, 222', 'São Paulo', 'SP');
INSERT INTO `oficina_mec`.`cliente_pf` (`Nome`, `CPF`, `Data_Nasc`, `Data Cadastro`, `Telefone`, `E-mail`, `Endereço`, `Cidade`, `Estado`) VALUES ('Roberto', '96325874589', '76-04-21', '22-10-20', '679562345', 'roberto@gmail.com', 'r. Batista de azevedo, 1114', 'Ponta Porã', 'MS');

select * from `cliente_pj`;
INSERT INTO `oficina_mec`.`cliente_pj` (`Razão_Social`, `Nome_Fantasia`, `CNPJ`, `Responsavel`, `Data Cadastro`, `Telefone`, `E-mail`, `Endereço`, `Cidade`, `Estado`) VALUES ('Nihontech ltda', 'Nihonte', '123654789654123', 'Julio', '22-10-20', '119236589', 'nihontech@gmail.com', 'r. batista de azevedo, 1105', 'São Paulo', 'SP');
INSERT INTO `oficina_mec`.`cliente_pj` (`Razão_Social`, `Nome_Fantasia`, `CNPJ`, `Responsavel`, `Data Cadastro`, `Telefone`, `E-mail`, `Endereço`, `Cidade`, `Estado`) VALUES ('Kibon', 'Kibon', '369852147896541', 'Gustavo', '22-10-10', '213698521', 'vendedor@kibon.com', 'av. jucelino, 1500', 'Rio de Janeiro', 'RJ');


-- drop database oficina_mec;
select * from veiculo;
-- Inserindo registros na tabela de veículos --
INSERT INTO `oficina_mec`.`veiculo` (`Tipo de Veiculo`, `Placa`, `Marca`, `Modelo`, `Ano`, `KM`, `fk_idCliente_PJ`, `fk_idCliente_PF`) VALUES ('Sedã', 'eqc2115', 'Renault', 'Logan', '2020', '85.000',1,NULL);
INSERT INTO `oficina_mec`.`veiculo` (`Tipo de Veiculo`, `Placa`, `Marca`, `Modelo`, `Ano`, `KM`, `fk_idCliente_PJ`, `fk_idCliente_PF`) VALUES ('hatch', 'bra1313', 'Fiat', 'Argo', '2022', '10.000',NULL,2);
INSERT INTO `oficina_mec`.`veiculo` (`Tipo de Veiculo`, `Placa`, `Marca`, `Modelo`, `Ano`, `KM`, `fk_idCliente_PJ`, `fk_idCliente_PF`) VALUES ('Perua', 'ecp1026', 'Toyota', 'Fielder', '2008', '300.000',2,NULL);
INSERT INTO `oficina_mec`.`veiculo` (`Tipo de Veiculo`, `Placa`, `Marca`, `Modelo`, `Ano`, `KM`, `fk_idCliente_PJ`, `fk_idCliente_PF`) VALUES ('SUV', 'cra4545', 'Hyundai', 'Creta', '2022', '5.000',NULL,1);
INSERT INTO `oficina_mec`.`veiculo` (`Tipo de Veiculo`, `Placa`, `Marca`, `Modelo`, `Ano`, `KM`, `fk_idCliente_PJ`, `fk_idCliente_PF`) VALUES ('Picape', 'def5897', 'Volkswagen', 'Amarok', '2021', '50.000',2,NULL);
INSERT INTO `oficina_mec`.`veiculo` (`Tipo de Veiculo`, `Placa`, `Marca`, `Modelo`, `Ano`, `KM`, `fk_idCliente_PJ`, `fk_idCliente_PF`) VALUES ('Minivan', 'jcn2154', 'Nissan', 'Gran Livina', '2014', '70.000',NULL,2);
INSERT INTO `oficina_mec`.`veiculo` (`Tipo de Veiculo`, `Placa`, `Marca`, `Modelo`, `Ano`, `KM`, `fk_idCliente_PJ`, `fk_idCliente_PF`) VALUES ('Sedã', 'ocr4542', 'Chevrolet', 'Cobalt', '2020', '95.000',1,NULL);

-- informe todos os clientes e seus respectivos veiculos;

SELECT 
    c.Nome, c.CPF, v.Marca, v.Placa
FROM
    cliente_pf c
        JOIN
    veiculo v ON c.idCliente_pf = v.fk_idCliente_pf;

-- informe todos os veículos dos clientes pjs;    
SELECT 
    *
FROM
    cliente_pj c
        JOIN
    veiculo v ON c.idCliente_pj = v.fk_idCliente_pj;

-- o veiculo de placa 'eqc2115' pertence a qual  cliente pj?
SELECT 
    *
FROM
    cliente_pj c
        JOIN
    veiculo v ON c.idcliente_pj = v.fk_idCliente_pj
WHERE
    v.Placa = 'eqc2115';

-- Inserindo resgistro na tabela de orçamentos --
select * from orçamento;
INSERT INTO `oficina_mec`.`orçamento` (`Numero_Orçamento`, `Aprovado`, `Data`, `Valor`, `Validade`, `fk_idVeiculo`,`Cod_Funcionário`) VALUES ('123654', 'SIM', '22-10-20', '1520', '90 dias', '1','100');
INSERT INTO `oficina_mec`.`orçamento` (`Numero_Orçamento`, `Aprovado`, `Data`, `Valor`, `Validade`, `fk_idVeiculo`,`Cod_Funcionário`) VALUES ('55555', 'SIM', '22-10-10', '1750', '90 dias', '2','100');
INSERT INTO `oficina_mec`.`orçamento` (`Numero_Orçamento`, `Aprovado`, `Data`, `Valor`, `Validade`, `fk_idVeiculo`,`Cod_Funcionário`) VALUES ('4444', 'NÃO', '22-10-20', '1456', '90 dias', '3','101');
INSERT INTO `oficina_mec`.`orçamento` (`Numero_Orçamento`, `Aprovado`, `Data`, `Valor`, `Validade`, `fk_idVeiculo`,`Cod_Funcionário`) VALUES ('3333', 'SIM', '22-10-18', '810', '90 dias', '4','101');
INSERT INTO `oficina_mec`.`orçamento` (`Numero_Orçamento`, `Aprovado`, `Data`, `Valor`, `Validade`, `fk_idVeiculo`,`Cod_Funcionário`) VALUES ('2222', 'SIM', '22-10-15', '930', '60 dias', '5','101');

-- crie um relatório, com o nome do cliente pf, nome, marca, tipo, ano e km do veículo, seguido do numero do orçamento, data, valor e validade.alter
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
    orçamento o
        JOIN
    veiculo v ON o.fk_idVeiculo = v.idVeiculo
        JOIN
    cliente_pf c ON c.idCliente_pf = v.fk_idCliente_pf;

-- Inserindo registros na tabela equipe --
select * from equipe;
INSERT INTO `oficina_mec`.`equipe` (`Num_Func`, `Equipe`) VALUES ('5', 'A');
INSERT INTO `oficina_mec`.`equipe` (`Num_Func`, `Equipe`) VALUES ('5', 'B');
INSERT INTO `oficina_mec`.`equipe` (`Num_Func`, `Equipe`) VALUES ('5', 'ADM');

-- Inserindo registros na tabela funcionario --
select * from funcionario;
INSERT INTO `oficina_mec`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('1', '3', 'João P.', '12395175385', '81-10-20', 'av. Interlagos, 1500', 'Mecânico', 'Mecânica', '20-01-01', '119632587', 'joao@mecanica.com');
INSERT INTO `oficina_mec`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('1', '2', 'Alex G.', '96325874125', '85-02-13', 'r. Alvarenga, 234', 'Auxiliar', 'Mecânica', '21-10-12', '119874598', 'alex@mecanica.com');
INSERT INTO `oficina_mec`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('1', '1', 'Pedro A.', '95175385296', '79-12-25', 'av.Yervant, 345', 'Lider', 'Mecânica', '19-01-10', '119652354', 'pedro@mecanica.com');
INSERT INTO `oficina_mec`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('1', '4', 'Jonas Y.', '74187498765', '81-06-12', 'av. Cupecê', 'Mecânico', 'Elétrica', '20-02-02', '119875874', 'jonas@mecanica.com');
INSERT INTO `oficina_mec`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('1', '5', 'Diogo M.', '96385274185', '86-04-01', 'r. sem nome', 'Mecânico', 'Hidráulica', '21-01-10', '119698596', 'diogo@mecanica.com');
INSERT INTO `oficina_mec`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('2', '6', 'Amauri J.', '95175385777', '81-01-12', 'av. Interlagos, 1500', 'Mecânico', 'Mecânica', '20-01-01', '119632511', 'amauri@mecanica.com');
INSERT INTO `oficina_mec`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('2', '7', 'Dorival P.', '95175385666', '85-02-13', 'av. Cupecê, 12', 'Auxiliar', 'Mecânica', '21-10-12', '119632533', 'dorival@mecanica.com');
INSERT INTO `oficina_mec`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('2', '8', 'Gabriel O.', '95175385667', '79-03-25', 'av.Yervant, 444', 'Lider', 'Mecânica', '20-02-02', '119632599', 'gabriel@mecanica.com');
INSERT INTO `oficina_mec`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('2', '9', 'Pedro H.', '95175385456', '86-04-15', 'r. Alvarenga, 150', 'Mecânico', 'Elétrica', '21-01-10', '119632588', 'pedroh@mecanica.com');
INSERT INTO `oficina_mec`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('2', '10', 'William A.', '95175385123', '86-05-10', 'av. Cupecê, 100', 'Mecânico', 'Hidráulica', '21-10-12', '119632577', 'william@mecanica.com');
INSERT INTO `oficina_mec`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('3', '100', 'Laura Y.', '95175385998', '00-06-15', 'r. Alvarenga, 222', 'Atendimento', 'Atendente', '21-01-10', '119632777', 'laura@mecanica.com');
INSERT INTO `oficina_mec`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('3', '101', 'Luana N.', '95175385326', '00-07-19', 'av. Cupecê, 333', 'Atendimento', 'Atendente', '21-10-12', '119632258', 'luana@mecanica.com');
select * from orçamento;

-- Inserindo Registros na tabela equipe_orçamento --
select * from equipe_orçamento;
INSERT INTO `oficina_mec`.`equipe_orçamento` (`fk_idEquipe`, `fk_idOrçamento`) VALUES ('1', '1');
INSERT INTO `oficina_mec`.`equipe_orçamento` (`fk_idEquipe`, `fk_idOrçamento`) VALUES ('1', '2');
INSERT INTO `oficina_mec`.`equipe_orçamento` (`fk_idEquipe`, `fk_idOrçamento`) VALUES ('1', '3');
INSERT INTO `oficina_mec`.`equipe_orçamento` (`fk_idEquipe`, `fk_idOrçamento`) VALUES ('2', '4');
INSERT INTO `oficina_mec`.`equipe_orçamento` (`fk_idEquipe`, `fk_idOrçamento`) VALUES ('2', '5');

-- crie um relatório, com o nome do cliente pf, nome, modelo, tipo, ano e km do veículo, seguido do numero do orçamento, data, valor e validade e a equipe;
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

-- crie um relatório, com o nome do cliente pj, nome, modelo, tipo, ano e km do veículo, seguido do numero do orçamento, data, valor e validade e a equipe;
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

-- informe a quantidade de funcionários de cada equipe;
SELECT 
    e.Equipe AS equipe, COUNT(*) AS qtd_funcionario
FROM
    equipe e
        JOIN
    funcionario f ON e.idEquipe = f.fk_idEquipe
GROUP BY e.Equipe;

-- Inserindo Registros na tabela peça --
Select * from peça;
INSERT INTO `oficina_mec`.`peça` (`Nome_peça`, `Descrição`, `Quantidade_Disponível`, `Valor_Unitário`) VALUES ('Disco de Freio', 'Disco ventilado', '20', '306');
INSERT INTO `oficina_mec`.`peça` (`Nome_peça`, `Descrição`, `Quantidade_Disponível`, `Valor_Unitário`) VALUES ('Pastilhas', 'Pastilhas Jogo', '100', '110');
INSERT INTO `oficina_mec`.`peça` (`Nome_peça`, `Descrição`, `Quantidade_Disponível`, `Valor_Unitário`) VALUES ('Reparo Amortecedor', 'Conjunto', '150', '700');
INSERT INTO `oficina_mec`.`peça` (`Nome_peça`, `Descrição`, `Quantidade_Disponível`, `Valor_Unitário`) VALUES ('Bandeja', 'Conjunto dir/esq', '100', '400');
INSERT INTO `oficina_mec`.`peça` (`Nome_peça`, `Descrição`, `Quantidade_Disponível`, `Valor_Unitário`) VALUES ('Amortecedor dianteiro', 'Conjunto', '100', '800');
INSERT INTO `oficina_mec`.`peça` (`Nome_peça`, `Descrição`, `Quantidade_Disponível`, `Valor_Unitário`) VALUES ('Cabo de vela', 'Jogo', '100', '200');
INSERT INTO `oficina_mec`.`peça` (`Nome_peça`, `Descrição`, `Quantidade_Disponível`, `Valor_Unitário`) VALUES ('Vela', 'Jogo', '100', '300');
INSERT INTO `oficina_mec`.`peça` (`Nome_peça`, `Descrição`, `Quantidade_Disponível`, `Valor_Unitário`) VALUES ('Óleo Motor', '1Litro', '150', '30');
INSERT INTO `oficina_mec`.`peça` (`Nome_peça`, `Descrição`, `Quantidade_Disponível`, `Valor_Unitário`) VALUES ('Óleo Cambio', '1Litro', '100', '200');
INSERT INTO `oficina_mec`.`peça` (`Nome_peça`, `Descrição`, `Quantidade_Disponível`, `Valor_Unitário`) VALUES ('Pneu ', '185/65r15', '100', '300');
INSERT INTO `oficina_mec`.`peça` (`Nome_peça`, `Descrição`, `Quantidade_Disponível`, `Valor_Unitário`) VALUES ('Revisão', 'somente revisão', '0', '0');

-- Inserindo Registros na tabela serviço --
select * from serviço;
INSERT INTO `oficina_mec`.`serviço` (`Tipo do Serviço`, `Nome_Serviço`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Revisão', 'Revisão Basica', '1', 'Revisão de 15 itens', '80');
INSERT INTO `oficina_mec`.`serviço` (`Tipo do Serviço`, `Nome_Serviço`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Revisão', 'Revisão Completa', '2', 'Revisão de 25 itens', '120');
INSERT INTO `oficina_mec`.`serviço` (`Tipo do Serviço`, `Nome_Serviço`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Manutenção', 'Troca de Disco', '1', 'Troca do par de discos', '150');
INSERT INTO `oficina_mec`.`serviço` (`Tipo do Serviço`, `Nome_Serviço`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Manutenção', 'Freios', '1', 'Troca conjuto de pastilhas', '100');
INSERT INTO `oficina_mec`.`serviço` (`Tipo do Serviço`, `Nome_Serviço`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Manutenção', 'rep_Suspensão', '2', 'Reparo do conjunto de amortecedores dianteiros', '150');
INSERT INTO `oficina_mec`.`serviço` (`Tipo do Serviço`, `Nome_Serviço`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Manutenção', 'Bandeja', '1', 'Reparo do conjunto de bandeja dianteira', '200');
INSERT INTO `oficina_mec`.`serviço` (`Tipo do Serviço`, `Nome_Serviço`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Manutenção', 'Amortecedores', '3', 'Troca dos amortecedores dianteiros', '200');
INSERT INTO `oficina_mec`.`serviço` (`Tipo do Serviço`, `Nome_Serviço`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Manutenção', 'cabos', '1', 'troca do conjunto de cabos', '50');
INSERT INTO `oficina_mec`.`serviço` (`Tipo do Serviço`, `Nome_Serviço`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Manutenção', 'Óleo Motor', '1', 'Troca de óleo motor', '80');
INSERT INTO `oficina_mec`.`serviço` (`Tipo do Serviço`, `Nome_Serviço`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Manutenção', 'Óleo Cambio', '1', 'Troca do óleo Cambio', '150');
INSERT INTO `oficina_mec`.`serviço` (`Tipo do Serviço`, `Nome_Serviço`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Manutenção', 'Pneu', '1', 'Troca pneu por unidade', '50');
INSERT INTO `oficina_mec`.`serviço` (`Tipo do Serviço`, `Nome_Serviço`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Manutenção', 'Vela_elétrica', '1', 'Troca do conjunto de velas', '50.00');


-- Inserindo Registros na tabela serviço_peça --
select * from serviço_peça;
INSERT INTO `oficina_mec`.`serviço_peça` (`fk_idOrçamento`, `fk_idServiço`, `fk_idPeça`,`Qtd_Peça`,`Qtd_Serviço`) VALUES ('1', '2','11','1','1');
INSERT INTO `oficina_mec`.`serviço_peça` (`fk_idOrçamento`, `fk_idServiço`, `fk_idPeça`,`Qtd_Peça`,`Qtd_Serviço`) VALUES ('1','11','10','4','4');
INSERT INTO `oficina_mec`.`serviço_peça` (`fk_idOrçamento`, `fk_idServiço`, `fk_idPeça`,`Qtd_Peça`,`Qtd_Serviço`) VALUES ('2', '8', '6','1','1');
INSERT INTO `oficina_mec`.`serviço_peça` (`fk_idOrçamento`, `fk_idServiço`, `fk_idPeça`,`Qtd_Peça`,`Qtd_Serviço`) VALUES ('2','12', '7','1','1');
INSERT INTO `oficina_mec`.`serviço_peça` (`fk_idOrçamento`, `fk_idServiço`, `fk_idPeça`,`Qtd_Peça`,`Qtd_Serviço`) VALUES ('2', '9', '8','4','1');
INSERT INTO `oficina_mec`.`serviço_peça` (`fk_idOrçamento`, `fk_idServiço`, `fk_idPeça`,`Qtd_Peça`,`Qtd_Serviço`) VALUES ('2','10', '9','4','1');
INSERT INTO `oficina_mec`.`serviço_peça` (`fk_idOrçamento`, `fk_idServiço`, `fk_idPeça`,`Qtd_Peça`,`Qtd_Serviço`) VALUES ('3', '3', '1','1','1');
INSERT INTO `oficina_mec`.`serviço_peça` (`fk_idOrçamento`, `fk_idServiço`, `fk_idPeça`,`Qtd_Peça`,`Qtd_Serviço`) VALUES ('3', '7', '5','1','1');
INSERT INTO `oficina_mec`.`serviço_peça` (`fk_idOrçamento`, `fk_idServiço`, `fk_idPeça`,`Qtd_Peça`,`Qtd_Serviço`) VALUES ('4', '4', '2','1','1');
INSERT INTO `oficina_mec`.`serviço_peça` (`fk_idOrçamento`, `fk_idServiço`, `fk_idPeça`,`Qtd_Peça`,`Qtd_Serviço`) VALUES ('4', '6', '4','1','1');
INSERT INTO `oficina_mec`.`serviço_peça` (`fk_idOrçamento`, `fk_idServiço`, `fk_idPeça`,`Qtd_Peça`,`Qtd_Serviço`) VALUES ('5', '5', '3','1','1');
INSERT INTO `oficina_mec`.`serviço_peça` (`fk_idOrçamento`, `fk_idServiço`, `fk_idPeça`,`Qtd_Peça`,`Qtd_Serviço`) VALUES ('5', '1','11','1','1');



-- crie um relatório, com o nome do cliente pj, nome, modelo, tipo, ano e km do veículo, seguido do numero do orçamento, data, valor e validade e a equipe;
select c.Razão_Social, v.Modelo, v.Marca, v.Ano, v.KM, o.Numero_Orçamento, o.Data, o.Valor, o.Validade, e.Equipe from orçamento o join veiculo v on o.fk_idVeiculo = v.idVeiculo join 
cliente_pj c on c.idCliente_pj = v.fk_idCliente_pj join equipe_orçamento eo on eo.fk_idorçamento = o.idOrçamento join equipe e on e.idEquipe = eo.fk_idEquipe;

-- Informe o valor total da Mão de Obra por orçamentos ordenado pelo id do orçamento;
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

-- Informe o valor total das peças por orçamentos ordenado pelo id do orçamento;
SELECT
o.idOrçamento, o.Numero_Orçamento, SUM(sp.Qtd_Peça * p.Valor_Unitário) AS Total_Peças 
FROM
orçamento o 
JOIN 
serviço_peça sp ON o.idOrçamento = sp.fk_idOrçamento 
JOIN
peça p ON sp.fk_idPeça = p.idPeça 
GROUP BY o.Numero_Orçamento 
ORDER BY o.idOrçamento;

-- Informe o valor total gasto com a mão de obra e peças de cada orçamento ordenado pelo id do orçamento;
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


-- relação completa de orçamentos de pessoas fisicas;
SELECT cpf.Nome AS nome_cliente, cpf.Telefone AS contato,
v.Modelo, v.Marca, v.Placa,
v.Ano, v.KM, o.Numero_Orçamento,
o.Data, o.Validade,`s`.`Tipo do Serviço`,
s.Descrição AS Desc_Serviço,
s.Mão_de_Obra, sp.Qtd_Serviço,
p.Nome_peça AS Peças, p.Descrição AS Desc_Peça,
p.Valor_unitário, sp.Qtd_Peça,
(s.Mão_de_Obra * sp.Qtd_Serviço + p.Valor_Unitário * sp.Qtd_Peça) AS Total
FROM 
orçamento o 
JOIN serviço_peça sp ON o.idOrçamento = sp.fk_idOrçamento, serviço s, peça p, veiculo v, cliente_pf cpf
WHERE sp.fk_idServiço = s.idServiço 
AND sp.fk_idpeça = p.idPeça 
AND o.fk_idVeiculo = v.idVeiculo 
AND v.fk_idCliente_pf = cpf.idCliente_pf;


-- Informe todos os orçamentos, com o número, Valor, Data, Validade, Nome do atendente, a equipe de mecânicos que realizaram os respectivos orçamentos bem como as informções do veículo.
select o.Numero_Orçamento as N_Orçamento,
o.Valor, o.Data, o.Validade, f.Nome as atendente,
e.Equipe as Equipe_mecânicos, v.Modelo, v.Marca, v.Ano, 
v.Placa, v.KM from orçamento o, funcionario f, equipe e, equipe_orçamento eo, veiculo v where o.Cod_Funcionário = f.Código and eo.fk_idOrçamento = o.idOrçamento and eo.fk_idEquipe = e.idEquipe and v.idVeiculo = o.fk_idVeiculo;

-- Quero todos os orçamentos com status aprovado;
Select * from orçamento where Aprovado = 'SIM';
select * from `OS`;
select * from orçamento;

-- Inserindo registros na OS --
INSERT INTO `oficina_mec`.`OS` (`Numero`, `Data_Emissão`, `Desconto`, `Data_Conclusão`, `fk_idOrçamento`, `Forma_Pagamento`) VALUES ('12345', '2022-10-20', '10', '2022-10-21', '1', 'Dinheiro');
INSERT INTO `oficina_mec`.`OS` (`Numero`, `Data_Emissão`, `Desconto`, `Data_Conclusão`, `fk_idOrçamento`, `Forma_Pagamento`) VALUES ('12356', '2022-10-21', '5', '2022-10-21', '2', 'Crédito');
INSERT INTO `oficina_mec`.`OS` (`Numero`, `Data_Emissão`, `Desconto`, `Data_Conclusão`, `fk_idOrçamento`, `Forma_Pagamento`) VALUES ('12378', '2022-10-19', '10', '2022-10-19', '4', 'Débito');
INSERT INTO `oficina_mec`.`OS` (`Numero`, `Data_Emissão`, `Desconto`, `Data_Conclusão`, `fk_idOrçamento`, `Forma_Pagamento`) VALUES ('12389', '2022-10-21', '5', '2022-10-22', '5', 'Crédito');


select * from `OS` os join orçamento o on os.fk_idOrçamento = o.idOrçamento join serviço_peça sp on os.fk_idOrçamento = sp.fk_idOrçamento;

select * from `OS` os join orçamento o on os.fk_idOrçamento = o.idOrçamento join serviço_peça sp on os.fk_idOrçamento = sp.fk_idOrçamento, serviço s, peça p, veiculo v, cliente_pf cpf where sp.fk_idServiço = s.idServiço and sp.fk_idpeça = p.idPeça and o.fk_idVeiculo = v.idVeiculo and v.fk_idCliente_pf = cpf.idCliente_pf;
;

use oficina_mec;
select * from cliente_pj;
show tables;

INSERT INTO `oficina_mec`.`cliente_pf` (`Nome`, `CPF`, `Data_Nasc`, `Data Cadastro`, `Telefone`, `E-mail`, `Endereço`, `Cidade`, `Estado`) VALUES ('Julio Cesar', '12345678945', '79-11-06', '22-10-20', '119857412', 'julio.okuda@gmail.com', 'r. gal edson figueira, 222', 'São Paulo', 'SP');
show databases;
use oficina_mec;
show tables;
select * from cliente_pf;
