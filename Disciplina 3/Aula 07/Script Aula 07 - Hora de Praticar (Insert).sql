CREATE DATABASE pratica1;

USE pratica1;

CREATE TABLE Pais(
id_pais INTEGER PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
continente VARCHAR(150)
);

CREATE TABLE Estado(
id_est INTEGER PRIMARY KEY AUTO_INCREMENT,
nome_est VARCHAR(100),
sigla_est VARCHAR(2),
regiao_est VARCHAR(100), 
id_pais_fk int,
foreign key (id_pais_fk) references pais (id_pais)
);

CREATE TABLE Cidade(
id_cid INTEGER PRIMARY KEY AUTO_INCREMENT,
nome_cid VARCHAR(100),
data_criacao_cid date,
id_est_fk int,
foreign key (id_est_fk) references estado(id_est)
);

CREATE TABLE Endereco(
id_end INTEGER PRIMARY KEY AUTO_INCREMENT,
rua_end VARCHAR(100),
numero_end INTEGER,
bairro_end VARCHAR(100),
id_cid_fk int,
foreign key (id_cid_fk) references cidade(id_cid)
);

CREATE TABLE Cliente(
id_cli INTEGER PRIMARY KEY AUTO_INCREMENT,
nome_cli VARCHAR(100),
cpf VARCHAR(20),
data_nasc_cli DATE,
sexo VARCHAR(1),
email VARCHAR(150),
id_end_fk int,
foreign key (id_end_fk) references endereco(id_end)
); 

# ----------------EXERCICIOS----------------------------
#	• Insira 02 registros na tabela Pais mencionando os atributos;
desc pais;
insert into pais (nome, continente) values ('Brasil', 'America Do Sul');
insert into pais (nome, continente) values ('Mexico', 'America Latina');
select * from pais;
#	• Insira 02 registros na tabela Pais sem mencionar os atributos;
insert into pais values (null, 'Argentina', 'America Do Sul');
insert into pais values (null, 'Estados Unidos', 'America do Norte');
#	• Insira 02 registros na tabela Estado mencionando os atributos;
desc estado;
insert into estado (nome_est, sigla_est, id_pais_fk) values('Rondonia', 'RO', 1);
insert into estado (nome_est, id_pais_fk) values('Mato Grosso', 1);
select * from estado;
#	• Insira 02 registros na tabela Estado sem mencionar os atributos;
insert into estado values(null, 'São Paulo', 'SP', 'Centro Oeste', 1);
insert into estado values(null, 'Santa Catarina', 'SC', 'Sul', 1);
#	• Insira 02 registros na tabela Cidade mencionando os atributos;
desc cidade;
insert into cidade (nome_cid, id_est_fk) values ('Sao Paulo', 3);
insert into cidade (nome_cid, data_criacao_cid, id_est_fk) values ('Mato Grosso', '1768-09-24',  2);
select * from cidade;
#	• Insira 02 registros na tabela Cidade sem mencionar os atributos;
insert into cidade values(null, 'Ariquemes', '1897-02-12', 1);
insert into cidade values(null, 'Porto Velho', '1797-10-02', 1);
#	• Insira 02 registros na tabela Endereco mencionando os atributos;
desc  endereco;
insert into endereco (rua_end, bairro_end, id_cid_fk) values ('Rua das flores', 'Setor 2', 3);
insert into endereco (rua_end, id_cid_fk) values ('Rua dos santos', 3);
select * from endereco;
#	• Insira 02 registros na tabela Endereco sem mencionar os atributos;
insert into endereco values (null, 'Rua dos animais', 3243, 'Bairro de Cima', 3);
insert into endereco values (null, 'Rua dos estados', 3243, 'Setor 5', 3);
#	• Insira 02 registros na tabela Cliente mencionando os atributos;
desc cliente;
insert into cliente (nome_cli, cpf, sexo, id_end_fk) values('Joao da silva', '123.123.213-32', 'M', 1);
insert into cliente (nome_cli, cpf, id_end_fk) values('Maria Jose', '543.133.213-31', 2);
select * from cliente;
#	• Insira 02 registros na tabela Cliente sem mencionar os atributos;
insert into cliente  values(null, 'Alice Angelo', '324.433.212-43', '1998-02-21','F', 'aliceangelo@maill.com', 4);
insert into cliente  values(null, 'Guilherme Castello', '232.433.512-43', '1999-09-12','M', 'guilhere@maill.com', 4);
