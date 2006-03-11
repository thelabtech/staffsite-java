BEGIN TRAN T1

UPDATE wsn_sp_WsnApplication SET willingForDifferentProject = '1' WHERE willingForDifferentProject = 'T'
UPDATE wsn_sp_WsnApplication SET willingForDifferentProject = '0' WHERE willingForDifferentProject <> '1'

UPDATE wsn_sp_WsnApplication SET usCitizen = '1' WHERE usCitizen = 'T'
UPDATE wsn_sp_WsnApplication SET usCitizen = '0' WHERE usCitizen <> '1'

UPDATE wsn_sp_WsnApplication SET isApplicationComplete = '1' WHERE isApplicationComplete = 'T'
UPDATE wsn_sp_WsnApplication SET isApplicationComplete = '0' WHERE isApplicationComplete <> '1'

UPDATE wsn_sp_WsnApplication SET applicationCompleteNote = '1' WHERE applicationCompleteNote = 'T'
UPDATE wsn_sp_WsnApplication SET applicationCompleteNote = '0' WHERE applicationCompleteNote <> '1'

UPDATE wsn_sp_WsnApplication SET insuranceReceived = '1' WHERE insuranceReceived = 'T'
UPDATE wsn_sp_WsnApplication SET insuranceReceived = '0' WHERE insuranceReceived <> '1'

UPDATE wsn_sp_WsnApplication SET waiverReceived = '1' WHERE waiverReceived = 'T'
UPDATE wsn_sp_WsnApplication SET waiverReceived = '0' WHERE waiverReceived <> '1'

UPDATE wsn_sp_WsnApplication SET didGo = '1' WHERE didGo = 'T'
UPDATE wsn_sp_WsnApplication SET didGo = '0' WHERE didGo <> '1'

UPDATE wsn_sp_WsnApplication SET participantEvaluation = '1' WHERE participantEvaluation = 'T'
UPDATE wsn_sp_WsnApplication SET participantEvaluation = '0' WHERE participantEvaluation <> '1'

UPDATE wsn_sp_WsnApplication SET travelPlans = '1' WHERE travelPlans = 'T'
UPDATE wsn_sp_WsnApplication SET travelPlans = '0' WHERE travelPlans <> '1'

UPDATE wsn_sp_WsnApplication SET travelDeviation = '1' WHERE travelDeviation = 'T'
UPDATE wsn_sp_WsnApplication SET travelDeviation = '0' WHERE travelDeviation <> '1'

UPDATE wsn_sp_WsnApplication SET visaIsMultipleEntry = '1' WHERE visaIsMultipleEntry = 'T'
UPDATE wsn_sp_WsnApplication SET visaIsMultipleEntry = '0' WHERE visaIsMultipleEntry <> '1'

UPDATE wsn_sp_WsnApplication SET isStaff = '1' WHERE isStaff = 'T'
UPDATE wsn_sp_WsnApplication SET isStaff = '0' WHERE isStaff <> '1'

UPDATE wsn_sp_WsnApplication SET prevIsp = '1' WHERE prevIsp = 'T'
UPDATE wsn_sp_WsnApplication SET prevIsp = '0' WHERE prevIsp <> '1'

UPDATE wsn_sp_WsnApplication SET child = '1' WHERE child = 'T'
UPDATE wsn_sp_WsnApplication SET child = '0' WHERE child <> '1'

UPDATE wsn_sp_WsnApplication SET inSchool = '1' WHERE inSchool = 'T'
UPDATE wsn_sp_WsnApplication SET inSchool = '0' WHERE inSchool <> '1'

UPDATE wsn_sp_WsnApplication SET participateImpact = '1' WHERE participateImpact = 'T'
UPDATE wsn_sp_WsnApplication SET participateImpact = '0' WHERE participateImpact <> '1'

UPDATE wsn_sp_WsnApplication SET participateDestino = '1' WHERE participateDestino = 'T'
UPDATE wsn_sp_WsnApplication SET participateDestino = '0' WHERE participateDestino <> '1'

UPDATE wsn_sp_WsnApplication SET participateEpic = '1' WHERE participateEpic = 'T'
UPDATE wsn_sp_WsnApplication SET participateEpic = '0' WHERE participateEpic <> '1'

UPDATE wsn_sp_WsnApplication SET isIntern = '1' WHERE isIntern = 'T'
UPDATE wsn_sp_WsnApplication SET isIntern = '0' WHERE isIntern <> '1'

UPDATE wsn_sp_WsnApplication SET _1a = '1' WHERE _1a = 'T'
UPDATE wsn_sp_WsnApplication SET _1a = '0' WHERE _1a <> '1'

UPDATE wsn_sp_WsnApplication SET _1b = '1' WHERE _1b = 'T'
UPDATE wsn_sp_WsnApplication SET _1b = '0' WHERE _1b <> '1'

UPDATE wsn_sp_WsnApplication SET _1c = '1' WHERE _1c = 'T'
UPDATE wsn_sp_WsnApplication SET _1c = '0' WHERE _1c <> '1'

UPDATE wsn_sp_WsnApplication SET _1d = '1' WHERE _1d = 'T'
UPDATE wsn_sp_WsnApplication SET _1d = '0' WHERE _1d <> '1'

UPDATE wsn_sp_WsnApplication SET _1e = '1' WHERE _1e = 'T'
UPDATE wsn_sp_WsnApplication SET _1e = '0' WHERE _1e <> '1'

UPDATE wsn_sp_WsnApplication SET _2a = '1' WHERE _2a = 'T'
UPDATE wsn_sp_WsnApplication SET _2a = '0' WHERE _2a <> '1'

UPDATE wsn_sp_WsnApplication SET _2c = '1' WHERE _2c = 'T'
UPDATE wsn_sp_WsnApplication SET _2c = '0' WHERE _2c <> '1'

UPDATE wsn_sp_WsnApplication SET _3a = '1' WHERE _3a = 'T'
UPDATE wsn_sp_WsnApplication SET _3a = '0' WHERE _3a <> '1'

UPDATE wsn_sp_WsnApplication SET _3b = '1' WHERE _3b = 'T'
UPDATE wsn_sp_WsnApplication SET _3b = '0' WHERE _3b <> '1'

UPDATE wsn_sp_WsnApplication SET _3c = '1' WHERE _3c = 'T'
UPDATE wsn_sp_WsnApplication SET _3c = '0' WHERE _3c <> '1'

UPDATE wsn_sp_WsnApplication SET _3d = '1' WHERE _3d = 'T'
UPDATE wsn_sp_WsnApplication SET _3d = '0' WHERE _3d <> '1'

UPDATE wsn_sp_WsnApplication SET _3e = '1' WHERE _3e = 'T'
UPDATE wsn_sp_WsnApplication SET _3e = '0' WHERE _3e <> '1'

UPDATE wsn_sp_WsnApplication SET _3f = '1' WHERE _3f = 'T'
UPDATE wsn_sp_WsnApplication SET _3f = '0' WHERE _3f <> '1'

UPDATE wsn_sp_WsnApplication SET _3g = '1' WHERE _3g = 'T'
UPDATE wsn_sp_WsnApplication SET _3g = '0' WHERE _3g <> '1'

UPDATE wsn_sp_WsnApplication SET _4a = '1' WHERE _4a = 'T'
UPDATE wsn_sp_WsnApplication SET _4a = '0' WHERE _4a <> '1'

UPDATE wsn_sp_WsnApplication SET _4b = '1' WHERE _4b = 'T'
UPDATE wsn_sp_WsnApplication SET _4b = '0' WHERE _4b <> '1'

UPDATE wsn_sp_WsnApplication SET _4c = '1' WHERE _4c = 'T'
UPDATE wsn_sp_WsnApplication SET _4c = '0' WHERE _4c <> '1'

UPDATE wsn_sp_WsnApplication SET _4d = '1' WHERE _4d = 'T'
UPDATE wsn_sp_WsnApplication SET _4d = '0' WHERE _4d <> '1'

UPDATE wsn_sp_WsnApplication SET _4e = '1' WHERE _4e = 'T'
UPDATE wsn_sp_WsnApplication SET _4e = '0' WHERE _4e <> '1'

UPDATE wsn_sp_WsnApplication SET _4f = '1' WHERE _4f = 'T'
UPDATE wsn_sp_WsnApplication SET _4f = '0' WHERE _4f <> '1'

UPDATE wsn_sp_WsnApplication SET _4g = '1' WHERE _4g = 'T'
UPDATE wsn_sp_WsnApplication SET _4g = '0' WHERE _4g <> '1'

UPDATE wsn_sp_WsnApplication SET _4h = '1' WHERE _4h = 'T'
UPDATE wsn_sp_WsnApplication SET _4h = '0' WHERE _4h <> '1'

UPDATE wsn_sp_WsnApplication SET _5a = '1' WHERE _5a = 'T'
UPDATE wsn_sp_WsnApplication SET _5a = '0' WHERE _5a <> '1'

UPDATE wsn_sp_WsnApplication SET _5b = '1' WHERE _5b = 'T'
UPDATE wsn_sp_WsnApplication SET _5b = '0' WHERE _5b <> '1'

UPDATE wsn_sp_WsnApplication SET _5c = '1' WHERE _5c = 'T'
UPDATE wsn_sp_WsnApplication SET _5c = '0' WHERE _5c <> '1'

UPDATE wsn_sp_WsnApplication SET _5d = '1' WHERE _5d = 'T'
UPDATE wsn_sp_WsnApplication SET _5d = '0' WHERE _5d <> '1'

UPDATE wsn_sp_WsnApplication SET _5f = '1' WHERE _5f = 'T'
UPDATE wsn_sp_WsnApplication SET _5f = '0' WHERE _5f <> '1'

UPDATE wsn_sp_WsnApplication SET _5h = '1' WHERE _5h = 'T'
UPDATE wsn_sp_WsnApplication SET _5h = '0' WHERE _5h <> '1'

UPDATE wsn_sp_WsnApplication SET _11a = '1' WHERE _11a = 'T'
UPDATE wsn_sp_WsnApplication SET _11a = '0' WHERE _11a <> '1'

UPDATE wsn_sp_WsnApplication SET _12a = '1' WHERE _12a = 'T'
UPDATE wsn_sp_WsnApplication SET _12a = '0' WHERE _12a <> '1'

UPDATE wsn_sp_WsnApplication SET _13a = '1' WHERE _13a = 'T'
UPDATE wsn_sp_WsnApplication SET _13a = '0' WHERE _13a <> '1'

UPDATE wsn_sp_WsnApplication SET _13b = '1' WHERE _13b = 'T'
UPDATE wsn_sp_WsnApplication SET _13b = '0' WHERE _13b <> '1'

UPDATE wsn_sp_WsnApplication SET _13c = '1' WHERE _13c = 'T'
UPDATE wsn_sp_WsnApplication SET _13c = '0' WHERE _13c <> '1'

UPDATE wsn_sp_WsnApplication SET _15 = '1' WHERE _15 = 'T'
UPDATE wsn_sp_WsnApplication SET _15 = '0' WHERE _15 <> '1'

UPDATE wsn_sp_WsnApplication SET _19a = '1' WHERE _19a = 'T'
UPDATE wsn_sp_WsnApplication SET _19a = '0' WHERE _19a <> '1'

UPDATE wsn_sp_WsnApplication SET _19b = '1' WHERE _19b = 'T'
UPDATE wsn_sp_WsnApplication SET _19b = '0' WHERE _19b <> '1'

UPDATE wsn_sp_WsnApplication SET _19c = '1' WHERE _19c = 'T'
UPDATE wsn_sp_WsnApplication SET _19c = '0' WHERE _19c <> '1'

UPDATE wsn_sp_WsnApplication SET _19d = '1' WHERE _19d = 'T'
UPDATE wsn_sp_WsnApplication SET _19d = '0' WHERE _19d <> '1'

UPDATE wsn_sp_WsnApplication SET _19e = '1' WHERE _19e = 'T'
UPDATE wsn_sp_WsnApplication SET _19e = '0' WHERE _19e <> '1'

UPDATE wsn_sp_WsnApplication SET _21a = '1' WHERE _21a = 'T'
UPDATE wsn_sp_WsnApplication SET _21a = '0' WHERE _21a <> '1'

UPDATE wsn_sp_WsnApplication SET _21b = '1' WHERE _21b = 'T'
UPDATE wsn_sp_WsnApplication SET _21b = '0' WHERE _21b <> '1'

UPDATE wsn_sp_WsnApplication SET _21c = '1' WHERE _21c = 'T'
UPDATE wsn_sp_WsnApplication SET _21c = '0' WHERE _21c <> '1'

UPDATE wsn_sp_WsnApplication SET _21d = '1' WHERE _21d = 'T'
UPDATE wsn_sp_WsnApplication SET _21d = '0' WHERE _21d <> '1'

UPDATE wsn_sp_WsnApplication SET _21e = '1' WHERE _21e = 'T'
UPDATE wsn_sp_WsnApplication SET _21e = '0' WHERE _21e <> '1'

UPDATE wsn_sp_WsnApplication SET _21f = '1' WHERE _21f = 'T'
UPDATE wsn_sp_WsnApplication SET _21f = '0' WHERE _21f <> '1'

UPDATE wsn_sp_WsnApplication SET _21g = '1' WHERE _21g = 'T'
UPDATE wsn_sp_WsnApplication SET _21g = '0' WHERE _21g <> '1'

UPDATE wsn_sp_WsnApplication SET _21h = '1' WHERE _21h = 'T'
UPDATE wsn_sp_WsnApplication SET _21h = '0' WHERE _21h <> '1'

UPDATE wsn_sp_WsnApplication SET _22a = '1' WHERE _22a = 'T'
UPDATE wsn_sp_WsnApplication SET _22a = '0' WHERE _22a <> '1'

UPDATE wsn_sp_WsnApplication SET _23a = '1' WHERE _23a = 'T'
UPDATE wsn_sp_WsnApplication SET _23a = '0' WHERE _23a <> '1'

UPDATE wsn_sp_WsnApplication SET _24a = '1' WHERE _24a = 'T'
UPDATE wsn_sp_WsnApplication SET _24a = '0' WHERE _24a <> '1'

UPDATE wsn_sp_WsnApplication SET _26a = '1' WHERE _26a = 'T'
UPDATE wsn_sp_WsnApplication SET _26a = '0' WHERE _26a <> '1'

UPDATE wsn_sp_WsnApplication SET _27a = '1' WHERE _27a = 'T'
UPDATE wsn_sp_WsnApplication SET _27a = '0' WHERE _27a <> '1'

UPDATE wsn_sp_WsnApplication SET _28a = '1' WHERE _28a = 'T'
UPDATE wsn_sp_WsnApplication SET _28a = '0' WHERE _28a <> '1'

UPDATE wsn_sp_WsnApplication SET _29a = '1' WHERE _29a = 'T'
UPDATE wsn_sp_WsnApplication SET _29a = '0' WHERE _29a <> '1'

UPDATE wsn_sp_WsnApplication SET _29c = '1' WHERE _29c = 'T'
UPDATE wsn_sp_WsnApplication SET _29c = '0' WHERE _29c <> '1'

UPDATE wsn_sp_WsnApplication SET _29d = '1' WHERE _29d = 'T'
UPDATE wsn_sp_WsnApplication SET _29d = '0' WHERE _29d <> '1'

UPDATE wsn_sp_WsnApplication SET isPaid = '1' WHERE isPaid = 'T'
UPDATE wsn_sp_WsnApplication SET isPaid = '0' WHERE isPaid <> '1'

UPDATE wsn_sp_WsnApplication SET isApplyingForStaffInternship = '1' WHERE isApplyingForStaffInternship = 'T'
UPDATE wsn_sp_WsnApplication SET isApplyingForStaffInternship = '0' WHERE isApplyingForStaffInternship <> '1'

UPDATE wsn_sp_WsnApplication SET isRecruited = '1' WHERE isRecruited = 'T'
UPDATE wsn_sp_WsnApplication SET isRecruited = '0' WHERE isRecruited <> '1'

UPDATE wsn_sp_WsnApplication SET campusHasStaffTeam = '1' WHERE campusHasStaffTeam = 'T'
UPDATE wsn_sp_WsnApplication SET campusHasStaffTeam = '0' WHERE campusHasStaffTeam <> '1'

UPDATE wsn_sp_WsnApplication SET campusHasStaffCoach = '1' WHERE campusHasStaffCoach = 'T'
UPDATE wsn_sp_WsnApplication SET campusHasStaffCoach = '0' WHERE campusHasStaffCoach <> '1'

UPDATE wsn_sp_WsnApplication SET campusHasMetroTeam = '1' WHERE campusHasMetroTeam = 'T'
UPDATE wsn_sp_WsnApplication SET campusHasMetroTeam = '0' WHERE campusHasMetroTeam <> '1'

UPDATE wsn_sp_WsnApplication SET campusHasOther = '1' WHERE campusHasOther = 'T'
UPDATE wsn_sp_WsnApplication SET campusHasOther = '0' WHERE campusHasOther <> '1'

UPDATE wsn_sp_WsnApplication SET inSchoolNextFall = '1' WHERE inSchoolNextFall = 'T'
UPDATE wsn_sp_WsnApplication SET inSchoolNextFall = '0' WHERE inSchoolNextFall <> '1'

UPDATE wsn_sp_WsnApplication SET participateCCC = '1' WHERE participateCCC = 'T'
UPDATE wsn_sp_WsnApplication SET participateCCC = '0' WHERE participateCCC <> '1'

UPDATE wsn_sp_WsnApplication SET participateNone = '1' WHERE participateNone = 'T'
UPDATE wsn_sp_WsnApplication SET participateNone = '0' WHERE participateNone <> '1'

UPDATE wsn_sp_WsnApplication SET ciPhoneCallRequested = '1' WHERE ciPhoneCallRequested = 'T'
UPDATE wsn_sp_WsnApplication SET ciPhoneCallRequested = '0' WHERE ciPhoneCallRequested <> '1'

UPDATE wsn_sp_WsnApplication SET participateOtherProjects = '1' WHERE participateOtherProjects = 'T'
UPDATE wsn_sp_WsnApplication SET participateOtherProjects = '0' WHERE participateOtherProjects <> '1'

ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN willingForDifferentProject bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN usCitizen bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN isApplicationComplete bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN applicationCompleteNote bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN insuranceReceived bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN waiverReceived bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN didGo bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN participantEvaluation bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN travelPlans bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN travelDeviation bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN visaIsMultipleEntry bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN isStaff bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN prevIsp bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN child bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN inSchool bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN participateImpact bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN participateDestino bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN participateEpic bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN isIntern bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _1a bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _1b bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _1c bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _1d bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _1e bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _2a bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _2c bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _3a bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _3b bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _3c bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _3d bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _3e bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _3f bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _3g bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _4a bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _4b bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _4c bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _4d bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _4e bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _4f bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _4g bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _4h bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _5a bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _5b bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _5c bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _5d bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _5f bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _5h bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _11a bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _12a bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _13a bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _13b bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _13c bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _15 bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _19a bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _19b bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _19c bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _19d bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _19e bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _21a bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _21b bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _21c bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _21d bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _21e bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _21f bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _21g bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _21h bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _22a bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _23a bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _24a bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _26a bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _27a bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _28a bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _29a bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _29c bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN _29d bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN isPaid bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN isApplyingForStaffInternship bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN isRecruited bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN campusHasStaffTeam bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN campusHasStaffCoach bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN campusHasMetroTeam bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN campusHasOther bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN inSchoolNextFall bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN participateCCC bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN participateNone bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN ciPhoneCallRequested bit
ALTER TABLE wsn_sp_WsnApplication ALTER COLUMN participateOtherProjects bit

SELECT * FROM wsn_sp_WsnApplication WHERE wsn_sp_WsnApplication.WsnApplicationID < 100

ROLLBACK TRAN T1
--COMMIT TRAN T1