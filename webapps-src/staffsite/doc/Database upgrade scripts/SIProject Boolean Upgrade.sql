
BEGIN TRAN T1

UPDATE isttemp.hr_si_Project SET insuranceFormsReceived = '1' WHERE insuranceFormsReceived = 'T'
UPDATE isttemp.hr_si_Project SET insuranceFormsReceived = '0' WHERE insuranceFormsReceived <> '1'

UPDATE isttemp.hr_si_Project SET CAPSFeePaid = '1' WHERE CAPSFeePaid = 'T'
UPDATE isttemp.hr_si_Project SET CAPSFeePaid = '0' WHERE CAPSFeePaid <> '1'

UPDATE isttemp.hr_si_Project SET adminFeePaid = '1' WHERE adminFeePaid = 'T'
UPDATE isttemp.hr_si_Project SET adminFeePaid = '0' WHERE adminFeePaid <> '1'

UPDATE isttemp.hr_si_Project SET secure = '1' WHERE secure = 'T'
UPDATE isttemp.hr_si_Project SET secure = '0' WHERE secure <> '1'

UPDATE isttemp.hr_si_Project SET projEvalCompleted = '1' WHERE projEvalCompleted = 'T'
UPDATE isttemp.hr_si_Project SET projEvalCompleted = '0' WHERE projEvalCompleted <> '1'

UPDATE isttemp.hr_si_Project SET partnershipRegionOnly = '1' WHERE partnershipRegionOnly = 'T'
UPDATE isttemp.hr_si_Project SET partnershipRegionOnly = '0' WHERE partnershipRegionOnly <> '1'

UPDATE isttemp.hr_si_Project SET onHold = '1' WHERE onHold = 'T'
UPDATE isttemp.hr_si_Project SET onHold = '0' WHERE onHold <> '1'


ALTER TABLE isttemp.hr_si_Project ALTER COLUMN insuranceFormsReceived bit
ALTER TABLE isttemp.hr_si_Project ALTER COLUMN CAPSFeePaid bit
ALTER TABLE isttemp.hr_si_Project ALTER COLUMN adminFeePaid bit
ALTER TABLE isttemp.hr_si_Project ALTER COLUMN secure bit
ALTER TABLE isttemp.hr_si_Project ALTER COLUMN projEvalCompleted bit
ALTER TABLE isttemp.hr_si_Project ALTER COLUMN partnershipRegionOnly bit
ALTER TABLE isttemp.hr_si_Project ALTER COLUMN onHold bit


SELECT * FROM isttemp.hr_si_Project


ROLLBACK TRAN T1

/*
ROLLBACK TRAN T1
COMMIT TRAN T1
*/
