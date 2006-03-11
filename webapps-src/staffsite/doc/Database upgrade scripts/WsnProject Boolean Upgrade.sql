
BEGIN TRAN T1

UPDATE isttemp.wsn_sp_WsnProject SET insuranceFormsReceived = '1' WHERE insuranceFormsReceived = 'T'
UPDATE isttemp.wsn_sp_WsnProject SET insuranceFormsReceived = '0' WHERE insuranceFormsReceived <> '1'

UPDATE isttemp.wsn_sp_WsnProject SET CAPSFeePaid = '1' WHERE CAPSFeePaid = 'T'
UPDATE isttemp.wsn_sp_WsnProject SET CAPSFeePaid = '0' WHERE CAPSFeePaid <> '1'

UPDATE isttemp.wsn_sp_WsnProject SET adminFeePaid = '1' WHERE adminFeePaid = 'T'
UPDATE isttemp.wsn_sp_WsnProject SET adminFeePaid = '0' WHERE adminFeePaid <> '1'

UPDATE isttemp.wsn_sp_WsnProject SET secure = '1' WHERE secure = 'T'
UPDATE isttemp.wsn_sp_WsnProject SET secure = '0' WHERE secure <> '1'

UPDATE isttemp.wsn_sp_WsnProject SET projEvalCompleted = '1' WHERE projEvalCompleted = 'T'
UPDATE isttemp.wsn_sp_WsnProject SET projEvalCompleted = '0' WHERE projEvalCompleted <> '1'

UPDATE isttemp.wsn_sp_WsnProject SET partnershipRegionOnly = '1' WHERE partnershipRegionOnly = 'T'
UPDATE isttemp.wsn_sp_WsnProject SET partnershipRegionOnly = '0' WHERE partnershipRegionOnly <> '1'

UPDATE isttemp.wsn_sp_WsnProject SET onHold = '1' WHERE onHold = 'T'
UPDATE isttemp.wsn_sp_WsnProject SET onHold = '0' WHERE onHold <> '1'

ALTER TABLE isttemp.wsn_sp_WsnProject ALTER COLUMN insuranceFormsReceived bit
ALTER TABLE isttemp.wsn_sp_WsnProject ALTER COLUMN CAPSFeePaid bit
ALTER TABLE isttemp.wsn_sp_WsnProject ALTER COLUMN adminFeePaid bit
ALTER TABLE isttemp.wsn_sp_WsnProject ALTER COLUMN secure bit
ALTER TABLE isttemp.wsn_sp_WsnProject ALTER COLUMN projEvalCompleted bit
ALTER TABLE isttemp.wsn_sp_WsnProject ALTER COLUMN partnershipRegionOnly bit
ALTER TABLE isttemp.wsn_sp_WsnProject ALTER COLUMN onHold bit


SELECT * FROM isttemp.wsn_sp_WsnProject


ROLLBACK TRAN T1

/*
ROLLBACK TRAN T1
COMMIT TRAN T1
*/
