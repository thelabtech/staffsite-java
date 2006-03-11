
BEGIN TRAN T1

UPDATE isttemp.wsn_sp_WsnEvaluation SET applicantNotified = '1' WHERE applicantNotified = 'T'
UPDATE isttemp.wsn_sp_WsnEvaluation SET applicantNotified = '0' WHERE applicantNotified <> '1'

UPDATE isttemp.wsn_sp_WsnEvaluation SET _DeQual1 = '1' WHERE _DeQual1 = 'T'
UPDATE isttemp.wsn_sp_WsnEvaluation SET _DeQual1 = '0' WHERE _DeQual1 <> '1'

UPDATE isttemp.wsn_sp_WsnEvaluation SET _DeQual2 = '1' WHERE _DeQual2 = 'T'
UPDATE isttemp.wsn_sp_WsnEvaluation SET _DeQual2 = '0' WHERE _DeQual2 <> '1'

UPDATE isttemp.wsn_sp_WsnEvaluation SET _DeQual3 = '1' WHERE _DeQual3 = 'T'
UPDATE isttemp.wsn_sp_WsnEvaluation SET _DeQual3 = '0' WHERE _DeQual3 <> '1'

UPDATE isttemp.wsn_sp_WsnEvaluation SET _DeQual4 = '1' WHERE _DeQual4 = 'T'
UPDATE isttemp.wsn_sp_WsnEvaluation SET _DeQual4 = '0' WHERE _DeQual4 <> '1'

UPDATE isttemp.wsn_sp_WsnEvaluation SET _DeQual5 = '1' WHERE _DeQual5 = 'T'
UPDATE isttemp.wsn_sp_WsnEvaluation SET _DeQual5 = '0' WHERE _DeQual5 <> '1'

UPDATE isttemp.wsn_sp_WsnEvaluation SET _DeQual6 = '1' WHERE _DeQual6 = 'T'
UPDATE isttemp.wsn_sp_WsnEvaluation SET _DeQual6 = '0' WHERE _DeQual6 <> '1'

UPDATE isttemp.wsn_sp_WsnEvaluation SET parent_haveDiscussed = '1' WHERE parent_haveDiscussed = 'T'
UPDATE isttemp.wsn_sp_WsnEvaluation SET parent_haveDiscussed = '0' WHERE parent_haveDiscussed <> '1'


ALTER TABLE isttemp.wsn_sp_WsnEvaluation ALTER COLUMN applicantNotified bit
ALTER TABLE isttemp.wsn_sp_WsnEvaluation ALTER COLUMN _DeQual1 bit
ALTER TABLE isttemp.wsn_sp_WsnEvaluation ALTER COLUMN _DeQual2 bit
ALTER TABLE isttemp.wsn_sp_WsnEvaluation ALTER COLUMN _DeQual3 bit
ALTER TABLE isttemp.wsn_sp_WsnEvaluation ALTER COLUMN _DeQual4 bit
ALTER TABLE isttemp.wsn_sp_WsnEvaluation ALTER COLUMN _DeQual5 bit
ALTER TABLE isttemp.wsn_sp_WsnEvaluation ALTER COLUMN _DeQual6 bit
ALTER TABLE isttemp.wsn_sp_WsnEvaluation ALTER COLUMN parent_haveDiscussed bit


SELECT * FROM isttemp.wsn_sp_WsnEvaluation


ROLLBACK TRAN T1

/*
ROLLBACK TRAN T1
COMMIT TRAN T1
*/
