create database Herois;
use Herois;


create table Origem (
cod_ori int primary key not null,
nome_ori varchar (200) not null
);

insert into Origem values (1, 'Marvel');
insert into Origem values (2, 'DC Comics');
insert into Origem values (3, 'TV');
insert into Origem values (4, 'Internet');

create table Heroi (
cod_hero int primary key not null,
nome_hero varchar (200) not null,
arma_hero varchar (100),
cod_ori_fk int,
foreign key (cod_ori_fk) references Origem (cod_ori)
);

insert into heroi values (1, 'Capitão America', 'Escudo', 1);
insert into heroi values (2, 'Homem de Ferro', 'Armadura', 1);
insert into heroi (cod_hero, nome_hero) values (3, 'Huck');
insert into heroi (cod_hero, nome_hero, cod_ori_fk) values (4, 'Power Rangers', 3);
insert into heroi (cod_hero, nome_hero) values (5, 'Big Hero');
insert into heroi values (6, 'Homem-Aranha', 'Teia', 1);
insert into heroi values (7, 'Super Homem', 'Força', 2);
insert into heroi values (8, 'Batman', 'Dinheiro', 2);
insert into heroi values (9, 'Seya de Pegasus', 'Cosmo', 3);


#==============================================================================================

#				C R O S S   J O I N

# Mostra um cruzamento de todos os registros da tabela
SELECT
origem.nome_ori as 'Origem',
heroi.nome_hero as 'Nome Heroi'
FROM
origem CROSS JOIN heroi;

# 				I N N E R   J O I N

# Mostra os valores vinculados através da chave estrangeira (cod_ori). Os registros não vinculados SÃO DESCARTADOS.
select
origem.nome_ori as 'Origem', 
heroi.nome_hero as 'Nome Heroi'
from 
origem inner JOIN heroi
on 
(origem.cod_ori = heroi.cod_ori_fk) order by origem;


# 				L E F T   J O I N
# busca tudo que esta na tabela da esquerda da comparação (join) e vincula com a tabela direita (join) inclusive os registros sem relação;
select
origem.nome_ori as 'Origem', 
heroi.nome_hero as 'Nome Heroi'
from 
origem left JOIN heroi
on 
(origem.cod_ori = heroi.cod_ori_fk) order by origem;


# 				R I G H T   J O I N
# busca tudo que esta na tabela da direita da comparação (join) e vincula com a tabela esquerda(join) inclusive os registros sem relação;
select
origem.nome_ori as 'Origem', 
heroi.nome_hero as 'Nome Heroi'
from 
origem right JOIN heroi
on 
(origem.cod_ori = heroi.cod_ori_fk) order by origem;



#				U N I O N   A L L

select 
origem.nome_ori as 'Origem',
heroi.nome_hero as 'Nome Heroi'
from 
origem left join heroi
on (origem.cod_ori = heroi.cod_ori_fk)
union all
select 
origem.nome_ori as 'Origem',
heroi.nome_hero as 'Nome Heroi'
from 
origem right join heroi
on (origem.cod_ori = heroi.cod_ori_fk);




