
BEGIN TRAN T1

UPDATE isttemp.hr_si_Person SET workInUS = '1' WHERE workInUS = 'T'
UPDATE isttemp.hr_si_Person SET workInUS = '0' WHERE workInUS <> '1'

UPDATE isttemp.hr_si_Person SET isStaff = '1' WHERE isStaff = 'T'
UPDATE isttemp.hr_si_Person SET isStaff = '0' WHERE isStaff <> '1'


ALTER TABLE isttemp.hr_si_Person ALTER COLUMN workInUS bit
ALTER TABLE isttemp.hr_si_Person ALTER COLUMN isStaff bit


SELECT * FROM isttemp.hr_si_Person


ROLLBACK TRAN T1

/*
ROLLBACK TRAN T1
COMMIT TRAN T1
*/
