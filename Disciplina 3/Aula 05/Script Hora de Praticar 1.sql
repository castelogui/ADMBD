
use pratica1;


#--------EXERCICIOS AULA 05------------- 
#	1. Adicione o atributo RG na tabela Cliente;
alter table Cliente add rg_cli varchar(15);
desc cliente;
#	2. Adicione o atributo TELEFONE na tabela Cliente;
alter table Cliente add telefone_cli varchar(16);
desc cliente;
#	3. Adicione o atributo REFERENCIA na tabela Endereco;
desc endereco;
alter table endereco add referencia varchar(100);
alter table endereco change referencia referencia_end varchar(100);
#	4. Exclua o atributo CONTINENTE na tabela Pais;
desc pais;
alter table pais drop continente;
#	5. Altere o nome do atributo SEXO para GENERO;
desc cliente;
alter table cliente change sexo genero varchar(20);
alter table cliente change genero genero_cli varchar(20);
#	6. Altere o tipo de dados do atributo DATA_NASC de DATE para VARCHAR em Cliente;
alter table cliente change data_nasc_cli data_nasc_cli varchar(10);
desc cliente;

	# adicionando atributo continente em país
	alter table pais add continente varchar(100);
	
	# adicionando chaves estrangeiras na tabela estado
	alter table estado add id_pais_fk integer;
	alter table estado add foreign key (id_pais_fk)references pais (id_pais);

	#adicionando chave estrangeira na tabela cidade
	alter table cidade add id_est_fk int;
	alter table cidade add foreign key (id_est_fk) references estado(id_est);
	
	# adicionando chave estrangeira em endereco
	alter table endereco add id_cid_fk int;
	alter table endereco add foreign key (id_cid_fk) references cidade (id_cid);
	
	desc endereco;
	#adicionando chave estrangeira em cliente
	alter table cliente add id_end_fk int;
	alter table cliente add foreign key (id_end_fk) references endereco(id_end); 

#	7. Crie uma a sequencia de comandos para excluir todas as tabelas, seguindo a lógica de dependência entre as tabelas
drop table cliente; 
drop table endereco; 
drop table cidade; 
drop table estado; 
drop table pais;  