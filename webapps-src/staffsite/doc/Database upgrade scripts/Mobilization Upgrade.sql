
BEGIN TRAN T1

--EXECUTE PrepareTable 'wsn_sp_WsnEvaluation'
EXECUTE UpdateTable  'wsn_sp_WsnEvaluation','evalID'

--EXECUTE PrepareTable 'wsn_sp_WsnApplication'
EXECUTE UpdateFKey   'wsn_sp_WsnApplication','WsnApplicationID','wsn_sp_WsnEvaluation','fk_WsnApplicationID'
EXECUTE UpdateFKey   'wsn_sp_WsnApplication','WsnApplicationID','wsn_sp_WsnApplication','fk_wsnSpouse'
EXECUTE UpdateFKey   'wsn_sp_WsnApplication','WsnApplicationID','wsn_sp_WsnApplication','fk_childOf'
EXECUTE UpdateFKey   'wsn_sp_WsnApplication','WsnApplicationID','hr_ms_Payment','fk_WsnApplicationID'
EXECUTE UpdateFKey   'wsn_sp_WsnApplication','WsnApplicationID','wsn_sp_WsnProject','fk_IsCoord'
EXECUTE UpdateFKey   'wsn_sp_WsnApplication','WsnApplicationID','wsn_sp_WsnProject','fk_IsAPD'
EXECUTE UpdateFKey   'wsn_sp_WsnApplication','WsnApplicationID','wsn_sp_WsnProject','fk_IsPD'
EXECUTE UpdateFKey   'wsn_sp_WsnApplication','WsnApplicationID','wsn_sp_Reference','fk_WsnApplicationID'
EXECUTE UpdateTable  'wsn_sp_WsnApplication','WsnApplicationID'

--EXECUTE PrepareTable 'wsn_sp_WsnProject'
EXECUTE UpdateFKey   'wsn_sp_WsnProject','WsnProjectID','wsn_sp_WsnApplication','projectPref1'
EXECUTE UpdateFKey   'wsn_sp_WsnProject','WsnProjectID','wsn_sp_WsnApplication','projectPref2'
EXECUTE UpdateFKey   'wsn_sp_WsnProject','WsnProjectID','wsn_sp_WsnApplication','projectPref3'
EXECUTE UpdateFKey   'wsn_sp_WsnProject','WsnProjectID','wsn_sp_WsnApplication','projectPref4'
EXECUTE UpdateFKey   'wsn_sp_WsnProject','WsnProjectID','wsn_sp_WsnApplication','projectPref5'
EXECUTE UpdateFKey   'wsn_sp_WsnProject','WsnProjectID','wsn_sp_WsnApplication','fk_isMember'
EXECUTE UpdateFKey   'wsn_sp_WsnProject','WsnProjectID','wsn_sp_WsnApplication','assignedToProject'
EXECUTE UpdateTable  'wsn_sp_WsnProject','WsnProjectID'

--EXECUTE PrepareTable 'hr_ms_Payment'
EXECUTE UpdateTable  'hr_ms_Payment','paymentID'

--EXECUTE PrepareTable 'hr_si_Application'
EXECUTE UpdateFKey   'hr_si_Application','applicationID','hr_si_Payment','fk_ApplicationID'
EXECUTE UpdateFKey   'hr_si_Application','applicationID','hr_si_Reference','fk_SIApplicationID'
EXECUTE UpdateTable  'hr_si_Application','applicationID'

--EXECUTE PrepareTable 'hr_si_Application_Archive2003'
EXECUTE UpdateFKey   'hr_si_Application_Archive2003','applicationID','hr_si_Payment','fk_ApplicationID'
EXECUTE UpdateFKey   'hr_si_Application_Archive2003','applicationID','hr_si_Reference_Archive2003','fk_SIApplicationID'
EXECUTE UpdateTable  'hr_si_Application_Archive2003','applicationID'

--EXECUTE PrepareTable 'hr_si_Payment'
EXECUTE UpdateTable  'hr_si_Payment','paymentID'

--EXECUTE PrepareTable 'hr_si_Person'
EXECUTE UpdateFKey   'hr_si_Person','SIPersonID','hr_si_Application','fk_SIPersonID'
EXECUTE UpdateTable  'hr_si_Person','SIPersonID'

--EXECUTE PrepareTable 'hr_si_Person_Archive2003'
EXECUTE UpdateFKey   'hr_si_Person_Archive2003','SIPersonID','hr_si_Application_Archive2003','fk_SIPersonID'
EXECUTE UpdateTable  'hr_si_Person_Archive2003','SIPersonID'

--SELECT * FROM wsn_sp_WsnProject
SELECT WsnProjectID, fk_IsCoord, fk_IsAPD, fk_IsPD FROM wsn_sp_WsnProject

ROLLBACK TRAN T1
--COMMIT TRAN T1

