create database oficinamecanica;

create table clientepessoafisica (
Idclientepessoafisica int auto_increment not null, 
Nome varchar (255),
RG char (10) not null, 
CPF char (11) not null,
Datadenascimento date,
Telefone varchar (45),
primary key (idclientepessoafisica),
constraint unique_CPF_clientepessoafisica unique (CPF),
constraint unique_RG_clientepessoafisica unique (RG)
);

insert into clientepessoafisica (Idclientepessoafisica,Nome,RG,CPF,Datadenascimento,Telefone)
values 
(01,'Fulado de tal 1',2654712412,12457841545,22-05-1992,249998-7541),
(02,'Fulado de tal 2',21456788945,12456987451,21-04-1990,249998-7545),
(03,'Fulado de tal 3',12457899452,12459687412,20-02-1991,249998-7542),
(04,'Fulado de tal 4',21469874312,12456974384,19-01-1995,249998-7543)
;

create table clientepessoajurica (
idclientepessoajuridica int auto_increment not null, 
Razaosocial varchar (255),
Nomefantasia varchar (255),
CNPJ char (15) not null,
Telefone varchar (45),
primary key (idpessoajuridica),
constraint unique_CNPJ_clientepessoajurica unique (CNPJ)
);

insert into clientepessoajuridica(idclientepessoajuridica,Razaosocial,Nomefantasia,CNPJ,Telefone)
values 
(001,'Empresa 1 LTDA','Nome Fantasia 1',124597451234567,249945-7541),
(002,'Empresa 2 LTDA','Nome Fantasia 2',547894125410214,249945-5478),
(003,'Empresa 3 LTDA','Nome Fantasia 3',102457894151021,249945-9541),
(004,'Empresa 4 LTDA','Nome Fantasia 4',210459712014578,249945-6214)
;


create table ordemdeservico (
idordemdeservico int not null,
idclientepessoafisica int not null,
idclientepessoajuridica int not null, 
idveiculoemmanutencao int not null,
idformadepagamento int not null,
marca varchar(255),
iniciodoserico date not null,
servicoencaminhado date not null,
conclusaodoservico date not null,
primary key (idordemdeservico,idclientepessoafisica,idclientepessoajuridica,idveiculoemmanutencao,idformadepagamento),
constraint fk_ordemdeservico_idclientepessoafisica foreign key (idclientepessoafisica) references clientepessoafisica (Idclientepessoafisica),
constraint fk_ordemdeservico_idclientepessoajuridica foreign key (idclientepessoajuridica) references clientepessoajuridica (Idclientepessoajuridica),
constraint fk_ordemdeservico_idveiculoemmanutencao foreign key (idveiculoemmanutencao) references veiculoemmanutencao (Idveiculoemmanutencao),
constraint fk_ordemdeservico_idformadepagamento foreign key (idformadepagamento) references veiculoemmanutencao (Idformadepagamento)
)
;

insert into ordemdeservico (idordemdeservico,idclientepessoafisica,idclientepessoajuridica,idveiculoemmanutencao,idformadepagamento,marca,iniciodoserico,servicoencaminhado,conclusaodoservico)
values 
(1,01,null,'Cobalt','AA','Chevrolet',15-09-2022,'Não', 17-09-2022),
(2,02,null,'Jetta','AA','Volkswagem',12-09-2022,'Não', 13-09-2022),
(3,03,null,'Onix','AA','Chevrolet',14-09-2022,'Não', 16-09-2022),
(4,04,null,'Sentra','AA','Nissan',15-09-2022,'Não', 17-09-2022),

(5,null,001,'308','AA','Peugeot',16-09-2022,'Não', 19-09-2022),
(6,null,002,'2008','AA','Peugeot',19-09-2022,'Não', 20-09-2022),
(7,null,003,'Nivus','AA','Volkswagem',12-09-2022,'Não', 13-09-2022),
(8,null,004,'Voyage','AA','Volkswagem',13-09-2022,'Não', 14-09-2022)
;




create table servicos (
idservico int, 
idtipodeservico int not null,
idordemdeservico int not null,
primary key (idservico,idtipodeservico,idordemdeservico),
constraint fk_servicos_idtipodeservico foreign key (idtipodeservico) references tipodeservico (idtipodeservico),
constraint fk_servicos_idordemdeservico foreign key (idordemdeservico) references ordemdeservico (idordemdeservico)
);

insert into ordemdeservico (idservico,idtipodeservico,idordemdeservico)
values
 ('AB','Reparos automotivos',1),
  ('AB','Reparos automotivos',2),
   ('AB','Reparos automotivos',3),
    ('AB','Reparos automotivos',4),
    
     ('AC','Manutenção de Embreagem',5),
      ('AC','Manutenção de Embreagem',6),
       ('AC','Manutenção de Embreagem',7),
        ('AC','Manutenção de Embreagem',8)
        ;


create table tipodeservico (
idtipodeservico int primary key,
valordoservico decimal,
valortotal decimal, 
totaldedescontos decimal,
descrição varchar (255) 
);
 
 insert into tipodeservico (idtipodeservico,valordoservico,valortotal,totaldedescontos,descrição) 
 values 
 (1,137.75,123.95,13.75,'Reparos automotivos com 10% de desconto'),
 (2,145.15,130.65,14,55,'Reparos automotivos com 10% de desconto'),
 (3,199.50,179.55,19.95,'Reparos automotivos com 10% de desconto'),
 (4,170.50,153.45,17.45,'Reparos automotivos com 10% de desconto'),
 
 (5,220,209,11,'Manutenção de Embreagem com 5% de desconto'),
 (6,235,223.25,11.75,'Manutenção de Embreagem com 5% de desconto'),
 (7,145.90,138.65,7,29,'Manutenção de Embreagem com 5% de desconto'),
 (8,112,106,40,5.6,'Manutenção de Embreagem com 5% de desconto')
 ;

create table estoque (
idpecas int primary key not null,
marca varchar (255),
nome varchar (255),
quantidade int, 
descricao varchar (255)
);

insert into estoque (idpecas,marca,nome,quantidade,descricao)
values 
('PEÇASA','aleatoriopeças','PEÇAA',40,'Peças para Reparos automotivos'),
('PEÇASB','aleatoriopeças','PEÇAB',30,'Peças para Reparos automotivos'),
('PEÇASC','aleatoriopeças','PEÇAC',20,'Peças para Reparos automotivos'),
('PEÇASD','aleatoriopeças','PEÇAD',10,'Peças para Reparos automotivos'),

('PEÇASE','aleatoriopeças','PEÇAE',15,'Peças para Manutenção de Embreagem'),
('PEÇASF','aleatoriopeças','PEÇAF',25,'Peças para Manutenção de Embreagem'),
('PEÇASG','aleatoriopeças','PEÇAG',22,'Peças para Manutenção de Embreagem'),
('PEÇASH','aleatoriopeças','PEÇAH',12,'Peças para Manutenção de Embreagem')
;

CREATE TABLE fornecedor (
    idfornecedor INT PRIMARY KEY NOT NULL,
    razaosocial VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    telefone VARCHAR(45),
    email VARCHAR(255)
);

insert into fornecedor ( idfornecedor,razaosocial,CNPJ,telefone,email)
values 

('F1','Autopeças e Acessórios',265478912451784,2499974-2487,'teste.mysql@outlook.com')
;

create table fornecedordisponibilizandopecas (
idfornecedordisponibilizandopecas int, 
idpecas int not null, 
idfornecedor int, 
nome varchar (255) not null, 
quantidade varchar (255) not null, 
descricao varchar (255),
primary key (idfornecedordisponibilizandopecas,idpecas,idfornecedor),
constraint fk_fornecedordisponibilizandopecas_idpecas foreign key (idpecas) references estoque (idpecas),
constraint fk_fornecedordisponibilizandopecas_idfornecedor foreign key (idfornecedor) references fornecedor (idfornecedor)
);


insert into fornecedordisponibilizandopecas (idfornecedordisponibilizandopecas,idpecas,idfornecedor,nome,quantidade,descricao)
values 
('x1','PEÇASA','F1','PEÇAA',40,'Fornecedor Disponibilizando Peças para Reparos automotivos'),
('x1','PEÇASB','F1','PEÇAB',30,'Fornecedor Disponibilizando Peças para Reparos automotivos'),
('x1','PEÇASC','F1','PEÇAC',20,'Fornecedor Disponibilizando Peças para Reparos automotivos'),
('x1','PEÇASD','F1','PEÇAD',10,'Fornecedor Disponibilizando Peças para Reparos automotivos'),
('x2','PEÇASE','F1','PEÇAE',15,'Fornecedor Disponibilizando Peças para Manutenção de Embreagem'),
('x2','PEÇASF','F1','PEÇAF',25,'Fornecedor Disponibilizando Peças para Manutenção de Embreagem'),
('x2','PEÇASG','F1','PEÇAG',22,'Fornecedor Disponibilizando Peças para Manutenção de Embreagem'),
('x2','PEÇASH','F1','PEÇAH',12,'Fornecedor Disponibilizando Peças para Manutenção de Embreagem')
;

create table veiculoemmanutencao (
idveiculoemmanutencao int not null, 
idveiculo int not null, 
idequipe int not null, 
nomedomecânicoresponsavel varchar (255) not null, 
iniciodamanutencao date not null, 
conclusaodamanutencao date not null,
situacaoatual varchar (255),
tipodereparo varchar (255), 
manutencaoadicional varchar (255),
primary key (idveiculoemmanutencao,idveiculo,idequipe),
constraint fk_veiculoemmanutencao_idequipe foreign key (idequipe) references coladoradordisponivel (idequipe),
constraint fk_veiculoemmanutencao_idveiculo foreign key (idveiculo) references veiculo (idveiculo)
);

insert into veiculoemmanutencao (idveiculoemmanutencao,idveiculo,idequipe,nomedomecânicoresponsavel,iniciodamanutencao,situacaoatual,manutencaoadicional)
values 

('1MT','Cobalt','EquipeA','Fulano de Tal 1',15-09-2022,'Inicio da manutenção em 4 dias','não'),
('2MT','Jetta','EquipeA','Fulano de Tal 1',12-09-2022,'Inicio da manutenção em 1 dia','não'),
('3MT','Onix','EquipeA','Fulano de Tal 2', 14-09-2022,'Inicio da manutenção em 3 dias','não'),
('4MT','Sentra','EquipeA','Fulano de Tal 3',15-09-2022,'Inicio da manutenção em 4 dias','não'),

 ('5MT','308','EquipeA','Fulano de Tal 4',16-09-2022,'Inicio da manutenção em 4 dias','não'),
('6MT','2008','EquipeA','Fulano de Tal 5',19-09-2022,'Inicio da manutenção em 4 dias','não'),
('7MT','Nivus','EquipeA','Fulano de Tal 6',19-09-2022,'Inicio da manutenção em 4 dias','não'),
('8MT','Voyage','EquipeA','Fulano de Tal 5',13-09-2022,'Inicio da manutenção em 4 dias','não')
;

create table veiculo (
idveiculo int not null, 
marca varchar (255) not null,
modelo varchar (255) not null, 
ano char (4),
placa varchar (10)
);

insert into veiculo (idveiculo,marca,modelo,ano,placa)
values 
('Cobalt','Chevrolet','Sedan',2022,'EESS1457'),
('Onix','Chevrolet','Hatch',2022,'ABDF1457'),
('Jetta','Volkswagem','Sedan',2022,'CDSD1457'),
('Sentra','Nissan','Sedan',2022,'EFDS1457'),

('308','Peugeot','Sedan',2022,'EFDF1457'),
('2008','Peugeot','Sedan',2022,'EFGIG1457'),
('Nivus','Nissan','Sedan',2022,'EDSPH1457'),
('Voyage','Volkswagem','SUV',2022,'ESES1457')
;

create table quadrodecolaboradores (
idmecanicoresponsavel int primary key not null,
nome varchar (255) not null,
matricula varchar (100) not null, 
CPF char (11) not null, 
telefone varchar (45) not null, 
especialidade varchar (255) not null, 
endereço varchar (255) not null)
;

insert into quadrodecolaboradores (idmecanicoresponsavel,nome,matricula,CPF,telefone,especialidade,endereço)
values
('M01','Fulano de TAL 1',5478123,124571487122,2497841-2457,'Reparos automotivos e Manutenção de Embreagem','Rio de Janeiro'),
('M02','Fulano de TAL 2',5478122,54781241021,2497841-4457,'Reparos automotivos e Manutenção de Embreagem','Rio de Janeiro'),
('M03','Fulano de TAL 3',5478124,45718451201,2497841-5557,'Reparos automotivos e Manutenção de Embreagem','Rio de Janeiro'),
('M04','Fulano de TAL 4',5478125,24157013541,2497841-1257,'Reparos automotivos e Manutenção de Embreagem','Rio de Janeiro'),
('M05','Fulano de TAL 5',5478126,54128710241,2497841-1157,'Reparos automotivos e Manutenção de Embreagem','Rio de Janeiro'),
('M06','Fulano de TAL 6',5478127,10245871345,2497841-1057,'Reparos automotivos e Manutenção de Embreagem','Rio de Janeiro')
;

create table coladoradordisponivel (
idequipe int primary key not null,
idmecanicoresponsavel int not null,
idveiculoemmanutencao int not null,
constraint fk_coladoradordisponivel_idveiculoemmanutencao foreign key (idveiculoemmanutencao) references veiculoemmanutencao (idveiculoemmanutencao),
constraint fk_coladoradordisponivel_idmecanicoresponsavel foreign key (idmecanicoresponsavel) references quadrodecolaboradores (idmecanicoresponsavel)
);

insert into coladoradordisponivel (idequipe,idmecanicoresponsavel,idveiculoemmanutencao)
values
('EquipeA','M01','Cobalt'),
('EquipeA','M01','Jetta'),
('EquipeA','M02','Onix'),
('EquipeA','M03','Sentra'),

('EquipeA','M04','308'),
('EquipeA','M05','2008'),
('EquipeA','M06','Nivus'),
('EquipeA','M05','Voyage')
;

  create table formadepagamento (
    Idpessoafisica int,
    Idpessoajuridica int ,
    Idformadepagaamento int,
    Idpix int,
    Idcartao int,
    tipodepagamento enum ('Cartão','Pix'),
    limite float,
    primary key (Idpessoafisica,Idpessoajuridica,Idformadepamento,Idpix,Idcartao,tipodepagamento,limite),
    constraint fk_formadepagamento_Idpessoajuridica foreign key (Idpessoajuridica) references clientepessoajuridica (Idpessoajuridica),
    constraint fk_formadepagamento_Idpessoafisica foreign key (Idpessoafisica) references clientepessoafisica (Idpessoafisica)
);

insert into formadeagamento (Idpessoafisica,Idpessoajuridica,Idformadepagaamento,Idpix, Idcartao,tipodepagamento,tipodepagamento,limite)
values 
(01,null,'X1',null,1,null,'cartao',null),
(02,null,'X1',null,1,null,'cartao',null),
(03,null,'X1',null,1,null,'cartao',null),
(04,null,'X1',null,1,null,'cartao',null),

(null,001,'X2',2,null,null,'pix',null),
(null,002,'X2',2,null,null,'pix',null),
(null,003,'X2',2,null,null,'pix',null),
(null,004,'X2',2,null,null,'pix',null)
;

create table cartao (
    Idcartao int,
    Idformadepagamento int,
    nomedotitular varchar (255) not null,
    CPF char (11) not null,
    numerodocartao char (30) not null, 
    datadevalidade date not null, 
    codigodevalidacao char (3),
    primary key (Idcartao,Idformadepagamento),
     constraint unique_numerodocartao_cartao unique (numerodocartao),
     constraint unique_datadevalidade_cartao unique (datadevalidade),
     constraint unique_codigodevalidacao_cartao unique (codigodevalidacao),
    constraint unique_CPF_cartao unique (CPF),
  constraint fk_cartao_Idcartao foreign key (Idcartao) references formadepagamento (Idcartao)
    );

insert into cartao (Idcartao,Idformadepagamento,nomedotitular,CPF,numerodocartao,datadevalidade,codigodevalidacao)
values
(1,'Visa','X1','Fulano de Tal 1',47517124512,4517-45127-4571-4452,20-10-2028,457),
(1,'Visa','X1','Fulano de Tal 2',12457124512,5674-45127-4571-4452,20-10-2030,483),
(1,'Visa','X1','Fulano de Tal 3',47127124512,2457-45127-4571-4452,20-10-2027,197),
(1,'Visa','X1','Fulano de Tal 4',35417124512,3547-45127-4571-4452,20-10-2026,227),

(null,'X2',null,null,null,null,null),
(null,'X2',null,null,null,null,null),
(null,'X2',null,null,null,null,null),
(null,'X2',null,null,null,null,null)
;


     create table Pix (
    Idpix int,
    Idformadepagamento int,
    Chave varchar (255),
    primary key (Idpix ,Idformadepagamento),
    constraint fk_Pix_IdPix foreign key (IdPix) references formadepagamento (IdPix)
    );
    
insert into Pix (Idpix,Idformadepagamento,Chave)
values 
(2,'X2','ea4512656598465.4445946'),
(2,'X2','ea4512656598465.4445946'),
(2,'X2','ea4512656598465.4445946'),
(2,'X2','ea4512656598465.4445946'),

(null,'X1',null),
(null,'X1',null),
(null,'X1',null),
(null,'X1',null)

;

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


