--se elimine din tabela stoc coloana pret unitar (in cazul in care a fost introdusa o astfel de coloana)

IF EXISTS (SELECT * FROM dbo.syscolumns 
		   WHERE id = object_id(N'[dbo].[Stoc]')
		   AND name = 'PretUnitar')
	ALTER TABLE [dbo].[Stoc] DROP COLUMN [PretUnitar]

--sau

IF exists (SELECT * FROM  sys.columns c 
INNER JOIN  sys.objects t ON (c.[object_id] = t.[object_id])
WHERE t.[object_id] = OBJECT_ID(N'[dbo].[Stoc]')
AND c.[name] = 'PretUnitar')
    BEGIN TRY
        ALTER TABLE [dbo].[Stoc] DROP COLUMN PretUnitar
    END TRY
    BEGIN CATCH
        print 'FAILED!'
    END CATCH
ELSE
    BEGIN 
        SELECT ERROR_NUMBER() AS ErrorNumber;
        print 'NO TABLE OR COLUMN FOUND !'
    END 