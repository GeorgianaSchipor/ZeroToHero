USE Magazin
----Cerinta sase:
----Minim: sa se scrie o procedura care introduce produse in stoc (insereaza informatii in tabela Intrari)
----extra: realizati un script care apeleaza procedura 
----Hints: CREATE, INSERT, DECLARE

create procedure addIntrari
(@cant int, @pret float(12), @data datetime, @IDP int, @IDM int)
as
begin 
	insert into [dbo].[Intrari]
	values(@cant, @pret, @data, @IDP, @IDM)
end

--apelare procedura

DECLARE 
@cant as int = 50,
@pret as float(12) = 7,
@data as datetime = getdate(),
@IDP as int = 1,
@IDM as int = 1

exec addIntrari @cant, @pret, @data, @IDP, @IDM

exec addIntrari 20, 14, @data , 2, 1

exec addIntrari 100, 3, @data, 3, 2 

select* from [dbo].[Intrari]

