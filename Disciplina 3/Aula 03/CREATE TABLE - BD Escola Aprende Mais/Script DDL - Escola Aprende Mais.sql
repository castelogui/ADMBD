create database EscolaAprendeMais;

use EscolaAprendeMais;

create table Escola(
id_esc INTEGER PRIMARY KEY AUTO_INCREMENT,
nome_esc varchar(100),
endereco_esc varchar(100)
);

create table Funcionario(
id_fun INTEGER PRIMARY KEY AUTO_INCREMENT,
nome_fun varchar(100),
cpf_fun varchar(15),
funcao_fun varchar(100),
id_esc_fk integer,
foreign key (id_esc_fk) references Escola(id_esc)
);

create table Diario(
id_dia INTEGER PRIMARY KEY AUTO_INCREMENT
);

create table Aula(
id_aul INTEGER PRIMARY KEY AUTO_INCREMENT,
conteudo_aul varchar(200),
data_aul date,
id_dia_fk integer,
foreign key (id_dia_fk) references Diario (id_dia)
);

create table Aluno(
id_alu INTEGER PRIMARY KEY AUTO_INCREMENT,
nome_alu varchar(100),
cpf_alu varchar(15),
endereco_alu varchar(100)
);

create table Presenca(
id_pre INTEGER PRIMARY KEY AUTO_INCREMENT,
ausente_pre boolean,
presente_pre boolean,
id_aul_fk integer,
id_alu_fk integer,
foreign key (id_aul_fk) references Aula(id_aul),
foreign key (id_alu_fk) references Aluno(id_alu)
);

create table Nota(
id_not INTEGER PRIMARY KEY AUTO_INCREMENT,
etapa1_not float,
etapa2_not float,
id_dia_fk integer,
id_alu_fk integer,
foreign key (id_dia_fk) references Diario(id_dia),
foreign key (id_alu_fk) references Aluno(id_alu)
);

create table Curso(
id_cur INTEGER PRIMARY KEY AUTO_INCREMENT,
nome_cur varchar(100),
objetivo_cur varchar(250),
perfil_egresso_cur varchar(200)
);

create table Disciplina(
id_dis INTEGER PRIMARY KEY AUTO_INCREMENT,
nome_dis varchar(100),
objetivo_dis varchar(250),
conteudos_dis varchar(300),
bibliografia_dis varchar(350),
id_cur_fk integer,
foreign key (id_cur_fk) references Curso(id_cur)
);

create table Matricula(
id_mat INTEGER PRIMARY KEY AUTO_INCREMENT,
numero_mat varchar(10),
id_alu_fk integer,
id_dis_fk integer,
id_fun_fk integer,
foreign key(id_alu_fk) references Aluno(id_alu),
foreign key(id_dis_fk) references Disciplina(id_dis),
foreign key(id_fun_fk) references Funcionario(id_fun)
);

create table Turma(
id_tur INTEGER PRIMARY KEY AUTO_INCREMENT,
nome_tur varchar(100)
);

create table Matricua_Turma(
id_mat_tur integer primary key auto_increment,
id_mat_fk integer,
foreign key(id_mat_fk) references Matricula(id_mat),
id_tur_fk integer,
foreign key(id_tur_fk) references Turma(id_tur)
);