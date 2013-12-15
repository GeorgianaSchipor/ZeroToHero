USE Magazin
--sa se scrie un query din care sa reiasa pt fiecare magazin 
--care sunt categoriile de produse inexistente in stoc
--(am pp ca nu exista categorii inregistrare, fara produse comercializate)

--varianta 1
declare @counter int = 1;
while @counter<=(select count([IDMagazin]) from [dbo].[Magazin])
begin
	select @counter as NRMagazin, c.IDCategorie as 'Categorii inexistente in magazin', c.DenumireCategorie
	from [dbo].[CategorieProdus] c inner join [dbo].[Produs] p
	on c.IDCategorie=p.IDCategorie
	where p.IDCategorie not in (select IDCategorie 
								from Produs
								where IDMagazin = @counter)
	select @counter += 1
end

--varianta 2
declare @counter int = 1;
while @counter<=(select count([IDMagazin]) from [dbo].[Magazin])
begin
	select @counter as NRMagazin, c.IDCategorie as 'Categorii inexistente in magazin', c.DenumireCategorie
	from [dbo].[CategorieProdus] c left outer join (select * 
													from Produs	
													where IDMagazin = @counter) p
	on c.IDCategorie=p.IDCategorie
	where IDMagazin is null
	select @counter += 1
end

--varianta 3
declare @counter int = 1;
while @counter<=(select count([IDMagazin]) from [dbo].[Magazin])
begin
	select @counter as NRMagazin, IDCategorie as 'Categorii inexistente in magazin'
	from Produs
		EXCEPT 
	select @counter as NRMagazin, IDCategorie
	from Produs
	where IDMagazin = @counter
	select @counter += 1
end

--varianta 4
declare @counter int = 1;
while @counter<=(select count([IDMagazin]) from [dbo].[Magazin])
begin
	select @counter as NRMagazin, IDCategorie as 'Categorii inexistente in magazin'
	from Produs
		INTERSECT
	select @counter as NRMagazin, IDCategorie
	from Produs
	where IDMagazin != @counter
	select @counter += 1
end

--varianta 5
DECLARE @id int, @den nvarchar(30)
DECLARE Magazin_Cursor CURSOR FOR
	SELECT IDMagazin, DenumireMagazin
	FROM [dbo].[Magazin]

OPEN Magazin_Cursor;
FETCH NEXT FROM Magazin_Cursor
INTO @id, @den;
WHILE @@FETCH_STATUS = 0
	BEGIN
		select @id as NRMagazin, @den as DenumireMagazin, c.IDCategorie as 'Categorii inexistente in magazin', c.DenumireCategorie
		from [dbo].[CategorieProdus] c inner join [dbo].[Produs] p
		on c.IDCategorie=p.IDCategorie
		where p.IDCategorie not in (select IDCategorie 
									from Produs
									where IDMagazin = @id)
		FETCH NEXT FROM Magazin_Cursor
		INTO @id, @den;
    END;
CLOSE Magazin_Cursor;
DEALLOCATE Magazin_Cursor;
GO




