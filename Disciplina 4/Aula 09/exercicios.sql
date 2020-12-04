
#================================= AULA 09 - TRIGGERS ===============================

use bd_mecanica5;

drop database bd_mecanica5;

# exemplo: Baixar estoque

delimiter $$
create trigger baixaEstoque before insert
on itens_venda for each row
begin
declare estoque int;
select quant_prod into estoque from produto where cod_prod = new.cod_prod_fk;
if (estoque > new.quant_itenv) then
	update produto set quant_prod = quant_prod - new.quant_itenv 
    where cod_prod = new.cod_prod_fk;
else 
	set new.quant_itenv = estoque;
    update produto set quant_prod = quant_prod - new.quant_itenv where cod_prod = new.cod_prod_fk;
end if;
end $$ delimiter ;

drop trigger baixaestoque;

# exemplo: Cancela Baixa de Estoque

select * from itens_venda;
select * from produto;
select * from venda;

insert into itens_venda values(null, 3, 25, 9, 1);
insert into itens_venda values(null, 3, 50.5, 1, 2);
delete from itens_venda where cod_itenv=14;

delimiter $$
create trigger cancelaBaixaEstoque after delete
on itens_venda for each row
begin
	update produto 
	set quant_prod = quant_prod + old.quant_itenv 
	where cod_prod = old.cod_prod_fk;
end $$ delimiter ;
