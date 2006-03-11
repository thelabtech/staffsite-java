--tempPrimaryKey

BEGIN TRAN T1


EXECUTE UpdateFKey   'ministry_Authorization','AuthorizationID','ministry_Note','Fk_authorizationNote'
EXECUTE UpdateTable  'ministry_Authorization','AuthorizationID'

EXECUTE UpdateFKey   'ministry_ChangeRequest','ChangeRequestID','ministry_FieldChange','Fk_hasFieldChanges'
EXECUTE UpdateFKey   'ministry_ChangeRequest','ChangeRequestID','ministry_Authorization','fk_changeRequestID'
EXECUTE UpdateTable  'ministry_ChangeRequest','ChangeRequestID'

EXECUTE UpdateTable  'ministry_FieldChange','FieldChangeID'


SELECT * FROM ministry_FieldChange

--UPDATE ministry_FieldChange SET ministry_FieldChange.newValue = ministry_Note.NoteID FROM ministry_FieldChange, ministry_Note WHERE ministry_FieldChange.newValue = ministry_Note.oldPrimaryKey;
--UPDATE ministry_FieldChange SET ministry_FieldChange.newValue = ministry_LocalLevel.teamID FROM ministry_FieldChange, ministry_LocalLevel WHERE ministry_FieldChange.newValue = ministry_LocalLevel.oldPrimaryKey;

ROLLBACK TRAN T1

/*
ROLLBACK TRAN T1
COMMIT TRAN T1
*/
