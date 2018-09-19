SELECT C.NomeCliente, COUNT(VI.IdProduto) AS Quantidade 
	FROM VendaItem AS VI
	INNER JOIN Venda AS V
	ON VI.IdVenda = V.IdVenda
	INNER JOIN Cliente AS C
	ON V.IdCliente = C.IdCliente
	WHERE DATEPART(YY, V.DataVenda) = 2018
	GROUP BY C.NomeCliente, VI.IdProduto
	
	
SELECT * FROM Cliente WHERE NomeCliente = 'Josiel Alves de Matos'
SELECT * FROM Venda WHERE IdCliente = 27
SELECT * FROM VendaItem WHERE IdVenda = 77 or IdVenda = 79

INSERT INTO Venda VALUES (27, '21/05/2017 13:15:20', '22/05/2017 13:15:20')
INSERT INTO VendaItem VALUES(79, 2, 3)
INSERT INTO VendaItem VALUES(78, 3, 3)