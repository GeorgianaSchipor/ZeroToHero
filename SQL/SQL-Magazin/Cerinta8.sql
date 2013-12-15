CREATE TRIGGER ActualizareStocuriLaIntrare
   ON  [dbo].[Intrari]
   AFTER insert
AS 
BEGIN
	DECLARE @Cant int, @Prod int, @Mag int, @Pret float(12) 
	SELECT @Cant = (SELECT Cantitate FROM INSERTED)
	SELECT @Prod = (SELECT ProdusIntrare FROM INSERTED)
	SELECT @Mag = (SELECT MagazinIntrare FROM INSERTED)
	--SELECT @Pret= (SELECT PretUnitarIntrare FROM INSERTED)
	--pretul in tabela stoc va fi initializat cu pretul recomandat (cel din tabela Produs) 
	--si actualizat mereu cu ultimul pret cu care produsul a intrat

	UPDATE [dbo].[Stoc] 
	SET Cantitate=Cantitate+@Cant -- AND PretUnitar=@pret 
	WHERE ProdusStoc=@Prod AND MagazinStoc=@Mag
END
GO

CREATE TRIGGER ActualizareStocuriLaIesire
   ON  [dbo].[Intrari]
   AFTER insert
AS 
BEGIN
	DECLARE @Cant int, @Prod int, @Mag int
	SELECT @Cant = (SELECT Cantitate FROM INSERTED)
	SELECT @Prod = (SELECT ProdusIntrare FROM INSERTED)
	SELECT @Mag = (SELECT MagazinIntrare FROM INSERTED)

	UPDATE [dbo].[Stoc] 
	SET Cantitate=Cantitate-@Cant 
	WHERE ProdusStoc=@Prod AND MagazinStoc=@Mag
END
GO