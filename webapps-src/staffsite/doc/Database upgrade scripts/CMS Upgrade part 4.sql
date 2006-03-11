--tempPrimaryKey

BEGIN TRAN T1

--EXEC sp_rename 'staffsite_staffsiteprofile.isStaff', 'isStaffBak', 'COLUMN'
--ALTER TABLE staffsite_staffsiteprofile ADD isStaff bit

UPDATE staffsite_staffsiteprofile SET isStaff = '1' WHERE isStaff = 'T'
UPDATE staffsite_staffsiteprofile SET isStaff = '0' WHERE isStaff <> '1'

UPDATE staffsite_staffsiteprofile SET changePassword = '1' WHERE changePassword = 'T'
UPDATE staffsite_staffsiteprofile SET changePassword = '0' WHERE changePassword <> '1'

ALTER TABLE staffsite_staffsiteprofile ALTER COLUMN isStaff bit
ALTER TABLE staffsite_staffsiteprofile ALTER COLUMN changePassword bit

SELECT * FROM staffsite_staffsiteprofile


ROLLBACK TRAN T1

/*
ROLLBACK TRAN T1
COMMIT TRAN T1
*/
