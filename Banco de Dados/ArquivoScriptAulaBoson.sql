CREATE DATABASE db_Biblioteca

CREATE TABLE tbl_Livro
(ID_Livro SMALLINT PRIMARY KEY IDENTITY(100,1),
Nome_Livro VARCHAR (50) NOT NULL,
ISBN VARCHAR(30) NOT NULL UNIQUE,
ID_Autor SMALLINT NOT NULL,
Data_Pub DATETIME NOT NULL,
Preco_Livro MONEY NOT NULL)

CREATE TABLE tbl_autores(
ID_Autor SMALLINT PRIMARY KEY,
Nome_Autor VARCHAR(50),
Sobrenome_Autor VARCHAR(50))

CREATE TABLE tbl_editoras(
ID_editora SMALLINT PRIMARY KEY IDENTITY,
Nome_Editora VARCHAR(50) NOT NULL)

--sp_help tbl_editoras

CREATE TABLE tbl_teste_identidade
(ID_Teste SMALLINT PRIMARY KEY IDENTITY,
valor SMALLINT NOT NULL)

INSERT INTO tbl_teste_identidade (valor) VALUES (10)
INSERT INTO tbl_teste_identidade (valor) VALUES (20)
INSERT INTO tbl_teste_identidade (valor) VALUES (30)
INSERT INTO tbl_teste_identidade (valor) VALUES (40)

SELECT * FROM tbl_teste_identidade

ALTER TABLE tbl_Livro DROP COLUMN ID_Autor

ALTER TABLE tbl_Livro
ADD ID_Autor SMALLINT NOT NULL
CONSTRAINT fk_ID_Autor FOREIGN KEY(ID_Autor)
REFERENCES tbl_autores

ALTER TABLE tbl_Livro
ADD ID_editora SMALLINT NOT NULL
CONSTRAINT fk_id_editora FOREIGN KEY(ID_editora)
REFERENCES tbl_editoras

ALTER TABLE tbl_Livro
ALTER COLUMN ID_Autor SMALLINT

DROP TABLE tbl_teste_identidade

INSERT INTO tbl_autores(ID_Autor, Nome_Autor,
Sobrenome_Autor) VALUES(1, 'Daniel', 'Barret')
INSERT INTO tbl_autores(ID_Autor, Nome_Autor,
Sobrenome_Autor) VALUES(2, 'Gerald', 'Carter')
INSERT INTO tbl_autores(ID_Autor, Nome_Autor,
Sobrenome_Autor) VALUES(3, 'Mark', 'Sobell')
INSERT INTO tbl_autores(ID_Autor, Nome_Autor,
Sobrenome_Autor) VALUES(4, 'William', 'Stanek')
INSERT INTO tbl_autores(ID_Autor, Nome_Autor,
Sobrenome_Autor) VALUES(5, 'Richard', 'Blum')


INSERT INTO tbl_editoras(Nome_Editora) VALUES ('Prentice Hall')
INSERT INTO tbl_editoras(Nome_Editora) VALUES ('O Reilly')
INSERT INTO tbl_editoras(Nome_Editora) VALUES ('Microsoft Press')
INSERT INTO tbl_editoras(Nome_Editora) VALUES ('Wiley')

INSERT INTO tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_editora)
VALUES ('Linux Command Line and Shell Scripting', 14383349, '20091221', 88.35, 5, 4)

INSERT INTO tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_editora)
VALUES ('SSH, the Secure Shell', 127658324, '20091221', 48.30, 1, 2)

INSERT INTO tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_editora)
VALUES ('Using Samba', 12456539, '20001221', 42.45, 2, 2) 

INSERT INTO tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_editora)
VALUES ('Livro Sem Autor', 124545547, '20180913', 60.45, null, 2) 

INSERT INTO tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_editora)
VALUES ('Segundo Livro Sem Autor', 12425547, '20180802', 45.45, null, 4) 

--Apagar todos os registros de uma tabela
--TRUNCATE TABLE tbl_Livro

SELECT Nome_Autor FROM tbl_autores
SELECT * FROM tbl_autores
SELECT Nome_Livro FROM tbl_Livro

SELECT Nome_Livro, ID_Autor FROM tbl_Livro
SELECT Nome_autor, Sobrenome_autor FROM tbl_autores

--ASC - Ordem ascendente (crescente)
--DESC - Ordem descendente (inversa)

SELECT * FROM tbl_Livro ORDER BY Nome_Livro
SELECT * FROM tbl_autores ORDER BY Nome_autor DESC

--DISTINCT - Exibir colunas com valores diferentes (esconde os valores iguais)

SELECT DISTINCT ID_Autor FROM tbl_Livro

SELECT * FROM tbl_Livro WHERE ID_Autor = '1'
SELECT ID_Autor FROM tbl_autores WHERE Sobrenome_Autor = 'Stanek'

SELECT * FROM tbl_Livro WHERE ID_Livro > 2 AND ID_Autor < 3
SELECT * FROM tbl_Livro WHERE ID_Livro > 2 OR ID_Autor < 3

-- SINTAXE UPDATE
-- UPDATE tabela SET coluna = valor, coluna = valor WHERE "filtro"

-- Ex. 01:
SELECT * FROM tbl_Livro
UPDATE tbl_Livro SET Preco_Livro = 65.45 WHERE ID_Livro = 102

SELECT * FROM tbl_autores
UPDATE tbl_autores SET Sobrenome_Autor = 'Cartman' WHERE ID_Autor = 2;

UPDATE tbl_Livro SET Preco_Livro = 80.00, Nome_Livro = 'Linux Command' WHERE ID_Livro = 106

--SELECT TOP - Usado para especificar o numero de registro ou o percentual a retornar
SELECT TOP 10 PERCENT Nome_Livro FROM tbl_Livro
SELECT TOP 3 Nome_Livro FROM tbl_Livro

--SQL Alias - Pode-se dar um nome diferente a uma coluna ou tabela em uma consulta
SELECT Nome_Livro AS Livro FROM tbl_Livro
SELECT Nome_Livro AS Livro, ID_Autor AS Autor FROM tbl_Livro

--OPERADOR UNION - Permite combinar duas ou mais declarações SELECT
--Cada declaração SELECT deve ter o mesmo numero de colunas, tipos de dados e ordem das colunas.
SELECT ID_Autor FROM tbl_autores UNION
SELECT ID_Autor FROM tbl_Livro

SELECT ID_Autor FROM tbl_autores UNION ALL
SELECT ID_Autor FROM tbl_Livro

SELECT Nome_Autor FROM tbl_autores UNION
SELECT Nome_Livro FROM tbl_Livro

--SELECT INTO - seleciona dados de uma ou mais tabelas e os insere em uma tabela diferente
--Pode ser usada para criar copias de backup de tabelas

SELECT Nome_Livro, ID_Autor INTO LivroAutor FROM tbl_Livro WHERE ID_Livro > 2
SELECT ID_Livro, Nome_Livro, ISBN INTO Livro_ISBN FROM tbl_Livro WHERE ID_Livro > 2
SELECT * INTO tbl_Livro_backup FROM tbl_Livro
SELECT * FROM LivroAutor
SELECT * FROM Livro_ISBN
SELECT * FROM tbl_Livro_backup

--Funções Agregadas - Funções matematicas
-- Conta a quantidade de registro
SELECT COUNT(*) FROM tbl_autores
SELECT COUNT(Nome_Autor) FROM tbl_autores
-- Traz o valor maximo da coluna
SELECT MAX(Preco_Livro) AS PreçoMaximo FROM tbl_Livro
-- Traz o valor minimo da coluna
SELECT MIN(Preco_Livro) AS PreçoMinimo FROM tbl_Livro
-- Traz a media da coluna
SELECT AVG(Preco_Livro) AS Média FROM tbl_Livro
-- Traz a soma de toda a coluna
SELECT SUM(Preco_Livro) AS PreçoTotal FROM tbl_Livro


--BETWEEN - seleção de intervalos
SELECT * FROM tbl_Livro WHERE Data_Pub BETWEEN '20040517' AND '20100517'
SELECT Nome_Livro AS Livro, Preco_Livro AS Preço FROM tbl_Livro WHERE Preco_Livro BETWEEN 40.00 AND 60.00

--LIKE e NOT LIKE - 
--LIKE - Determina se uma caracteres especifica corresponde a um padrão especificado. Um padrão pode incluir caracteres normais e curingas
--NOT LIKE - Inverte a comparação, verificando se a cadeia de caracteres NÃO corresponde ao padrão especificado.
-- '%' -- Qualquer cadeia de 0 ou mais caracteres
-- '_' -- Sublinhado: qualquer caracter unico
-- '[]' -- Qualquer caracter unico no intervalo ou conjunto especificado ([a-h]; [aeiou])
-- '[^]' -- Qualquer caracter único que não esteja no intervalo ou conjunto especificado ([a-h]; [aeiou])
-- SELECIONAR TODOS OS LIVROS QUE COMEÇAM COM A LETRA S
SELECT Nome_Livro FROM tbl_Livro WHERE Nome_Livro LIKE 'S%'
-- SELECIONAR TODOS OS LIVROS QUE TERMINA COM A LETRA G
SELECT Nome_Livro FROM tbl_Livro WHERE Nome_Livro LIKE 'S%'
-- SELECIONA TODOS OS LIVROS QUE A SEGUNDA LETRA É i
SELECT Nome_Livro FROM tbl_Livro WHERE Nome_Livro LIKE '_i%'
-- SELECIONA TODOS OS LIVROS QUE COMEÇA OU S OU COM L
SELECT Nome_Livro FROM tbl_Livro WHERE Nome_Livro LIKE '[SL]%'
-- SELECIONA TODOS OS LIVROS QUE TERMINA COM g OU COM l
SELECT Nome_Livro FROM tbl_Livro WHERE Nome_Livro LIKE '%[gl]'
-- SELECIONA TODOS OS LIVROS COM A SEGUNDA LETRA i OU S
SELECT Nome_Livro FROM tbl_Livro WHERE Nome_Livro LIKE '_[iS]%'
-- SELECIONA TODOS OS LIVROS QUE A SEGUNDA LETRA É i E A QUINTA É x
SELECT Nome_Livro FROM tbl_Livro WHERE Nome_Livro LIKE '_i__x%'
-- SELECIONA TODOS OS LIVROS QUE NÃO COMEÇA COM A LETRA L
SELECT Nome_Livro FROM tbl_Livro WHERE Nome_Livro NOT LIKE 'L%'


-- JOINS - JOIN é usado para obter dados provenientes de duas ou mais tabelas, baseado em um relacionamento entre colunas nestas tabelas.
--INNER JOIN: Retorna linhas quando houver pelo menos uma correspondencia em ambas as tabelas.

SELECT * FROM tbl_Livro INNER JOIN tbl_autores ON tbl_Livro.ID_Autor = tbl_autores.ID_Autor
SELECT tbl_Livro.Nome_Livro, tbl_Livro.ISBN, tbl_autores.Nome_Autor FROM tbl_Livro
INNER JOIN tbl_autores ON tbl_Livro.ID_Autor = tbl_autores.ID_Autor

SELECT l.Nome_Livro, E.Nome_editora FROM tbl_Livro AS L
INNER JOIN tbl_editoras AS E ON L.ID_editora = E.ID_Editora

--OUTER JOIN: Retorna linhas mesmo quando não houver pelo menos uma correspondencia em uma das tabelas(ou ambas).
--O OUTER JOIN divide-se em LEFT JOIN, RIGHT JOIN e FULL JOIN
--LEFT JOIN: Retorna todas as linhas da tabela á esquerda, mesmo se não houver nenhuma correspondencia na tabela a direita
--RIGHT JOIN: Retorna todas as linhas da tabela á direita, mesmo se não houver nenhuma correspondencia na tabela á esquerda.
--FULL JOIN: Retorna linhas quando houver uma correspondencia em qualquer uma das tabelas. É uma combinação de LEFT e RIGHT JOINS

SELECT * FROM tbl_Livro
SELECT * FROM tbl_Livro INNER JOIN tbl_autores ON tbl_Livro.ID_Autor = tbl_autores.ID_Autor -- NÃO TRAZ LIVROS SEM AUTOR
SELECT * FROM tbl_Livro LEFT JOIN tbl_autores ON tbl_Livro.ID_Autor = tbl_autores.ID_Autor
-- Excluindo correspondencias
SELECT * FROM tbl_Livro LEFT JOIN tbl_autores ON tbl_Livro.ID_Autor = tbl_autores.ID_Autor WHERE tbl_autores.ID_Autor IS NULL

SELECT * FROM tbl_autores RIGHT JOIN tbl_Livro ON tbl_Livro.ID_Autor = tbl_autores.ID_Autor 
--WHERE tbl_autores.ID_Autor IS NULL

-- FULL JOIN -- traz todos os dados das tabelas
SELECT Li.Nome_Livro, Li.ID_Autor, Au.Nome_Autor FROM tbl_Livro AS Li
FULL JOIN tbl_autores AS Au ON Li.ID_Autor = Au.ID_Autor
-- FULL JOIN -- excluindo correspondencias
SELECT Li.Nome_Livro, Li.ID_Autor, Au.Nome_Autor FROM tbl_Livro AS Li
FULL JOIN tbl_autores AS Au ON Li.ID_Autor = Au.ID_Autor 
WHERE Li.ID_Autor IS NULL OR Au.ID_Autor IS NULL

--IN - Filtro de Multiplas Condições
--Determina se um determinado valor corresponde a qualquer valor em uma subconsulta ou lista.
--Retorna sempre TRUE ou FALSE.
--Pode substituir o OR em queries com mais de uma condição.

SELECT * FROM tbl_Livro WHERE ID_Autor IN (1, 2)
SELECT * FROM tbl_Livro WHERE ID_Autor NOT IN (1, 2)

use teste

CREATE TABLE Produtos (codProduto smallint,
NomeProduto varchar(20), Preco money, 
Quant smallint, Total as (Preco * Quant))

SELECT * FROM Produtos
INSERT INTO Produtos VALUES (1, 'Mouse', 15.00, 2)
INSERT INTO Produtos VALUES (2, 'Teclado', 18.00, 1)
INSERT INTO Produtos VALUES (3, 'Fones', 25.00, 1)
INSERT INTO Produtos VALUES (4, 'Pendrive', 25.00, 3)
INSERT INTO Produtos VALUES (5, 'SD card', 29.00, 2)
INSERT INTO Produtos VALUES (6, 'DVD-R', 1.30, 12)

SELECT SUM(Total) FROM Produtos

--INDICES - Permitem que as aplicações de BD encontrem os dados mais rapidamente sem ter de ler a tabela toda.
--Usuarios não veem os indices
--Apenas crie indices em tabelas que recebam muitas consultas;
--tabelas indexadas levam mais tempo para serem atualizadas.

use db_Biblioteca
SELECT * FROM tbl_Livro
CREATE INDEX indice_nome_livro ON tbl_Livro(Nome_Livro)

--REGRAS - As regras são configurações que permitem especificar como  determinados parametros do BD devem
--se comportar, como por exemplo, limitar faixas de valores em colunas, ou especificar valores invalidos para registros.

SELECT * FROM tbl_Livro
CREATE RULE rl_preco AS @VALOR > 10.00

--SP = STORED PROCEDURE
EXECUTE SP_BINDRULE rl_preco, 'tbl_Livro.Preco_Livro'
SELECT * FROM tbl_Livro
UPDATE tbl_Livro SET Preco_Livro = 50.00 WHERE ID_Livro = 109
UPDATE tbl_Livro SET Preco_Livro = 10.90 WHERE ID_Livro = 109

use teste
-- Backup do Banco de Dados
BACKUP DATABASE teste
TO DISK = 'C:\SQL\teste.bak';
GO

SELECT * FROM Produtos

use db_Biblioteca
SELECT * FROM tbl_Livro
-- Concatenação de Strings
-- É possivel concatenar strings usando-se operador de concatenação +
-- Sintaxe:
-- string1 | coluna + string2 | coluna
-- Exemplos:
SELECT 'Fábio ' + 'da Bóson Treinamentos' AS Bóson
SELECT Nome_autor + ' ' + Sobrenome_autor AS 'Nome Completo' FROM tbl_autores
SELECT 'Eu gosto do livro ' + Nome_Livro AS 'Meu Livro' FROM tbl_Livro WHERE ID_Autor = 2

--Collation ("Colação" / "Agrupamento")
--Trata-se da codificação dos caracteres em uma ordem padrão.
--Muitos sistemas de colação são baseados em ordem numérica ou alfabética.
--A colação usada pelos bancos de dados é configurada durante a instalação do sistema.
--collation-charts.org - Site com cartas de agrupamento em varios alfabetos e idiomas
--Para ver as Opções de colação disponiveis
SELECT * FROM fn_helpcollations()

-- Para ver o esquema de colação usada pelo servidor
SELECT SERVERPROPERTY('Collation') AS Colação_Usada

-- Alterar o esquema de colação de um banco de dados
ALTER DATABASE teste COLLATE Greek_CI_AI
-- Verificar o esquema de colação de um banco de dados
SELECT DATABASEPROPERTYEX('db_Biblioteca', 'Collation') AS Colação

-- nivel de coluna
SELECT * FROM tbl_Livro ORDER BY Nome_Livro
COLLATE Icelandic_CI_AI


-- Cláusula WITH TIES - Sempre utilizada com order by
-- Verifica se existe um outro registro com o mesmo valor do ultimo registro da coluna de ordenação
SELECT TOP(3) WITH TIES nome_time, pontos FROM tbl_times ORDER BY Pontos DESC

--Views
--Uma exibição(Visão) é uma tabela virtual baseada no conjunto de resultados de uma consulta SQL.
--Contem linhas e colunas como uma tabela real, e pode receber comandos como declarações JOIN, WHERE e funções como uma tabela normal.
--Mostra sempre resultados de dados atualizados, pois o motor do BD recria os dados toda vez que o usuario consulta ela

go
CREATE VIEW vw_LivrosAutores AS SELECT tbl_Livro.Nome_Livro AS Livro, tbl_autores.Nome_Autor AS Autor FROM tbl_Livro INNER JOIN tbl_autores ON tbl_Livro.ID_Autor = tbl_autores.ID_Autor
go
SELECT Livro, Autor FROM vw_LivrosAutores
WHERE Livro LIKE 'S%'
go
ALTER VIEW vw_LivrosAutores AS SELECT tbl_Livro.Nome_Livro AS Livro, tbl_autores.Nome_Autor AS Autor, Preco_Livro AS Valor FROM tbl_Livro INNER JOIN tbl_autores ON tbl_Livro.ID_Autor = tbl_autores.ID_Autor
go

SELECT * FROM vw_LivrosAutores
--DELETAR VIEW
DROP VIEW vw_LivrosAutores

--Subconsultas
-- Uma subconsulta (subquery) é uma declaração SQL embutida em uma consulta externa.
--A subconsulta fornece uma resposta á consulta externa na forma de um valor escalar, lista de valores, ou conjunto de dados,
--equivalentes a uma expressão, lista ou tabela para a consulta externa.

SELECT (SELECT 'Fábio') AS Subconsulta;

SELECT Resultado.Cliente, SUM(Resultado.Total) AS Total
FROM
(SELECT CL.Nome_Cliente AS Cliente, PR.Preco_Produto * CO.Quantidade AS Total
FROM Clientes AS CL
INNER JOIN Compras AS CO
ON CL.ID_Cliente = CO.ID_Cliente
INNER JOIN Produtos AS PR
ON CO.ID_Produto = PR.ID_Produto) AS Resultado
GROUP BY Resultado.Cliente
ORDER BY Total

--CTE - Common Table Expression / Expressão de Tabela Comum
--Variação sintatica de uma subconsulta, similar a uma exibição (View).
--Pode ser acessada multiplas vezes dentro da consulta principal, como se fosse uma exibição ou tabela

WITH ConsultaCTE(Cliente, Total)
AS(SELECT CL.Nome_Cliente AS Cliente, 
PR.Preco_Produto * CO.Quantidade AS Total
FROM Clientes AS CL
INNER JOIN Compras AS CO
ON CL.ID_Cliente = CO.ID_Cliente
INNER JOIN Produtos AS PR
ON CO.ID_Produto = PR.ID_Produto)

SELECT Cliente, SUM(Total) AS ValorTotal
FROM ConsultaCTE 
GROUP BY Cliente
ORDER BY ValorTotal

--Variaveis
--As variaveis podem ser declaradas no corpo de um batch ou procedimento.
--Pode-se atribuir-lhes valores usando-se declarações SET ou SELECT.
--As variaveis são inicializadas por padrão com NULL

--Obs. Usa-se a palavra DECLARE apenas uma vez para todas as variaveis.
go
DECLARE @valor INT,
		@texto VARCHAR(40),
		@data_nasc DATE,
		@nada MONEY
-- Atribuir valores com SET
SET @valor = 50
SET @texto = 'Bóson'
SET @data_nasc = GETDATE()

SELECT @valor AS Valor, @texto AS Texto, @data_nasc AS 'Data de Nascimento', @nada AS Salário

-- Atribuir valor com SELECT
DECLARE @livro VARCHAR(30)
SELECT @livro = nome_livro
FROM tbl_Livro where ID_Livro = 101

SELECT @livro AS 'Nome do Livro'

-- Exemplo com calculo
DECLARE @preco MONEY, @quantidade INT, @nome VARCHAR(30)
SET @quantidade = 5

SELECT @preco = Preco_Livro, @nome = Nome_Livro
FROM tbl_Livro WHERE ID_Livro = 101

SELECT @nome AS 'Nome do Livro',
@preco * @quantidade AS 'Preço dos Livros'

-- Conversão de Dados
--Podemos converter expressões de um tipo de dados em outro no SQL usando as funções:
--CAST
--CONVERT

-- CAST
SELECT 'O preço do livro ' + Nome_Livro + ' é de R$ ' + 
CAST(Preco_Livro AS VARCHAR(6)) AS ITEM FROM tbl_Livro WHERE ID_Autor = 2

-- CONVERT
SELECT 'O preço do livro ' + Nome_Livro + ' é de R$ ' + 
CONVERT(VARCHAR(6), Preco_Livro) AS ITEM FROM tbl_Livro

-- CONVERT COM ESTILO
--Codigo do Estilo	Padrao				Representação
--101					EUA					mm/dd/aaaa
--102					ANSI				aaaa.mm.dd
--103					Britanico/Frances	dd/mm/aaaa
--112					ISO					aaaammdd
--109					Padrão				mes dd aaaa

SELECT 'A data de publicação ' + 
CONVERT(VARCHAR(18), Data_Pub, 103)
FROM tbl_Livro WHERE ID_Livro = 102

--Condicional IF / ELSE
--É possivel realizar testes condicionais em declarações SQL usando-se a estrutura IF / ELSE.
-- Para executar blocos de codigo, use as palavras BEGIN e END

DECLARE @numero INT,
		@texto VARCHAR(10)

SET @numero = 20
SET @texto = 'Ana'

IF @numero = 20
	SELECT 'Número correto!'
IF @texto = 'Fábio'
	BEGIN
		SET @numero = 30
		SELECT @numero
	END;
ELSE
	BEGIN
		SET @numero = 40
		SELECT 'Número incorreto!'
	END;

DECLARE @nome VARCHAR(30),
		@media REAL,
		@resultado VARCHAR(10)

SELECT 
	@nome = nome_aluno,
	@media = (tbl_alunos.nota1 + tbl_alunos.nota2 + tbl_alunos.nota3 + tbl_alunos.nota4) / 4.00
FROM tbl_alunos
WHERE nome_aluno = 'Fábio'
	IF @media >= 7.00
		BEGIN
			SELECT @resultado = 'Aprovado';
		END;
	ELSE
		BEGIN
			SELECT @resultado = 'Reprovado';
		END;
	SELECT ' O aluno ' + @nome + ' está ' + @resultado + ' com média ' + CAST(@MEDIA AS VARCHAR);

GO
--WHILE - é usado para executar codigo enquanto uma condição for verdadeira
--ele executa apenas um comando; se for necessario executar um bloco de comandos, use BEGIN / END

DECLARE @valor INT
SET @valor = 0

WHILE @valor < 10
	BEGIN
		PRINT 'Número: ' + CAST(@valor AS VARCHAR(2))
		SET @valor = @valor + 1
	END;

DECLARE @codigo INT
SET @codigo = 106

WHILE @codigo < 109
	BEGIN
		SELECT ID_Livro AS ID, Nome_livro AS Livro, Preco_Livro AS Preço FROM tbl_Livro WHERE ID_Livro = @codigo
		SET @codigo = @codigo + 1
	END;

--STORED PROCEDURES - São lotes (batches) de declarações SQL que podem ser executadas como uma subrotina.
--Permitem centralizar a logica de acesso aos dados em um unico local, facilitando a manutenção e otimizaçao de codigo.
--Tambem é possivel ajustar permissões de acesso aos usuarios, definindo quem pode ou não executa-las
go
CREATE PROCEDURE teste
AS
SELECT 'Bóson Treinamentos' AS Nome

EXEC teste

go
CREATE PROCEDURE p_LivroValor
AS
SELECT Nome_Livro, Preco_livro FROM tbl_Livro

EXEC p_LivroValor

--Visualizar conteudo de SP
EXEC sp_helptext p_LivroValor

GO
--Criptografar Stored Procedure
CREATE PROCEDURE p_LivroISBN
WITH ENCRYPTION
AS
SELECT Nome_Livro, ISBN FROM tbl_Livro
EXEC p_LivroISBN
EXEC sp_helptext p_LivroISBN

GO
-- Modificar Stored Procedure
ALTER PROCEDURE teste (@par1 AS INT)
AS
SELECT @par1

EXEC teste 25

GO
ALTER PROCEDURE p_LivroValor(@ID SMALLINT)
AS
SELECT Nome_Livro AS Livro, Preco_Livro AS Preço
FROM tbl_Livro WHERE ID_Livro = @ID

EXEC p_LivroValor 106

GO
ALTER PROCEDURE teste(@par1 AS INT, @par2 AS VARCHAR(20))
AS
SELECT @par1
SELECT @par2

-- Por posição
EXEC teste 26, 'Laranja' 

-- Por nome dos parametros
EXEC teste @par2 = 'Abacate', @par1 = 30

GO
ALTER PROCEDURE p_LivroValor(@ID SMALLINT, @Preco MONEY)
AS
SELECT Nome_Livro AS Livro, Preco_Livro AS Preço
FROM tbl_Livro
WHERE ID_Livro > @ID AND Preco_Livro > @Preco

EXEC p_LivroValor @ID = 101, @Preco = 60

GO
ALTER PROCEDURE p_LivroValor(@Quantidade SMALLINT, @ID SMALLINT)
AS
SELECT Nome_Livro AS Livro, Preco_Livro * @Quantidade AS Preço
FROM tbl_Livro WHERE ID_Livro = @ID

EXEC p_LivroValor @ID = 102, @Quantidade = 10

go
CREATE PROCEDURE p_insere_editora(@nome VARCHAR(50))
AS
INSERT INTO tbl_editoras(Nome_Editora) VALUES (@nome)

EXEC p_insere_editora @nome = 'Ediouro'

SELECT * FROM tbl_editoras

go
CREATE PROCEDURE p_teste_valor_padrao(@param1 INT, @param2 VARCHAR(20) = 'Valor Padrão!')
AS
SELECT 'Valor do parametro 1: ' + CAST(@param1 AS VARCHAR)
SELECT 'Valor do parametro 2: ' + @param2

EXEC p_teste_valor_padrao 30
EXEC p_teste_valor_padrao @param1 = 40, @param2 = 'Valor Modificado'

go
--Parametros de Saida
--Os parametros de Saida habilitam um procedimento armazenado a retornar dados ao procedimento chamador.
--Usamos a palavra-chave OUTPUT quando o procedimento é criado, e tambem quando é chamado.
--No procedimento armazenado, o parametro de saida aparece como uma variavel local; No procedimento chamador, uma variavel
--deve ser criada para receber o parametro de saida

ALTER PROCEDURE teste (@par1 AS INT OUTPUT)
AS
SELECT @par1 * 2
RETURN

DECLARE @valor AS INT = 15
EXEC teste @valor OUTPUT
PRINT @valor

go
--Comando RETURN
--O comando RETURN termina incondicionalmente o procedimento e retorna um valor inteiro ao chamador
--Pode ser usado para retornar status de sucesso ou falha do procedimento
ALTER PROCEDURE p_LivroValor(@Quantidade SMALLINT, @Cod SMALLINT = -10, @ID SMALLINT)
AS
-- Não retorna as linhas que foram afetadas
SET NOCOUNT ON
IF @ID >= 100
	BEGIN
		SELECT Nome_Livro AS Livro, Preco_Livro * @Quantidade AS Preço
		FROM tbl_Livro WHERE ID_Livro = @ID
		RETURN 1
	END
ELSE
	RETURN @Cod

DECLARE @Codigo INT
EXEC @Codigo = p_LivroValor @ID = 102, @Quantidade = 5
PRINT @Codigo

--User-Defined Functions
--Funções Definidas pelo Usuario
--Podemos criar funções (UDFs) para realizar diversas tarefas nos bancos de dados, tais como:
-- Inserir logica complexa em uma consulta
-- Criar novas funções para expressões complexas
-- Substituir exibições com a vantagem de aceitar parametros
-- Tipos UDFs: Funções Escalares, Valor de Tabela Embutida, Valor de Tabela Multi-instruções

--Funções Escalares - Retorna apenas um unico valor especifico.
--calcula media das notas dos alunos, com peso 2 na nota4

go
CREATE FUNCTION nota_media(@nome VARCHAR(30))
RETURNS REAL
AS
	BEGIN
		DECLARE @media REAL
		SELECT @media = (nota1 + nota2 + nota3 + nota4 * 2) / 5.00
		FROM tbl_alunos WHERE nome_aluno = @nome
		RETURN @media
	END
GO

SELECT dbo.nota_media('Fábio')

-- Função com Valor de Tabela Embutida (Inline)
--São similares a uma exibição, porem permitem utilizar parametros. Retornam um conjunto completo de dados.
go

CREATE FUNCTION retorna_itens(@valor REAL)
RETURNS Table
AS
RETURN (
	SELECT L.Nome_Livro, A.Nome_Autor, E.Nome_Editora
	FROM tbl_Livro AS L
	INNER JOIN tbl_autores AS A
	ON L.ID_Autor = A.ID_Autor
	INNER JOIN tbl_editoras AS E
	ON L.ID_editora = E.ID_Editora
	WHERE L.Preco_Livro > @valor)

go

SELECT Nome_Livro, Nome_Autor FROM retorna_itens(40.00)

go

--Função com Valor de Tabela com Varias Instruções
--Combina a habilidade da função escalar de conter codigos complexos com a habilidade da função com valor de tabela
--de retornar um resultset.
--Este tipo de função cria uma variavel do tipo table e a popula a partir do codigo. Essa taela é então passada de volta a função,
--de modo que possa ser usada em declarações SELECT

CREATE FUNCTION multi_tabela()
RETURNS @valores Table
	(Nome_Livro VARCHAR(50),
	Data_Pub DATETIME, Nome_Editora VARCHAR(50),
	Preco_Livro MONEY)
AS
BEGIN
	INSERT @valores (Nome_Livro, Data_Pub, Nome_Editora, Preco_Livro)
		SELECT L.Nome_Livro, L.Data_Pub, E.Nome_Editora, L.Preco_Livro
		FROM tbl_Livro AS L
		INNER JOIN tbl_editoras AS E
		ON L.ID_editora = E.ID_Editora
	RETURN
END

SELECT * FROM multi_tabela()

go

--Triggers
--Um Trigger (Gatilho) é um tipo especial de SP que é executada automaticamente quando um usuario
--realiza uma operação de modificação de dados em uma tabela especificada.
--Dispara Trigger:
--INSERT
--UPDATE
--DELETE

--Triggers DML
--Os Triggers não são executados diretamente;
--disparam apenas em resposta a eventos como INSERT, UPDATE, DELETE em uma tabela
--No SQL Server, os triggers disparam uma vez para cada operação de modificação - e não uma vez por linha afetada

--Modos de disparo de um Trigger
--After - O codigo presente no trigger é executado apos todas as ações terem sido completadas na tabela especificada

--Instead Of - O codigo presente no trigger é executado no lugar da operação que causou seu disparo.
