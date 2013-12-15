USE Magazin
---insert in CategorieProdus

INSERT INTO CategorieProdus
VALUES (1, 'Legume', NULL)
INSERT INTO CategorieProdus
VALUES (2, 'Lactate', NULL)
INSERT INTO CategorieProdus
VALUES (3, 'Carne', 'pui, vita, porc, peste')
INSERT INTO CategorieProdus
VALUES (4, 'Bauturi', 'alcoolice si nealcoolice' )
INSERT INTO CategorieProdus
VALUES (5, 'Dulciuri', NULL)
INSERT INTO CategorieProdus
VALUES (6, 'Fructe', NULL)

---insert in Magazin

INSERT INTO Magazin
VALUES(1, 'Magazin Non-Stop', 'Strada Viitorului, Nr. 6', 'Suceava')
INSERT INTO Magazin
VALUES(2, 'Bristena', 'Strada Teilor, Nr. 14', 'Cluj')

---insert in Produs

INSERT INTO Produs
VALUES(1, 'Rosii', 1, 1, 'perisabil', 13)
INSERT INTO Produs
VALUES(2, 'Branza Feta', 2, 1, 'perisabil', 21)
INSERT INTO Produs
VALUES(3, 'Piept de pui', 3, 1, NULL, 29)
INSERT INTO Produs
VALUES(4, 'Coca-Cola', 4, 2, NULL, 7)
INSERT INTO Produs
VALUES(5, 'Ciocolata Milka', 5, 2, NULL ,6)
INSERT INTO Produs
VALUES(6, 'Struguri', 6, 2, 'perisabil', 11)
