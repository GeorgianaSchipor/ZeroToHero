USE Magazin

create view despreProdus
as
select p.IDMagazin, p.DenumireProdus, p.IDCategorie, s.Cantitate
from [dbo].[Produs] p inner join [dbo].[Stoc] s on p.IDProdus=s.ProdusStoc

select * from despreProdus

alter table [dbo].[Stoc]
add PretUnitar float(12)

alter view despreProdus
as
select p.IDMagazin, p.DenumireProdus, p.IDCategorie, sum(s.Cantitate) as 'Cantitate', sum(s.PretUnitar*s.Cantitate) as 'Valoarea Stocului'
from [dbo].[Produs] p inner join [dbo].[Stoc] s on p.IDProdus=s.ProdusStoc
group by p.IdMagazin, p.DenumireProdus, p.IDCategorie

