#Script BD_AgenciaBancaria - Versão 4.0 - Atividade 01 - 3ª Etapa
#SEU NOME: Guilherme Rafael Crisostomo Castelo
drop database BD_guilherme_castelo;
create database BD_guilherme_castelo;
use BD_guilherme_castelo;

create table Banco (
cod_ban int primary key not null auto_increment,
nome_ban varchar (200) not null
);

insert into Banco values (null, 'Caixa Econômica Federal');
insert into Banco values (null, 'Banco do Brasil');


create table Agencia (
cod_ag int primary key not null auto_increment,
numero_ag varchar (100) not null,
nome_ag varchar (100),
telefone_ag varchar (200),
cod_ban_fk int not null,
foreign key (cod_ban_fk) references Banco (cod_ban)
);

insert into Agencia values (null, '0951-2', 'Centro', '69 3421 1111', 2);
insert into Agencia values (null, '4402-1', 'Centro', '69 3422 2299', 2);
insert into Agencia values (null, '1824', 'Centro', '69 3423 1925', 1);
insert into Agencia values (null, '1920', 'Nova Brasilia', '69 3421 1122', 1);


create table Cliente (
cod_cli int primary key not null auto_increment,
nome_cli varchar (200) not null,
cpf_cli varchar (50) not null,
rg_cli varchar (100) not null,
sexo_cli varchar (1),
dataNasc_cli date not null,
renda_cli float not null,
endereco_cli varchar (300) not null,
email_cli varchar (300) not null,
telefone_cli varchar (200) not null
);

insert into Cliente values (null, 'Maria da Silva', '123.123.123-23', '1113322 sesdec/RO', 'F', '1990-10-10', 2500.00, 'Rua das Flores', 'maria.silva@hotmail.com', '3423 3333'); 
insert into Cliente values (null, 'Roberto Carlos', '789.789.789-89', '889977 sesdec/RO', 'M', '1975-01-10', 4990.00, 'Av. Costa', 'roberto.carlos@gmail.com', '8444 8899'); 
insert into Cliente values (null, 'Jane Pereira', '444.666.444-44', '005548 sesdec/RO', 'F', '1989-06-07', 1850.50, 'Rua Presidente', 'jane.pereira@hotmail.com', '9977 8899'); 
insert into Cliente values (null, 'Clodoaldo Bragança', '654.456.654-65', '654658 sesdec/RO', 'F', '1991-10-12', 9850.50, 'Av. Brasil', 'clodoaldo.bragança@gmail.com', '3423 5500'); 
insert into Cliente values (null, 'Livia de Souza', '333.444.666-98', '0033333 sesdec/RO', 'F', '1982-01-30', 1100.00, 'Av. Ji-Parana', 'livia.souza@hotmail.com', '8498 9898'); 
insert into Cliente values (null, 'Joab da Silva', '159.425.456-77', '001215 sesdec/RO', 'M', '2000-10-01', 4990.00, 'Av. Ji-Parana', 'joab.silva@hotmail.com', '69 8411 2321');
insert into cliente values (null, 'Rodrigo Hilbert', '123.445.888-99', '5592 sesdec', 'M', '1970-09-30', 2500.00, 'Rua Dr. Luiz', 'rodrigo.hilbert@yahoo.com.br', '9944 4545');
insert into cliente values (null, 'João Eujácio Teixeira Júnior', '999.445.789-99', '978999992 sesdec', 'M', '1989-01-10', 6000.00, 'Rua Silva Abreu', 'joao.eujacio@ifro.edu.br', '3421 1159');
insert into cliente values (null, 'Everton Feline', '123.123.888-99', '12392 sesdec', 'M', '1987-12-10', 11500.00, 'Rua Alencar Vieira', 'everton.feline@gmail.com','69 84228811');
insert into cliente values (null, 'Igor de Souza Santos', '123.345.848-99', '43299892 sesdec', 'M', '1990-12-30', 1000.00, 'Av. Brasil', 'igor.souza@gmail.com', '69 9977 7777');
insert into cliente values (null, 'Francisco Bezerra', '888.123.111-11', '213156 sesdec', 'M', '1965-01-30', 3500.00, 'Rua Fim do Mundo', 'francisco.bezerra@ifro.edu.br', '69 3423 5502');


create table Conta_Corrente (
cod_cc int primary key not null auto_increment,
numero_cc int not null,
dataAbertura_cc date not null,
saldo_cc float not null,
cod_ag_fk int not null,
cod_cli_fk int not null,
foreign key (cod_ag_fk) references Agencia (cod_ag),
foreign key (cod_cli_fk) references Cliente (cod_cli)
);

insert into Conta_Corrente values (null, 40650, '2009-01-01', 0.00, 1, 1);
insert into Conta_Corrente values (null, 41897, '2009-01-30', 0.00, 1, 2);
insert into Conta_Corrente values (null, 42487, '2010-06-06', 0.00, 1, 3);
insert into Conta_Corrente values (null, 43456, '2011-04-21', 0.00, 1, 4);
insert into Conta_Corrente values (null, 44787, '2012-12-31', 0.00, 1, 5);

create table Deposito (
cod_dep int primary key not null auto_increment,
valor_dep float not null,
data_dep date not null,
tipo_dep varchar (100),
cod_cc_fk int not null,
foreign key (cod_cc_fk) references Conta_Corrente (cod_cc)
);

create table Saque (
cod_saq int primary key not null auto_increment,
valor_saq float not null,
data_saq date not null,
local_saq varchar (100) not null,
hora_saq time,
cod_cc_fk int not null,
foreign key (cod_cc_fk) references Conta_Corrente (cod_cc)
);

create table Transferencia (
cod_trans int primary key not null auto_increment,
valor_trans float not null,
data_trans date not null,
descricao_trans varchar (100), #Exemplo: Pagamento de carro
cod_cc_origem_fk int not null,
cod_cc_destino_fk int not null,
foreign key (cod_cc_origem_fk) references Conta_Corrente (cod_cc),
foreign key (cod_cc_destino_fk) references Conta_Corrente (cod_cc)
);

create table Pagamento (
cod_pag int primary key not null auto_increment,
valor_pag float not null,
data_pag date not null,
tipo_pag varchar (100), #Tipos possíveis: Boleto ou Convênio
hora_pag time,
dataVencimento_pag date not null,
codigoBarras_pag varchar (300),
cod_cc_fk int not null,
foreign key (cod_cc_fk) references Conta_Corrente (cod_cc)
);

#---------------------------------------------EXERCÍCIOS-----------------------------------------------------

#			Tarefa 1 - Depósito

/*
-	Crie um gatilho na tabela Depósito para adicionar o
	valor do depósito no saldo da Conta Corrente do
	cliente após cada depósito realizado.
*/

delimiter $$
create trigger add_valor_deposito_em_cc after insert 
on deposito for each row
begin
update conta_corrente set saldo_cc = saldo_cc + new.valor_dep where new.cod_cc_fk = cod_cc;
end $$ delimiter ;

/*
-	Crie um procedimento para inserir um novo
	Depósito, mas só permita a inserção se o valor do
	depósito for MAIOR do que ZERO. Verifique também
	se o depósito é do tipo “Cheque” ou “Dinheiro”. Se
	for do tipo “Cheque” o valor do depósito não pode
	ser MAIOR do que 2000 reais. Se for do tipo
	“Dinheiro” o valor do depósito não pode ser MAIOR
	do que 5000 reais. Retorne mensagens de
	confirmação ou alerta para o usuário. Chame o
	procedimento e faça 01 depósito para cada conta
	corrente.
*/
delimiter $$
create procedure insert_new_deposito (valor float, data_dep date, tipo varchar(100), cc int(11))
begin
if (valor > 0 ) then
	if (tipo = 'cheque') then
		if (valor <= 2000) then
			insert into deposito values (null, valor, data_dep, tipo, cc);
            select concat('O deposito foi realizado na conta: ',cc) as Confirmação;
		else
			select concat('O valor ',valor,' deve ser menor que 2 mil para cheque') as Erro;
		end if;
	else 
		if(tipo = 'dinheiro') then
			if (valor <= 5000) then
				insert into deposito values (null, valor, data_dep, tipo, cc);
				select concat('O deposito foi realizado na conta: ',cc) as Confirmação;
			else
				select concat('O valor ',valor,' deve ser menor que 5 mil para dinheiro') as Erro;
			end if;
		end if;
	end if;
else
	select concat('O valor: $',valor,' deve ser maior que Zero') as Erro;
end if;
end $$ delimiter ;

#			Testes:

# conta 1
call insert_new_deposito(400.00, '2020-09-21', 'dinheiro', 1);
call insert_new_deposito(750.00, '2020-09-22', 'cheque', 1);

# conta 2
call insert_new_deposito(650.00, '2020-11-14', 'dinheiro', 2);
call insert_new_deposito(70.00, '2020-10-26', 'cheque', 2);

# conta 3
call insert_new_deposito(2600.00, '2020-10-03', 'dinheiro', 3);
call insert_new_deposito(0.00, '2020-10-03', 'dinheiro', 3);
call insert_new_deposito(1900.00, '2020-10-09', 'cheque', 3);

# conta 4
call insert_new_deposito(5500.00, '2020-11-19', 'dinheiro', 4);
call insert_new_deposito(800.00, '2020-11-27', 'cheque', 4);

# conta 5
call insert_new_deposito(3800.00, '2020-12-01', 'dinheiro', 5);
call insert_new_deposito(0.05, '2020-12-01', 'cheque', 5);
call insert_new_deposito(2900.00, '2020-11-30', 'cheque', 5);

#---------------------------------------------------------------------------------------------

#			Tarefa 2 - Saque

/*
-	Crie um gatilho na tabela Saque para retirar o valor
	do saque no saldo da Conta Corrente do cliente
	após cada saque realizado.
*/

delimiter $$
create trigger update_saldo_de_saque after insert
on saque for each row
begin
update conta_corrente set saldo_cc = saldo_cc - new.valor_saq
where cod_cc = new.cod_cc_fk;
end $$ delimiter ;

/*
-	Crie um procedimento para inserir um novo Saque,
	mas só permita a inserção se houver saldo suficiente
	na Conta Corrente do cliente, ou seja, o valor do
	saque deve ser MENOR ou IGUAL ao valor do saldo
	da conta. Faça também uma verificação para não
	permitir saques com valor superior a 3000 reais.
	Também não permita saque no horário entre as
	“00:00” e as “06:00” da manhã. Retorne mensagens
	de confirmação ou alerta para o usuário. Chame o
	procedimento e faça 05 saques.
*/
delimiter $$
create procedure insert_new_saque(valor float, data_s date, local_s varchar(100), hora time, cliente int)
begin
declare saldo_atual_cc float;
select saldo_cc into saldo_atual_cc from conta_corrente where (cod_cli_fk = cliente);
if (hora between '06:01' and '23:59') then
	if (valor <= 3000) then
        if (valor<= saldo_atual_cc) then
			insert into saque values(null, valor, data_s, local_s, hora, cliente);
            select 'Saque realizado com Sucesso!' as Confirmação;
		else
			select concat('Saldo insuficiente para realizar Saque!') as Erro;
		end if;
	else
		select concat('Saque deve ser menor que R$ ',valor) as Erro;
	end if;
else
	select 'Não é possivel realizar saque entre os horários 00:00 e 06:00' as Erro;
end if;
end $$ delimiter ;

#			Testes

# saque cliente 1
call insert_new_saque(50.00, '2020-08-12', 'Centro', '21:34', 1);

# saque cliente 2
call insert_new_saque(150.00, '2020-09-10', 'Centro', '11:42', 2);

# saque cliente 3
call insert_new_saque(650.00, '2020-10-03', 'Caixa eletronico mercado', '16:12', 3);

# saque cliente 4
call insert_new_saque(950.00, '2020-11-30', 'Caixa eletrônico farmácia', '19:58', 4);
call insert_new_saque(850.00, '2020-11-30', 'Caixa eletrônico farmácia', '19:59', 4);
call insert_new_saque(800.00, '2020-11-30', 'Caixa eletrônico farmácia', '20:01', 4);

# saque cliente 5
call insert_new_saque(2000.00, '2020-12-01', 'Nova Brasília', '05:59', 5);
call insert_new_saque(2000.00, '2020-12-01', 'Nova Brasília', '06:08', 5);

#----------------------------------------------------------------------------------

#			Tarefa 3 - Transferências

/*
-	Crie um gatilho na tabela Transferência para
	adicionar o valor da transferência no saldo da conta
	do cliente de destino e retirar o valor da
	transferência no saldo da conta do cliente de
	origem.(10 pontos)
*/
delimiter $$
create trigger update_cc_a_cada_transferencia after insert 
on transferencia for each row
begin
update conta_corrente set saldo_cc = saldo_cc - new.valor_trans
where cod_cc = new.cod_cc_origem_fk; 
update conta_corrente set saldo_cc = saldo_cc + new.valor_trans
where cod_cc = new.cod_cc_destino_fk; 
end $$ delimiter ;
/*
-	Crie um procedimento para inserir uma nova
	Transferência, mas só permita a inserção se houver
	saldo suficiente na Conta Corrente do cliente de
	origem. Você também deve garantir que os códigos
	das contas informadas sejam diferente. Chame o
	procedimento e faça 01 transferência.
*/
delimiter $$
create procedure insert_new_transferencia (valor float, data_t date, descricao varchar(100), cc_o int, cc_d int)
begin
declare saldo_cc_o float;
select saldo_cc into saldo_cc_o from conta_corrente where (cod_cc = cc_o);
if (valor <= saldo_cc_o) or (cc_o <> cc_d) then
	if(cc_o <> cc_d) then
		insert into transferencia values (null, valor,data_t, descricao, cc_o, cc_d);
        select 'Transferencia realizada com sucesso!' as Confirmação;
	else
		select 'As contas origem e destino precisam ser diferentes!' as Erro;
	end if;
else
	select concat('Saldo insuficiente: R$ ',saldo_cc_o,',00 < R$ ', valor, ',00') as Erro;
end if;
end $$ delimiter ;

call insert_new_transferencia(200, '2020-09-03', 'Transferencia de pagamento de pizza', 1, 4);
call insert_new_transferencia(100, '2020-09-04', 'Transferencia de pagamento de lanche', 1, 4);


#----------------------------------------------------------------------------------

#			Tarefa 4 - Pagamentos

/*
-	Crie um gatilho na tabela Pagamento para retirar o
	valor do pagamento no saldo da Conta Corrente do
	cliente após cada saque realizado.
*/
delimiter $$
create trigger update_cc_com_pagamento after insert
on pagamento for each row
begin
update conta_corrente set saldo_cc = saldo_cc - new.valor_pag
where cod_cc = new.cod_cc_fk;
end $$ delimiter ;

/*
-	Crie um procedimento para inserir um novo
	Pagamento, mas só permita a inserção se houver saldo
	suficiente na Conta Corrente do cliente, ou seja, o valor
	do pagamento deve ser MENOR ou IGUAL ao valor do
	saldo da conta. Faça também uma verificação para
	permitir pagamentos somente entre os horários de
	“09:00” e “21:00”. Verifique também se código de barras
	do boleto possui exatamente 10 caracteres. Retorne
	mensagens de confirmação ou alerta para o usuário.
	Chame o procedimento e faça 03 pagamentos.
*/

delimiter $$
create procedure insert_new_pagamento(valor float, data_p date, tipo varchar(100), hora time, dataV_p date, codigoBarra varchar(300), cc int)
begin
declare saldo_atual_cc float;
select saldo_cc into saldo_atual_cc from conta_corrente where cod_cc = cc;
if (saldo_atual_cc >= valor) then
	if (hora between '09:00' and '21:00') then
		if (length(codigoBarra) = 10) then
			insert into pagamento values (null, valor, data_p, tipo, hora, dataV_p, codigoBarra, cc);
            select 'Pagamento realizado com sucesso!' as Confirmação;
		else
			select 'O codigo de barras precisa ter 10 caracteres!' as Erro;
		end if;
	else
		select 'Horario invalido para pagamento!' as Erro;
	end if;
else	
	select 'Saldo insuficiente!' as Erro;
end if;
end $$ delimiter ;

call insert_new_pagamento(200, '2020-10-02', 'boleto','10:00', '2020-10-05', '1234567890', 1);
call insert_new_pagamento(20000, '2020-10-02', 'boleto','10:00', '2020-10-05', '1234567890', 1);
call insert_new_pagamento(100, '2020-10-08', 'boleto','13:00', '2020-10-15', '5734537820', 4);
call insert_new_pagamento(10, '2020-10-08', 'boleto','13:00', '2020-10-15', '57348321820', 4);
call insert_new_pagamento(1500, '2020-10-02', 'boleto','10:00', '2020-10-05', '3453289073', 5);
call insert_new_pagamento(15, '2020-10-02', 'boleto','06:00', '2020-10-05', '3453289073', 5);
