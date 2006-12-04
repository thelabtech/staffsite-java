select * from sp_elements; where question_table = 'answers';




select * from sp_question_options where question_id = 248;
select * from sp_question_options ;

select count(*) from sp_answers where question_id = 261;
select count(id), answer from sp_answers where question_id = 339 group by answer;
select count(wsnapplicationid), _21b from wsn_sp_wsnapplication group by _21b;

select count(referenceID), isStaff from wsn_sp_reference group by isStaff;

select * from wsn_sp_reference where referenceType = 'P';
select * from wsn_sp_reference where referenceType = 'S1';
select count(referenceid), referenceType from wsn_sp_reference group by referenceType;
select count(referenceid), _6sb from wsn_sp_reference group by _6sb;
select count(id), type from sp_references group by type;
select count(id), status from sp_references group by status;
select * from sp_references;

select * from wsn_sp_reference where fk_wsnapplicationid is not null and fk_wsnapplicationid <> 0;
select newApp.id, ref.* from wsn_sp_reference ref join wsn_sp_wsnapplication app on (ref.fk_WsnApplicationID = app.WsnApplicationId) join sp_applications newApp on (app.WsnApplicationId = newApp.old_id);
select * from sp_references where application_id <= 100 and application_id >= 39;
delete from sp_references where application_id <= 100 and application_id >= 39;

select count(*) from sp_references where access_key is null;
select MD5(NOW()+(RAND()*1000000000)), sp_references.* from sp_references where access_key is null;
update sp_references set access_key = MD5(NOW()+(RAND()*1000000000)) where access_key is null;

select * from sp_applications;



select is_staff, answer from sp_references ref left outer join sp_answers ans on (ans.instance_id = ref.id and ans.question_id = 261);


select max(id) from sp_applications;
select count(*) from wsn_sp_wsnapplication;
select count(*) from sp_applications app where old_id is not null;
select * from sp_answers where instance_id = 4;

select * from sp_references where application_id <= 100 and application_id >= 39;
delete from sp_references where application_id <= 100 and application_id >= 39;

select app.wsnapplicationId as old_id, app.* from wsn_sp_wsnapplication app order by old_id;
select app.* from sp_applications app where old_id is not null order by cast(old_id as signed);


select * from sp_answers where instance_id <= 39 and instance_id <=55 and question_id <= 255 and question_id >= 33 ;
delete from sp_answers where instance_id <= 39 and instance_id <=55 and question_id <= 255 and question_id >= 33 ;

select app.old_id, app.* from sp_applications app where old_id >= 32760;
select * from wsn_sp_wsnapplication app where wsnapplicationid >= 32760;
select count(*) from wsn_sp_wsnapplication oldApp join sp_applications newApp on (oldApp.wsnapplicationid = newapp.old_id);
select count(*) from wsn_sp_wsnapplication oldApp left outer join sp_applications newApp on (oldApp.wsnapplicationid = newapp.old_id);

select person.personid, person.firstName, person.lastName, app.* from wsn_sp_wsnapplication app join ministry_person person on (app.fk_personId = person.personid) where wsnapplicationid in (32767, 32769, 32768);
select * from sp_applications where old_id in (32764, 24118);

select * from wsn_sp_reference where fk_wsnapplicationid in (32764, 24118);






select app.wsnapplicationid as old_id, ref.* from wsn_sp_reference ref join wsn_sp_wsnapplication app on (ref.fk_wsnapplicationID = app.wsnapplicationid) where (ref.referenceType = 'S1' or ref.referenceType = 'S2') order by app.wsnapplicationid, referenceType;
select app.old_id, ref.* from sp_references ref join sp_applications app on (ref.application_id = app.id) where app.old_id is not null and (ref.type = 'SpSpiritualReference1' or ref.type = 'SpSpiritualReference2') order by cast(old_id as signed), ref.type;

select * from sp_answers where instance_id <= 2090 and instance_id >= 1717 and question_id <= 306 and question_id >= 261 order by instance_id;
delete from sp_answers where instance_id <= 532 and instance_id >= 159 and question_id <= 306 and question_id >= 261;

select * from sp_answers where answer is null;
select * from sp_answers where question_id = 261;


select app.wsnapplicationid as old_id, ref.* from wsn_sp_reference ref join wsn_sp_wsnapplication app on (ref.fk_wsnapplicationID = app.wsnapplicationid) where (ref.referenceType = 'P') order by app.wsnapplicationid, referenceType;
select app.old_id, ref.* from sp_references ref join sp_applications app on (ref.application_id = app.id) where app.old_id is not null and (ref.type = 'SpPeerReference') order by cast(old_id as signed), ref.type;

select * from sp_answers where instance_id <= 2090 and instance_id >= 1717 and question_id <= 373 and question_id >= 317;
delete from sp_answers where instance_id <= 531 and instance_id >= 158 and question_id <= 373 and question_id >= 317;



select * from wsn_sp_wsnapplication where length(_29f) > 4000;
select * from wsn_sp_wsnapplication where length(_1f) > 4000;
select * from wsn_sp_wsnapplication where length(_2b) > 4000;
select * from wsn_sp_wsnapplication where length(_3h) > 4000;
select * from wsn_sp_wsnapplication where length(_4i) > 4000;
select * from wsn_sp_wsnapplication where length(_5e) > 4000;
select * from wsn_sp_wsnapplication where length(_5g) > 4000;
select length(_6), app.* from wsn_sp_wsnapplication app where length(_6) > 4000;
select * from wsn_sp_wsnapplication where length(_7) > 4000;
select * from wsn_sp_wsnapplication where length(_8a) > 4000;
select * from wsn_sp_wsnapplication where length(_8b) > 4000;
select * from wsn_sp_wsnapplication where length(_9) > 4000;
select * from wsn_sp_wsnapplication where length(_10) > 4000;
select * from wsn_sp_wsnapplication where length(_11b) > 4000;
select * from wsn_sp_wsnapplication where length(_12b) > 4000;
select * from wsn_sp_wsnapplication where length(_14) > 4000;
select * from wsn_sp_wsnapplication where length(_20a) > 4000;
select * from wsn_sp_wsnapplication where length(_20b) > 4000;
select * from wsn_sp_wsnapplication where length(_20c) > 4000;
select * from wsn_sp_wsnapplication where length(_21i) > 4000;
select * from wsn_sp_wsnapplication where length(_22b) > 4000;
select * from wsn_sp_wsnapplication where length(_23b) > 4000;
select * from wsn_sp_wsnapplication where length(_24b) > 4000;
select * from wsn_sp_wsnapplication where length(_25) > 4000;
select * from wsn_sp_wsnapplication where length(_26b) > 4000;
select * from wsn_sp_wsnapplication where length(_27b) > 4000;
select * from wsn_sp_wsnapplication where length(_28b) > 4000;
select * from wsn_sp_wsnapplication where length(_29b) > 4000;
select * from wsn_sp_wsnapplication where length(_29e) > 4000;
select * from wsn_sp_wsnapplication where length(_29f) > 4000;
select * from wsn_sp_wsnapplication where length(_30) > 4000;
select * from wsn_sp_wsnapplication where length(_31) > 4000;
select * from wsn_sp_wsnapplication where length(_32) > 4000;
select * from wsn_sp_wsnapplication where length(_33) > 4000;
select * from wsn_sp_wsnapplication where length(_34) > 4000;
select * from wsn_sp_wsnapplication where length(_35) > 4000;

select * from sp_answers where answer like '%<caron><caron><caron><caron><caron>%';

select count(*) from sp_references;

select app.wsnapplicationid as old_id, ref.* from wsn_sp_reference ref join wsn_sp_wsnapplication app on (ref.fk_wsnapplicationID = app.wsnapplicationid) where (ref.referenceType = 'S1' or ref.referenceType = 'S2') order by app.wsnapplicationid desc, referenceType;
select app.old_id, ref.* from sp_references ref join sp_applications app on (ref.application_id = app.id) where app.old_id is not null and (ref.type = 'SpSpiritualReference1' or ref.type = 'SpSpiritualReference2') order by cast(old_id as signed) desc, ref.type;

select newApp.id, ref.* from wsn_sp_reference ref join wsn_sp_wsnapplication app on (ref.fk_WsnApplicationID = app.WsnApplicationId) join sp_applications newApp on (app.WsnApplicationId = newApp.old_id) left outer join sp_references newRef on (newRef.application_id = newApp.id) where newRef.id is null;
select count(*) from sp_applications app left join sp_references ref on (ref.application_id = app.id) where ref.id is null;

select * from sp_references where application_id = 29732;


