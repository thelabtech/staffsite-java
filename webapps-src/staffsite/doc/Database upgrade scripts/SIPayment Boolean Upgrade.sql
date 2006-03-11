
BEGIN TRAN T1

UPDATE isttemp.hr_si_Payment SET posted = '1' WHERE posted = 'T'
UPDATE isttemp.hr_si_Payment SET posted = '0' WHERE posted <> '1'


ALTER TABLE isttemp.hr_si_Payment ALTER COLUMN posted bit


SELECT * FROM isttemp.hr_si_Payment


ROLLBACK TRAN T1

/*
ROLLBACK TRAN T1
COMMIT TRAN T1
*/
