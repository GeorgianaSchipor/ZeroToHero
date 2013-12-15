USE master; 
GO 
CREATE DATABASE Magazin 
ON      ( NAME = Magazin_dat, FILENAME = 'D:\Databases\Magazin.mdf') 
LOG ON  ( NAME = Magazin_log, FILENAME = 'D:\Databases\Magazin.ldf'); 
GO
