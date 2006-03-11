
BEGIN TRAN T1



DECLARE @old_key varchar(70), @new_key varchar(70)
DECLARE key_cursor CURSOR FOR
--Find and omit root and Not Categorized.
--SELECT oldPrimaryKey, CmsCategoryID FROM cms_CmsCategory WHERE CmsCategoryID not in (1, 508) ORDER BY CmsCategoryID DESC
SELECT oldPrimaryKey, CmsCategoryID FROM cms_CmsCategory WHERE CmsCategoryID not in (1, 359) ORDER BY CmsCategoryID DESC
--SELECT oldPrimaryKey, CmsCategoryID FROM cms_CmsCategory ORDER BY CmsCategoryID DESC
OPEN key_cursor

FETCH NEXT FROM key_cursor
INTO @old_key, @new_key
WHILE @@FETCH_STATUS = 0
BEGIN
   UPDATE cms_CmsCategory SET pathid = REPLACE (pathid, @old_key, @new_key)
--   PRINT @old_key + ' ' + @new_key
   FETCH NEXT FROM key_cursor
   INTO @old_key, @new_key
END

CLOSE key_cursor
DEALLOCATE key_cursor
GO




SELECT * FROM cms_CmsCategory


ROLLBACK TRAN T1

/*
ROLLBACK TRAN T1
COMMIT TRAN T1
*/
