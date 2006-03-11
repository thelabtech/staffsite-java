BEGIN TRAN A

UPDATE ministry_ChangeRequest 
SET ministry_ChangeRequest.updateStaff = ministry_StaffChangeRequest.updateStaff
FROM ministry_ChangeRequest, ministry_StaffChangeRequest
WHERE ministry_ChangeRequest.oldPrimaryKey = ministry_StaffChangeRequest.ChangeRequestID

SELECT * FROM ministry_ChangeRequest

ROLLBACK TRAN A