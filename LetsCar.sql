CREATE DATABASE LetsCar

USE LetsCar

CREATE TABLE Cliente
(
	IdCliente INT NOT NULL PRIMARY KEY,
	Nome VARCHAR(50) NOT NULL,
	Sobrenome VARCHAR(50) NOT NULL,
	CPF BIGINT NOT NULL
)

CREATE TABLE Carros
(
	IdCarros INT NOT NULL PRIMARY KEY,
	Marca VARCHAR(100) NOT NULL,
	Modelo VARCHAR(100),
	Ano INT,
	Preco BIGINT NOT NULL,
	Cor VARCHAR(50),
	Adicionais VARCHAR(300),
	IdFormaDePagamento INT NOT NULL,
)

ALTER TABLE Carros
ADD CONSTRAINT fk_FormaPagamentoCarro FOREIGN KEY (IdFormaDePagamento) REFERENCES FormaDePagamento (IdFormaDePagamento)

CREATE TABLE Contato
(
	IdContato INT NOT NULL PRIMARY KEY,
	Telefone BIGINT NOT NULL,
	Email VARCHAR(256)
)

CREATE TABLE FormaDePagamento
(
	IdFormaDePagamento INT PRIMARY KEY,
)
ALTER TABLE FormaDePagamento ADD Formas VARCHAR(100) NOT NULL

CREATE TABLE CarrosFavoritos
(
	IdCarros INT,
	CONSTRAINT fk_CarroFavorito FOREIGN KEY (IdCarros) REFERENCES Carros (IdCarros),
	IdCLiente INT,
	CONSTRAINT fk_ClienteCarroFavorito FOREIGN KEY (IdCLiente) REFERENCES Cliente (IdCLiente)
)
ALTER TABLE CarrosFavoritos
	ADD CONSTRAINT pk_Cliente_CarroFavorito
		PRIMARY KEY(IdCarros, IdCLiente)

-- INSERTS

INSERT INTO Cliente(IdCliente, Nome, Sobrenome, CPF)
	VALUES(1, 'Caio', 'Milhan', 95917497834)

INSERT INTO Cliente(IdCliente, Nome, Sobrenome, CPF)
	VALUES(2, 'Marcelo', 'Milhan', 95917497835)

INSERT INTO Carros(IdCarros, Marca, Modelo, Ano, Preco, Cor, Adicionais)
	VALUES(2, 'Audi', 'A4', 2021, 1000000, 'Preto', 'Vidro Blindado')

INSERT INTO Carros(IdCarros, Marca, Modelo, Ano, Preco, Cor, Adicionais)
	VALUES(3, 'Audi', 'A6', 2020, 1000000, 'Prata', 'Vidro Fosco')

INSERT INTO Contato(IdContato, Telefone, Email)
	VALUES(3, 991131983, 'cliente@gmail.com' )

INSERT INTO Contato(IdContato, Telefone, Email)
	VALUES(4, 991131873, 'clientebrabo@gmail.com' )

INSERT INTO FormaDePagamento(IdFormaDePagamento, Formas)
	VALUES(4, 'Cartão de Crédito')

INSERT INTO FormaDePagamento(IdFormaDePagamento, Formas)
	VALUES(5, 'Boleto')

INSERT INTO CarrosFavoritos(IdCarros, IdCLiente)
	VALUES(2, 1)

-- SELECTS

SELECT * FROM Cliente
	WHERE Nome = 'Caio'

SELECT * FROM Carros

SELECT * FROM Contato
	WHERE Telefone = 991131983

SELECT * FROM FormaDePagamento
	WHERE IdFormaDePagamento = 4
	
SELECT * FROM CarrosFavoritos

-- DELETES

DELETE FROM Cliente
WHERE Nome = 'Caio'

DELETE FROM Carros
WHERE Marca = 'Audi'

DELETE FROM Contato
WHERE Telefone = 991131983

DELETE FROM FormaDePagamento
WHERE IdFormaDePagamento = 4

DELETE FROM CarrosFavoritos
WHERE IdCarros = 5

-- UPDATE

UPDATE Cliente 
SET Nome = 'Anderson'
WHERE CPF = 95917497834

UPDATE Carros 
SET Marca = 'Ferrari'
WHERE Cor = 'Preto'

UPDATE Contato 
SET Telefone = 992564873
WHERE Email = 'cliente@gmail.com'

UPDATE FormaDePagamento 
SET Formas = 'Cheque'
WHERE IdFormaDePagamento = 4

UPDATE CarrosFavoritos 
SET IdCarros = 7
WHERE IdCarros = 2

