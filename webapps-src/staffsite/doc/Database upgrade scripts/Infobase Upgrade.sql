
BEGIN TRAN T1

--ALTER TABLE ministry_Activity DROP PK__ministry_Activit__02B25B50
--EXECUTE PrepareTable 'ministry_Activity'
EXECUTE UpdateFKey   'ministry_Activity','ActivityID','ministry_Assoc_activityContact','ActivityID'
EXECUTE UpdateFKey   'ministry_Activity','ActivityID','ministry_Statistic','fk_Activity'
EXECUTE UpdateFKey   'ministry_Activity','ActivityID','staffsite_staffsitepref','value'
EXECUTE UpdateTable  'ministry_Activity','ActivityID'

--ALTER TABLE ministry_Address DROP PK__ministry_Address__03A67F89
--EXECUTE PrepareTable 'ministry_Address'
EXECUTE UpdateFKey   'ministry_Address','AddressID','ministry_Staff','fk_primaryAddress'
EXECUTE UpdateFKey   'ministry_Address','AddressID','ministry_Staff','fk_secondaryAddress'
EXECUTE UpdateTable  'ministry_Address','AddressID'

--ALTER TABLE ministry_Dependent DROP PK__ministry_Depende__0C3BC58A
--EXECUTE PrepareTable 'ministry_Dependent'
EXECUTE UpdateFKey   'ministry_Dependent','DependentID','ministry_Assoc_dependents','DependentID'
EXECUTE UpdateTable  'ministry_Dependent','DependentID'

--ALTER TABLE ministry_LocalLevel DROP PK__ministry_LocalLe__0E240DFC
--EXECUTE PrepareTable 'ministry_LocalLevel'
EXECUTE UpdateFKey   'ministry_LocalLevel','teamID','ministry_Activity','fk_teamID'
EXECUTE UpdateFKey   'ministry_LocalLevel','teamID','ministry_Staff','fk_teamID'
EXECUTE UpdateFKey   'ministry_LocalLevel','teamID','staffsite_staffsitepref','value'
EXECUTE UpdateTable  'ministry_LocalLevel','teamID'

--ALTER TABLE ministry_NonCccMin DROP PK__ministry_NonCccM__0F183235
--EXECUTE PrepareTable 'ministry_NonCccMin'
EXECUTE UpdateFKey   'ministry_NonCccMin','NonCccMinID','ministry_Assoc_otherMinistries','NonCccMinID'
EXECUTE UpdateTable  'ministry_NonCccMin','NonCccMinID'

--ALTER TABLE ministry_Note DROP PK__ministry_Note__100C566E
--EXECUTE PrepareTable 'ministry_Note'
EXECUTE UpdateFKey   'ministry_Note','NoteID','ministry_Authorization','fk_AuthorizationNote'
EXECUTE UpdateTable  'ministry_Note','NoteID'

--ALTER TABLE ministry_RegionalTeam DROP PK__ministry_Regiona__64A2D57C
--EXECUTE PrepareTable 'ministry_RegionalStat'
EXECUTE UpdateTable  'ministry_RegionalStat','RegionalStatID'

--ALTER TABLE ministry_RegionalTeam DROP PK__ministry_Regiona__11F49EE0
--EXECUTE PrepareTable 'ministry_RegionalTeam'
EXECUTE UpdateFKey   'ministry_RegionalTeam','teamID','ministry_RegionalStat','fk_regionalTeamID'
EXECUTE UpdateTable  'ministry_RegionalTeam','teamID'

--ALTER TABLE ministry_TargetArea DROP PK__ministry_TargetA__15C52FC4
--EXECUTE PrepareTable 'ministry_TargetArea'
EXECUTE UpdateFKey   'ministry_TargetArea','TargetAreaID','linczone_contacts','CampusID'
EXECUTE UpdateFKey   'ministry_TargetArea','TargetAreaID','ministry_Activity','fk_targetAreaID'
EXECUTE UpdateFKey   'ministry_TargetArea','TargetAreaID','ministry_Assoc_otherMinistries','TargetAreaID'
EXECUTE UpdateFKey   'ministry_TargetArea','TargetAreaID','staffsite_staffsitepref','value'
EXECUTE UpdateTable  'ministry_TargetArea','TargetAreaID'

--ALTER TABLE ministry_TargetArea DROP PK__ministry_Statist__68736660
--EXECUTE PrepareTable 'ministry_Statistic'
EXECUTE UpdateTable  'ministry_Statistic','StatisticID'

--SELECT * FROM ministry_TargetArea
SELECT * FROM ministry_Activity

COMMIT TRAN T1

/*
ROLLBACK TRAN T1
COMMIT TRAN T1
*/
