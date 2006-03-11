
BEGIN TRAN T1

UPDATE isttemp.hr_si_Reference_Archive2003 SET isFormSubmitted = '1' WHERE isFormSubmitted = 'T'
UPDATE isttemp.hr_si_Reference_Archive2003 SET isFormSubmitted = '0' WHERE isFormSubmitted <> '1'

UPDATE isttemp.hr_si_Reference_Archive2003 SET isStaff = '1' WHERE isStaff = 'T'
UPDATE isttemp.hr_si_Reference_Archive2003 SET isStaff = '0' WHERE isStaff <> '1'

UPDATE isttemp.hr_si_Reference_Archive2003 SET _rg7 = '1' WHERE _rg7 = 'T'
UPDATE isttemp.hr_si_Reference_Archive2003 SET _rg7 = '0' WHERE _rg7 <> '1'

UPDATE isttemp.hr_si_Reference_Archive2003 SET _ew7 = '1' WHERE _ew7 = 'T'
UPDATE isttemp.hr_si_Reference_Archive2003 SET _ew7 = '0' WHERE _ew7 <> '1'

UPDATE isttemp.hr_si_Reference_Archive2003 SET _ew9 = '1' WHERE _ew9 = 'T'
UPDATE isttemp.hr_si_Reference_Archive2003 SET _ew9 = '0' WHERE _ew9 <> '1'


ALTER TABLE isttemp.hr_si_Reference_Archive2003 ALTER COLUMN isFormSubmitted bit
ALTER TABLE isttemp.hr_si_Reference_Archive2003 ALTER COLUMN isStaff bit
ALTER TABLE isttemp.hr_si_Reference_Archive2003 ALTER COLUMN _rg7 bit
ALTER TABLE isttemp.hr_si_Reference_Archive2003 ALTER COLUMN _ew7 bit
ALTER TABLE isttemp.hr_si_Reference_Archive2003 ALTER COLUMN _ew9 bit


SELECT * FROM isttemp.hr_si_Reference_Archive2003


ROLLBACK TRAN T1

/*
ROLLBACK TRAN T1
COMMIT TRAN T1
*/
