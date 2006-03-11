
begin tran a

UPDATE ministry_FieldChange SET ministry_FieldChange.newValue = ministry_Note.NoteID FROM ministry_FieldChange, ministry_Note WHERE ministry_FieldChange.newValue = ministry_Note.oldPrimaryKey
UPDATE ministry_FieldChange SET ministry_FieldChange.newValue = ministry_LocalLevel.teamID FROM ministry_FieldChange, ministry_LocalLevel WHERE ministry_FieldChange.newValue = ministry_LocalLevel.oldPrimaryKey

SELECT * FROM ministry_FieldChange

COMMIT tran a