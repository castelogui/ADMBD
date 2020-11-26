create database Dentista_Do_Povo;

use Dentista_Do_Povo;

create table Paciente(
id_pac integer primary key auto_increment,
nome_pac varchar(100),
cpf_pac varchar(15),
telefone_pac varchar(12),
email_pac varchar(50)
);

create table Dentista(
id_den integer primary key auto_increment,
nome_den varchar(100),
cpf_den varchar(15),
especialidade_den varchar(50)
);

create table Agenda(
id_age integer primary key auto_increment,
data_age date,
hora_age time,
tipo_age varchar(50),
id_pac_fk integer,
id_den_fk integer,
foreign key (id_pac_fk) references Paciente (id_pac),
foreign key (id_den_fk) references Dentista (id_den)
);

create table Consulta(
id_con integer primary key auto_increment,
valor_con float,
data_con date,
id_pac_fk integer,
id_den_fk integer,
foreign key (id_pac_fk) references Paciente (id_pac),
foreign key (id_den_fk) references Dentista (id_den)
);

create table Procedimento(
id_pro integer primary key auto_increment,
nome_pro varchar(100),
materiais_pro varchar(100),
valor_pro float
);

create table Consulta_Procedimento(
id_con_pro integer primary key auto_increment,
id_con_fk integer,
id_pro_fk integer,
foreign key (id_con_fk) references Consulta (id_con),
foreign key (id_pro_fk) references Procedimento (id_pro)
);

create table Recebimento(
id_rec integer primary key auto_increment,
data_rec date,
tipo_rec varchar(100),
valor_rec float,
id_con_fk integer,
foreign key (id_con_fk) references Consulta(id_con)
);

