create database SuperMercadoVendeMais;

use SuperMercadoVendeMais;

create table Cliente(
id_cli INTEGER PRIMARY KEY AUTO_INCREMENT,
nome_cli varchar(100) not null,
endereco_cli varchar(100) not null,
cpf_cli varchar(15) not null
); 

create table Caixa(
id_cai INTEGER PRIMARY KEY AUTO_INCREMENT,
saldo_inicial_cai float,
total_recebimentos_cai float,
total_retiradas_cai float,
saldo_final float
);

create table Despesa(
id_des INTEGER PRIMARY KEY AUTO_INCREMENT,
nome_des varchar(100),
valor_des float
);

create table Fornecedor(
id_for INTEGER PRIMARY KEY AUTO_INCREMENT,
nome_for varchar(100),
cnpj_for varchar(25)
);

create table Setor(
id_set INTEGER PRIMARY KEY AUTO_INCREMENT,
nome_set varchar(100)
);

create table Funcionario(
id_fun INTEGER PRIMARY KEY AUTO_INCREMENT,
nome_fun varchar(100),
funcao_fun varchar(100),
id_set_fk integer,
foreign key (id_set_fk) references Setor (id_set)
);

create table Pagamento(
id_pag INTEGER PRIMARY KEY AUTO_INCREMENT,
tipo_pag varchar(100),
data_pag datetime,
id_cai_fk integer,
id_des_fk integer,
foreign key (id_cai_fk) references Caixa (id_cai),
foreign key (id_des_fk) references Despesa (id_des)
);

create table Compra(
id_com INTEGER PRIMARY KEY AUTO_INCREMENT,
valor_com float,
data_com date,
id_for_fk integer,
id_fun_fk integer,
id_des_fk integer,
foreign key (id_for_fk) references Fornecedor (id_for),
foreign key (id_fun_fk) references Funcionario (id_fun),
foreign key (id_des_fk) references Despesa (id_des)
);

create table Produto(
id_pro INTEGER PRIMARY KEY AUTO_INCREMENT,
nome_pro varchar(100),
valor_pro float,
estoque integer
);

create table Compra_Produto(
id_com_pro integer primary key auto_increment,
id_pro_fk integer,
foreign key (id_pro_fk) references Produto(id_pro),
id_com_fk integer,
foreign key (id_com_fk) references Compra (id_com)
);

create table Venda(
id_ven INTEGER PRIMARY KEY AUTO_INCREMENT,
valor_ven float,
data_ven datetime,
id_fun_fk integer,
id_cli_fk integer,
foreign key (id_fun_fk) references Funcionario (id_fun),
foreign key (id_cli_fk) references Cliente (id_cli)
);

create table Venda_Produto(
id_ven_pro integer primary key auto_increment,
id_ven_fk integer,
foreign key (id_ven_fk) references Venda(id_ven),
id_pro_fk integer,
foreign key (id_pro_fk) references Produto (id_pro)
);

create table Entrega(
id_entr INTEGER PRIMARY KEY AUTO_INCREMENT,
data_entr date,
endereco_alternativo_entr varchar(150),
hora_entr time,
id_ven_fk integer,
foreign key (id_ven_fk) references Venda (id_ven)
);

create table Recebimento(
id_rec INTEGER primary KEY auto_increment,
tipo_rec varchar(100),
data_rec datetime,
id_cai_fk integer,
id_ven_fk integer,
foreign key (id_cai_fk) references Caixa (id_cai),
foreign key (id_ven_fk) references Venda (id_ven)
);