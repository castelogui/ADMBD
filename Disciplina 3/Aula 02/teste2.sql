CREATE DATABASE pratica2;

USE pratica2;

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
id_pais_fk INTEGER,
FOREIGN KEY(id_pais_fk) REFERENCES Pais (id_pais)
);

CREATE TABLE Cidade(
id_cid INTEGER PRIMARY KEY AUTO_INCREMENT,
nome_cid VARCHAR(100),
data_criacao_cid date,
id_est_fk INTEGER,
FOREIGN KEY (id_est_fk) references Estado (id_est)
);

CREATE TABLE Endereco(
id_end INTEGER PRIMARY KEY AUTO_INCREMENT,
rua_end VARCHAR(100),
numero_end INTEGER,
bairro_end VARCHAR(100),
id_cid_fk INTEGER,
FOREIGN KEY (id_cid_fk) REFERENCES Cidade (id_cid)
);

CREATE TABLE Cliente(
id_cli INTEGER PRIMARY KEY AUTO_INCREMENT,
nome_cli VARCHAR(100),
cpf VARCHAR(20),
data_nasc_cli DATE,
sexo VARCHAR(1),
email VARCHAR(150),
id_end_fk INTEGER,
FOREIGN KEY (id_end_fk) REFERENCES Endereco (id_end)
); 
