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

#EXERCÍCIOS
#1. Adicione o atributo local_sede_ban na tabela Banco.
alter table banco add local_sede_ban varchar(50);
describe banco;

#2. Adicione o atributo cnpj_ban na tabela Banco, antes do atributo local_sede_ban.
alter table  banco add cnpj_ban varchar(20) after nome_ban;
desc banco;

#3. Adicione o atributo endereco_ag na tabela Agencia, depois do atributo telefone_ag.
alter table agência add endereco_ag varchar(100) after telefone_ag;
desc agência;

#4. Adicione o atributo numero_cartao_cc na tabela Conta_Corrente antes do atributo dataabertura_cc.
desc conta_corrente;
alter table Conta_Corrente add numero_cartao_cc varchar(16) after número_cc;

#5. Adicione o atributo hora_dep na tabela Depósito, após o atributo data_dep.
desc depósito;
alter table depósito add hora_dep time after data_dep;

#6. Altero o nome do atributo número_ag para numero_ag, na tabela Agência.
desc agência;
alter table agência change número_ag numero_ag varchar(100) not null;

#7. Altere o nome do telefone_ag para contato_ag, na tabela Agencia.
desc agência;
alter table agência change telefone_ag contato_ag varchar(100);

#8. Altere o nome do atributo endereço_cli para endereco_cli na tabela Cliente.
desc cliente;
alter table cliente change endereço_cli endereco_cli varchar(300) not null;

#9. Altere o tipo de dado do atributo renda_cli para double.
alter table cliente change renda_cli renda_cli double not null;

#10. Altere o tipo do dado do atributo data_saq para varchar na tabela Saque.
desc saque;
alter table saque change data_saq data_saq varchar(10) not null;

#11. Altere o tipo de dado do atributo saldo_cc para double na tabela Conta_Corrente.
desc conta_corrente;
alter table conta_corrente change saldo_cc saldo_cc double not null;

#12. Apague o atributo local_sede_ban na tabela Banco.
desc banco;
alter table banco drop local_sede_ban;

#13. Apague o atributo cnpj_ban na tabela Banco.
alter table banco drop cnpj_ban;

#14. Apague o atributo endereco_ag na tabela Agencia.
desc agência;
alter table agência drop endereco_ag;

#15. Apague o atributo numero_cartao_cc na tabela Conta_Corrente.
desc conta_corrente;
alter table conta_corrente drop numero_cartao_cc;

#16. Apague o atributo hora_dep na tabela Depósito.
desc depósito;
alter table depósito drop hora_dep;

#17. Apague a tabela Depósito.
drop table depósito;

#18. Apague a tabela Saque.
drop table Saque;

#19. Apague a tabela Pagamento.
drop table pagamento;

#20. Apague a tabela Transferência.
drop table transferência;
