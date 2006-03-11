
BEGIN TRAN T1


UPDATE isttemp.wsn_sp_Reference SET isFormSubmitted = '1' WHERE isFormSubmitted = 'T'
UPDATE isttemp.wsn_sp_Reference SET isFormSubmitted = '0' WHERE isFormSubmitted <> '1'

UPDATE isttemp.wsn_sp_Reference SET isStaff = '1' WHERE isStaff = 'T'
UPDATE isttemp.wsn_sp_Reference SET isStaff = '0' WHERE isStaff <> '1'

UPDATE isttemp.wsn_sp_Reference SET sendMidEval = '1' WHERE sendMidEval = 'T'
UPDATE isttemp.wsn_sp_Reference SET sendMidEval = '0' WHERE sendMidEval <> '1'

ALTER TABLE isttemp.wsn_sp_Reference ALTER COLUMN isFormSubmitted bit
ALTER TABLE isttemp.wsn_sp_Reference ALTER COLUMN isStaff bit
ALTER TABLE isttemp.wsn_sp_Reference ALTER COLUMN sendMidEval bit


SELECT * FROM isttemp.wsn_sp_Reference


ROLLBACK TRAN T1

/*
ROLLBACK TRAN T1
COMMIT TRAN T1
*/
