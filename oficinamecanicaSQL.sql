create database oficinamecanica;

create table clientepessoafisica (
    Idclientepessoafisica int auto_increment not null, 
    Nome varchar (255),
    RG char (10) not null, 
    CPF char (11) not null,
    Datadenascimento date,
    Telefone varchar (45),
    primary key (Idclientepessoafisica),
    constraint unique_CPF_clientepessoafisica unique (CPF),
    constraint unique_RG_clientepessoafisica unique (RG)
);

insert into clientepessoafisica (Idclientepessoafisica, Nome, RG, CPF, Datadenascimento, Telefone)
values 
    (01, 'Fulado de tal 1', '2654712412', '12457841545', '1992-05-22', '249998-7541'),
    (02, 'Fulado de tal 2', '21456788945', '12456987451', '1990-04-21', '249998-7545'),
    (03, 'Fulado de tal 3', '12457899452', '12459687412', '1991-02-20', '249998-7542'),
    (04, 'Fulado de tal 4', '21469874312', '12456974384', '1995-01-19', '249998-7543')
;

create table clientepessoajuridica (
    idclientepessoajuridica int auto_increment not null, 
    Razaosocial varchar (255),
    Nomefantasia varchar (255),
    CNPJ char (14) not null,
    Telefone varchar (45),
    primary key (idclientepessoajuridica),
    constraint unique_CNPJ_clientepessoajuridica unique (CNPJ)
);

insert into clientepessoajuridica (idclientepessoajuridica, Razaosocial, Nomefantasia, CNPJ, Telefone)
values 
    (001, 'Empresa 1 LTDA', 'Nome Fantasia 1', '12459745123456', '249945-7541'),
    (002, 'Empresa 2 LTDA', 'Nome Fantasia 2', '54789412541021', '249945-5478'),
    (003, 'Empresa 3 LTDA', 'Nome Fantasia 3', '10245789441212','249945-7845')
    ;


CREATE TABLE ordemdeservico (
  idordemdeservico INT NOT NULL,
  idclientepessoafisica INT,
  idclientepessoajuridica INT,
  idveiculoemmanutencao INT,
  idformadepagamento INT,
  marca VARCHAR(255),
  iniciodoservico DATE,
  servicoencaminhado DATE,
  conclusaodoservico DATE,
  PRIMARY KEY (idordemdeservico),
  CONSTRAINT fk_ordemdeservico_idclientepessoafisica FOREIGN KEY (idclientepessoafisica) REFERENCES clientepessoafisica (idclientepessoafisica),
  CONSTRAINT fk_ordemdeservico_idclientepessoajuridica FOREIGN KEY (idclientepessoajuridica) REFERENCES clientepessoajuridica (idclientepessoajuridica),
  CONSTRAINT fk_ordemdeservico_idveiculoemmanutencao FOREIGN KEY (idveiculoemmanutencao) REFERENCES veiculoemmanutencao (idveiculoemmanutencao),
  CONSTRAINT fk_ordemdeservico_idformadepagamento FOREIGN KEY (idformadepagamento) REFERENCES formadepagamento (idformadepagamento)
);

INSERT INTO ordemdeservico (idordemdeservico, idclientepessoafisica, idclientepessoajuridica, idveiculoemmanutencao, idformadepagamento, marca, iniciodoservico, servicoencaminhado, conclusaodoservico)
VALUES 
  (1, 01, null, 1, 1, 'Chevrolet', '2022-09-15', 'Não', '2022-09-17'),
  (2, 02, null, 2, 1, 'Volkswagen', '2022-09-12', 'Não', '2022-09-13'),
  (3, 03, null, 3, 1, 'Chevrolet', '2022-09-14', 'Não', '2022-09-16'),
  (4, 04, null, 4, 1, 'Nissan', '2022-09-15', 'Não', '2022-09-17'),
  (5, null, 1, 5, 1, 'Peugeot', '2022-09-16', 'Não', '2022-09-19'),
  (6, null, 2, 6, 1, 'Peugeot', '2022-09-19', 'Não', '2022-09-20'),
  (7, null, 3, 7, 1, 'Volkswagen', '2022-09-12', 'Não', '2022-09-13'),
  (8, null, 4, 8, 1, 'Volkswagen', '2022-09-13', 'Não', '2022-09-14');


INSERT INTO servicos (idservico, idtipodeservico, idordemdeservico)
VALUES
('AB', 1, 1),
('AB', 1, 2),
('AB', 1, 3),
('AB', 1, 4),
('AC', 2, 5),
('AC', 2, 6),
('AC', 2, 7),
('AC', 2, 8);



CREATE TABLE tipodeservico (
idtipodeservico INT PRIMARY KEY,
valordoservico DECIMAL,
valortotal DECIMAL,
totaldedescontos DECIMAL,
`descricao` VARCHAR(255)
);

INSERT INTO tipodeservico (idtipodeservico, valordoservico, valortotal, totaldedescontos, `descricao`)
VALUES
(1, 137.75, 123.95, 13.75, 'Reparos automotivos com 10% de desconto'),
(2, 145.15, 130.65, 14.55, 'Reparos automotivos com 10% de desconto'),
(3, 199.50, 179.55, 19.95, 'Reparos automotivos com 10% de desconto'),
(4, 170.50, 153.45, 17.45, 'Reparos automotivos com 10% de desconto'),
(5, 220, 209, 11, 'Manutenção de Embreagem com 5% de desconto'),
(6, 235, 223.25, 11.75, 'Manutenção de Embreagem com 5% de desconto'),
(7, 145.90, 138.65, 7.29, 'Manutenção de Embreagem com 5% de desconto'),
(8, 112, 106, 40.5, 'Manutenção de Embreagem com 5% de desconto');


create table estoque (
idpecas varchar(10) primary key not null,
marca varchar (255),
nome varchar (255),
quantidade int, 
descricao varchar (255)
);

insert into estoque (idpecas, marca, nome, quantidade, descricao)
values 
(1, 'aleatoriopecas', 'PEÇAA', 40, 'Peças para Reparos automotivos'),
(2, 'aleatoriopecas', 'PEÇAB', 30, 'Peças para Reparos automotivos'),
(3, 'aleatoriopecas', 'PEÇAC', 20, 'Peças para Reparos automotivos'),
(4, 'aleatoriopecas', 'PEÇAD', 10, 'Peças para Reparos automotivos'),
(5, 'aleatoriopecas', 'PEÇAE', 15, 'Peças para Manutenção de Embreagem'),
(6, 'aleatoriopecas', 'PEÇAF', 25, 'Peças para Manutenção de Embreagem'),
(7, 'aleatoriopecas', 'PEÇAG', 22, 'Peças para Manutenção de Embreagem'),
(8, 'aleatoriopecas', 'PEÇAH', 12, 'Peças para Manutenção de Embreagem');


CREATE TABLE fornecedor (
    idfornecedor INT PRIMARY KEY NOT NULL,
    razaosocial VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    telefone VARCHAR(45),
    email VARCHAR(255)
);

INSERT INTO fornecedor (idfornecedor, razaosocial, CNPJ, telefone, email)
VALUES (1, 'Autopeças e Acessórios', '265478912451784', '2499974-2487', 'teste.mysql@outlook.com');

CREATE TABLE fornecedordisponibilizandopecas (
    idfornecedordisponibilizandopecas INT NOT NULL,
    idpecas INT NOT NULL,
    idfornecedor INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    quantidade INT NOT NULL,
    descricao VARCHAR(255),
    PRIMARY KEY (idfornecedordisponibilizandopecas, idpecas, idfornecedor),
    CONSTRAINT fk_fornecedordisponibilizandopecas_idpecas FOREIGN KEY (idpecas) REFERENCES estoque (idpecas),
    CONSTRAINT fk_fornecedordisponibilizandopecas_idfornecedor FOREIGN KEY (idfornecedor) REFERENCES fornecedor (idfornecedor)
);

INSERT INTO fornecedordisponibilizandopecas (idfornecedordisponibilizandopecas, idpecas, idfornecedor, nome, quantidade, descricao)
VALUES 
('x1', 1, 1, 'PEÇAA', 40, 'Fornecedor Disponibilizando Peças para Reparos automotivos'),
('x1', 2, 1, 'PEÇAB', 30, 'Fornecedor Disponibilizando Peças para Reparos automotivos'),
('x1', 3, 1, 'PEÇAC', 20, 'Fornecedor Disponibilizando Peças para Reparos automotivos'),
('x1', 4, 1, 'PEÇAD', 10, 'Fornecedor Disponibilizando Peças para Reparos automotivos'),
('x2', 5, 1, 'PEÇAE', 15, 'Fornecedor Disponibilizando Peças para Manutenção de Embreagem'),
('x2', 6, 1, 'PEÇAF', 25, 'Fornecedor Disponibilizando Peças para Manutenção de Embreagem'),
('x2', 7, 1, 'PEÇAG', 22, 'Fornecedor Disponibilizando Peças para Manutenção de Embreagem'),
('x2', 8, 1, 'PEÇAH', 12, 'Fornecedor Disponibilizando Peças para Manutenção de Embreagem');


create table veiculoemmanutencao (
idveiculoemmanutencao int not null, 
idveiculo varchar(255) not null, 
idequipe varchar(255) not null, 
nomedomecanicoresponsavel varchar(255) not null, 
iniciodamanutencao date not null, 
conclusaodamanutencao date, 
situacaoatual varchar(255),
tipodereparo varchar(255), 
manutencaoadicional varchar(255),
primary key (idveiculoemmanutencao),
constraint fk_veiculoemmanutencao_idequipe foreign key (idequipe) references coladoradordisponivel (idequipe),
constraint fk_veiculoemmanutencao_idveiculo foreign key (idveiculo) references veiculo (idveiculo)
);

insert into veiculoemmanutencao (idveiculoemmanutencao,idveiculo,idequipe,nomedomecanicoresponsavel,iniciodamanutencao,situacaoatual,manutencaoadicional)
values 
(1, 'Cobalt', 'EquipeA', 'Fulano de Tal 1', '2022-09-15', 'Inicio da manutenção em 4 dias', 'não'),
(2, 'Jetta', 'EquipeA', 'Fulano de Tal 1', '2022-09-12', 'Inicio da manutenção em 1 dia', 'não'),
(3, 'Onix', 'EquipeA', 'Fulano de Tal 2', '2022-09-14', 'Inicio da manutenção em 3 dias', 'não'),
(4, 'Sentra', 'EquipeA', 'Fulano de Tal 3', '2022-09-15', 'Inicio da manutenção em 4 dias', 'não'),
(5, '308', 'EquipeA', 'Fulano de Tal 4', '2022-09-16', 'Inicio da manutenção em 4 dias', 'não'),
(6, '2008', 'EquipeA', 'Fulano de Tal 5', '2022-09-19', 'Inicio da manutenção em 4 dias', 'não'),
(7, 'Nivus', 'EquipeA', 'Fulano de Tal 6', '2022-09-19', 'Inicio da manutenção em 4 dias', 'não'),
(8, 'Voyage', 'EquipeA', 'Fulano de Tal 5', '2022-09-13', 'Inicio da manutenção em 4 dias', 'não');

CREATE TABLE veiculo (
  idveiculo INT NOT NULL,
  marca VARCHAR(255) NOT NULL,
  modelo VARCHAR(255) NOT NULL,
  ano CHAR(4),
  placa VARCHAR(10)
);

INSERT INTO veiculo (idveiculo, marca, modelo, ano, placa) VALUES
(1, 'Chevrolet', 'Cobalt', '2022', 'EESS1457'),
(2, 'Chevrolet', 'Onix', '2022', 'ABDF1457'),
(3, 'Volkswagen', 'Jetta', '2022', 'CDSD1457'),
(4, 'Nissan', 'Sentra', '2022', 'EFDS1457'),
(5, 'Peugeot', '308', '2022', 'EFDF1457'),
(6, 'Peugeot', '2008', '2022', 'EFGIG1457'),
(7, 'Nissan', 'Nivus', '2022', 'EDSPH1457'),
(8, 'Volkswagen', 'Voyage', '2022', 'ESES1457');



CREATE TABLE quadrodecolaboradores (
  idmecanicoresponsavel varchar(10) PRIMARY KEY NOT NULL,
  nome varchar(255) NOT NULL,
  matricula varchar(100) NOT NULL,
  CPF char(11) NOT NULL,
  telefone varchar(45) NOT NULL,
  especialidade varchar(255) NOT NULL,
  endereco varchar(255) NOT NULL
);

INSERT INTO quadrodecolaboradores (idmecanicoresponsavel, nome, matricula, CPF, telefone, especialidade, endereco)
VALUES
('M01', 'Fulano de TAL 1', '5478123', '12457148712', '24978412457', 'Reparos automotivos e Manutenção de Embreagem', 'Rio de Janeiro'),
('M02', 'Fulano de TAL 2', '5478122', '54781241021', '24978414457', 'Reparos automotivos e Manutenção de Embreagem', 'Rio de Janeiro'),
('M03', 'Fulano de TAL 3', '5478124', '45718451201', '24978415557', 'Reparos automotivos e Manutenção de Embreagem', 'Rio de Janeiro'),
('M04', 'Fulano de TAL 4', '5478125', '24157013541', '24978411257', 'Reparos automotivos e Manutenção de Embreagem', 'Rio de Janeiro'),
('M05', 'Fulano de TAL 5', '5478126', '54128710241', '24978411157', 'Reparos automotivos e Manutenção de Embreagem', 'Rio de Janeiro'),
('M06', 'Fulano de TAL 6', '5478127', '10245871345', '24978411057', 'Reparos automotivos e Manutenção de Embreagem', 'Rio de Janeiro');



CREATE TABLE coladoradordisponivel (
  idequipe varchar(10) not null,
  idmecanicoresponsavel varchar(10) not null,
  idveiculoemmanutencao varchar(10) not null,
  primary key (idequipe, idmecanicoresponsavel, idveiculoemmanutencao),
  foreign key (idveiculoemmanutencao) references veiculoemmanutencao (idveiculoemmanutencao),
  foreign key (idmecanicoresponsavel) references quadrodecolaboradores (idmecanicoresponsavel)
);


INSERT INTO coladoradordisponivel (idequipe, idmecanicoresponsavel, idveiculoemmanutencao)
VALUES
('EquipeA', 'M01', 'Cobalt'),
('EquipeA', 'M01', 'Jetta'),
('EquipeA', 'M02', 'Onix'),
('EquipeA', 'M03', 'Sentra'),
('EquipeA', 'M04', '308'),
('EquipeA', 'M05', '2008'),
('EquipeA', 'M06', 'Nivus'),
('EquipeA', 'M05', 'Voyage');

CREATE TABLE formadepagamento (
    Idpessoafisica INT,
    Idpessoajuridica INT,
    Idformadepagamento INT,
    Idpix INT,
    Idcartao INT,
    tipodepagamento ENUM('Cartão', 'Pix'),
    limite FLOAT,
    PRIMARY KEY (Idpessoafisica, Idpessoajuridica, Idformadepagamento, Idpix, Idcartao, tipodepagamento),
    CONSTRAINT fk_formadepagamento_Idpessoajuridica FOREIGN KEY (Idpessoajuridica) REFERENCES clientepessoajuridica (Idpessoajuridica),
    CONSTRAINT fk_formadepagamento_Idpessoafisica FOREIGN KEY (Idpessoafisica) REFERENCES clientepessoafisica (Idpessoafisica)
);

INSERT INTO formadepagamento (Idpessoafisica, Idpessoajuridica, Idformadepagamento, Idpix, Idcartao, tipodepagamento, limite)
VALUES 
(1, NULL, 'X1', NULL, 1, 'Cartão', NULL),
(2, NULL, 'X1', NULL, 1, 'Cartão', NULL),
(3, NULL, 'X1', NULL, 1, 'Cartão', NULL),
(4, NULL, 'X1', NULL, 1, 'Cartão', NULL),
(NULL, 1, 'X2', 2, NULL, 'Pix', NULL),
(NULL, 2, 'X2', 2, NULL, 'Pix', NULL),
(NULL, 3, 'X2', 2, NULL, 'Pix', NULL),
(NULL, 4, 'X2', 2, NULL, 'Pix', NULL);


create table cartao (
    Idcartao int not null,
    Idformadepagamento varchar(255) not null,
    nomedotitular varchar(255) not null,
    CPF char(11) not null,
    numerodocartao char(30) not null, 
    datadevalidade date not null, 
    codigodevalidacao char(3) not null,
    primary key (Idcartao, Idformadepagamento),
    constraint unique_numerodocartao_cartao unique (numerodocartao),
    constraint unique_datadevalidade_cartao unique (datadevalidade),
    constraint unique_codigodevalidacao_cartao unique (codigodevalidacao),
    constraint unique_CPF_cartao unique (CPF),
    constraint fk_cartao_Idformadepagamento foreign key (Idformadepagamento) references formadepagamento (Idformadepagamento)
);

insert into cartao (Idcartao, Idformadepagamento, nomedotitular, CPF, numerodocartao, datadevalidade, codigodevalidacao)
values
(1, 'Visa', 'Fulano de Tal 1', '47517124512', '45174512745714452', '2028-10-20', '457'),
(2, 'Visa', 'Fulano de Tal 2', '12457124512', '56744512745714452', '2030-10-20', '483'),
(3, 'Visa', 'Fulano de Tal 3', '47127124512', '24574512745714452', '2027-10-20', '197'),
(4, 'Visa', 'Fulano de Tal 4', '35417124512', '35474512745714452', '2026-10-20', '227');

insert into cartao (Idformadepagamento) values ('X2');
insert into cartao (Idformadepagamento) values ('X2');
insert into cartao (Idformadepagamento) values ('X2');
insert into cartao (Idformadepagamento) values ('X2');


-- create table
create table Pix (
    IdPix int,
    IdFormaDePagamento int,
    Chave varchar (255),
    primary key (IdPix, IdFormaDePagamento),
    constraint fk_Pix_IdPix foreign key (IdPix) references FormaDePagamento (IdPix)
);

-- insert data
insert into Pix (IdPix, IdFormaDePagamento, Chave) values 
(2, 1, 'ea4512656598465.4445946'),
(2, 1, 'ea4512656598465.4445946'),
(2, 1, 'ea4512656598465.4445946'),
(2, 1, 'ea4512656598465.4445946'),
(null, 1, null),
(null, 1, null),
(null, 1, null),
(null, 1, null);



-----------------------------------------------

 SELECT * FROM clientepessoafisica;
 
SELECT COUNT (idclientepessoafisica), nome
FROM clientepessoafisica
GROUP BY nome
HAVING COUNT (idclientepessoafisica) > 03;

SELECT * FROM clientepessoafisica
WHERE Nome='Fulado de tal 2';

SELECT estoque.idestoque,fornecedordisponibilizandopecas.idpecas,estoque.quantidade
FROM estoque
INNER JOIN fornecedordisponibilizandopecas
ON estoque.idestoque=fornecedordisponibilizandopecas.idpecas;

SELECT * FROM clientepessoafisica
ORDER BY clientepessoajurica ASC, Nomefantasia DESC;

