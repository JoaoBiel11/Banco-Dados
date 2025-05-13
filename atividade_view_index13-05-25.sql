# ATIVIDADE 13/05/2025  VIEW e INDEX

DROP DATABASE IF EXISTS atv_view_index_nome_sobrenome;
CREATE DATABASE IF NOT EXISTS atv_view_index_nome_sobrenome ;
USE atv_view_index_nome_sobrenome;


CREATE TABLE Equipe (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(32)
);

INSERT INTO Equipe (id, nome) VALUES (1, 'Palmeiras');
INSERT INTO Equipe (id, nome) VALUES (2, 'Santos');
INSERT INTO Equipe (id, nome) VALUES (3, 'SCCP');
INSERT INTO Equipe (id, nome) VALUES (4, 'SPFC');

CREATE TABLE Campeonato (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(32)
);

INSERT INTO Campeonato (id, nome) VALUES (1, 'Campeonato Brasileiro');
INSERT INTO Campeonato (id, nome) VALUES (2, 'Copa do Brasil');
INSERT INTO Campeonato (id, nome) VALUES (3, 'Libertadores');

CREATE TABLE JogadorBrasileiro (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cpf VARCHAR(16) UNIQUE,
  nome VARCHAR(32),
  posicao VARCHAR(16),
  idEquipe INT,
  salario INT,
  CONSTRAINT fk_jogadorbrasileiro_idEquipe FOREIGN KEY(idEquipe)
    REFERENCES Equipe(id),
  CONSTRAINT ck_jogadorbrasileiro_posicao CHECK (posicao IN ('Goleiro', 'Lateral', 'Zagueiro', 'Meio-Campo', 'Atacante'))
);


INSERT INTO JogadorBrasileiro (cpf, nome, posicao, idEquipe, salario) 
  VALUES ('111.222.333.44', 'Sao Marcos', 'Goleiro', 1, 350000.75);
  select * from jogadorbrasileiro;
INSERT INTO JogadorBrasileiro (cpf, nome, posicao, idEquipe, salario) 
  VALUES ('098.765.345.12', 'Neymar', 'Atacante', 2, 565000.50);
INSERT INTO JogadorBrasileiro (cpf, nome, posicao, idEquipe, salario) 
  VALUES ('045.456.555.12', 'Betao', 'Zagueiro', 3, 18000.00);
INSERT INTO JogadorBrasileiro (cpf, nome, posicao, idEquipe, salario) 
  VALUES ('235.457.789-65', 'Alex', 'Meio-Campo', 1, 310000.20);
INSERT INTO JogadorBrasileiro (cpf, nome, posicao, idEquipe, salario) 
  VALUES ('777.854.123-68', 'Ronaldinho', 'Atacante', 2, 425000.00);
INSERT INTO JogadorBrasileiro (cpf, nome, posicao, idEquipe, salario) 
  VALUES ('159.487.236-00', 'Gilmar Fuba', 'Atacante', 3, 8500.00);
INSERT INTO JogadorBrasileiro (cpf, nome, posicao, idEquipe, salario) 
  VALUES ('457.148.230-00', 'Iranildo', 'Meio-Campo', null, 0);
INSERT INTO JogadorBrasileiro (cpf, nome, posicao, idEquipe, salario) 
  VALUES ('476.555.788-15', 'Odvan', 'Zagueiro', null, 0);


drop TABLE if exists JogadorEstrangeiro; 
CREATE TABLE JogadorEstrangeiro (
  id INT AUTO_INCREMENT PRIMARY KEY,
  passaporte VARCHAR(16) UNIQUE,
  nome VARCHAR(32),
  posicao VARCHAR(16),
  idEquipe INT,
  paisOrigem VARCHAR(16),
  salario INT,
  CONSTRAINT fk_jogadorestrangeiro_idEquipe FOREIGN KEY(idEquipe)
    REFERENCES Equipe(id)
);

INSERT INTO JogadorEstrangeiro (passaporte, nome, posicao, idEquipe, paisOrigem, salario) 
  VALUES ('586.324.111.44', 'Arce', 'Lateral', 1, 'Paraguai', 200500.10);
INSERT INTO JogadorEstrangeiro (passaporte, nome, posicao, idEquipe, paisOrigem, salario) 
  VALUES ('348.562.363.14', 'Mancuso', 'Atacante', 3, 'Argentina', 110000.75);
INSERT INTO JogadorEstrangeiro (passaporte, nome, posicao, idEquipe, paisOrigem, salario) 
  VALUES ('456.357.698.47', 'Gioino', 'Atacante', 3, 'Argentina', 15000);


CREATE TABLE EquipeCampeonato (
  idEquipe INT,
  idCampeonato INT,
  posicao INT,
  PRIMARY KEY (idEquipe, idCampeonato),
  CONSTRAINT fk_equipecampeonato_idEquipe FOREIGN KEY (idEquipe)
    REFERENCES Equipe(id),
  CONSTRAINT fk_equipecampeonato_idCamp FOREIGN KEY (idCampeonato)
    REFERENCES Campeonato(id),
  CONSTRAINT ck_equipecampeonato_posicao CHECK (posicao > 0)
);

INSERT INTO EquipeCampeonato (idEquipe, idCampeonato, posicao)
  VALUES (1, 1, 1);
INSERT INTO EquipeCampeonato (idEquipe, idCampeonato, posicao)
  VALUES (1, 3, 1);
INSERT INTO EquipeCampeonato (idEquipe, idCampeonato, posicao)
  VALUES (2, 1, 16);
INSERT INTO EquipeCampeonato (idEquipe, idCampeonato, posicao)
  VALUES (3, 1, 3);
INSERT INTO EquipeCampeonato (idEquipe, idCampeonato, posicao)
  VALUES (4, 1, 8);

CREATE TABLE Cidade (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(32),
  estado VARCHAR(2)
);

INSERT INTO Cidade (id, nome, estado) VALUES (1, 'Sao Paulo', 'SP');
INSERT INTO Cidade (id, nome, estado) VALUES (2, 'Rio de Janeiro', 'RJ');
INSERT INTO Cidade (id, nome) VALUES ( 3, 'Belo Horizonte');
INSERT INTO Cidade (id, nome) VALUES (4, 'Porto Alegre');
INSERT INTO Cidade (id, nome) VALUES (5, 'Recife');

CREATE TABLE Tecnico (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cpf VARCHAR(16) UNIQUE,
  nome VARCHAR(32),
  idEquipe INT,
  dataNasc DATE,
  CONSTRAINT fk_tecnico_idEquipe FOREIGN KEY(idEquipe)
    REFERENCES Equipe(id)
);

INSERT INTO Tecnico (id, cpf, nome, idEquipe, dataNasc) 
  VALUES (1, '123.654.875-90', 'Marcelo de Oliveira', 1, '1965-03-04');
INSERT INTO Tecnico (id, cpf, nome, idEquipe, dataNasc) 
  VALUES (2, '565.187.765-12', 'Dorival Junior', 2, '1962-04-25');
INSERT INTO Tecnico (id, cpf, nome, idEquipe, dataNasc) 
  VALUES (3, '098.904.642-65', 'Tite', 3, '1961-05-25');
INSERT INTO Tecnico (id, cpf, nome, idEquipe, dataNasc) 
  VALUES (4, '187.644.235-20', 'Osorio', 4, '1962-06-08');

CREATE TABLE PaisesTecnicos (
  idTecnico INT,
  pais VARCHAR(32),
  PRIMARY KEY (idTecnico, pais),
  FOREIGN KEY (idTecnico)
    REFERENCES Tecnico(id)
    ON DELETE CASCADE
);

INSERT INTO PaisesTecnicos (idTecnico, pais) VALUES (1, 'Brasil');
INSERT INTO PaisesTecnicos (idTecnico, pais) VALUES (2, 'Brasil');
INSERT INTO PaisesTecnicos (idTecnico, pais) VALUES (3, 'Brasil');
INSERT INTO PaisesTecnicos (idTecnico, pais) VALUES (3, 'Emirados Arabes');
INSERT INTO PaisesTecnicos (idTecnico, pais) VALUES (4, 'Estados Unidos');
INSERT INTO PaisesTecnicos (idTecnico, pais) VALUES (4, 'Colombia');
INSERT INTO PaisesTecnicos (idTecnico, pais) VALUES (4, 'Mexico');
INSERT INTO PaisesTecnicos (idTecnico, pais) VALUES (4, 'Brasil');

CREATE TABLE Jogo (
  id INT AUTO_INCREMENT PRIMARY KEY,
  dataJogo DATE,
  idEquipeCasa INT,
  idEquipeFora INT,
  golsEquipeCasa INT,
  golsEquipeFora INT,
  idCidade INT,
  estadio VARCHAR(32),
  idCampeonato INT,
  FOREIGN KEY (idEquipeCasa)
    REFERENCES Equipe (id),
  FOREIGN KEY (idEquipeFora)
    REFERENCES Equipe (id),
  FOREIGN KEY (idCidade)
    REFERENCES Cidade (id)
    ON DELETE SET NULL,
  FOREIGN KEY (idCampeonato)
    REFERENCES Campeonato (id)
);

INSERT INTO Jogo (id, dataJogo, idEquipeCasa, idEquipeFora, 
                golsEquipeCasa, golsEquipeFora, idCidade, estadio, idCampeonato)
  VALUES (1, '2015-06-10', 3, 1, 0, 2, 1, 'Itaquerao', 1);
INSERT INTO Jogo (id, dataJogo, idEquipeCasa, idEquipeFora, 
                golsEquipeCasa, golsEquipeFora, idCidade, estadio, idCampeonato)
  VALUES (2, '2015-06-11', 2, 4, 2, 2, 1, 'Vila Belmiro', 1);
INSERT INTO Jogo (id, dataJogo, idEquipeCasa, idEquipeFora, 
                golsEquipeCasa, golsEquipeFora, idCidade, estadio, idCampeonato)
  VALUES (3, '2015-06-11', 2, 3, 3, 2, NULL, 'Morumbi', 1);


INSERT INTO equipe (nome) VALUES ('Flamengo');
INSERT INTO equipe (nome) VALUES ('Fluminense');
INSERT INTO equipe (nome) VALUES ('Vasco');
INSERT INTO equipe (nome) VALUES ('Gremio');
INSERT INTO equipe (nome) VALUES ('Internacional');
INSERT INTO equipe (nome) VALUES ('Atletico PR');
INSERT INTO equipe (nome) VALUES ('Coritiba');
INSERT INTO equipe (nome) VALUES ('Atletico MG');
INSERT INTO equipe (nome) VALUES ('Cruzeiro');
INSERT INTO equipe (nome) VALUES ('Bahia');
INSERT INTO equipe (nome) VALUES ('Vitoria');
INSERT INTO equipe (nome) VALUES ('Sport');
INSERT INTO equipe (nome) VALUES ('Nautico');
INSERT INTO equipe (nome) VALUES ('Ponte Preta');
INSERT INTO equipe (nome) VALUES ('Guarani');
INSERT INTO equipe (nome) VALUES ('Portuguesa');

select * from equipe;


-- Lista atacantes brasileiros
SELECT * FROM JogadorBrasileiro
  WHERE posicao like 'Atacante';

-- Visão que lista as informações dos atacantes brasileiros  
CREATE OR REPLACE VIEW ListaAtacantesBrasileiros AS
  SELECT * FROM JogadorBrasileiro
    WHERE posicao like 'Atacante';
    
-- Seleciona visão criada
SELECT * FROM ListaAtacantesBrasileiros;

-- Seleciona atacantes brasileiros que ganham mais que 200000 (SLIDE 12)
SELECT nome, cpf FROM ListaAtacantesBrasileiros
  WHERE salario > 200000;

-- Descreve visão
DESC ListaAtacantesBrasileiros;

-- Lista todos os jogadores (brasileiros e estrangeiros) (SLIDE 13)
SELECT nome, posicao, idEquipe, paisOrigem, salario 
  FROM JogadorEstrangeiro
UNION
SELECT nome, posicao, idEquipe, 'Brasil', salario 
  FROM JogadorBrasileiro;

-- Criação de visão para listagem das médias por posicao (SLIDE 14)
CREATE OR REPLACE VIEW MediaPorPosicao (posicao, mediaSalario) AS
  SELECT j.posicao, AVG(j.salario) FROM JogadorBrasileiro j
    GROUP BY j.posicao;

-- Criação da visão com os nomes de equipes e jogadores (SLIDE 15)
CREATE OR REPLACE VIEW EquipesJogadores AS  
  SELECT e.nome AS equipe, j.nome AS jogador
    FROM JogadorBrasileiro j JOIN Equipe e
    ON e.id = j.idEquipe;

SELECT * FROM EquipesJogadores;
DESC EquipesJogadores;

-- Inserção por meio de visões (SLIDE 17)
INSERT INTO ListaAtacantesBrasileiros (cpf, nome, posicao, idEquipe, salario)
  VALUES ('987.654.345-89', 'Dodo', 'Atacante', 4, 400000);

#---------------------------------------------------------------------------------------------------
-- Adicionando clausula WITH CHECK OPTION   (SLIDE 18)
CREATE OR REPLACE VIEW ListaAtacantesBrasileiros AS
  SELECT * FROM JogadorBrasileiro
    WHERE posicao like 'Atacante'
    WITH CHECK OPTION;

-- Inserção não funciona, pois jogador a ser inserido não é Atacante  
-- INSERT INTO ListaAtacantesBrasileiros (cpf, nome, posicao, idEquipe, salario)
--  VALUES ('171.156.123-21', 'Murilo', 'Zagueiro', 3, 150000);


#*****************************************
#************* QUESTÕES *****************
#*****************************************

#PARTE 1(SELECTS E JOINS)
-- a) Listar todos os jogadores brasileiros e seus clubes
select jb.nome, jb.posicao, e.nome as clube from JogadorBrasileiro jb
left join Equipe e on jb.idEquipe = e.id;
-- b) Listar técnicos que trabalharam no Brasil
select t.nome, p.pais from tecnico t 
left join paisestecnicos p on p.idTecnico = t.id where p.pais like "%Brasil%";
-- c) Jogadores (brasileiros e estrangeiros) com salário maior que 300 mil
select jb.nome, jb.salario from jogadorbrasileiro jb
where jb.salario >300000
union
select je.nome, je.salario from jogadorestrangeiro je
where je.salario >300000;
-- d) Equipes e suas posições no Campeonato Brasileiro
select e.nome, ec.posicao from equipe e
left join equipecampeonato ec on e.id = ec.idequipe
where (select c.id from campeonato c where c.id = ec.idcampeonato and c.id = 1);
-- e) Jogos com placar e cidade
select c.nome as Cidade, j.datajogo as Data_Jogo, j.golsequipecasa as Gols_Casa, j.golsequipefora as Gols_Fora from cidade c
left join jogo j on c.id = j.idcidade where j.datajogo is not null;

#PARTE 2(VIEWS)
-- a) View_Jogadores_Equipes
-- Mostra todos os jogadores brasileiros com o nome de sua equipe.
create view View_Jogadores_Equipes as
select jb.nome AS Jogador, jb.posicao, jb.salario, e.nome AS Equipe
from JogadorBrasileiro jb left join Equipe e ON jb.idEquipe = e.id;
select * from View_Jogadores_Equipes;

-- b) View_Tecnicos_Experiencia
-- Mostra os técnicos e os países onde já trabalharam.
create view View_Tecnicos_Experiencia as
select t.nome as Tecnico, t.datanasc as DataNasc, pt.pais as País from tecnico t
left join paisestecnicos pt on t.id = pt.idtecnico;
select * from View_Tecnicos_Experiencia;
-- c) View_Resultados_Jogos
-- Mostra o resultado dos jogos com nomes das equipes e cidade.
create view View_Resultados_Jogos as
select e1.nome as Equipe_Casa, 
e2.nome as Equipe_Fora, 
j.golsequipecasa as Time_Casa, 
j.golsequipefora as Time_Fora,
c. nome as Cidade  from jogo j
inner join equipe e1 on j.golsequipecasa = e1.id
inner join equipe e2 on j.golsequipefora = e2.id
inner join cidade c on j.idcidade = c.id;
select * from View_Resultados_Jogos;
-- d) View_Salario_Medio_Equipe
-- Mostra o salário médio dos jogadores de cada equipe.
create view View_Salario_Medio_Equipe as
select 
  e.nome AS Equipe,
  ROUND(AVG(jb.salario), 2) AS SalarioMedio
from Equipe e
join JogadorBrasileiro jb ON e.id = jb.idEquipe
group by e.nome;

-- e) View_Equipes_Campeonatos
-- Relaciona equipes aos campeonatos que disputaram.
create view View_Equipes_Campeonatos as
select 
  e.nome AS Equipe,
  c.nome AS Campeonato
from Campeonato c
join Jogo j ON c.id = j.idCampeonato
join Equipe e ON e.id IN (j.idEquipeCasa, j.idEquipeFora)
group by e.nome, c.nome;


-- f) View_Jogadores_Lesionados_Atualmente
#Mostra os jogadores que estão atualmente lesionados (usando a tabela abaixo).
create table Lesao (
  id int auto_increment primary key,
  idJogador int,
  tipo varchar(32),
  dataInicio date,
  dataFim date,
  foreign key(idJogador) references JogadorBrasileiro(id)
);

INSERT INTO Lesao (id, idJogador, tipo, dataInicio, dataFim) VALUES (2, 2, 'manha', '2018-05-02','2025-10-03');
INSERT INTO Lesao (id, idJogador, tipo, dataInicio, dataFim) VALUES (1, 3, 'muscular', '2025-01-01','2025-10-03');

create view View_Jogadores_Lesionados_Atualmente as
select 
  jb.nome AS Jogador,
  l.tipo AS TipoLesao,
  l.dataInicio,
  l.dataFim
from lesao l
join JogadorBrasileiro jb on l.idJogador = jb.id
where CURDATE() between l.dataInicio and l.dataFim;

select * from View_Jogadores_Lesionados_Atualmente;


#PARTE 3(Consultando Views com Filtros e Ordenações)

-- a) Usando a View_Salario_Medio_Equipe
-- Pergunta: Quais equipes possuem salário médio acima de R$ 200.000,00? Liste em ordem
-- decrescente do maior para o menor salário médio.
select * from view_salario_medio_equipe 
where salariomedio > 200000
order by salariomedio desc;

-- b) Usando a View_Equipes_Campeonatos
-- Pergunta: Liste os campeonatos disputados pela equipe "Palmeiras", ordenados pelo nome
-- em ordem crescente.
select * from View_Equipes_Campeonatos
where equipe like "%Palmeiras%" 
order by campeonato asc;
-- c) Usando a View_Jogadores_Lesionados_Atualmente
-- Pergunta: Quas jogadores estão atualmente lesionados com lesão do tipo "muscular"? Liste-
-- os por ordem alfabética. Crie a condição para ter mais de um jogador com lesão muscular.
select * from View_Jogadores_Lesionados_Atualmente
where tipoLesao is not null
order by jogador asc;



#PARTE 4(INDEX)

-- Considere a tabela Torcedor abaixo:
CREATE TABLE Torcedor (
id int,
nome VARCHAR(30),
sexo CHAR(1),
idEquipe int,
CONSTRAINT pk_torcedor PRIMARY KEY(id),
CONSTRAINT fk_torcedor_equipe FOREIGN KEY(idEquipe)
REFERENCES Equipe(id)
);

# EXPLAIN SELECT * FROM torcedor WHERE id = 1;

-- Inserção em massa usando stored procedure
DELIMITER $$
CREATE PROCEDURE popular_torcedores()
BEGIN
DECLARE i INT DEFAULT 1;
WHILE i <= 100000 DO
INSERT INTO Torcedor(id, nome)
VALUES(i, CONCAT('Torcedor', LPAD(i, 6, '0')));
IF MOD(i, 10000) = 0 THEN
COMMIT;
END IF;
SET i = i + 1;
END WHILE;
COMMIT;
END$$
DELIMITER ;

# chamar a procedure para popular a tabela torcedor
CALL popular_torcedores();

# contar o tempo da execução
SET PROFILING = 1;
-- Sua consulta aqui (por exemplo...)
select * from torcedor where nome = 'Torcedor000123';
select * from torcedor;
SHOW PROFILES;

# aqui a consulta fica mais rápida (verifique com show profiles)
CREATE INDEX idx_nome_torcedor ON torcedor(nome);
SET PROFILING = 1;
SELECT * FROM torcedor WHERE nome = 'Torcedor000123';
SHOW PROFILES;

-+
