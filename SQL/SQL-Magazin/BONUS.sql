USE Magazin

CREATE TABLE Intrari_Iesiri
(
IDOperatiune int IDENTITY(1,1) primary key,
Cantitate int,
PretUnitar float(12),
Data datetime NOT NULL,
Produs int,
Magazin int,
TipOperatiune nchar(1) -- I sau E
)

DROP TABLE [dbo].[Intrari]

DROP TABLE [dbo].[Iesiri]