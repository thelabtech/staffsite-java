
BEGIN TRAN T1

UPDATE isttemp.hr_si_Person_Archive2003 SET workInUS = '1' WHERE workInUS = 'T'
UPDATE isttemp.hr_si_Person_Archive2003 SET workInUS = '0' WHERE workInUS <> '1'

UPDATE isttemp.hr_si_Person_Archive2003 SET isStaff = '1' WHERE isStaff = 'T'
UPDATE isttemp.hr_si_Person_Archive2003 SET isStaff = '0' WHERE isStaff <> '1'


ALTER TABLE isttemp.hr_si_Person_Archive2003 ALTER COLUMN workInUS bit
ALTER TABLE isttemp.hr_si_Person_Archive2003 ALTER COLUMN isStaff bit


SELECT * FROM isttemp.hr_si_Person_Archive2003


ROLLBACK TRAN T1

/*
ROLLBACK TRAN T1
COMMIT TRAN T1
*/
