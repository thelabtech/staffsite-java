/*  Table Owner Change Code
EXEC sp_changeobjectowner 'istdev.ministry_TargetArea', 'istprod2'
EXEC sp_changeobjectowner 'istprod.ministry_TargetArea', 'istdev'
*/

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'PrepareTable' AND type = 'P') DROP PROCEDURE PrepareTable
GO
Create Procedure "PrepareTable" @STable varchar(100)
As
EXEC ('ALTER TABLE '+@STable+' ADD tempPrimaryKey int IDENTITY PRIMARY KEY')
GO


IF EXISTS (SELECT name FROM sysobjects WHERE name = 'UpdateTable' AND type = 'P') DROP PROCEDURE UpdateTable
GO
Create Procedure "UpdateTable" @STable varchar(100), @SKey varchar(100)
As
DECLARE @temp varchar(100) 

--EXEC ('ALTER TABLE '+@STable+' DROP COLUMN '+@SKey)
SET @temp = @STable+'.'+@SKey
EXEC sp_rename @temp, 'oldPrimaryKey', 'COLUMN'
SET @temp = @STable+'.tempPrimaryKey'
EXEC sp_rename @temp, @SKey, 'COLUMN'
GO


IF EXISTS (SELECT name FROM sysobjects WHERE name = 'UpdateFKey' AND type = 'P') DROP PROCEDURE UpdateFKey
GO
Create Procedure "UpdateFKey" @STable varchar(100), @SKey varchar(100), @DTable varchar(100), @DKey varchar(100)
As
EXEC ('UPDATE '+@DTable+' SET '+@DTable+'.'+@DKey+' = ST1.tempPrimaryKey FROM '+@STable+' ST1, '+@DTable+' WHERE '+@DTable+'.'+@DKey+' = ST1.'+@SKey)
GO


BEGIN TRAN T1



EXECUTE UpdateTable  'staffsite_staffsitepref','StaffSitePrefID'

EXECUTE UpdateFKey   'staffsite_staffsiteprofile','StaffSiteProfileID','staffsite_staffsitepref','fk_StaffSiteProfile'
EXECUTE UpdateFKey   'staffsite_staffsiteprofile','StaffSiteProfileID','wsn_sp_WsnApplication','surferID'
EXECUTE UpdateTable  'staffsite_staffsiteprofile','StaffSiteProfileID'



SELECT * FROM staffsite_staffsitepref


ROLLBACK TRAN T1

/*
ROLLBACK TRAN T1
COMMIT TRAN T1
*/
