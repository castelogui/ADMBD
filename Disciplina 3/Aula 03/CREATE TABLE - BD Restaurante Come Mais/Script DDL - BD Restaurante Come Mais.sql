create database Restaurante_Come_Mais;

use Restaurante_Come_Mais;

create table Funcionario(
id_fun integer primary key auto_increment,
nome_fun varchar(100),
funcao_fun varchar(50)
);

alter table Funcionario add cpf_fun varchar(15);

desc funcionario;

create table Caixa(
id_cai integer primary key auto_increment,
saldo_inicial_cai float,
total_recebimentos_cai float,
saldo_final_cai float,
data_cai date
);

create table Mesa(
id_mes integer primary key auto_increment,
status_mes varchar(20),
numero_mes integer
);

create table Fornecedor(
id_for integer primary key auto_increment,
nome_for varchar(100),
cnpj_for varchar(20)
);

create table Cliente(
id_cli integer primary key auto_increment,
nome_cli varchar(100),
cpf_cli varchar(15)
);

create table Compra(
id_com integer primary key auto_increment,
valor_com float,
id_fun_fk integer,
id_for_fk integer,
foreign key (id_fun_fk) references Funcionario(id_fun),
foreign key (id_for_fk) references Fornecedor(id_for)
);

create table Produto(
id_pro integer primary key auto_increment,
valor_pro float,
estoque_pro int,
nome_pro varchar(100)
);

create table Compra_Produto(
id_com_pro integer primary key auto_increment,
id_com_fk integer,
id_pro_fk integer,
foreign key (id_com_fk) references Compra (id_com),
foreign key (id_pro_fk) references Produto (id_pro)
);

create table Pedido(
id_ped integer primary key auto_increment,
hora_ped time,
valor_ped float,
id_mes_fk integer,
foreign key (id_mes_fk) references Mesa(id_mes),
id_fun_fk integer,
foreign key(id_fun_fk) references Funcionario(id_fun)
);

create table Produto_Pedido(
id_pro_ped integer primary key auto_increment,
id_pro_fk integer,
id_ped_fk integer,
foreign key(id_pro_fk) references Produto(id_pro),
foreign key(id_ped_fk) references Pedido(id_ped)
);

create table Venda(
id_ven integer primary key auto_increment,
valor_ven float,
id_fun_fk int,
id_cli_fk int,
id_ped_fk int,
foreign key (id_fun_fk) references Funcionario(id_fun),
foreign key (id_cli_fk) references Cliente(id_cli),
foreign key (id_ped_fk) references Pedido(id_ped)
);

create table Venda_Produto(
id_ven_pro integer primary key auto_increment,
id_ven_fk int,
id_pro_fk int,
foreign key (id_ven_fk)references Venda(id_ven),
foreign key (id_pro_fk)references Produto(id_pro)
);

create table Refeicao(
id_ref integer primary key auto_increment,
kilo_ref float,
id_ven_fk int,
foreign key (id_ven_fk)references Venda(id_ven)
);

create table Pedido_Refeicao(
id_ped_ref integer primary key auto_increment,
id_ped_fk int,
id_ref_fk int,
foreign key (id_ped_fk) references Pedido(id_ped),
foreign key (id_ref_fk) references Refeicao(id_ref)
);

create table Recebimento(
id_rec integer primary key auto_increment,
valor_rec float,
id_ven_fk int,
id_cai_fk int,
foreign key (id_ven_fk)references Venda(id_ven),
foreign key (id_cai_fk)references Caixa(id_cai)
);
