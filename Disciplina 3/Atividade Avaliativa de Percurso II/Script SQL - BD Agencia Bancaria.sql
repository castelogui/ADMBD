create database BD_Banco;
use BD_Banco;

create table Banco (
cod_ban int primary key not null,
nome_ban varchar (200) not null
);

create table Agência (
cod_ag int primary key not null,
número_ag varchar (100) not null,
nome_ag varchar (100),
telefone_ag varchar (200),
cod_ban_fk int not null,
foreign key (cod_ban_fk) references Banco (cod_ban)
);

create table Cliente (
cod_cli int primary key not null,
nome_cli varchar (200) not null,
cpf_cli varchar (50) not null,
rg_cli varchar (100) not null,
sexo_cli varchar (100),
datanasc_cli date not null,
renda_cli float not null,
endereço_cli varchar (300) not null,
email_cli varchar (300) not null,
telefone_cli varchar (200) not null
);

create table Conta_Corrente (
cod_cc int primary key not null,
número_cc int not null,
dataabertura_cc date not null,
saldo_cc float not null,
valorlimite_cc float not null,
taxamensal_cc float not null,
cod_ag_fk int not null,
cod_cli_fk int not null,
foreign key (cod_ag_fk) references Agência (cod_ag),
foreign key (cod_cli_fk) references Cliente (cod_cli)
);

create table Saque (
cod_saq int primary key not null,
valor_saq float not null,
data_saq date not null,
local_saq varchar (100) not null,
hora_saq time,
cod_cc_fk int not null,
foreign key (cod_cc_fk) references Conta_Corrente (cod_cc)
);

create table Transferência (
cod_trans int primary key not null,
valor_trans float not null,
data_trans date not null,
descrição_trans varchar (100),
cod_cc_origem_fk int not null,
cod_cc_destino_fk int not null,
foreign key (cod_cc_origem_fk) references Conta_Corrente (cod_cc),
foreign key (cod_cc_destino_fk) references Conta_Corrente (cod_cc)
);

create table Depósito (
cod_dep int primary key not null,
valor_dep float not null,
data_dep date not null,
tipo_dep varchar (100),
cod_cc_fk int not null,
foreign key (cod_cc_fk) references Conta_Corrente (cod_cc)
);

create table Pagamento (
cod_pag int primary key not null,
valor_pag float not null,
data_pag date not null,
tipo_pag varchar (100),
datavencimento_pag date not null,
codigobarras_pag varchar (300),
cod_cc_fk int not null,
foreign key (cod_cc_fk) references Conta_Corrente (cod_cc)
);