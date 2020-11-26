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
sexo_cli varchar (1),
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


#--------------EXERCICIOS-------------------------

#	1. Adicione 03 registros na tabela Banco.
desc banco;
insert into banco (cod_ban, nome_ban) values(1, 'Banco de dinheiro vivo');
insert into banco (cod_ban, nome_ban) values(2, 'Banco de criptomoeda');
insert into banco values(3, 'Banco digital flor');
select * from banco;

#	2. Adicione 03 registros na tabela Agência.
desc agência;
insert into agência values(1, '321', 'Agencia 321', '321321321', 1);
insert into agência values(2, '123', 'Agencia 123', '123123123', 3);
insert into agência (cod_ag, número_ag, nome_ag, cod_ban_fk)values(3, '456', 'Terceira agencia', 2);
select * from agência;

#	3. Adicione 05 registros na tabela Cliente.
desc cliente;
insert into cliente values (1, 'Suely de Lima', '432.453.655-31','3242-43','F', '1987-12-09', 1500.55, 'Rua dos palmares, 3454 setor 6', 'sueli@gmail.com', '69 23424-3242');
insert into cliente values (2,'Gustavo Souza', '543.654.123-65','00323-76','M', '2007-05-13', 1897.00, 'Rua três setor 9 numero 4332', 'gustavo@gmail.com', '69 98234-34726');
insert into cliente values (3, 'Alice Castelo', '765.657.123-90','010223-65','F', '1990-01-19', 2540.90, 'Alameda IPÊ Setor dos palmares numero 456', 'alice@hotmail.com', '49 8765-4332');
insert into cliente values (4, 'Evandro Pereira', '003.032.650-22','000342-34','M', '1960-03-18', 5890.67, 'Avenida 43,  numero 6554, setor idustrial', 'evandro@outlook.com', '78 43234-324');
insert into cliente values (5, 'Maria José Castelo', '432.123.322-18','433334-89','F', '1948-06-08', 1830.72, 'Rua Dos anjos, setor 40, numero 4321', 'masécastelo@hotmail.com', '69 23112-2332');
select *from cliente;

#	4. Adicione 05 registros na tabela Conta_Corrente, ou seja, uma corrente corrente para cada cliente inserido anteriormente.
desc Conta_Corrente;
insert into conta_corrente values(1, 3456-34, '2020-10-12', 1400, 20000, 10.20, 1, 1);
insert into conta_corrente values(2, 54312-23, '2019-12-16', 600, 10000, 4.34, 1, 2);
insert into conta_corrente values(3, 76452-12, '2010-09-13', 5400, 30500, 50.45, 3, 4);
insert into conta_corrente values(4, 00321-10, '2017-01-20', 2440, 20600, 14.20, 2, 5);
insert into conta_corrente values(5, 874378-87, '2010-04-09', 6280, 13600, 28.20, 3, 3);
select * from conta_corrente;

#	5. Adicione 03 registros na tabela Saque, para clientes aleatórios, você decide.
desc saque;
insert into saque (cod_saq, valor_saq, data_saq, local_saq, cod_cc_fk) values(1, 50.00, '2020-10-20', 'Agencia avenida 53 Ariquemes RO', 1);
insert into saque values(2, 25.00, '2020-07-02', 'Agencia 5 da quinta rua do 2 Jaru RO', '10:53', 4);
insert into saque values(3, 170.00, '2020-08-13', 'Agencia Banco Seguro setima rua setor das palmeiras Ji-Paraná RO', '21:08', 2);
select * from saque;

#	6. Adicione 03 registros na tabela Depósito, para clientes aleatórios, você decide.
desc depósito;
insert into depósito values(1, 234.00, '2020-08-18', 'Deposito em conta corrente', 3);
insert into depósito values(2, 36.50, '2020-05-07', 'Deposito em conta corrente', 5);
insert into depósito values(3, 528.00, '2019-02-25', 'Deposito em conta corrente', 2);
select * from depósito;

#	7. Adicione 03 registros na tabela Pagamento, para clientes aleatórios, você decide.
desc pagamento;
insert into pagamento values(1, 350, '2020-11-22', 'Pagemento credito em conta', '2020-12-21', '78932426500432', 3);
insert into pagamento values(2, 1260, '2020-01-03', 'Pagemento depósito em conta poupança', '2020-02-04', '63782358990001', 1);
insert into pagamento values(3, 643.90, '2020-11-01', 'Débito em conta corrente', '2021-01-02', '876524678000322', 5);
select * from pagamento;

#	8. Adicione 03 registros na tabela Transferência, para clientes aleatórios, você decide.
desc transferência;
insert into transferência values (1, 150.30, '2020-08-02', 'Tranferencia de pagamento de serviços', 1, 5);
insert into transferência values (2, 300.56, '2020-02-23', 'Tranferencia de débito', 4, 2);
insert into transferência values (3, 235.49, '2020-06-12', 'Tranferencia prestação de contas', 4, 3);
select * from transferência;
