/*  Table Owner Change Code
EXEC sp_changeobjectowner 'istdev.ministry_TargetArea', 'istprod2'
EXEC sp_changeobjectowner 'istprod.ministry_TargetArea', 'istdev'
*/

BEGIN TRAN T1

SELECT * FROM simplesecuritymanager_user

UPDATE simplesecuritymanager_user SET emailVerified = '1' WHERE emailVerified = 'T'
UPDATE simplesecuritymanager_user SET emailVerified = '0' WHERE emailVerified <> '1'

--ALTER TABLE simplesecuritymanager_user ALTER COLUMN emailVerified bit


SELECT * FROM simplesecuritymanager_user


ROLLBACK TRAN T1

/*
ROLLBACK TRAN T1
COMMIT TRAN T1
*/
