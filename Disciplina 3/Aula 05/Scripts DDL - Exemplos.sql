use escolaaprendemais;

# descreva os atributos da tabela
desc aluno;

# altera tabela adicionando "data_nascimento_alu"
alter table aluno add data_nascimento_alu date;

alter table aluno add renda_familiar_alu float after nome_alu;

alter table aluno drop renda_familiar_alu;

alter table aluno add renda_familiar_alu float first;

# alterar atributos de uma tabela
alter table aluno change renda_familiar_alu renda_fam_alu float;

alter table aluno change renda_fam_alu renda_fam_alu float after nome_alu;
