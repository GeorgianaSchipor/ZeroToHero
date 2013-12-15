USE Magazin

CREATE TABLE CategorieProdus
(
IDCategorie int NOT NULL, 
DenumireCategorie nvarchar(30) NOT NULL, 
DescriereCategorie nvarchar(max) 
)
ALTER TABLE CategorieProdus
ADD CONSTRAINT pk_IDCategorie primary key (IDCategorie) 
GO

CREATE TABLE Magazin
(
IDMagazin int NOT NULL,
DenumireMagazin nvarchar(30) NOT NULL,
Adresa nvarchar(max),
Oras nvarchar(20)
)
ALTER TABLE Magazin
ADD CONSTRAINT pk_IDMagazin primary key (IDMagazin)
GO

CREATE TABLE Produs
(
IDProdus int CONSTRAINT pk_IDProdus primary key(IDProdus),
DenumireProdus nvarchar(30) NOT NULL,
IDCategorie int NOT NULL,
IDMagazin int NOT NULL,
DescriereProdus nvarchar(max),  
PretUnitarRecomandat float(12)
)
ALTER TABLE Produs
ADD CONSTRAINT fk_IDCategorie foreign key(IDCategorie) 
REFERENCES CategorieProdus(IDCategorie)
GO

CREATE TABLE Stoc
(
Cantitate int,
ProdusStoc int, 
MagazinStoc int
)
ALTER TABLE Stoc
ADD CONSTRAINT fk_ProdusStoc foreign key(ProdusStoc) 
REFERENCES Produs(IDProdus)
ALTER TABLE Stoc
ADD CONSTRAINT fk_MagazinStoc foreign key(MagazinStoc) 
REFERENCES Magazin(IDMagazin)
GO

CREATE TABLE Intrari
(
IDIntrare int IDENTITY(1,1) primary key,
Cantitate int,
PretUnitarIntrare float(12),
DataIntrare datetime NOT NULL,
ProdusIntrare int,
MagazinIntrare int
)
ALTER TABLE Intrari
ADD CONSTRAINT fk_ProdusIntrare foreign key(ProdusIntrare) 
REFERENCES Produs(IDProdus)
ALTER TABLE Intrari
ADD CONSTRAINT fk_MagazinIntrare foreign key(MagazinIntrare) 
REFERENCES Magazin(IDMagazin)
GO

CREATE TABLE Iesiri
(
IDIesire int IDENTITY(1,1) primary key,
Cantitate int,
PretUnitarIesire float(12),
DataIesire datetime NOT NULL,
ProdusIesire int,
MagazinIesire int
)
ALTER TABLE Iesiri
ADD CONSTRAINT fk_ProdusIesire foreign key(ProdusIesire) 
REFERENCES Produs(IDProdus)
ALTER TABLE Iesiri
ADD CONSTRAINT fk_MagazinIesire foreign key(MagazinIesire) 
REFERENCES Magazin(IDMagazin)
GO

CREATE TRIGGER PopulareStoc
   ON  [dbo].[Produs]
   AFTER insert
AS 
BEGIN
	DECLARE @Prod int, @Mag int, @Pret float(12) 

	SELECT @Prod = (SELECT IDProdus FROM INSERTED)
	SELECT @Mag = (SELECT IDMagazin FROM INSERTED)
	Select @Pret= (SELECT PretUnitarRecomandat FROM INSERTED)
	
	INSERT INTO [dbo].[Stoc](Cantitate,ProdusStoc,MagazinStoc, PretUnitar) 
	VALUES(0, @Prod, @Mag, @pret)  
END
GO


