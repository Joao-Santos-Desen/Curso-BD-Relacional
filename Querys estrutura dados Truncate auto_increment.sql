/* NA CRIAÇÃO DO BANCO:
1) - descrever as tabelas do banco
2) - descrever os atributos das tabelas
3) - descrever os relacionamentos entre tabelas
*/

show tables;

show create table aluno;

CREATE TABLE `aluno` (
   `nome` varchar(25) DEFAULT NULL,
   `email` varchar(150) DEFAULT NULL,
   `sexo` char(1) DEFAULT NULL,
   `ativo_sn` int(11) DEFAULT '1',
   `cpf` varchar(14) DEFAULT NULL,
   `idaluno` int(11) NOT NULL AUTO_INCREMENT,
   `data_nascimento` date DEFAULT NULL,
   PRIMARY KEY (`idaluno`),
   UNIQUE KEY `uc_aluno_cpf` (`cpf`),
   UNIQUE KEY `uc_aluno_email` (`email`)
 ) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


show create table telefone;

CREATE TABLE `telefone` (
   `idtelefone` int(11) NOT NULL AUTO_INCREMENT,
   `numero` varchar(20) NOT NULL,
   `fk_idaluno` int(11) NOT NULL,
   `tipo` enum('res','com','cel') NOT NULL,
   PRIMARY KEY (`idtelefone`),
   KEY `fk_aluno_telefone` (`fk_idaluno`),
   CONSTRAINT `fk_aluno_telefone` FOREIGN KEY (`fk_idaluno`) REFERENCES `aluno` (`idaluno`)
 ) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
 select * from funcionario;
 
 alter table funcionario add column fk_idmatricula_supervisor int;
 
 alter table funcionario add constraint fk_funcionario_supervisor 
 foreign key(fk_idmatricula_supervisor) references funcionario(idmatricula);
 
 desc funcionario;
 
 update funcionario set fk_idmatricula_supervisor = 110 where idmatricula = 100;
 
 insert into funcionario(
	nome, funcao
 )values(
	'Pedro', 'Gerente de TI'
 );
 
 update funcionario set fk_idmatricula_supervisor = 354 where idmatricula = 127;
 
 update funcionario set fk_idmatricula_supervisor = 110 where idmatricula in (221, 353);
 
 select * from funcionario where fk_idmatricula_supervisor = 110;
 
 
select * from gasto;

-- delete
-- drop table / create table
-- truncate table

truncate table gasto;

-- truncando a tabela onde está a fk
select * from telefone;
truncate table telefone;

-- truncando a tabela referência
select * from aluno;

set foreign_key_checks = 0; -- desabilita a proteção do banco com relacionamentos na tabela referência
set foreign_key_checks = 1; -- habilita a proteção do banco com relacionamentos na tabela referência
truncate table aluno;
truncate table curso;


-- auto_increment (valor padrão é 1);
select * from telefone;
select * from aluno;
insert into aluno(nome, email, sexo, cpf, data_nascimento)values
	('Jorge', 'jorga@teste.com.br', 'M', '222.222.222-98', '1989-01-06');
insert into telefone(numero, fk_idaluno, tipo)values('11 3333-4444', 1, 'res');

alter table telefone auto_increment = 300;
select max(idtelefone) + 1 from telefone; -- lógica do auto_increment: (valor maximo + 1)
