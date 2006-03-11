package org.alt60m.ministry.servlet;

import org.alt60m.ministry.model.dbio.*;
import org.alt60m.ministry.*;
import org.alt60m.util.DBConnectionFactory;

import java.util.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.*;
import org.apache.log4j.*;

public class QueueChangeRequest {
	/**
	 *  Method called by a servlet to commit an address change to the database.
	 *
	
	 Consider moving the applying of the newValues to the staffobject to the applychanges class and also notifying staffservices from there.
	 */
	public void addressChangeRequest(final String staffId, final String requestorStaffId, final Map newValues) throws Exception {
		try {
			StaffChangeRequest changeRequest = new StaffChangeRequest();
			changeRequest.setUpdateStaffId(staffId);
			changeRequest.setRequestedById(requestorStaffId);
			changeRequest.setRequestDate(new java.sql.Date(System.currentTimeMillis()));
			changeRequest.setType(StaffChangeRequest.ADDRESS_CHANGE);
			changeRequest.setEffectiveDate(new java.sql.Date(System.currentTimeMillis()));
			changeRequest.persist();
			String changeRequestId = changeRequest.getChangeRequestId();

			StaffChangeRequest addrChangeRequest = new StaffChangeRequest();
			addrChangeRequest.setUpdateStaffId(staffId);
			addrChangeRequest.setRequestedById(requestorStaffId);
			addrChangeRequest.setRequestDate(new java.sql.Date(System.currentTimeMillis()));
			addrChangeRequest.setType(StaffChangeRequest.ADDRESS_CHANGE);
			addrChangeRequest.setEffectiveDate(new java.sql.Date(DateFormat.getDateInstance(DateFormat.SHORT).parse((String) newValues.get("primaryStartDate")).getTime()));
			addrChangeRequest.persist();
			String addrChangeRequestId = addrChangeRequest.getChangeRequestId();
			//end init

			Staff parent = new Staff(staffId);
			if (!newValues.get("addressType").equals("Payroll")) {
				if (newValues.get("addrChangeType").equals("Permanent")) {
					OldAddress primaryAddr = parent.getPrimaryAddress();
					if (primaryAddr == null) {
						primaryAddr = new OldAddress();
						parent.assocPrimaryAddress(primaryAddr);
					}
					copyValuesToChangeRequest(addrChangeRequestId, primaryAddr, newValues);
				} else {
					OldAddress currentAddr = parent.getPrimaryAddress();
					if (currentAddr == null) {
						currentAddr = new OldAddress();
						parent.assocPrimaryAddress(currentAddr);
					}
					copyValuesToChangeRequest(addrChangeRequestId, currentAddr, newValues);//queue temp addr.

					//queue the rollback
					StaffChangeRequest addrChangeRequest2 = new StaffChangeRequest();
					addrChangeRequest2.setUpdateStaffId(staffId);
					addrChangeRequest2.setRequestedById(requestorStaffId);
					addrChangeRequest2.setRequestDate(new java.sql.Date(System.currentTimeMillis()));
					addrChangeRequest2.setType(StaffChangeRequest.ADDRESS_CHANGE);
					addrChangeRequest2.setEffectiveDate(new java.sql.Date(DateFormat.getDateInstance(DateFormat.SHORT).parse((String) newValues.get("primaryEndDate")).getTime()));
					addrChangeRequest2.persist();
					String addrChangeRequest2Id = addrChangeRequest2.getChangeRequestId();

					Hashtable h = new Hashtable();
					java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
					h.put("startDate", formatter.format(addrChangeRequest2.getEffectiveDate()));
					h.put("primaryStartDate", formatter.format(addrChangeRequest2.getEffectiveDate()));
					h.put("primaryAddress1", currentAddr.getAddress1());
					log("put " + currentAddr.getAddress1() + " into h");
					h.put("primaryAddress2", currentAddr.getAddress2());
					h.put("primaryAddress3", currentAddr.getAddress3());
					h.put("primaryAddress4", currentAddr.getAddress4());
					h.put("primaryCity", currentAddr.getCity());
					h.put("primaryState", currentAddr.getState());
					h.put("primaryZip", currentAddr.getZip());
					h.put("primaryCountry", currentAddr.getCountry());
					copyValuesToChangeRequest(addrChangeRequest2Id, currentAddr, h);
					//queue putting addr back
				}
			}
			copyValuesToChangeRequest(changeRequestId, parent, newValues);
			ApplyStaffChanges.applyChanges(changeRequest);
			ApplyStaffChanges.applyChanges(addrChangeRequest);
			new Notifier().emailStaffServices(newValues);
		} catch (java.text.ParseException pe) {
			pe.printStackTrace();
			String emsg = pe.toString(); //save the root cause
			throw new Exception(emsg);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e.toString());
		}
	}

	/**
	 *  Method called by a servlet to commit a marital status change to the database.
	 *
	 */
	public void maritalStatusChangeRequest(final String staffId, final String requestorStaffId, final Map newValues) throws Exception {
		try {
			java.sql.Date staffMarriageDate = new java.sql.Date(DateFormat.getDateInstance(DateFormat.SHORT).parse((String) newValues.get("marriageDate")).getTime());

			//Set the standard change request
			StaffChangeRequest changeRequest = new StaffChangeRequest();
			changeRequest.setUpdateStaffId(staffId);
			changeRequest.setRequestedById(requestorStaffId);
			changeRequest.setType(StaffChangeRequest.MARITAL_STATUS_CHANGE);
			changeRequest.setRequestDate(new java.sql.Date(System.currentTimeMillis()));
			changeRequest.setEffectiveDate(new java.sql.Date(System.currentTimeMillis()));
			changeRequest.persist();
			String changeRequestId = changeRequest.getChangeRequestId();

			//Set the change Request effective after the marriage 
			StaffChangeRequest changeRequestTS = new StaffChangeRequest();
			changeRequestTS.setUpdateStaffId(staffId);
			changeRequestTS.setRequestedById(requestorStaffId);
			changeRequestTS.setType(StaffChangeRequest.MARITAL_STATUS_CHANGE);
			changeRequestTS.setRequestDate(new java.sql.Date(System.currentTimeMillis()));
			changeRequestTS.setEffectiveDate(staffMarriageDate);
			changeRequestTS.persist();
			String changeRequestTSId = changeRequestTS.getChangeRequestId();

			//these spouse ones are not marked persistent unless the spouseAccountNo is not null
			StaffChangeRequest changeRequestSpouse = new StaffChangeRequest();
			changeRequestSpouse.setRequestedById(requestorStaffId);
			changeRequestSpouse.setType(StaffChangeRequest.MARITAL_STATUS_CHANGE);
			changeRequestSpouse.setRequestDate(new java.sql.Date(System.currentTimeMillis()));
			changeRequestSpouse.setEffectiveDate(new java.sql.Date(System.currentTimeMillis()));
			
			StaffChangeRequest changeRequestTSSpouse = new StaffChangeRequest();
			changeRequestTSSpouse.setRequestedById(requestorStaffId);
			changeRequestTSSpouse.setType(StaffChangeRequest.MARITAL_STATUS_CHANGE);
			changeRequestTSSpouse.setRequestDate(new java.sql.Date(System.currentTimeMillis()));
			changeRequestTSSpouse.setEffectiveDate(staffMarriageDate);

			Staff parent = new Staff(staffId);			
			copyFianceeValuesToChangeRequest(changeRequestId, parent, newValues);
			copyValuesToChangeRequest(changeRequestTSId, parent, newValues);
			
			if (newValues.get("fianceeAccountNo") != null) {
				String fianceeAccountNo = (String) newValues.get("fianceeAccountNo");
				Staff spouse = new Staff(fianceeAccountNo);
				
				changeRequestSpouse.setUpdateStaffId(fianceeAccountNo);
				changeRequestTSSpouse.setUpdateStaffId(fianceeAccountNo);
				changeRequestSpouse.persist();
				changeRequestTSSpouse.persist();
				String changeRequestSpouseId = changeRequestSpouse.getChangeRequestId();
				String changeRequestTSSpouseId = changeRequestTSSpouse.getChangeRequestId();
								
				Hashtable values = new Hashtable();
				if (spouse.getIsMale()) {
					values.put("spouseAccountNo", newValues.get("accountNo"));					
					values.put("spouseFirstName", newValues.get("firstName"));
					values.put("spouseMiddleName", newValues.get("middleName"));
					values.put("spouseLastName", newValues.get("lastName"));
				} else {
					values.put("accountNo", parent.getAccountNo()+"S");
					values.put("spouseAccountNo", parent.getAccountNo());
					values.put("spouseFirstName", parent.getLastName());
					values.put("spouseMiddleName", parent.getMiddleInitial());
					values.put("spouseLastName", parent.getPreferredName());
					values.put("lastName", newValues.get("spouseLastName"));
					values.put("middleName", newValues.get("spouseMiddleName"));
					values.put("firstName", newValues.get("spouseFirstName"));
				}
				values.put("fianceeAccountNo", parent.getAccountNo());
				values.put("maritalStatus", newValues.get("maritalStatus"));
				values.put("fianceeFirstName", parent.getPreferredName());
				values.put("fianceeMiddleName", parent.getMiddleInitial());
				values.put("fianceeLastName", parent.getLastName());
				values.put("isFianceeStaff", "true");
				values.put("marriageDate", newValues.get("marriageDate"));
				values.put("spouseEmail", parent.getEmail());
				
				copyFianceeValuesToChangeRequest(changeRequestSpouseId, spouse, values);
				copyValuesToChangeRequest(changeRequestTSSpouseId, spouse, values);
				
				ApplyStaffChanges.applyChanges(changeRequestSpouse);
				ApplyStaffChanges.applyChanges(changeRequestTSSpouse);
			}
			ApplyStaffChanges.applyChanges(changeRequest);
			ApplyStaffChanges.applyChanges(changeRequestTS);

			new Notifier().emailStaffServices(newValues);
		} catch (java.text.ParseException pe) {
			pe.printStackTrace();
			String emsg = pe.toString(); //save the root cause
			throw new Exception(emsg);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e.toString());
		}
	}

	/**
	 *  Method called by a servlet to commit a dependent status change to the database.
	 *
	 */
	public void dependentChangeRequest(final String staffId, final String requestorStaffId, final Map newValues) throws Exception {
		Iterator iter = newValues.keySet().iterator();
		while (iter.hasNext()) {
			log(Priority.DEBUG, (String) iter.next());
		}

		if (newValues.containsKey("newChild")) {
			addNewChild(staffId, requestorStaffId, newValues);
		}

		if (newValues.containsKey("ineligibleDep")) {
			log(Priority.DEBUG, "informing Staff Services of ineligible dependent");
			new Notifier().emailStaffServices(newValues);
		}
	}

	private void addNewChild(final String staffId, final String requestorStaffId, final Map newValues) throws Exception {
		try {
			StaffChangeRequest changeRequest = new StaffChangeRequest();
			changeRequest.setUpdateStaffId(staffId);
			changeRequest.setRequestedById(requestorStaffId);

			changeRequest.setType(StaffChangeRequest.DEPENDENT_CHANGE);
			changeRequest.setRequestDate(new java.sql.Date(System.currentTimeMillis()));
			changeRequest.setEffectiveDate(new java.sql.Date(System.currentTimeMillis()));
			changeRequest.setAppliedDate(new java.sql.Date(System.currentTimeMillis()));
			changeRequest.persist();
			
			String changeRequestId = changeRequest.getChangeRequestId();
			
			FieldChange birthdate = new FieldChange();
			birthdate.setField("birthDate");
			birthdate.setNewValue((String) newValues.get("birthDate"));
			birthdate.setChangeRequestId(changeRequestId);
			birthdate.persist();

			FieldChange firstName = new FieldChange();
			firstName.setField("firstName");
			firstName.setNewValue((String) newValues.get("firstName"));
			firstName.setChangeRequestId(changeRequestId);
			firstName.persist();

			//should truncate middlename to the initial
			if (newValues.containsKey("middleName")) {
				FieldChange middleName = new FieldChange();
				middleName.setField("middleName");
				middleName.setNewValue((String) newValues.get("middleName"));
				middleName.setChangeRequestId(changeRequestId);
				middleName.persist();
			}

			FieldChange lastName = new FieldChange();
			lastName.setField("lastName");
			lastName.setNewValue((String) newValues.get("lastName"));
			lastName.setChangeRequestId(changeRequestId);
			lastName.persist();

			FieldChange gender = new FieldChange();
			gender.setField("gender");
			gender.setNewValue((String) newValues.get("gender"));
			gender.setChangeRequestId(changeRequestId);
			gender.persist();

			// No auth required for this type of update.  FieldChange object is for 
			// completeness and record keeping.
			Dependent newDep = new Dependent();
			newDep.setFirstName((String) newValues.get("firstName"));
			if (newValues.containsKey("middleName")) {
				newDep.setMiddleName((String) newValues.get("middleName"));
			}
			newDep.setLastName((String) newValues.get("lastName"));
			java.sql.Date birthDate = new java.sql.Date(DateFormat.getDateInstance(DateFormat.SHORT).parse((String) newValues.get("birthDate")).getTime());
			newDep.setBirthDate(birthDate);
			newDep.setGender((String) newValues.get("gender"));
			newDep.persist();
			newDep.assocStaffId(staffId);

			Staff parent = new Staff(staffId);
			if (parent.getSpouseAccountNo() != null && parent.getSpouseAccountNo().trim().length() > 0) {
				newDep.assocStaffId(parent.getSpouseAccountNo());
			} else {
				log(Priority.ERROR, "No spouseAccountNo for " + parent.getAccountNo());
			}
			
			new Notifier().emailStaffServices(newValues);
		} catch (java.text.ParseException pe) {
			pe.printStackTrace();
			String emsg = pe.toString(); //save the root cause
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e.toString());
		}
	}

	/**
	 *  Method called by a servlet to commit a job change request to the database.
	 *
	 */
	public void jobChangeRequest(final String staffId, final String requestorStaffId, Map newValues) throws Exception {
		try {
			//Staff requestor = null;
			if (staffId.equals(requestorStaffId)) {
				//requestor = parent;
			} else {
				//requestor = new Staff(requestorStaffId);
			}
			
			//Check for duplicate Change Request - code should work if we want to use it in the future... 10/8/04 - JCS
			/*
			if( isDuplicateRequest(staffId, newValues) ) {
				throw new DuplicateRequestException();
			}*/
			
			StaffChangeRequest changeRequest = new StaffChangeRequest();
			changeRequest.setUpdateStaffId(staffId);
			changeRequest.setRequestedById(requestorStaffId);
			changeRequest.setRequestDate(new java.sql.Date(System.currentTimeMillis()));
			changeRequest.setType(StaffChangeRequest.JOB_CHANGE);
			java.sql.Date effDate = new java.sql.Date(DateFormat.getDateInstance(DateFormat.SHORT).parse((String) newValues.get("effectiveDate")).getTime());
			changeRequest.setEffectiveDate(effDate);
			changeRequest.persist();
			String changeRequestId = changeRequest.getChangeRequestId();
			
			Staff parent = new Staff(staffId);
			determineApprovalsForJobChange(parent, newValues, changeRequestId);
			copyValuesToChangeRequest(changeRequestId, parent, newValues);
			new Notifier().notifyNextAuthorizor(changeRequest);
		} catch (AuthorizerNotFoundException e) {
			throw e;
		} catch (BadRegionException e) {
			throw e;
		} catch (DuplicateRequestException e) {
			throw e;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e.toString());
		}
	}

	/**
	 * @param staffId
	 * @param newValues
	 * @return
	 */
	private boolean isDuplicateRequest(String staffId, Map newValues) throws Exception {
		Connection conn = DBConnectionFactory.getDatabaseConn();
		Statement statement = conn.createStatement();
		ResultSet rs;
		Set fields = initFieldNames();
		
		Iterator valuesIter = newValues.keySet().iterator();
		Set matches = null;
		while( valuesIter.hasNext() && (matches == null || matches.size() > 0) ) {
			String field = (String)valuesIter.next();
			if ( fields.contains(field) ) {
				String fieldChange = (String)newValues.get(field);
				String sql = "SELECT scr.ChangeRequestID FROM ministry_ChangeRequest scr " +
							"INNER JOIN istdev.ministry_FieldChange fc ON scr.ChangeRequestID = fc.Fk_hasFieldChanges " +
							"WHERE scr.updateStaff = '"+staffId+"' " +
								"AND (scr.applieddate = '' OR scr.applieddate IS NULL) " +
								"AND fc.field = '"+field+"' " +
								"AND fc.newValue = '"+fieldChange+"'";
				
				rs = statement.executeQuery(sql);
				if ( matches == null ) {
					matches = new HashSet();
					while ( rs.next() ) {
						matches.add(rs.getString(1));
					}
				} else {
					Set tempMatches = new HashSet();
					while ( rs.next() ) {
						if (matches.contains(rs.getString(1))) {
							tempMatches.add(rs.getString(1));
						}
					}
					matches = tempMatches;
				}
			}
		}
		
		return (matches.size() > 0);
	}

	/**
	 * @return
	 */
	private Set initFieldNames() {
		Set result = new HashSet();
		result.add("ministry");
		result.add("jobStatus");
		result.add("region");
		result.add("strategy");
		result.add("role");
		result.add("position");
		result.add("teamID");
		result.add("title");
		return result;
	}

	/**
	 *  Method called by a servlet to commit a leave of absence change to the database.
	 *
	 */

	// how does this w/o an effective date? how does it get applied?
	public void leaveOfAbsence(final String staffId, final String requestorStaffId, Map newValues) throws Exception {
		try {
			StaffChangeRequest changeRequest = new StaffChangeRequest();
			changeRequest.setUpdateStaffId(staffId);
			changeRequest.setRequestedById(requestorStaffId);
			changeRequest.setType(StaffChangeRequest.LEAVE_OF_ABSENCE);
			changeRequest.setRequestDate(new java.sql.Date(System.currentTimeMillis()));
			changeRequest.setEffectiveDate(new java.util.Date((String) newValues.get("beginDate")));
			changeRequest.persist();
			
			String changeRequestId = changeRequest.getChangeRequestId();

			Authorization auth1 = new Authorization();
			auth1.setSequence(1);
			auth1.setRole(StaffChangeRequest.HR_REGIONAL_DIR);
			auth1.setChangeRequestId(changeRequestId);
			auth1.persist();

			Staff parent = new Staff(staffId);
			FieldChange beginDate = new FieldChange();
			beginDate.setField("loaStartDate");
			beginDate.setNewValue((String) newValues.get("beginDate"));
			beginDate.setOldValue((parent.getLoaStartDate() == null) ? "" : parent.getLoaStartDate().toString());
			beginDate.setChangeRequestId(changeRequestId);
			beginDate.persist();

			FieldChange endDate = new FieldChange();
			endDate.setField("loaEndDate");
			endDate.setNewValue((String) newValues.get("endDate"));
			endDate.setOldValue((parent.getLoaEndDate() == null) ? "" : parent.getLoaEndDate().toString());
			endDate.setChangeRequestId(changeRequestId);
			endDate.persist();

			FieldChange leaveReason = new FieldChange();
			leaveReason.setField("loaReason");
			leaveReason.setNewValue((String) newValues.get("leaveReason"));
			leaveReason.setOldValue(parent.getLoaReason());
			leaveReason.setChangeRequestId(changeRequestId);
			leaveReason.persist();

			if (newValues.get("loaNote") != null) {
				Note loa = new Note();
				loa.setDateEntered(new java.sql.Date(System.currentTimeMillis()));
				loa.setNote((String) newValues.get("loaNote"));
				loa.persist();
				FieldChange loaNote = new FieldChange();
				loaNote.setField("loaNote");
				loaNote.setNewValue(loa.getNoteId());
				loaNote.setChangeRequestId(changeRequestId);
				loaNote.persist();
			}
			new Notifier().notifyNextAuthorizor(changeRequest);
		} catch (AuthorizerNotFoundException e) {
			throw e;
		} catch (BadRegionException e) {
			throw e;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e.toString());
		}
	}

	/**
	 *  Method called by a servlet to commit resignation to the database.
	 *
	 */

	public void resignation(final String staffId, final String requestorStaffId, Map newValues)
		throws Exception {
		try {
			StaffChangeRequest changeRequest = new StaffChangeRequest();
			changeRequest.setUpdateStaffId(staffId);
			changeRequest.setRequestedById(requestorStaffId);
			changeRequest.setType(StaffChangeRequest.RESIGNATION);
			changeRequest.setRequestDate(new java.sql.Date(System.currentTimeMillis()));
			changeRequest.setEffectiveDate(new java.util.Date((String) newValues.get("resignationDate")));
			if(newValues.get("newRegion")!=null)	// only store the region in the change request table if they didn't have a region when they made the change request (to not duplicate pending requests)
				changeRequest.setRegion((String) newValues.get("newRegion"));
			changeRequest.persist();
			
			String changeRequestId = changeRequest.getChangeRequestId();

			Authorization auth1 = new Authorization();
			auth1.setSequence(1);
			auth1.setRole(StaffChangeRequest.HR_REGIONAL_DIR);
			auth1.setChangeRequestId(changeRequestId);
			auth1.persist();

			FieldChange keepSupport = new FieldChange();
			keepSupport.setField("keepSupport");
			keepSupport.setNewValue((String) newValues.get("keepSupport"));
			keepSupport.setChangeRequestId(changeRequestId);
			keepSupport.persist();
			
			FieldChange lastDay = new FieldChange();
			lastDay.setField("resignationDate");
			lastDay.setNewValue((String) newValues.get("resignationDate"));
			
			Staff parent = new Staff(staffId);
			
			FieldChange teamID = new FieldChange();
			teamID.setField("teamID");
			teamID.setNewValue("");
			teamID.setOldValue(parent.getLocalLevelId());
			teamID.setChangeRequestId(changeRequestId);
			teamID.persist();
			
			lastDay.setOldValue((parent.getResignationDate() == null) ? "" : parent.getResignationDate().toString());
			lastDay.setChangeRequestId(changeRequestId);
			lastDay.persist();			

			FieldChange resignationReason = new FieldChange();
			resignationReason.setField("resignationReason");
			resignationReason.setNewValue((String) newValues.get("resignReason"));
			resignationReason.setOldValue(parent.getResignationReason());
			resignationReason.setChangeRequestId(changeRequestId);
			resignationReason.persist();			

			if (newValues.get("resignationLetter") != null) {
				Note note = new Note();
				note.setNote((String) newValues.get("resignationLetter"));
				note.setDateEntered(new java.sql.Date(System.currentTimeMillis()));
				note.persist();
				FieldChange resignationLetter = new FieldChange();
				resignationLetter.setField("resignationLetter");
				resignationLetter.setNewValue(note.getNoteId());
				resignationLetter.setChangeRequestId(changeRequestId);
				resignationLetter.persist();
			}

			FieldChange severanceRequest = new FieldChange();
			severanceRequest.setField("severancePayMonthsReq");
			severanceRequest.setNewValue((String) newValues.get("severanceRequest"));
			severanceRequest.setOldValue(Long.toString(parent.getSeverancePayMonthsReq()));
			severanceRequest.setChangeRequestId(changeRequestId);
			severanceRequest.persist();			

			FieldChange contributionsToOtherAcct = new FieldChange();
			contributionsToOtherAcct.setField("contributionsToOtherAcct");
			contributionsToOtherAcct.setOldValue((new Boolean(parent.getContributionsToOtherAcct())).toString());
			contributionsToOtherAcct.setChangeRequestId(changeRequestId);
			if (newValues.get("anotherAccountName") != null) {
				contributionsToOtherAcct.setNewValue("true");

				FieldChange contributionsToAcntName = new FieldChange();
				contributionsToAcntName.setField("contributionsToAcntName");
				contributionsToAcntName.setNewValue((String) newValues.get("anotherAccountName"));
				contributionsToAcntName.setOldValue(parent.getContributionsToAcntName());
				contributionsToAcntName.setChangeRequestId(changeRequestId);
				contributionsToAcntName.persist();			
				
				FieldChange contributionsToAcntNo = new FieldChange();
				contributionsToAcntNo.setField("contributionsToAcntNo");
				contributionsToAcntNo.setNewValue((String) newValues.get("anotherAccountNumber"));
				contributionsToAcntNo.setOldValue(parent.getContributionsToAcntNo());
				contributionsToAcntNo.setChangeRequestId(changeRequestId);
				contributionsToAcntNo.persist();			
			} else {
				contributionsToOtherAcct.setNewValue("false");
			}
			contributionsToOtherAcct.persist();
			new Notifier().notifyNextAuthorizor(changeRequest);
		} catch (AuthorizerNotFoundException e) {
			throw e;
		} catch (BadRegionException e) {
			throw e;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e.toString());
		}
	}

	private void determineApprovalsForJobChange(Staff parent, Map newValues, String changeRequestId) throws Exception {
		//begin Determine necessary approavals
		if (newValues.get("ministry") != null && !parent.getMinistry().equals(newValues.get("ministry"))) {
			Authorization auth1, auth2, auth3 = null;
			if ((parent.getMinistry().equals("Campus Ministry")
				|| parent.getMinistry().equals("Campus")
				|| parent.getMinistry().equals(""))
				&& ((String) newValues.get("ministry")).equals("Campus Ministry")) {
				//bypass normal approval process because this is probably all about an unness or already campus update
				if ( newValues.get("region") != null && !parent.getRegion().equals(newValues.get("region")) ) {
					addRegionChangeAuthorizations(parent, changeRequestId);
				} else {
					addDefaultAuthorization(changeRequestId);
				}
				log(Priority.DEBUG, "Executing the bypass");
			} else if (
				parent.getMinistry().equals("Campus Ministry")
					&& (!((String) newValues.get("ministry")).equals("Campus Ministry"))) {
				// Campus to Non-Campus	
				log(Priority.DEBUG, "Executing campus to non-campus");
				auth1 = new Authorization();
				auth1.setRole(StaffChangeRequest.HR_REGIONAL_DIR);
				auth1.setSequence(1);
				auth1.setChangeRequestId(changeRequestId);
				auth1.persist();
				
				auth2 = new Authorization();
				auth2.setRole(StaffChangeRequest.HR_NATIONAL_DIR);
				auth2.setSequence(2);
				auth2.setChangeRequestId(changeRequestId);
				auth2.persist();

				auth3 = new Authorization();
				auth3.setSequence(3);
				auth3.setRole(StaffChangeRequest.HR_NON_CAMPUS);
				auth3.setChangeRequestId(changeRequestId);
				auth3.persist();
			} else {
				// Non-Campus to Campus
				log(Priority.DEBUG, "Executing non-campus to campus");
				auth1 = new Authorization();
				auth1.setSequence(1);
				auth1.setRole(StaffChangeRequest.HR_NON_CAMPUS);
				auth1.setChangeRequestId(changeRequestId);
				auth1.persist();

				auth2 = new Authorization();
				auth2.setRole(StaffChangeRequest.HR_NATIONAL_DIR);
				auth2.setSequence(2);
				auth2.setChangeRequestId(changeRequestId);
				auth2.persist();

				auth3 = new Authorization();
				auth3.setRole(StaffChangeRequest.HR_REGIONAL_DIR);
				auth3.setSequence(3);
				auth3.setChangeRequestId(changeRequestId);
				auth3.persist();
			}
		}
		else if ( newValues.get("region") != null && !parent.getRegion().equals(newValues.get("region")) ) {
			addRegionChangeAuthorizations(parent, changeRequestId);
		} else {
			//this is where the default authorization gets added
			// job change is within region
			addDefaultAuthorization(changeRequestId);
		}
	}
	
	private void addDefaultAuthorization(String changeRequestId) {
		Authorization auth1 = new Authorization();
		auth1.setSequence(1);
		auth1.setRole(StaffChangeRequest.HR_REGIONAL_DIR);
		auth1.setChangeRequestId(changeRequestId);
		auth1.persist();
	}
	
	private void addRegionChangeAuthorizations(Staff parent, String changeRequestId) {
		Authorization auth1, auth2;
		auth1 = new Authorization();
		auth1.setSequence(1);
		auth1.setRole(StaffChangeRequest.HR_REGIONAL_DIR);
		//if the sending region is null we should just pre-authorize the first one
		if ((parent.getRegion() == null)
			|| (parent.getRegion().equals(" "))
			|| (parent.getRegion().length() == 0)) {
			log(Priority.DEBUG, "parent region is 0 length. pre-authorizing");
			auth1.setAuthorized("Y");
			auth1.setAuthDate(new java.sql.Date(System.currentTimeMillis()));
		} else {
			log(Priority.DEBUG, "parent region is NOT 0 length");
			log(Priority.DEBUG, "parent region is: " + parent.getRegion());
		}
		auth2 = new Authorization();
		auth2.setSequence(2);
		auth2.setRole(StaffChangeRequest.HR_REGIONAL_DIR);
		auth1.setChangeRequestId(changeRequestId);
		auth2.setChangeRequestId(changeRequestId);
		auth1.persist();
		auth2.persist();
	}

	private void copyValuesToChangeRequest(String changeRequestId, Staff parent, Map newValues) throws Exception {
		// Begin AddressChange Section
		if (newValues.get("countryStatus") != null) {
			FieldChange countryStatus = new FieldChange();
			countryStatus.setField("countryStatus");
			countryStatus.setOldValue(parent.getCountryStatus());
			countryStatus.setNewValue((String) newValues.get("countryStatus"));
			countryStatus.setChangeRequestId(changeRequestId);
			countryStatus.persist();
		}

		if (newValues.get("homePhone") != null
			&& (parent.getHomePhone() == null
				|| !parent.getHomePhone().equals((String) newValues.get("homePhone")))) {
			FieldChange homePhone = new FieldChange();
			homePhone.setField("homePhone");
			homePhone.setOldValue((parent.getHomePhone() == null) ? "" : parent.getHomePhone());
			homePhone.setNewValue((String) newValues.get("homePhone"));
			homePhone.setChangeRequestId(changeRequestId);
			homePhone.persist();
		}

		if (newValues.get("workPhone") != null
			&& (parent.getWorkPhone() == null
				|| !parent.getWorkPhone().equals((String) newValues.get("workPhone")))) {
			FieldChange workPhone = new FieldChange();
			workPhone.setField("workPhone");
			workPhone.setOldValue((parent.getWorkPhone() == null) ? "" : parent.getWorkPhone());
			workPhone.setNewValue((String) newValues.get("workPhone"));
			workPhone.setChangeRequestId(changeRequestId);
			workPhone.persist();
		}

		if (newValues.get("email") != null
			&& (parent.getEmail() == null
				|| !parent.getEmail().equals((String) newValues.get("email")))) {
			FieldChange email = new FieldChange();
			email.setField("email");
			email.setOldValue(parent.getEmail());
			email.setNewValue((String) newValues.get("email"));
			email.setChangeRequestId(changeRequestId);
			email.persist();
		}

		if (newValues.get("spouseEmail") != null
			&& (parent.getSpouseEmail() == null
				|| !parent.getSpouseEmail().equals((String) newValues.get("spouseEmail")))) {
			FieldChange spouseEmail = new FieldChange();
			spouseEmail.setField("spouseEmail");
			spouseEmail.setOldValue(parent.getSpouseEmail());
			spouseEmail.setNewValue((String) newValues.get("spouseEmail"));
			spouseEmail.setChangeRequestId(changeRequestId);
			spouseEmail.persist();
		}

		if (newValues.get("primaryEmpLocState") != null
			&& (parent.getPrimaryEmpLocState() == null
				|| !parent.getPrimaryEmpLocState().equals(
					(String) newValues.get("primaryEmpLocState")))) {
			FieldChange primaryEmpLocState = new FieldChange();
			primaryEmpLocState.setField("primaryEmpLocState");
			primaryEmpLocState.setOldValue(parent.getPrimaryEmpLocState());
			primaryEmpLocState.setNewValue((String) newValues.get("primaryEmpLocState"));
			primaryEmpLocState.setChangeRequestId(changeRequestId);
			primaryEmpLocState.persist();
		}

		if (newValues.get("primaryEmpLocCountry") != null
			&& (parent.getPrimaryEmpLocCountry() == null
				|| !parent.getPrimaryEmpLocCountry().equals(
					(String) newValues.get("primaryEmpLocCountry")))) {
			FieldChange primaryEmpLocCountry = new FieldChange();
			primaryEmpLocCountry.setField("primaryEmpLocCountry");
			primaryEmpLocCountry.setOldValue(parent.getPrimaryEmpLocCountry());
			primaryEmpLocCountry.setNewValue((String) newValues.get("primaryEmpLocCountry"));
			primaryEmpLocCountry.setChangeRequestId(changeRequestId);
			primaryEmpLocCountry.persist();
		}

		if (newValues.get("primaryEmpLocCity") != null
			&& (parent.getPrimaryEmpLocCity() == null
				|| !parent.getPrimaryEmpLocCity().equals(
					(String) newValues.get("primaryEmpLocCity")))) {
			FieldChange primaryEmpLocCity = new FieldChange();
			primaryEmpLocCity.setField("primaryEmpLocCity");
			primaryEmpLocCity.setOldValue(parent.getPrimaryEmpLocCity());
			primaryEmpLocCity.setNewValue((String) newValues.get("primaryEmpLocCity"));
			primaryEmpLocCity.setChangeRequestId(changeRequestId);
			primaryEmpLocCity.persist();
		}
		//End AddressChange Section

		// Begin Married Section - look in copyFiancee method for copying the fiancee fields
		if (newValues.get("maritalStatus") != null) {
			FieldChange maritalStatus = new FieldChange();
			maritalStatus.setField("maritalStatus");
			maritalStatus.setNewValue((String) newValues.get("maritalStatus"));
			maritalStatus.setOldValue(parent.getMaritalStatus());
			maritalStatus.setChangeRequestId(changeRequestId);
			maritalStatus.persist();
		}

		//spouse is always the other person relative to the person initiating this request
		if (newValues.get("spouseAccountNo") != null) {
			FieldChange spouseAccountNo = new FieldChange();
			spouseAccountNo.setField("spouseAccountNo");
			//if this person is male, the wife's account no. will change to be his + S.  the wife's record and account no. will be added to the staff table in the nightly updater.
			if (parent.getIsMale()) {
				spouseAccountNo.setNewValue(parent.getAccountNo() + "S");
			} else {
				spouseAccountNo.setNewValue((String) newValues.get("spouseAccountNo"));
			}
			spouseAccountNo.setOldValue(parent.getSpouseAccountNo());
			spouseAccountNo.setChangeRequestId(changeRequestId);
			spouseAccountNo.persist();
		}

		if (newValues.get("spouseFirstName") != null) {
			FieldChange spouseFirstName = new FieldChange();
			spouseFirstName.setField("spouseFirstName");
			spouseFirstName.setNewValue((String) newValues.get("spouseFirstName"));
			spouseFirstName.setOldValue(parent.getSpouseFirstName());
			spouseFirstName.setChangeRequestId(changeRequestId);
			spouseFirstName.persist();
		}

		if (newValues.get("spouseMiddleName") != null) {
			FieldChange spouseMiddleName = new FieldChange();
			spouseMiddleName.setField("spouseMiddleName");
			spouseMiddleName.setNewValue((String) newValues.get("spouseMiddleName"));
			spouseMiddleName.setOldValue(parent.getSpouseMiddleName());
			spouseMiddleName.setChangeRequestId(changeRequestId);
			spouseMiddleName.persist();
		}

		if (newValues.get("spouseLastName") != null) {
			FieldChange spouseLastName = new FieldChange();
			spouseLastName.setField("spouseLastName");
			spouseLastName.setNewValue((String) newValues.get("spouseLastName"));
			spouseLastName.setOldValue(parent.getSpouseLastName());
			spouseLastName.setChangeRequestId(changeRequestId);
			spouseLastName.persist();
		}

		if (newValues.get("spouseEmail") != null) {
			FieldChange spouseEmail = new FieldChange();
			spouseEmail.setField("spouseEmail");
			spouseEmail.setNewValue((String) newValues.get("spouseEmail"));
			spouseEmail.setOldValue(parent.getEmail());
			spouseEmail.setChangeRequestId(changeRequestId);
			spouseEmail.persist();
		}
		if (!parent.getIsMale()) {	
			// changing the woman's name and account #. what if husband's changing name? you can't enter it on the form
			if (newValues.get("lastName") != null) {
				FieldChange lastName = new FieldChange();
				lastName.setField("lastName");
				lastName.setNewValue((String)newValues.get("lastName"));
				lastName.setOldValue(parent.getLastName());
				lastName.setChangeRequestId(changeRequestId);
				lastName.persist();
			}
			if (newValues.get("firstName") != null) {
				FieldChange firstName = new FieldChange();
				firstName.setField("firstName");
				firstName.setNewValue((String)newValues.get("firstName"));
				firstName.setOldValue(parent.getFirstName());
				firstName.setChangeRequestId(changeRequestId);
				firstName.persist();
			}
			if (newValues.get("middleName") != null) {
				FieldChange middleInitial = new FieldChange();
				middleInitial.setField("middleInitial");
				middleInitial.setNewValue((String)newValues.get("middleName"));
				middleInitial.setOldValue(parent.getMiddleInitial());
				middleInitial.setChangeRequestId(changeRequestId);
				middleInitial.persist();	
			}
			if (newValues.get("accountNo") != null) {
				FieldChange middleInitial = new FieldChange();
				middleInitial.setField("accountNo");
				middleInitial.setNewValue((String)newValues.get("accountNo"));
				middleInitial.setOldValue(parent.getAccountNo());
				middleInitial.setChangeRequestId(changeRequestId);
				middleInitial.persist();	
			}
		}
		// End Married Section

		// Begin JobChange Section
		if (newValues.get("ministry") != null) {
			log(Priority.DEBUG, "The newValues-ministry is NOT NULL");
			FieldChange ministry = new FieldChange();
			ministry.setField("ministry");
			ministry.setNewValue((String) newValues.get("ministry"));
			ministry.setOldValue(parent.getMinistry());
			ministry.setChangeRequestId(changeRequestId);
			ministry.persist();
		}
		if (newValues.get("jobStatus") != null) {
			FieldChange jobStatus = new FieldChange();
			jobStatus.setField("jobStatus");
			jobStatus.setNewValue((String) newValues.get("jobStatus"));
			jobStatus.setOldValue(parent.getJobStatus());
			jobStatus.setChangeRequestId(changeRequestId);
			jobStatus.persist();
		}
		if (newValues.get("region") != null) {
			FieldChange region = new FieldChange();
			region.setField("region");
			region.setNewValue((String) newValues.get("region"));
			region.setOldValue(parent.getRegion());
			region.setChangeRequestId(changeRequestId);
			region.persist();
		}
		if (newValues.get("strategy") != null) {
			FieldChange strategy = new FieldChange();
			strategy.setField("strategy");
			strategy.setNewValue((String) newValues.get("strategy"));
			strategy.setOldValue(parent.getStrategy());
			strategy.setChangeRequestId(changeRequestId);
			strategy.persist();
		}
		if (newValues.get("role") != null) {
			FieldChange position = new FieldChange();
			position.setField("role");
			position.setNewValue((String) newValues.get("role"));
			position.setOldValue(parent.getPosition());
			position.setChangeRequestId(changeRequestId);
			position.persist();
		}
		if (newValues.get("position") != null) {
			FieldChange position = new FieldChange();
			position.setField("position");
			position.setNewValue((String) newValues.get("position"));
			position.setOldValue(parent.getPosition());
			position.setChangeRequestId(changeRequestId);
			position.persist();
		}
		if (newValues.get("teamID") != null) {
			FieldChange teamID = new FieldChange();
			teamID.setField("teamID");
			teamID.setNewValue((String) newValues.get("teamID"));
			teamID.setOldValue((parent.getMembership() == null) ? "" : parent.getMembership().getLocalLevelId());
			teamID.setChangeRequestId(changeRequestId);
			teamID.persist();
		}
		if (newValues.get("title") != null) {
			FieldChange jobTitle = new FieldChange();
			jobTitle.setField("title");
			jobTitle.setNewValue((String) newValues.get("title"));
			jobTitle.setOldValue(parent.getJobTitle());
			jobTitle.setChangeRequestId(changeRequestId);
			jobTitle.persist();
		}
		if (newValues.get("location") != null) {
			FieldChange location = new FieldChange();
			location.setField("workLocation");
			location.setNewValue((String)newValues.get("location"));
			location.setOldValue(parent.getPrimaryEmpLocDesc());
			location.setChangeRequestId(changeRequestId);
			location.persist();
		}
		//End JobChange Section
	}

	private void copyValuesToChangeRequest(String changeRequestId, OldAddress addr, Map newValues) throws Exception {
		//change type is permanent
		if (newValues.get("startDate") != null) {
			FieldChange primaryStartDate = new FieldChange();
			primaryStartDate.setField("startDate");
			primaryStartDate.setOldValue(
				(addr.getStartDate() == null) ? "" : addr.getStartDate().toString());
			primaryStartDate.setNewValue((String) newValues.get("primaryStartDate"));
			primaryStartDate.setChangeRequestId(changeRequestId);
			primaryStartDate.persist();
		}

		if (newValues.get("primaryEndDate") != null) {
			FieldChange primaryEndDate = new FieldChange();
			primaryEndDate.setField("endDate");
			primaryEndDate.setOldValue((addr.getEndDate() == null) ? "" : addr.getEndDate().toString());
			primaryEndDate.setNewValue((String) newValues.get("primaryEndDate"));
			primaryEndDate.setChangeRequestId(changeRequestId);
			primaryEndDate.persist();
		}

		if (newValues.get("primaryAddress1") != null) {
			FieldChange primaryAddress1 = new FieldChange();
			primaryAddress1.setField("address1");
			primaryAddress1.setOldValue((addr.getAddress1() == null) ? "" : addr.getAddress1());
			primaryAddress1.setNewValue((String) newValues.get("primaryAddress1"));
			primaryAddress1.setChangeRequestId(changeRequestId);
			primaryAddress1.persist();
		}

		if (newValues.get("primaryAddress2") != null) {
			FieldChange primaryAddress2 = new FieldChange();
			primaryAddress2.setField("address2");
			primaryAddress2.setOldValue((addr.getAddress2() == null) ? "" : addr.getAddress2());
			primaryAddress2.setNewValue((String) newValues.get("primaryAddress2"));
			primaryAddress2.setChangeRequestId(changeRequestId);
			primaryAddress2.persist();
		}

		if (newValues.get("primaryAddress3") != null) {
			FieldChange primaryAddress3 = new FieldChange();
			primaryAddress3.setField("address3");
			primaryAddress3.setOldValue((addr.getAddress3() == null) ? "" : addr.getAddress3());
			primaryAddress3.setNewValue((String) newValues.get("primaryAddress3"));
			primaryAddress3.setChangeRequestId(changeRequestId);
			primaryAddress3.persist();
		}

		if (newValues.get("primaryAddress4") != null) {
			FieldChange primaryAddress4 = new FieldChange();
			primaryAddress4.setField("address4");
			primaryAddress4.setOldValue((addr.getAddress4() == null) ? "" : addr.getAddress4());
			primaryAddress4.setNewValue((String) newValues.get("primaryAddress4"));
			primaryAddress4.setChangeRequestId(changeRequestId);
			primaryAddress4.persist();
		}

		if (newValues.get("primaryCity") != null) {
			FieldChange primaryCity = new FieldChange();
			primaryCity.setField("city");
			primaryCity.setOldValue((addr.getCity() == null) ? "" : addr.getCity());
			primaryCity.setNewValue((String) newValues.get("primaryCity"));
			primaryCity.setChangeRequestId(changeRequestId);
			primaryCity.persist();
		}

		if (newValues.get("primaryState") != null) {
			FieldChange primaryState = new FieldChange();
			primaryState.setField("state");
			primaryState.setOldValue((addr.getState() == null) ? "" : addr.getState());
			primaryState.setNewValue((String) newValues.get("primaryState"));
			primaryState.setChangeRequestId(changeRequestId);
			primaryState.persist();
		}

		if (newValues.get("primaryZip") != null) {
			FieldChange primaryZip = new FieldChange();
			primaryZip.setField("zip");
			primaryZip.setOldValue((addr.getZip() == null) ? "" : addr.getZip());
			primaryZip.setNewValue((String) newValues.get("primaryZip"));
			primaryZip.setChangeRequestId(changeRequestId);
			primaryZip.persist();
		}

		if (newValues.get("primaryCountry") != null) {
			FieldChange primaryCountry = new FieldChange();
			primaryCountry.setField("country");
			primaryCountry.setOldValue((addr.getCountry() == null) ? "" : addr.getCountry());
			primaryCountry.setNewValue((String) newValues.get("primaryCountry"));
			primaryCountry.setChangeRequestId(changeRequestId);
			primaryCountry.persist();
		}
	}

	private void copyFianceeValuesToChangeRequest(String changeRequestId, Staff parent, Map newValues) throws Exception {
		//These fields get updated at a different time than the spouse changes so they can't be mixed in with those changes.
		//Begin Marital Status Change Section Non TS
		if (newValues.get("fianceeFirstName") != null) {
			FieldChange fianceeFirstName = new FieldChange();
			fianceeFirstName.setField("fianceeFirstName");
			fianceeFirstName.setNewValue((String) newValues.get("fianceeFirstName"));
			fianceeFirstName.setOldValue(parent.getFianceeFirstName());
			fianceeFirstName.setChangeRequestId(changeRequestId);
			fianceeFirstName.persist();
		}
		if (newValues.get("fianceeMiddleName") != null) {
			FieldChange fianceeMiddleName = new FieldChange();
			fianceeMiddleName.setField("fianceeMiddleName");
			fianceeMiddleName.setNewValue((String) newValues.get("fianceeMiddleName"));
			fianceeMiddleName.setOldValue(parent.getFianceeMiddleName());
			fianceeMiddleName.setChangeRequestId(changeRequestId);
			fianceeMiddleName.persist();
		}
		if (newValues.get("fianceeLastName") != null) {
			FieldChange fianceeLastName = new FieldChange();
			fianceeLastName.setField("fianceeLastName");
			fianceeLastName.setNewValue((String) newValues.get("fianceeLastName"));
			fianceeLastName.setOldValue(parent.getFianceeLastName());
			fianceeLastName.setChangeRequestId(changeRequestId);
			fianceeLastName.persist();
		}
		if (newValues.get("marriageDate") != null) {
			FieldChange marriageDate = new FieldChange();
			marriageDate.setField("marriageDate");
			marriageDate.setNewValue((String) newValues.get("marriageDate"));
			marriageDate.setOldValue((parent.getMarriageDate() == null) ? "" : parent.getMarriageDate().toString());
			marriageDate.setChangeRequestId(changeRequestId);
			marriageDate.persist();
		}
		if (newValues.get("isFianceeStaff") != null) {
			FieldChange isFianceeStaff = new FieldChange();
			isFianceeStaff.setField("isFianceeStaff");
			isFianceeStaff.setNewValue((String) newValues.get("isFianceeStaff"));
			isFianceeStaff.setOldValue((new Boolean(parent.getIsFianceeStaff())).toString());
			isFianceeStaff.setChangeRequestId(changeRequestId);
			isFianceeStaff.persist();
		}
		if (newValues.get("fianceeAccountNo") != null) {
			FieldChange fianceeAccountNo = new FieldChange();
			fianceeAccountNo.setField("fianceeAccountNo");
			fianceeAccountNo.setNewValue((String) newValues.get("fianceeAccountNo"));
			fianceeAccountNo.setOldValue(parent.getFianceeAccountNo());
			fianceeAccountNo.setChangeRequestId(changeRequestId);
			fianceeAccountNo.persist();
		}
		if (newValues.get("fianceeJoinStaffDate") != null) {
			FieldChange fianceeJoinStaffDate = new FieldChange();
			fianceeJoinStaffDate.setField("fianceeJoinStaffDate");
			fianceeJoinStaffDate.setNewValue((String) newValues.get("fianceeJoinStaffDate"));
			fianceeJoinStaffDate.setOldValue((parent.getFianceeJoinStaffDate() == null) ? "" : parent.getFianceeJoinStaffDate().toString());
			fianceeJoinStaffDate.setChangeRequestId(changeRequestId);
			fianceeJoinStaffDate.persist();
		}
		if (newValues.get("isFianceeJoiningNS") != null) {
			FieldChange isFianceeJoiningNS = new FieldChange();
			isFianceeJoiningNS.setField("isFianceeJoiningNS");
			isFianceeJoiningNS.setNewValue((String) newValues.get("isFianceeJoiningNS"));
			isFianceeJoiningNS.setOldValue((new Boolean(parent.getIsFianceeJoiningNS())).toString());
			isFianceeJoiningNS.setChangeRequestId(changeRequestId);
			isFianceeJoiningNS.persist();
		}
		if (newValues.get("joiningNS") != null) {
			FieldChange joiningNS = new FieldChange();
			joiningNS.setField("joiningNS");
			joiningNS.setNewValue((String) newValues.get("joiningNS"));
			joiningNS.setOldValue((new Boolean(parent.getJoiningNS())).toString());
			joiningNS.setChangeRequestId(changeRequestId);
			joiningNS.persist();
		}
		//End Marital Status Change Section Non TS
	}

	static private void log(String msg) {
		System.out.println(msg);
	}
	static private void log(org.apache.log4j.Priority p, String msg) {
		log(msg);
	}
}