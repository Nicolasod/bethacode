CREATE TABLE escola.paises(
	id int,
	nome varchar(80),
	populacao bigint,
CONSTRAINT pk_paises PRIMARY KEY (ID)
)

select * from escola.paises

INSERT INTO escola.paises VALUES(1, 'Brasil',213169919); 
INSERT INTO escola.paises VALUES(2, 'EUA',300000000); 


//----

CREATE TABLE escola.estados(
	id int,
	nome varchar(80),
	populacao bigint,
CONSTRAINT pk_estados PRIMARY KEY (ID)
)

select * from escola.estados

ALTER TABLE escola.estados ADD i_paises INT;

select * from escola.paises

ALTER TABLE escola.estados ADD CONSTRAINT FK_PAISES_ESTADOS
FOREIGN KEY (I_PAISES) REFERENCES escola.paises (ID);

INSERT INTO escola.estados VALUES(1, 'SC',7000000,2); 
INSERT INTO escola.estados VALUES(2, 'RS',11000000,1); 

//--------

CREATE TABLE escola.cidades(
	id int,
	nome varchar(80),
	populacao bigint,
CONSTRAINT pk_cidades PRIMARY KEY (ID)
)

select * from escola.cidades

ALTER TABLE escola.cidades ADD i_estados INT;

ALTER TABLE escola.cidades ADD CONSTRAINT FK_ESTADOS_CIDADES
FOREIGN KEY (I_ESTADOS) REFERENCES escola.estados (ID);

INSERT INTO escola.cidades VALUES(1, 'Araranguá',5000,2); 
INSERT INTO escola.cidades VALUES(2, 'Criciúma',217311,1); 
INSERT INTO escola.cidades VALUES(3, 'Içara',7000,1); 

//-----------

CREATE TABLE escola.alunos(
	id int,
	nome varchar(80),
	matricula int,
	dataNascimento date,
CONSTRAINT pk_alunos PRIMARY KEY (ID)
)

ALTER TABLE escola.alunos ADD i_cidades INT;

select * from escola.alunos

ALTER TABLE escola.alunos ADD CONSTRAINT FK_CIDADES_ALUNOS
FOREIGN KEY (I_CIDADES) REFERENCES escola.cidades (ID);

INSERT INTO escola.alunos VALUES(1, 'José Augusto',356,'1992-09-01',1); 
INSERT INTO escola.alunos VALUES(2, 'Claudio',875,'1993-02-26',2); 
INSERT INTO escola.alunos VALUES(3, 'Nicolas',659,'1992-09-01',1); 
INSERT INTO escola.alunos VALUES(4, 'Gabriel',587,'1993-09-01',2); 
INSERT INTO escola.alunos VALUES(5, 'Guilherme',951,'1990-05-13',3); 

//-----------
CREATE TABLE escola.professores(
	id int,
	nome varchar(80),
	dataNascimento date,
CONSTRAINT pk_professores PRIMARY KEY (ID)
)

ALTER TABLE escola.professores ADD i_cidades INT;

select * from escola.professores 

ALTER TABLE escola.professores ADD CONSTRAINT FK_CIDADES_PROFESSORES
FOREIGN KEY (I_CIDADES) REFERENCES escola.cidades (ID);

INSERT INTO escola.professores VALUES(1, 'Lucimar','1981-03-05',1); 
INSERT INTO escola.professores VALUES(2, 'Alfredo','1982-07-14',2); 

//--------

CREATE TABLE escola.materia(
	id int,
	descricao varchar(80),
CONSTRAINT pk_materia PRIMARY KEY (ID)
)

select * from escola.materia 


insert into escola.materia values (1, 'Cálculo 1');
insert into escola.materia values (2, 'Física 1');

//-------

CREATE TABLE escola.turmas(
	id int,
	descricao varchar(80),
CONSTRAINT pk_turmas PRIMARY KEY (ID)
)

ALTER TABLE escola.turmas ADD i_materia INT;

ALTER TABLE escola.turmas ADD i_professor INT;

select * from escola.turmas 

ALTER TABLE escola.turmas ADD CONSTRAINT FK_MATERIA_TURMAS
FOREIGN KEY (I_MATERIA) REFERENCES escola.materia (ID);

ALTER TABLE escola.turmas ADD CONSTRAINT FK_PROFESSORES_TURMAS
FOREIGN KEY (I_PROFESSOR) REFERENCES escola.professores (ID);

select * from escola.turmas 

INSERT INTO escola.turmas VALUES(1, 'Turma A',2,1); 
INSERT INTO escola.turmas VALUES(2, 'Turma B',1,2); 

//-----------------

CREATE TABLE escola.frequencia(
	id int,
	dataAula date,
	presenca boolean,
CONSTRAINT pk_frequencia PRIMARY KEY (ID)
)

ALTER TABLE escola.frequencia ADD i_turmas INT;

ALTER TABLE escola.frequencia ADD i_alunos INT;

select * from escola.frequencia 

ALTER TABLE escola.frequencia ADD CONSTRAINT FK_TURMAS_FREQUENCIA
FOREIGN KEY (I_TURMAS) REFERENCES escola.turmas (ID);

ALTER TABLE escola.frequencia ADD CONSTRAINT FK_ALUNOS_FREQUENCIA
FOREIGN KEY (I_ALUNOS) REFERENCES escola.alunos (ID);

select * from escola.frequencia 

INSERT INTO escola.frequencia VALUES(1, '2021-05-02',true,1,2); 
INSERT INTO escola.frequencia VALUES(2, '2021-05-02',false,2,1); 
INSERT INTO escola.frequencia VALUES (3,'2021-05-02',true,1,3);
INSERT INTO escola.frequencia VALUES (4,'2021-05-02',true,1,4);
INSERT INTO escola.frequencia VALUES (5,'2021-05-02',true,1,5);

//----------------------

//-- Criar um SQL que traga todos os alunos de uma cidade específica. 

select * from escola.alunos where i_cidades = 1

//-- Criar um SQL que traga todas as turmas de um determinado professor.

select * from escola.turmas where i_professor = 3

//-- Criar um SQL que traga a quantidade de alunos por cidade onde a população for menor que 10 mil habitantes.

select a.nome, a.i_cidades, c.id, c.nome, c.populacao from escola.cidades as c
join escola.alunos as a
on c.id = a.i_cidades where populacao < 10000

select count(*), cidades.nome from escola.alunos, escola.cidades 
where (alunos.i_cidades = cidades.id) 
and cidades.populacao < 10000 group by cidades.nome


//--Criar um SQL que traga as datas de nascimento de professores e alunos juntos.

SELECT nome, dataA FROM ( 

	SELECT nome, datanascimento as dataA FROM escola.alunos a

	UNION ALL

	SELECT nome, datanascimento as dataA FROM escola.professores p

) as tab



//--Criar um SQL que traga o nome da cidade e o nome do aluno na mesma consulta.

select a.nome, c.nome from escola.cidades as c
join escola.alunos as a
on c.id = a.i_cidades


//--Criar um SQL que traga a quantidade de alunos que compareceram e que não compareceram às aulas, por turma e em uma data especifica.

select count(*), frequencia.presenca from escola.alunos, escola.frequencia 
where (alunos.i_cidades = frequencia.id) group by frequencia.presenca










