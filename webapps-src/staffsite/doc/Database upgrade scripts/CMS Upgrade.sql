--tempPrimaryKey
BEGIN TRAN T1


EXECUTE UpdateFKey   'cms_CmsCategory','CmsCategoryID','cms_CmsCategory','parentCategory'
EXECUTE UpdateFKey   'cms_CmsCategory','CmsCategoryID','cms_assoc_FileCategory','CmsCategoryID'
EXECUTE UpdateTable  'cms_CmsCategory','CmsCategoryID'

EXECUTE UpdateFKey   'cms_CmsFile','CmsFileID','cms_assoc_FileCategory','CmsFileID'
EXECUTE UpdateTable  'cms_CmsFile','CmsFileID'



SELECT * FROM cms_CmsCategory
SELECT * FROM cms_assoc_FileCategory


ROLLBACK TRAN T1

/*
ROLLBACK TRAN T1
COMMIT TRAN T1
*/
