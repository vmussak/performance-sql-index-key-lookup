--CRIANDO TABELA
CREATE TABLE Cliente (
	Id INT IDENTITY(1,1) NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Sobrenome VARCHAR(50) NOT NULL,
	Email VARCHAR(200) NOT NULL,
	CONSTRAINT Cliente_PK PRIMARY KEY (Id)
)

--POPULANDO TABELA
DECLARE @Contador INT = 1000000
WHILE @Contador > 0
BEGIN

	INSERT INTO Cliente(Nome, Sobrenome, Email)
	VALUES (
		SUBSTRING(REPLACE(CONVERT(VARCHAR(250),NEWID()), '-', ''),1,15),
		SUBSTRING(REPLACE(CONVERT(VARCHAR(250),NEWID()), '-', ''),1,15),
		LOWER(SUBSTRING(REPLACE(CONVERT(VARCHAR(250),NEWID()), '-', ''),1,30)) + '@email.com'
	)

	SET @Contador = @Contador - 1

END

--VERIFICANDO TABELA
SELECT COUNT(*) AS QuantidadeRegistros FROM Cliente
SELECT TOP 10 * FROM Cliente

--ATUALIZANDO PARA FINS DE DIDÁTICA
UPDATE Cliente 
	SET Nome = 'Vinicius',
		Sobrenome = 'Mussak',
		Email = 'vinicius.mussak@outlook.com'
	WHERE Id = 333123

SELECT	Id,
		Nome,
		Sobrenome,
		Email
	FROM Cliente
	WHERE Email = 'vinicius.mussak@outlook.com'

CREATE INDEX IDX_ClienteEmail
ON Cliente(Email)

CREATE INDEX IDX_ClienteEmail
ON Cliente(Email)
INCLUDE (Nome, Sobrenome)
WITH (DROP_EXISTING = ON)