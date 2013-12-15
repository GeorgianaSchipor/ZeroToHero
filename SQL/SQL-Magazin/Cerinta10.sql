--sa se realizeze o procedura stocata care imi permite sa afisez evolutia cantitativa (cantitate) si valorica (pret*cantitate) a intrarilor pe ultimele n zile astfel
--magazin, data, produs, cantitate, valoare

CREATE PROCEDURE Evolutie(@n int)
AS
BEGIN
	DECLARE @counter int = 0 
	WHILE @counter <  @n
	BEGIN
		SELECT [MagazinIntrare], [DataIntrare], [ProdusIntrare], SUM([Cantitate]) AS 'Cantitate Totala', SUM([PretUnitarIntrare]*[Cantitate]) AS Valoare
		FROM [dbo].[Intrari]
		WHERE [DataIntrare] = CONVERT(date, (GETDATE() - @counter))
		GROUP BY [DataIntrare] ,[MagazinIntrare], [ProdusIntrare]

		select @counter += 1
	END
END
GO

exec Evolutie 3

-- + bonus
CREATE FUNCTION Evol 
(	
	@n as int = 0
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT [MagazinIntrare], [DataIntrare], [ProdusIntrare], SUM([Cantitate]) AS 'Cantitate Totala', SUM([PretUnitarIntrare]*[Cantitate]) AS Valoare
	FROM [dbo].[Intrari]
	WHERE [DataIntrare] = CONVERT(date, (GETDATE() - @n))
	GROUP BY [DataIntrare] ,[MagazinIntrare], [ProdusIntrare]
)

CREATE PROCEDURE Evolutia(@n int)
AS
BEGIN
	DECLARE @counter int = 0 
	WHILE @counter <  @n
	BEGIN
		SELECT *
		FROM Evol(@counter)
		
		select @counter += 1
	END
END
GO

exec Evolutia 3