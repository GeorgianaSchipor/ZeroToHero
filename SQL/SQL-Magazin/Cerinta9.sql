USE Magazin
-- sa se afiseze ce produse au intrat in ultimele 10 zile in stocul fiecarui magazin
--varianta 1
DECLARE @id int, @den nvarchar(30)
DECLARE Magazin_Cursor CURSOR FOR
SELECT IDMagazin, DenumireMagazin
FROM [dbo].[Magazin]

OPEN Magazin_Cursor;
FETCH NEXT FROM Magazin_Cursor
INTO @id, @den;
WHILE @@FETCH_STATUS = 0
	BEGIN
		Select i.MagazinIntrare, p.DenumireProdus
		From  [dbo].[Intrari] i INNER JOIN [dbo].[Produs] p
		On p.IDProdus=i.ProdusIntrare
		Where MagazinIntrare = @id AND i.DataIntrare between (GETDATE() - 10) AND GETDATE() 
		FETCH NEXT FROM Magazin_Cursor
		INTO @id, @den;
    END;
CLOSE Magazin_Cursor;
DEALLOCATE Magazin_Cursor;
GO

--varianta 2
Select i.MagazinIntrare AS 'Magazin', p.DenumireProdus
From  [dbo].[Intrari] i INNER JOIN [dbo].[Produs] p
On p.IDProdus=i.ProdusIntrare
Where i.DataIntrare between (GETDATE() - 10) AND GETDATE() 
Order by i.MagazinIntrare


--varianta 3
declare @azi date = convert(date,sysdatetime());
declare @counter int = 0;
while @counter<=9
begin
	Select i.MagazinIntrare, p.DenumireProdus
	From [dbo].[Intrari] i inner join [dbo].[Produs] p on i. ProdusIntrare = p.IDProdus 
	where day(DataIntrare) = day(@azi) - @counter
	group by i.MagazinIntrare, p.DenumireProdus

	select @counter += 1
end

-- sa se afiseze ce produse au iesit in ultimele 10 zile in stocul fiecarui magazin
--varianta 1
DECLARE @id int, @den nvarchar(30)
DECLARE Magazin_Cursor CURSOR FOR
SELECT IDMagazin, DenumireMagazin
FROM [dbo].[Magazin]

OPEN Magazin_Cursor;
FETCH NEXT FROM Magazin_Cursor
INTO @id, @den;
WHILE @@FETCH_STATUS = 0
	BEGIN
		Select i.MagazinIesire, p.DenumireProdus
		From  [dbo].[Iesiri] i INNER JOIN [dbo].[Produs] p
		On p.IDProdus=i.ProdusIesire
		Where MagazinIesire = @id AND i.DataIesire between (GETDATE() - 10) AND GETDATE() 
		FETCH NEXT FROM Magazin_Cursor
		INTO @id, @den;
    END;
CLOSE Magazin_Cursor;
DEALLOCATE Magazin_Cursor;
GO

--varianta 2
Select i.MagazinIesire AS 'Magazin', p.DenumireProdus
From  [dbo].[Iesiri] i INNER JOIN [dbo].[Produs] p
On p.IDProdus=i.ProdusIesire
Where i.DataIesire between (GETDATE() - 10) AND GETDATE() 
Order by i.MagazinIesire

--varianta 3
declare @azi date = convert(date,sysdatetime());
declare @counter int = 0;
while @counter<=9
begin
	Select i.MagazinIesire, p.DenumireProdus
	From [dbo].[Iesiri] i inner join [dbo].[Produs] p on i. ProdusIesire = p.IDProdus 
	where day(DataIesire) = day(@azi) - @counter
	group by i.MagazinIesire, p.DenumireProdus

	select @counter += 1
end