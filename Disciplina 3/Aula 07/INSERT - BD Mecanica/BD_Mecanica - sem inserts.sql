/*
Scrit do BD_Mecanica Carro ZERO
 */

create database BD_mecanica;
use BD_mecanica;

create table Cliente(
cod_cli int primary key auto_increment not null,
nome_cli varchar(200) not null,
cpf_cli varchar(50) not null,
rg_cli varchar(50) not null,
telefone_cli varchar(50) not null,
endereco_cli varchar(200) not null,
email_cli varchar(100),
sexo_cli varchar(50),
renda_cli double not null,
data_Nasc_cli date not null,
status_cli varchar (100)
);

create table Funcionario(
cod_func int primary key auto_increment not null,
nome_func varchar(200) not null,
funcao_func varchar(100) not null,
cpf_func varchar(50) not null,
rg_func varchar(50) not null,
telefone_func varchar(50),
endereco_func varchar (200),
email_func varchar (200),
sexo_func varchar (20),
salario_func double not null
);

create table Servico(
cod_serv int primary key auto_increment not null,
descricao_serv varchar(300) not null,
valor_serv double not null,
tempo_serv time
);

create table Fornecedor(
cod_forn int primary key auto_increment not null,
razao_forn varchar(150) not null,
nome_forn varchar(150) not null,
cnpj_forn varchar(50) not null,
endereco_forn varchar(300) not null,
telefone_forn varchar(50) not null
);

create table Produto(
cod_prod int primary key auto_increment not null,
nome_prod varchar(300) not null,
marca_prod varchar(150) not null,
estoque_prod int not null,
valor_prod double not null,
tamanho_prod varchar(5) not null,
tipo_prod varchar(50) not null
);

create table Compra(
cod_comp int primary key auto_increment not null,
data_comp date not null,
valor_comp double not null,
quant_itens_comp int,
forma_Pag_comp varchar(50) not null,
cod_forn_fk int not null,
foreign key (cod_forn_fk) references Fornecedor(cod_forn)
);

create table Despesa(
cod_desp int primary key auto_increment not null,
descricao_desp varchar(200),
valor_desp double not null,
data_desp date not null,
forma_pag_desp varchar(100) not null
);

create table Caixa(
cod_cai int primary key auto_increment not null,
data_cai date not null,
saldo_inicial_cai double not null,
total_recebimento_cai double not null,
total_pagamento_cai double not null,
saldo_final_cai double not null,
cod_func_fk int not null,
foreign key (cod_func_fk) references funcionario (cod_func)
);

create table Pagamento(
cod_pag int primary key auto_increment not null,
valor_pag double not null,
parcela_pag double not null,
data_pag date not null,
forma_pag varchar(50) not null,
cod_comp_fk int,
cod_cai_fk int not null,
cod_desp_fk int,
foreign key (cod_comp_fk) references compra (cod_comp),
foreign key (cod_cai_fk) references caixa (cod_cai),
foreign key (cod_desp_fk) references despesa (cod_desp)
);

create table Venda (
cod_vend int primary key auto_increment not null,
valor_vend double not null,
data_vend date not null,
hora_vend varchar(20),
forma_pag_vend varchar(100),
cod_cli_fk int not null,
cod_func_fk int not null,
foreign key (cod_cli_fk) references cliente (cod_cli),
foreign key (cod_func_fk) references funcionario (cod_func)
);

create table Recebimento (
cod_rec int primary key auto_increment not null,
valor_rec double not null,
parcela_rec int not null,
forma_rec varchar(100) not null,
data_vencimento_rec date not null,
cod_cai_fk int not null,
cod_vend_fk int not null,
foreign key (cod_cai_fk) references caixa (cod_cai),
foreign key (cod_vend_fk) references Venda(cod_vend)
);

create table Venda_Serv(
cod_vser int primary key auto_increment not null,
cod_vend_fk int not null,
cod_serv_fk int not null,
quant_vser int,
foreign key (cod_vend_fk) references venda (cod_vend),
foreign key (cod_serv_fk) references servico (cod_serv)
);

create table Venda_Prod(
cod_vpro int primary key auto_increment not null,
cod_vend_fk int not null,
cod_prod_fk int not null,
quant_vpro int,
foreign key (cod_vend_fk) references venda (cod_vend),
foreign key (cod_prod_fk) references produto (cod_prod)
);

create table Compra_Prod(
cod_cprod int primary key auto_increment not null,
cod_comp_fk int not null,
cod_prod_fk int not null,
quant_cprod int,
valor_cprod float,
foreign key (cod_comp_fk) references Compra (cod_comp),
foreign key (cod_prod_fk) references Produto (cod_prod)
);

create table Funcionario_Servico (
cod_fserv int not null primary key auto_increment,
cod_func_fk int not null,
cod_serv_fk int not null,
foreign key (cod_func_fk) references Funcionario (cod_func),
foreign key (cod_serv_fk) references Servico (cod_serv)
);

#------------------------EXERCICIO------------------------------------------
#	1. Adicione 05 registros para cada tabela do banco de dados, com dados aleatórios e inventados por você.



