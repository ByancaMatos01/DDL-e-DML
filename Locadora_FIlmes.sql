use locadoura
create database locadoura
use master
drop database locadoura
create table filmes (
id     int,
titulo varchar(40), 
ano    int not null check (ano <=2021),
primary key(id)
)
go
create table estrela (
id int ,
nome varchar(50)
primary key(id)
)
go
create table filme_estrela (
Filme_id int ,
estrela_id int,
foreign key(Filme_id) References filmes (id),
foreign key(estrela_id) References estrela (id)
)
go
create table DVD (
num int ,
data_fabricaçao date check(data_fabricaçao< getdate()),
filmes_id int
primary key(num),
foreign key(filmes_id) references filmes (id)
)
go
create table cliente (
num_cadastro int check(num_cadastro >0),
nome         varchar(70),
logradouro   varchar (150),
num           int,
cep           char (08) CHECK(LEN(cep) = 8)
Primary key(num_cadastro)
)
go

create table locaçao(
DVD_Num             int,
clientenum_cadastro int,
data_locacao date   DEFAULT(GETDATE()),
data_devolucao date,
valor decimal(7,2) check (valor >0),
primary key(DVD_Num,clientenum_cadastro, data_locacao),
foreign key (DVD_Num) references DVD (num),
foreign key (clientenum_cadastro) references cliente (num_cadastro),
CONSTRAINT chk_datas CHECK(data_devolucao  > data_locacao)
)
go
alter table estrela
add nome_real_da_estrela varchar(50)
go
alter table filmes 
alter column  titulo varchar (80)
go

insert into filmes (id,titulo, ano)
values(1001, 'Whiplash', 2015)
go
insert into filmes (id,titulo, ano)
values(1002, 'Birdman', 2015)
go
insert into filmes (id,titulo, ano)
values(1003, 'interestelar', 2014)
go
insert into filmes (id,titulo, ano)
values(1004, 'A Culpa é das estrelas', 2014)
go
insert into filmes (id,titulo, ano)
values(1005, 'Alexandre e o dia Terrivel, Horrivel, espantoso e Horrorso ', 2014)
go
insert into filmes (id,titulo, ano)
values(1006, 'Sing', 2016)
go
insert into estrela (ID, Nome, nome_real_da_estrela)
values (9901, 'Michael Keaton', 'Michael John Douglas')
go
insert into estrela (ID, Nome, nome_real_da_estrela)
values (9902, 'Emma Stone', 'Emily Jean Stone')
go
insert into estrela (ID, Nome)
values (9903, 'Miles Taller')
go
insert into estrela (ID, Nome, nome_real_da_estrela)
values (9904, 'Steve Carell', 'Steven John Carell')
go
insert into estrela (ID, Nome, nome_real_da_estrela)
values (9905, 'Jennifer Garner', 'Jennifer Anne Garner')
go

insert into filme_estrela(Filme_id, estrela_id)
values (1002,9901)
go
insert into filme_estrela(Filme_id, estrela_id)
values (1002,9902)
go
insert into filme_estrela(Filme_id, estrela_id)
values (1001,9903)
go
insert into filme_estrela(Filme_id, estrela_id)
values (1005,9904)
go
insert into filme_estrela(Filme_id, estrela_id)
values (1005,9905)
go


insert into cliente(num_cadastro, nome, logradouro,num,cep)
values(5501, 'Matilde Luz', 'Rua Síria', 150, '03086040')
go
insert into cliente(num_cadastro, nome, logradouro,num,cep)
values(5502, 'Carlos Carreiro', 'Rua Bartolomeu Aires', 1250, '04419110')
go
insert into cliente(num_cadastro, nome, logradouro,num)
values(5503, 'Daniel Ramalho', 'Rua Itajutiba', 169)
go
insert into cliente(num_cadastro, nome, logradouro,num)
values(5504, 'Roberta Bento', 'Rua Jayme Von Rosenburg', 36)
go
insert into cliente(num_cadastro, nome, logradouro,num, cep)
values(5505, 'Rosa Cerqueira', 'Rua Arnaldo Simões Pinto', 235, '02917110')
go
select*from cliente
go
INSERT INTO DVD VALUES
(10001, '02-12-2020', 1001),
(10002, '18-10-2019', 1002),
(10003, '03-04-2020', 1003),
(10004, '02-12-2020', 1001),
(10005, '18-10-2019', 1004),
(10006, '03-04-2020', 1002),
(10007, '02-12-2020', 1005),
(10008, '18-10-2019', 1002),
(10009, '03-04-2020', 1003)
 go

INSERT INTO locaçao VALUES
(10001, 5502, '2021-02-18','2021-02-21',3.50),
(10009, 5502, '2021-02-18','2021-02-21',3.50),
(10002, 5503, '2021-02-18','2021-02-19',3.50),
(10002, 5505, '2021-02-20','2021-02-23',3.00),
(10004, 5505, '2021-02-20','2021-02-23',3.00),
(10005, 5505, '2021-02-20','2021-02-23',3.00),
(10001, 5501, '2021-02-24','2021-02-26',3.50),
(10008, 5501, '2021-02-24','2021-02-26',3.50)

select*from locaçao

UPDATE cliente
SET cep = '08411150'
WHERE num_cadastro = 5503

UPDATE cliente
SET cep = '02918190'
WHERE num_cadastro = 5504

UPDATE locaçao
SET valor = 3.25
WHERE data_locacao = '2021-02-18' AND clientenum_cadastro = 5502

UPDATE locaçao
SET valor = 3.10
WHERE data_locacao = '2021-02-24' AND clientenum_cadastro = 5501

UPDATE dvd
SET data_fabricaçao = '2019-07-14'
WHERE num = 10005

UPDATE estrela
SET nome = 'Miles Alexander Teller'
WHERE UPPER(nome_real_da_estrela) = 'MILES TELLER'

DELETE filmes
WHERE UPPER(titulo) = 'SING'

SELECT titulo
FROM filmes
WHERE ano = 2014

SELECT filmes_id, CONVERT(CHAR(10), data_fabricaçao, 103) AS Fab
FROM dvd
WHERE data_fabricaçao > '01-01-2020'

GO

SELECT DVD_Num, data_locacao, data_devolucao, valor, valor + 2.00 AS Multa_Acrescimo
FROM locaçao
WHERE clientenum_cadastro = 5505

GO

SELECT logradouro, num, cep
FROM cliente
WHERE UPPER(nome) = 'MATILDE LUZ'

GO

SELECT num_cadastro, logradouro + ', ' + CAST(num AS varchar(7)) + ' - CEP: ' + cep AS end_comp 
FROM cliente
WHERE num_cadastro >= 5503






