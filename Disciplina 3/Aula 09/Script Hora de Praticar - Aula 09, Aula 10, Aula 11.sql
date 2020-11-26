drop database pratica3;

create database pratica3;
use pratica3;

create table cliente(
id_cli int primary key auto_increment,
nome_cli varchar(100),
idade_cli int,
renda_cli float,
data_nasc_cli date
);

insert into cliente values
(1, 'José da Silva', 33, 1500.50, '1987-01-30'),
(2, 'Ana Maria', 30, 2500.00, '1990-02-20'),
(3, 'Gustavo Silva', 20, 6000.00, '2000-01-31'),
(4, 'Marcos Pereira', 27, 1020.00, '1993-06-21'),
(5, 'Thiago Souza', 33, 5000.00, '1987-06-30');


#====================	AULA 09		===============================
#-----------HORA DE PRATICA 2----------------

# Altere o nome do cliente nº 3 para ‘Gustavo H. Silva’.
update cliente set nome_cli = 'Gustavo H. Silva' where (id_cli = 3);
select * from cliente;

# Aumente em 1000 reais a renda dos clientes com mais de 30 anos.
update cliente set renda_cli = renda_cli + 1000.00 where (idade_cli > 30);
select * from cliente;

# Aumente a renda dos clientes em 10%.
update cliente set renda_cli = renda_cli * 1.1;
select * from cliente;

# Crie um update que mude o nome do cliente nº 5 para ‘Lucas Matos’;
update cliente set nome_cli = 'Lucas Matos' where (id_cli = 5);
select * from cliente;

# Crie um update que aumentar a renda em 20% dos clientes ascidos antes do ano 2000;
update cliente set renda_cli = renda_cli * 1.2 where (data_nasc_cli < '2000-01-01');
select * from cliente;

# Crie um update para diminuir a renda em 27% dos clientes com renda maior ou igual a 5000 reais;
update cliente set renda_cli = renda_cli - (renda_cli * 0.27) where (renda_cli >= 5000);
select * from cliente;


# Crie um update para alterar a idade do cliente nº 2 para 40 anos.
update cliente set idade_cli = 40 where (id_cli = 2);
select * from cliente;

#==============================================================================

#-----------------HORA DE PRATICAR 3------------------
# Considerando a tabela Cliente novamente é preciso aumentar em 20% a renda dos cliente com idade entre 20 e 30 anos.
update cliente set renda_cli = renda_cli * 1.2 where (idade_cli >= 20) and (idade_cli <= 30);
select * from cliente;

# Aumentar em 20% a renda dos cliente com idade entre 20 e 30 anos e com renda menor do que 6 mil reais;
update cliente set renda_cli = renda_cli * 1.2 where (idade_cli >= 20) and (idade_cli <= 30) and (renda_cli < 6000);
select * from cliente;

# Aumentar em 80% a renda dos cliente com idade menor que 30 anos ou maior do que 50 anos, e nascidos após o ano 2000;
update cliente set renda_cli = renda_cli * 1.8 where ((idade_cli < 30) or (idade_cli > 50)) and (data_nasc_cli > '2000-01-01');
select * from cliente;	

# Altere para 50 a idade dos clientes com ID entre 2 e 5 ou nascidos entre 1970 e 1980;
update cliente set idade_cli = 50 where ((id_cli > 2) and (id_cli < 5)) or ((data_nasc_cli > '1970-01-01') and(data_nasc_cli < '1980-01-01'));
select * from cliente;
 

# Diminua 500 reais na renda dos clientes nascidos entre 1980 e 2000 que tenha renda superior a 1000 reais e idade menos que 50;
update cliente set renda_cli = renda_cli - 500.00 
where 
((data_nasc_cli >= '1980-01-01') and (data_nasc_cli <= '2000-01-01')) 
and (renda_cli > 1000) and (idade_cli < 50);
select * from cliente;

# Aumente 1000 reais na renda dos clientes com idade entre 10 e 20 anos ou 40 e 60 anos.
update cliente set renda_cli = renda_cli + 1000.00 where ((idade_cli >= 10) and (idade_cli <= 20)) or ((idade_cli >= 40) and (idade_cli <= 60));



#==================================AULA 10=========================================


#----------------HORA DE PRATICAR 1-----------------

#			Comando BETWEEN
# exclua os cliente com idade entre 30 e 40
delete from cliente where (idade_cli between 30 and 40);
select * from cliente;

# exclua os clientes com idade entre 30 e 40 e renda entre 500 e 2000 reais
delete from cliente where (idade_cli between 30 and 40) and (renda_cli between 500 and 2000);
select * from cliente;

#			Comando LIKE
# Exclua os clientes com sobrenome Silva
delete from cliente where (nome_cli LIKE '%Silva%');
select * from cliente;

# Exclua os clientes que nasceram em 1990.
delete from cliente where (data_nasc_cli LIKE '1990%');

# Exclua o cliente com o nome Jose da Silva. Porém garante que os nomes acentuados também sejam excluídos.
delete from cliente where (nome_cli like 'Jos_ da Silva'); 
select * from cliente;

# Exclua os clientes com renda entre 500 e 2000 e nascidos em 1987.
delete  from cliente where (renda_cli between 500 and 2000) and (data_nasc_cli like '1987%');
select * from cliente;

# Exclua os clientes com sobrenome Pereira ou Souza e que possuam idade entre 20 e 30 anos;
delete from cliente where ((nome_cli like '%Pereira%') or (nome_cli like '%Souza%')) and (idade_cli between 20 and 30);
select * from cliente;

# Exclua os clientes com idade entre 10 e 60 anos e com renda entre 1000 e 10000 e nascidos em 2000;
select * from cliente where (idade_cli between 10 and 60) and (renda_cli between 1000 and 10000) and (data_nasc_cli LIKE '2000%');
select * from cliente;


#=======================	Aula 11		============================

# -------------------Uso do select com opções----------------------
# Selecione o id, o nome e a renda dos clientes com renda superior a 1600 reais;
select id_cli, nome_cli, renda_cli from cliente where (renda_cli > 1600);

# Selecione os clientes com renda superior a 1600 reais;
select * from cliente where (renda_cli > 1600);

# Selecione os clientes com renda maior do que 1000 e ordenados pelo nome;
select * from cliente where (renda_cli > 1000) order by nome_cli;

#Selecione os clientes com renda maior do que 1000 e ordenados pelo nome de forma decrescente;
select * from cliente where (renda_cli > 1000) order by nome_cli desc;

# Selecione o id, nome e renda dos clientes que não possuem renda, ou seja, que estão nulas
update cliente set renda_cli = null where (id_cli = 5);
select id_cli, nome_cli, renda_cli from cliente where (renda_cli is null);
select id_cli, nome_cli, renda_cli from cliente where (renda_cli is not null);


#-------------------Uso do select com funções-----------------------
# Selecione e mostre quantos clientes estão armazenados no banco de dados.
select count(id_cli) from cliente;

#Selecione e mostre a soma das rendas de todos os clientes armazenados no banco de dados.
select sum(renda_cli) from cliente;

# Selecione e mostre a idade média dos clientes armazenados no banco de dados.
select avg(idade_cli) from cliente;

# Selecione e mostre a maior renda entre os clientes armazenados no banco de dados.
select max(renda_cli), nome_cli from cliente;

#Selecione e mostre a menor renda entre os clientes armazenados no banco de dados.
select min(renda_cli), nome_cli from cliente;

# -----------------HORA DE PRATICAR ------------------
# Selecione o nome e data de nascimento dos clientes nascidos entre 1980 e 2000 ordenados pelo nome;
select nome_cli, data_nasc_cli from cliente where (data_nasc_cli between '1980-01-01' and '2000-01-01') order by nome_cli;

# Selecione os clientes com idade entre 10 e 50 e que possuem nome não nulo ordenados pelo nome de forma decrescente;
select * from cliente where (idade_cli between 10 and 50) and (nome_cli is not null) order by nome_cli desc;

# Selecione e mostre a maior idade entre os clientes armazenados;
select max(idade_cli) from cliente;

# Selecione e mostre a menor renda entre os clientes armazenados;
select min(renda_cli) from cliente;

# Selecione e mostre a soma das idades dos clientes armazenados;
select sum(idade_cli) from cliente;

# Selecione e mostre a renda média dos clientes armazenados;
select avg(renda_cli) from cliente;

