--DDL
CREATE DATABASE RpgOnlineBD

USE RpgOnlineBD

CREATE TABLE Usuarios(
	IdUsuario		INT						PRIMARY KEY IDENTITY
	,Email			VARCHAR(100)						NOT NULL
	,Senha			VARCHAR(255)						NOT NULL			
)

CREATE TABLE Classes(
	IdClasse		INT						PRIMARY KEY IDENTITY
	,Nome			VARCHAR(50)				UNIQUE		NOT NULL
	,Descricao		VARCHAR(255)
)

CREATE TABLE Personagens(
	IdPersonagem	INT						PRIMARY KEY IDENTITY
	,NomePersonagem	VARCHAR(15)				UNIQUE		NOT NULL
	,IdUsuario		INT UNIQUE FOREIGN KEY REFERENCES Usuarios(IdUsuario)
	,IdClasse		INT FOREIGN KEY REFERENCES Classes(IdClasse)
)

CREATE TABLE Habilidades(
	IdHabilidade	INT						PRIMARY KEY IDENTITY
	,Nome			VARCHAR(100)			UNIQUE		NOT NULL
)

CREATE TABLE ClasseHabilidade(
	IdClasse		INT FOREIGN KEY REFERENCES Classes(IdClasse)
	,IdHabilidade	INT	FOREIGN KEY REFERENCES Habilidades(IdHabilidade)
)

--DML
INSERT INTO Usuarios VALUES('email@email.com', '784621')
INSERT INTO Classes VALUES('Bárbaro', 'Selvagem raivoso')
INSERT INTO Habilidades VALUES('Lança mortal'), ('Escudo supremo')
INSERT INTO Personagens(NomePersonagem, IdClasse, IdUsuario) VALUES('Vicking raivoso', 1, 1)
INSERT INTO ClasseHabilidade(IdClasse, IdHabilidade) VALUES (1, 1), (1, 2)

--DQL
SELECT * FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Habilidades
SELECT * FROM Personagens
SELECT * FROM ClasseHabilidade

--DML
INSERT INTO Usuarios VALUES('email12@email.com', '21316151')
INSERT INTO Classes VALUES('Monge', 'Descrição monge')
INSERT INTO Habilidades VALUES('Recuperar vida')
INSERT INTO Personagens(NomePersonagem, IdClasse, IdUsuario) VALUES('BitBugue', 2, 2)
INSERT INTO ClasseHabilidade(IdClasse, IdHabilidade) VALUES (2, 2), (2, 5)

UPDATE Usuarios
SET Senha = 649785
WHERE IdUsuario = 1

--DQL
SELECT * FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Habilidades
SELECT * FROM Personagens
SELECT * FROM ClasseHabilidade

--AO3
INSERT INTO Usuarios VALUES('Rpg2@gmail.com', '123459')
SELECT * FROM Usuarios
UPDATE Usuarios SET Email = 'Rpmg3@gmail.com', Senha = '789456'
DELETE FROM Usuarios WHERE IdUsuario = 3

SELECT P.NomePersonagem, C.Nome AS 'Nome da Classe', C.Descricao FROM Personagens AS P
INNER JOIN Classes AS C
ON P.IdClasse = C.IdClasse
