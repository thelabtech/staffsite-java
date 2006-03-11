--SELECT 'rename ' + url + ' ' + REPLACE (url, oldPrimaryKey, CmsFileID) as Command FROM cms_CmsFile WHERE url like '/cms/%'

UPDATE cms_CmsFile SET url = REPLACE (url, oldPrimaryKey, CmsFileID)
