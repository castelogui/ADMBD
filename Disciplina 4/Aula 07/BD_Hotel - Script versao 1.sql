drop database bd_hotel;

create database bd_hotel;
use bd_hotel;


create table Endereco (
cod_end integer not null primary key auto_increment,
rua_end varchar (300),
numero_end integer,
bairro_end varchar (100),
cidade_end varchar (100),
estado_end varchar (100)
); 

insert into Endereco values (null, 'Av. Brasil', 111, 'Nova Brasília', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (null, 'Av. Marechal Rondon', 1245, 'Centro', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (null, 'Rua Dr. Telma Rios', 1174, 'Colina Park I', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (null, 'Av. Aracaju', 911, 'BNH', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (null, 'Rua 07 de Setembro', 121, 'Dom Bosco', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (null, 'Rua Mato Grosso', 887, 'Jardim dos Migrantes', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (null, 'Av. Jorge Teixeira', 1589, 'Centro', 'Porto Velho', 'Rondônia');
insert into Endereco values (null, 'Av. Paulista', 989, 'Centro', 'São Paulo', 'São Paulo');
insert into Endereco values (null, 'Travessa dos Mineiros', 456, 'Centro', 'Ariquemes', 'Rondônia');
insert into Endereco values (null, 'Av. Monte Castelo', 555, 'Jardim dos Migrantes', 'Ji-Paraná', 'Rondônia');


create table Cliente (
cod_cli integer not null primary key auto_increment,
nome_cli varchar (200) not null,
estadocivil_cli varchar (50),
cpf_cli varchar (20) not null,
rg_cli varchar (30),
sexo_cli varchar (30),
datanasc_cli date,
rendafamiliar_cli double,
telefone_cli varchar (50) not null,
celular_cli varchar (50) not null,
cod_end integer not null,
foreign key (cod_end) references Endereco (cod_end)
);

insert into cliente values (null, 'Jackson Henrique da Silva Bezerra', 'Casado', '111.111.111-11', '54654 sesdec', 'Masculino', '1987-06-30', 
10000.00, '69 84085712', '69 84111111', 3);
insert into cliente values (null, 'Tony Stark', 'Casado', '111.111.111-22', '54654 sesdec', 'Masculino', '1965-1-1', 
456454.45, '', '', 8);
insert into cliente values (null, 'Capitão América', 'Solteiro', '111.111.111-33', '48877 sesdec', 'Masculino', '1950-05-30', 
0.00, '11 454546511', '', 1);
insert into cliente values (null, 'José Pereira da Silva', 'Casado', '222.222.222-88', '8888888 spp', 'Masculino', '1990-11-12', 
900.00, '69 88998899', '69 4444 4444', 4);
insert into cliente values (null, 'Maria de Jesus dos Santos', 'Solteira', '554.454.444-99', '99999 sesdec', 'Feminino', '1993-06-21', 
3000.00, '69 3421 5511', '69 99111111', 3);
insert into cliente values (null, 'Camila de Oliveira', 'Casada', '987.123.654-55', '8889999 sesdec', 'Feminino', '2000-12-12', 
5450.00, '69 3421 1122', '69 9999 7788', 10);
insert into cliente values (null, 'Marcos Araujo de Souza', 'Casado', '654.789.123-88', '998877 sesdec', 'Masculino', '1970-01-01', 
6845.00, '69 84085712', '69 84111111', 9);
insert into cliente values (null, 'Cleiton Batista Ferraz', 'Solteiro', '321.111.222-44', '1234312 sesdec', 'Masculino', '1982-07-30', 
4199.00, '69 3421 2211', '69 84118811', 2);
insert into cliente values (null, 'Eliana da Cruz', 'Solteira', '988.235.654-54', '12345 sesdec', 'Feminino', '1978-11-11', 
3250.00, '69 3421 9999', '69 84118811', 5);
insert into cliente values (null, 'Igor Garcia da Silva', 'Solteiro', '123.445.888-99', '999992 sesdec', 'Masculino', '1989-12-30', 
9600.00, '69 3421 1123', '69 84118811', 3);


create table Funcionario (
cod_func integer not null primary key auto_increment,
nome_func varchar (200) not null,
cpf_func varchar (20) not null,
rg_func varchar (20),
sexo_func varchar (30),
datanasc_func date,
salário_func double not null,
telefone_func varchar (50),
celular_func varchar (50) not null,
função_func varchar (50) not null,
cod_end integer not null,
foreign key (cod_end) references Endereco (cod_end)
);

insert into funcionario values (null, 'João Eujacio Teixeira', '123.544.311-99', '22222 sesdec', 'Masculino', '1988-10-30', 
5000.00, '', '69 84111155', 'Atendente', 2);
insert into funcionario values (null, 'Paula Fernandes', '565.888.988-88', '64444 sesdec', 'Feminino', '1965-1-20', 
45000.00, '', '', 'Atendente', 1);
insert into funcionario values (null, 'Roberto Carlos', '998.999.789-55', '46666 sesdec', 'Masculino', '1990-05-23', 
1500.00, '11 454546511', '', 'Gerente', 5);


create table Produto (
cod_prod int primary key not null auto_increment,
descrição_prod varchar (200) not null,
quantidade_prod int,
valor_prod float,
dataValidade_prod date
);

insert into produto values (null, 'Agua Mineral Sem Gás 500ml', 50, 3.50, '2020-01-01');
insert into produto values (null, 'Chocolate em Barra 200gr', 30, 4.80, '2018-06-30');
insert into produto values (null, 'Cerveja Skol 350ml', 10, 4.50, '2019-01-01');
insert into produto values (null, 'Vinho Tinto 700ml', 10, 50.50, '2019-01-01');

create table Quarto (
cod_qua int primary key not null auto_increment,
descrição_qua varchar (200) not null,
número_qua int not null,
tipo_qua varchar (100) not null,
valor_qua float
);

insert into quarto values (null, 'Apartamento Duplo', 100, 'Luxo', 200.00);
insert into quarto values (null, 'Apartamento Duplo', 101, 'Simples', 100.00);
insert into quarto values (null, 'Apartamento Individual', 201, 'Simples', 50.00);
insert into quarto values (null, 'Apartamento Tripo', 202, 'Simples', 150.00);
insert into quarto values (null, 'Apartamento Duplo', 301, 'Luxo', 200.00);
insert into quarto values (null, 'Apartamento Duplo', 302, 'Simples', 100.00);
insert into quarto values (null, 'Apartamento Individual', 401, 'Simples', 50.00);
insert into quarto values (null, 'Apartamento Tripo', 402, 'Simples', 150.00);

create table Produtos_quarto (
cod_pq int primary key not null auto_increment,
quantidade_pq int,
dataRecarga_pq date,
cod_qua int not null,
cod_prod int not null,
foreign key (cod_qua) references quarto (cod_qua),
foreign key (cod_prod) references produto (cod_prod)
);


insert into produtos_quarto values (null, 2, '2017-03-29', 1, 1);
insert into produtos_quarto values (null, 5, '2017-03-29', 1, 2);
insert into produtos_quarto values (null, 2, '2017-03-29', 1, 3);

insert into produtos_quarto values (null, 2, '2017-03-30', 2, 1);
insert into produtos_quarto values (null, 1, '2017-03-30', 2, 3);

insert into produtos_quarto values (null, 5, '2017-03-29', 3, 1);
insert into produtos_quarto values (null, 5, '2017-03-29', 3, 2);

insert into produtos_quarto values (null, 5, '2017-03-29', 4, 2);
insert into produtos_quarto values (null, 5, '2017-03-29', 5, 4);

create table Hospedagem (
cod_hosp int primary key not null auto_increment,
dataCheckin_hosp date,
dataCheckout_hosp date,
valorConsumo_hosp float,
valorDiárias_hosp float,
valorTotal_hosp float,
cod_cli int not null,
cod_func int not null,
foreign key (cod_cli) references Cliente (cod_cli),
foreign key (cod_func) references Funcionario (cod_func)
);

insert into hospedagem values (null, '2017-03-29', '2017-03-31', 25.00, 200.00, 0.00, 1, 1);
insert into hospedagem values (null, '2017-03-29', '2017-04-01', 10.00, 100.00, 0.00, 2, 1);
insert into hospedagem values (null, '2017-03-31', '2017-04-05', 15.00, 300.00, 0.00, 10, 1);
insert into hospedagem values (null, '2018-03-29', '2018-04-30', 25.00, 200.00, 0.00, 8, 2);
insert into hospedagem values (null, '2018-03-29', '2018-05-01', 10.00, 100.00, 0.00, 9, 2);
insert into hospedagem values (null, '2018-03-31', '2018-06-05', 15.00, 300.00, 0.00, 1, 2);

create table produtos_hospedagem (
cod_ph int primary key not null auto_increment,
cod_hosp int not null,
cod_prod int not null,
quant_ph int,
valorProd_ph float,
foreign key (cod_hosp) references Hospedagem (cod_hosp),
foreign key (Cod_prod) references Produto (cod_prod)
);

insert into produtos_hospedagem values (null, 1, 1, 3, 0.00);
insert into produtos_hospedagem values (null, 1, 2, 1, 0.00);

insert into produtos_hospedagem values (null, 2, 1, 3, 0.00);
insert into produtos_hospedagem values (null, 2, 3, 3, 0.50);

insert into produtos_hospedagem values (null, 3, 2, 1, 0.00);
insert into produtos_hospedagem values (null, 3, 3, 3, 0.00);
insert into produtos_hospedagem values (null, 3, 1, 10, 0.00);


create table quartos_hospedagem (
cod_qh int primary key not null auto_increment,
cod_hosp int not null,
cod_qua int not null,
quantDiárias_ph int,
valorQuarto_ph float,
foreign key (cod_hosp) references Hospedagem (cod_hosp),
foreign key (Cod_qua) references Quarto (cod_qua)
);

insert into quartos_hospedagem values (null, 1, 2, 2, 0.00);
insert into quartos_hospedagem values (null, 2, 3, 3, 0.00);
insert into quartos_hospedagem values (null, 3, 1, 10, 0.00);
insert into quartos_hospedagem values (null, 4, 6, 5, 0.00);
insert into quartos_hospedagem values (null, 5, 5, 10, 0.00);
insert into quartos_hospedagem values (null, 6, 2, 5, 0.00);


#========================================================================================

delimiter $$
create procedure MostraProdutosQuartos(codigo int)
begin
	SELECT
	quarto.número_qua as 'Número do Quarto',
	produto.descrição_prod as 'Nome do Produto',
	produtos_quarto.quantidade_pq as 'Quantidade Disponível no Quarto'
	FROM Quarto, Produtos_quarto, Produto
	WHERE
	(quarto.cod_qua = produtos_quarto.cod_qua) AND
	(produtos_quarto.cod_prod = produto.cod_prod) AND (quarto.cod_qua = codigo);
end $$ delimiter ;


call mostraprodutosquartos(3);

#-------------------------------------

DELIMITER $$
CREATE PROCEDURE relatorioHospedagemCliente (codigo INT)
BEGIN
	SELECT
	cliente.nome_cli,
	hospedagem.*
	FROM
	Hospedagem, Cliente
	WHERE
	(cliente.cod_cli = hospedagem.cod_cli) AND (cliente.cod_cli = codigo);
END $$ DELIMITER ;

call relatoriohospedagemcliente(2);

#--------------------------------------
delimiter $$
create procedure autualizarrendacliente(renda float, codigo_cliente int)
begin
update cliente set rendafamiliar_cli = renda where (codigo_cliente = cod_cli);
select 'Cliente atualizado com sucesso!' as Confirmação;
end $$ delimiter ;

call autualizarrendacliente(500, 1);

select * from cliente where (cod_cli = 1);

#-----------------------------------------------

delimiter $$
create procedure inseririEndereoco (
	rua VARCHAR (100), 
    numero INT, 
    bairro VARCHAR (100), 
    cidade VARCHAR (100), 
    estado VARCHAR (100)
    )
begin
	insert into endereco values (null, rua, numero, bairro, cidade, estado);
    select 'Endereço inserido com sucesso' as Confirmação;
end $$ delimiter ;

call inseririEndereoco('Rua da Paz', 500, 'Centro', 'Ji-Paraná', 'RO')

#----------------------------------------------------
DELIMITER $$
CREATE PROCEDURE MostrarConsumoCliente (codigo_cli INT, OUT total DOUBLE)
BEGIN
SELECT
	SUM(
		hospedagem.valorConsumo_hosp + hospedagem.valorDiárias_hosp
	)INTO total FROM Cliente, Hospedagem
	WHERE (Cliente.cod_cli = Hospedagem.cod_cli) AND
		(Cliente.cod_cli = codigo_cli);
END $$ DELIMITER ;

CALL MostrarConsumoCliente (1, @resultado);

SELECT @resultado;

#-------------------------EXERCICIOS----------------------------------
#		1. Crie um procedimento para obter a lista de produtos disponíveis no hotel
#		com o estoque maior do que um número recebido no parâmetro de entrada;

delimiter $$
create procedure produtosDisponiveisNoHotel(quantidade int)
begin
	select
	cod_prod as Codigo,
	descrição_prod as Descricao,
	quantidade_prod as Quantidade,
	valor_prod as Valor,
	dataValidade_prod as Data_Validade
	from produto
	where (quantidade_prod > quantidade);
end $$ delimiter ;

call produtosDisponiveisNoHotel(3);

#		2. Crie um procedimento com passagem de parâmetros de entrada para
#		cadastrar um novo Produto;


delimiter $$
create procedure inserirNovoProduto(
	descricao varchar(200), 
    quant int, 
    valor float, 
    validade date
	)
begin
	insert into produto values (null, descricao, quant, valor, validade);
    select 'Produto inserido com sucesso' as Confirmação;
end $$ delimiter ;

call inserirNovoProduto('Agua Mineral Com Gás 500ml', 40, 3.90, '2021-02-01');

select * from produto;

desc produto;

#		3. Crie um procedimento que retorne por uma variável de saída o número
#		total de clientes cadastrados no sistema do hotel;

delimiter $$
create procedure totalDeClietesCadastrados(out total int)
begin
	select count(cod_cli) into total from cliente;
end $$ delimiter ;

call totalDeClietesCadastrados(@result);

select @result as 'Total de Clientes';

#		4. Crie um procedimento que atualize para mais o valor dos produtos no
#		estoque em X% (X é o parâmetro de entrada);

select * from produto;

delimiter $$
create procedure updateValorProd_PorPorcentagem(x float)
begin
	update produto set valor_prod = valor_prod + (valor_prod * (x/100));
	select 'Produtos atualizados!' as Confirmação;
end $$ delimiter ;

call updateValorProd_PorPorcentagem(1);

#		5. Crie um procedimento para somar o valor do consumo e o valor da diária
#		e atribuir ao valor total da hospedagem, receba a hospedagem como parâmetro de entrada;

select * from hospedagem;

delimiter $$
create procedure ValorTotalHospedagem(codigo int)
begin
	declare quant_de_dias int;
    declare valor_total float;
	select (dataCheckout_hosp - dataCheckin_hosp) into quant_de_dias from hospedagem where (cod_hosp = codigo);
	select ((quant_de_dias * valorDiárias_hosp) + valorConsumo_hosp) into valor_total from hospedagem where(cod_hosp = codigo);
	update hospedagem set valorTotal_hosp = valor_total where (cod_hosp = codigo);
    select 'Valor total da hospedagem atualizado com Sucesso' as Confirmação;
end $$ delimiter ;

call ValorTotalHospedagem(2);

select * from hospedagem;


#=================================================AULA 02===================================================================


delimiter $$
create procedure aumentarProduto(codigo int, preco double, percentual int)
begin
	while((select valor_prod from produto where cod_prod = codigo) < preco) do
		update produto 
			SET valor_prod = valor_prod + (valor_prod * (percentual/100)) 
            WHERE cod_prod = codigo;
		SELECT CONCAT(
			'Produto reajustado para: ', 
            (SELECT valor_prod FROM produto WHERE cod_prod = codigo)
		) AS Mensagem;
	END WHILE;
end $$ delimiter ; 

call aumentarProduto(2, 7, 5);

select * from produto;


#------------------------------Exercicios AULA 02-----------------------------------------

/*			Exercicio 01

-	Crie um procedimento que se comporte como uma calculadora. Você
	deverá receber 02 números como parâmetros de entrada. Também
	deverá receber um parâmetro de entrada que informe o tipo da
	operação (+, -, /, *);

-	Faça estruturas IF para calcular os 02 números de acordo com a
	operação (símbolo) informado pelo usuário;

-	Retorne o resultado em uma mensagem de retorno;
*/

delimiter $$
create procedure calculadora(n1 float, sinal varchar(1), n2 float)
begin
	declare resultado float;
	if (sinal <> '+') and (sinal <> '-') and(sinal <> '/') and(sinal <> '*') then
		select concat ('O sinal ',sinal,' não é reconhecido.') as Erro;
	else
		if(sinal = '+') then
			select n1 + n2 into resultado;
            select concat (n1,' ', sinal,' ', n2, ' = ', resultado) as Resultado;
		else 
			if (sinal = '-') then
				select n1 - n2 into resultado;
				select concat (n1,' ', sinal,' ', n2, ' = ', resultado) as Resultado;
			else 
				if (sinal = '/') then
					select n1 / n2 into resultado;
					select concat (n1,' ', sinal,' ', n2, ' = ', resultado) as Resultado;
				else 
					if (sinal = '*') then
						select n1 * n2 into resultado;
						select concat (n1,' ', sinal,' ', n2, ' = ', resultado) as Resultado;
					end if;
				end if;
			end if;
		end if;
	end if;
end $$ delimiter ;

call calculadora(34,'*',2);
drop procedure calculadora;



/*			Exercicio 02
-	Crie um procedimento para informar a classificação de cada cliente
	utilizando as seguintes verificações (Ifs):

-	Caso a soma das hospedagens realizadas pelo cliente seja maior que R$
	1000 sua categoria é cliente VIP; 

-	Caso seja entre R$ 500 e 1000 sua categoria é cliente NORMAL;
	caso seja menor que R$ 500 sua categoria é POPULAR;

-	O código do cliente deve ser passado como parâmetro de entrada.

-	Na mensagem de retorno deve ser informado o nome do cliente e o
	seus status na classificação.
*/














