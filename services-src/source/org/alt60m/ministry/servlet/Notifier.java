package org.alt60m.ministry.servlet;

import java.io.*;
import org.alt60m.util.SendMessage;
import org.alt60m.ministry.*;
import org.alt60m.ministry.model.dbio.*;
import java.util.*;
import org.apache.log4j.*;

public class Notifier {

	public Notifier() {
		getConfigProperties(org.alt60m.servlet.ObjectMapping.getConfigPath() + "/hrtool_notification.properties");
/*
System.out.println("***********************");
		System.out.println("WEBSITE_EMAIL_ADDR = " + WEBSITE_EMAIL_ADDR + "\nERROR_EMAIL = " + ERROR_EMAIL + "\nPIU_STAFF_SERVICES_EMAIL = "+PIU_STAFF_SERVICES_EMAIL+"\nACS_STAFF_SERVICES_EMAIL = "+ACS_STAFF_SERVICES_EMAIL);
System.out.println("***********************");
*/
	}

    /**
     *  Static method that will take an unordered <CODE>Collection</CODE> of AuthorizationObjects
     *  and put them into a <CODE>List</CODE>, ordered by their sequence number.
     */
    public List orderAuthorizationsBySequence(Collection auth) {
	List orderedAuths = new ArrayList();
	for (int i=1;i<=auth.size();i++) {
	    Iterator it = auth.iterator();
	    while (it.hasNext()) {
		Authorization authObj = (Authorization) it.next();
		if (authObj.getSequence() == i) {
		    orderedAuths.add(authObj);
		}
	    }
	}
	return orderedAuths;
    }

    /**
     *  This method both identifies the next Staff person that needs to authorize a change
     *  request, gets his/her email address, and sends an email notifying of a pending change
     *  that requires their authorization.
     */
    public void notifyNextAuthorizor(StaffChangeRequest change) throws Exception {
	log(Priority.DEBUG, "Entering notifyNextAuthorizer");
	try {
	    final String nextAuthorizorEmail;
	    Staff updateStaff = change.getUpdateStaff();			// get staff record for staff person being updated
	    List orderedAuths = orderAuthorizationsBySequence(change.getAuthorizations());
	    //boolean region2region = false;
	    String receivingRegion = null;
		
	    // if we are moving from region to region, the hard part is getting the
	    // receiving region - need to iterate through the fieldchanges to find
	    // where FieldObject.getField() is equal to "region"
		Collection c = change.getFieldChanges();
		Iterator it = c.iterator();
		while (it.hasNext() && receivingRegion == null) {
			FieldChange field = (FieldChange) it.next();
			if (field.getField().equals("region")) {
				// found it
				receivingRegion = field.getNewValue();
				//region2region = true;
				log(Priority.DEBUG, "region to region is true");
				log(Priority.DEBUG, "receiving region is " + receivingRegion);
			}
		}
		
	    ListIterator lit = orderedAuths.listIterator();
	    String region = updateStaff.getRegion();
	    if(region==null||region.equals(""))		// only get the region from the change request table if they have no region
	    {
	    	if(change.getType().equals("Resignation"))
	    	{
	    		region= change.getRegion();
	    	}
	    }
	    Authorization auth = null;
	    // Now we need to look for the next Authorization Object that is untouched
	    while (lit.hasNext()) {
			auth = (Authorization) lit.next();	
			if (auth.getAuthorized() == null || auth.getAuthorized().equals("")) {
				// OK, now we have the next required authorization, need to get
				// the required role and (if applicable) region
				if (receivingRegion != null && auth.getSequence() != 1) {
					region = receivingRegion;
				}
				log(Priority.DEBUG, "** looking for auth for :" + region + ": region");
				log(Priority.DEBUG, "*** sequence no " + auth.getSequence() + " is unauthorized");
				break;
			}
	    }    

	    // at this point it is either the campus or non-campus message that needs to be sent
	    
	    // HRNC authorization...needs to be fake authorized and sent on to next authorizor
	    if (auth.getRole().equals(StaffChangeRequest.HR_NON_CAMPUS)) {
	    	HRTool hrt = new HRTool();
	    	hrt.authorize(change.getChangeRequestId(), auth.getAuthorizationId(), null, "StaffSite");
	    	
	    // HRNC authorization...no more auths to go so apply changes and send to Staff Services
/*		} else if (auth.getRole().equals(StaffChangeRequest.HR_NON_CAMPUS) && auth.getSequence() == 3) {
			ApplyStaffChanges.applyChanges(change); //Really we should apply these changes someplace else
			log(Priority.DEBUG, "Could be emailing SS now, hopefully w/ a pending approval message");
			emailStaffServices(change.getChangeRequestId());
*/			//notifyNonCampus();
	    } else if (auth.getRole().equals(StaffChangeRequest.HR_REGIONAL_DIR) || auth.getRole().equals(StaffChangeRequest.HR_NATIONAL_DIR)) {
			log(Priority.DEBUG, "notifying a campus person from :" + region + ": region");
			log(Priority.DEBUG, "using auth with seqno " + auth.getSequence());
			
			// If no region, automatically approve (since we're forcing them to have a region now)
			if ( auth.getRole().equals(StaffChangeRequest.HR_REGIONAL_DIR) && auth.getSequence() == 1 && region.equals("") ) {
				AuthorizeChangeRequest aci = new AuthorizeChangeRequest();
				aci.authorize(change.getChangeRequestId(), auth.getAuthorizationId(), "Automated Authorization due to null region.", "StaffSite");
			}
			
			// If a strange region, error out.
			if ( !region.equals("GL") &&
					!region.equals("GP") &&
					!region.equals("MA") &&
					!region.equals("MS") &&
					!region.equals("NC") &&
					!region.equals("NE") &&
					!region.equals("NW") &&
					!region.equals("RR") &&
					!region.equals("SE") &&
					!region.equals("SW") &&
					!region.equals("UM") &&
					!region.equals("IN") ) {
				throw new BadRegionException(region, "");
			}
						
			// Go ahead
			else {
				notifyCampus(change, updateStaff, auth, region);
			}
	    }
	} catch (AuthorizerNotFoundException e) {
		throw e;
	} catch (BadRegionException e) {
		throw e;
	} catch (Exception e) {
		e.printStackTrace();
	    throw new Exception(e.toString());
	}
    }

    private void notifyNonCampus() {
	// here is where we compose and send the message to staff services regarding this change
	log(Priority.DEBUG, "NOT IMPLEMENTED Notifying Non-Campus Person");
    }

    private void notifyCampus(StaffChangeRequest change, Staff updateStaff, Authorization auth, String region) throws Exception {
	log(Priority.DEBUG, "in notifyCampus");
	try {
	    log(Priority.DEBUG, "before lookupAuthEmail");
	    String nextAuthorizorEmail = lookUpAuthEmail(auth, region);
	    log(Priority.DEBUG, "past lookUpAuthEmail");	
	    log(Priority.DEBUG, "next authorizor: " + nextAuthorizorEmail);
	    final String lastName = updateStaff.getLastName();
	    final String firstName = updateStaff.getFirstName();
	    final String changeType = change.getType();
	   
	    SendMessage sm = new SendMessage();
	    sm.setTo(nextAuthorizorEmail);
	    sm.setFrom(WEBSITE_EMAIL_ADDR);
	    sm.setSubject("Staff Change Request");
	    
	    String body = "A Staff person has submitted a change request that requires your authorization.\n\n";
	    body += "Name: " + firstName + " " + lastName + "\n";
	    body += changeType + "\n\n";
	    body += "Please go to the Staff Tools page and click on 'View Pending Requests' to see more details";
	    
	    sm.setBody(body);
	    sm.send(true);
	    
	    // Check to make sure the rest of authorizers are there...
		List orderedAuths = orderAuthorizationsBySequence(change.getAuthorizations());
		if (orderedAuths.size() == 2 && auth.getSequence() == 1 &&
				((Authorization)orderedAuths.get(0)).getRole().equals(StaffChangeRequest.HR_REGIONAL_DIR) &&
				((Authorization)orderedAuths.get(1)).getRole().equals(StaffChangeRequest.HR_REGIONAL_DIR)) {
			String receivingRegion = null;
			Collection c = change.getFieldChanges();
			Iterator it = c.iterator();
			while (it.hasNext()) {
				FieldChange field = (FieldChange) it.next();
				if (field.getField().equals("region")) {
					// found it
					receivingRegion = field.getNewValue();
					log(Priority.DEBUG, "receiving region is " + receivingRegion);
					break;
				}	
			}
			// Will throw an exception if there's a problem
			lookUpAuthEmail((Authorization)orderedAuths.get(1), receivingRegion);
		}
	} catch (AuthorizerNotFoundException e) {
		throw e;
	} catch (Exception e) {
	    e.printStackTrace();
	    throw new Exception(e.toString());
	}
    }

    private String lookUpAuthEmail(Authorization auth, String region) throws Exception {
	log("in lookupAuthEmail");
	try {	
	    if (auth.getRole().equals(StaffChangeRequest.HR_NON_CAMPUS)) {
			log("chose acs_staff_services");
			//set the email address to staffservices
			return ACS_STAFF_SERVICES_EMAIL;
	    } else if (auth.getRole().equals(StaffChangeRequest.HR_REGIONAL_DIR) || auth.getRole().equals(StaffChangeRequest.HR_NATIONAL_DIR)) {
			//look up the appropriate person's email address
			log("chose campus hr person");
			return lookupCampusEmail(auth, region);
	    } else {
			return ERROR_EMAIL;
	    }
	} catch (AuthorizerNotFoundException e) {
		throw e;
	} catch (Exception e) {
	    throw new Exception(e.toString());
	}
    }

    private String lookupCampusEmail(Authorization auth, String region) throws AuthorizerNotFoundException, Exception {
	String nextAuthorizorEmail = ERROR_EMAIL;

	try {
	    String errMsg = new String();
	    Staff nextAuthorizor = null;
	    Collection c = null;
	    StaffInfo si = new StaffInfo();
	    if (auth.getRole().equals(StaffChangeRequest.HR_REGIONAL_DIR)) {
			c = si.getCampusHRRDs(region);
			errMsg = "Searching for CampusHRRDs in " + region;
	    } 
	    if (auth.getRole().equals(StaffChangeRequest.HR_NATIONAL_DIR)) {
			c = si.getCampusHRNDs();
			errMsg = "Searching for CampusHRNDs";
	    }
	    /*************************************
	     NOTE:  It is very important that this query returns only one  
	     record.  If the returned collection contains more than one record,
	     the SQL needs to be narrowed, or an array of strings  created
	     as the TO: field in the email.
	    *************************************/
	    if (c.size() > 0) {
			Iterator iter = c.iterator();
			nextAuthorizor = (Staff) iter.next();
			log(Priority.DEBUG, "Found " + nextAuthorizor.getLastName() + " to authorize this request");
	    } else {
			// If we have NO authorizor, we have got a problem.
			// Send an email to an admin to fix this data issue.
			StaffChangeRequest scr = new StaffChangeRequest(auth.getChangeRequestId());
			Staff parent = scr.getUpdateStaff();
			SendMessage sm = new SendMessage();
			sm.setSubject("Missing authorizer");
			sm.setTo(ERROR_EMAIL);
			sm.setFrom(WEBSITE_EMAIL_ADDR);
			String body = "The following query failed to produce an authorizer for a pending request for " + 
				parent.getPreferredName() + " " + parent.getLastName() + ":\n" +
			    errMsg + "\n\n" +
			    "Please inform this person that he/she needs to update his/her job information.";
			sm.setBody(body);
			sm.send(true);
			//return;
	    }
	    
	    if (nextAuthorizor != null) {
			nextAuthorizorEmail = nextAuthorizor.getEmail();
			log(Priority.DEBUG, "email is " + nextAuthorizor.getEmail());
	    } else {
			nextAuthorizorEmail = null;
			log(Priority.DEBUG, "next authorizor is null");
			throw new AuthorizerNotFoundException(auth.getRole(), region);
	    }
	} catch (AuthorizerNotFoundException e) {
		throw e;
	} catch (Exception e) {
	    throw new Exception(e.toString());
	}
	return nextAuthorizorEmail;
    }

    /**
     *  Method to notify staff services of a personnel change that DOES NOT require
     *  authorization.  This method will be called immediately after committing changes
     *  to the database.
     */
    public void emailStaffServices(Map formData) throws Exception {
	log(Priority.DEBUG, "Entering emailStaffServices...");
	SendMessage sm = new SendMessage();
	sm.setTo(PIU_STAFF_SERVICES_EMAIL);
	sm.setFrom(WEBSITE_EMAIL_ADDR);
	sm.setSubject("Information update");
	String changeType = (String)formData.get("changeType");
	String body = "The staff website has received a personnel information update.\n\n";

	if (changeType.equals(StaffChangeRequest.ADDRESS_CHANGE)) {
	    body += "Change of Address for " + formData.get("FirstName") + " " + formData.get("LastName") + "\n";
	    body += "Account No: " + formData.get("AccountNo") + "\n\n";
	    body += "Address Change Type: " + formData.get("addrChangeType") + "\n";
	    body += "Address Change Reason: " + formData.get("addressType") + "\n";
	    
	    if (((String) formData.get("addrChangeType")).equals("Permanent")) {
		body += "Effective Date: " + (String) formData.get("primaryStartDate") + "\n";
	    } else {
		body += "Beginning: " + (String) formData.get("primaryStartDate") + "\n";
		body += "Ending: " + (String) formData.get("primaryEndDate") + "\n";
	    }
	    
	    if (formData.get("addressReason") != null) {
		body += "Because of " + (String) formData.get("addressReason") + "\n\n";
	    }
	    
	    if (formData.get("primaryAddress1") != null) {
		body += "Street Address 1: " + formData.get("primaryAddress1") + "\n";
	    }
	    if (formData.get("primaryAddress2") != null) {
		body += "Street Address 2: " + formData.get("primaryAddress2") + "\n";
	    }
	    if (formData.get("primaryAddress3") != null) {
		body += "Street Address 3: " + formData.get("primaryAddress3") + "\n";
	    }
	    if (formData.get("primaryAddress4") != null) {
		body += "Street Address 4: " + formData.get("primaryAddress4") + "\n";
	    }
	    if (formData.get("primaryCity") != null) {
		body += "City: " + formData.get("primaryCity") + "\n";
	    }
	    if (formData.get("primaryState") != null) {
		body += "State: " + formData.get("primaryState") + "\n";
	    }
	    if (formData.get("primaryZip") != null) {
		body += "Zip: " + formData.get("primaryZip") + "\n";
	    }
	    if (formData.get("schoolDistrict") != null) {
		body += "School District" + formData.get("schoolDistrict") + " \n";
	    }
	    if (formData.get("homePhone") != null) {
		body += "Home Phone: " + formData.get("homePhone") + "\n";
	    }
	    if (formData.get("workPhone") != null) {
		body += "Work Phone: " + formData.get("workPhone") + "\n";
	    }
	    if (formData.get("email") != null) {
		body += "Email: " + formData.get("email") + "\n";
	    }
	    if (formData.get("spouseEmail") != null) {
		body += "Spouse Email: " + formData.get("spouseEmail") + "\n";
	    }
	    if (formData.get("primaryEmpLocCity") != null) {
		body += "Primary Employment City: " + formData.get("primaryEmpLocCity") + "\n";
	    }
	    if (formData.get("primaryEmpLocState") != null) {
		body += "Primary Employment State: " + formData.get("primaryEmpLocState") + "\n";
	    }
	    if (formData.get("primaryEmpLocCountry") != null) {
		body += "Primary Employment Country: " + formData.get("primaryEmpLocCountry") + "\n";
	    }
	    
	    if (formData.get("intlAssign") != null) {
		if (((String) formData.get("intlAssign")).equals("depart")) {
		    body += "I am departing for an International assignment.\n";
		}
		if (((String) formData.get("intlAssign")).equals("return")) {
		    body += "I am returning from an International assignment.\n";
		}
	    }
	} else if (changeType.equals(StaffChangeRequest.MARITAL_STATUS_CHANGE)) {
	    body += "Marital Status Change for " + formData.get("FirstName") + " " + formData.get("LastName") + "\n";
	    body += "Account No: " + formData.get("AccountNo") + "\n\n";
	    if (formData.get("fianceeFirstName") != null) {
		body += "Fiancee: " + formData.get("fianceeFirstName") + " " + formData.get("fianceeMiddleName") + " " + formData.get("fianceeLastName")  + "\n";
	    } 
	    if (((Boolean)formData.get("IsMale")).booleanValue()) {
		body += "Wife's married name: " + formData.get("spouseFirstName") + " " + formData.get("spouseMiddleName") + " " + formData.get("spouseLastName") + "\n";
	    } else {  
		body += "Wife's married name: " + formData.get("firstName") + " " + formData.get("middleName") + " " + formData.get("lastName") + "\n";
	    } 
	    if (formData.get("marriageDate") != null) { 
		body += "Wedding Date: " + formData.get("marriageDate") + "\n";
	    }
	    if (formData.get("spouseAccountNo") != null) { 
		body += "Fiancee is staff, account number: " + formData.get("spouseAccountNo") + "\n";
	    } else if (formData.get("fianceeJoinStaffDate") != null) { 
		body += formData.get("fianceeFirstName") + "will be joining Campus Crusade Staff on " + formData.get("fianceeJoinStaffDate") + ".\n";
	    }
	    if (formData.get("joiningNS") != null && ((String)formData.get("joiningNS")).equals("true")) { 
		body += "You will be joining National Staff." + "\n";
	    }
	    if (formData.get("joiningNS") != null && ((String)formData.get("isFianceeJoiningNS")).equals("true")) { 
		body += formData.get("fianceeFirstName") + " will be joining National Staff." + "\n";
	    }  
	} else if (changeType.equals(StaffChangeRequest.DEPENDENT_CHANGE)) {
	    body += "Dependent Change for " + formData.get("FirstName") + " " + formData.get("LastName") + "\n";
	    body += "Account No: " + formData.get("AccountNo") + "\n\n";
	    if (formData.get("firstName") != null) { 
		body += "New child: "+ formData.get("firstName") + " " + 
		    formData.get("middleName") + " " + formData.get("lastName") + "\n";
	    }
	    if (formData.get("gender") != null) { 
		body += "Gender: " + formData.get("gender") + "\n";
	    }
	    if (formData.get("birthDate") != null) {
		body += "Birthdate: " + formData.get("birthDate") + "\n";
	    } 
	    if (formData.get("adoptDate") != null) { 
		body += "Adoption Date: " + formData.get("adoptDate") + "\n";
	    }
	    if (formData.get("ineligibleDependentName") != null) {
		body += formData.get("ineligibleDependentName") + 
		    " is no longer eligible for medical/dental coverage as of " + 
		    formData.get("ineligibleDate") + ".\n";
	    } 
	}
	sm.setBody(body);
	sm.send(true);	     
	log(Priority.DEBUG, "leaving emailStaffServices");
    }

    /**
     *  Method to notify staff services of a change that DID require authorization.
     *  This notification happens AFTER all required approvals have been met.
     */
    public void emailStaffServices(String changeRequestId) throws Exception {
	StaffChangeRequest stf = new StaffChangeRequest(changeRequestId);
	Staff staff = stf.getUpdateStaff();
	SendMessage sm = new SendMessage();
	sm.setTo(ACS_STAFF_SERVICES_EMAIL);
	sm.setFrom(WEBSITE_EMAIL_ADDR);
	sm.setSubject("Information update");
	String body = new String("The staff website has received an administrative change of status.\n\n");
	String changeType = stf.getType();
	if (changeType.equals(StaffChangeRequest.JOB_CHANGE)) {
	    log("composing Job Change Body");
	    body += composeJobChangeBody(staff, stf);
	} else if (changeType.equals(StaffChangeRequest.LEAVE_OF_ABSENCE)) {			
	    log("composing LOA Body");
	    body += composeLOABody(staff, stf);
	} else if (changeType.equals(StaffChangeRequest.RESIGNATION)) {
		sm.setTo(ACS_RESIGN_STAFF_SERVICES_EMAIL);
		log("composing Resignation Body");
	    body += composeResignationBody(staff, stf);
	}
	//append the approvals to the end of the message
	body += appendAuthorizations(stf);
	sm.setBody(body);
	sm.send(true);
    }

    private String composeJobChangeBody(Staff staff, StaffChangeRequest stf) throws Exception {
		String body = new String();
		Collection fields = stf.getFieldChanges();
		Iterator iter = fields.iterator();
		body += "Job Change Request for " + staff.getFirstName() + " " + staff.getLastName() + "\n";
		body += "Account No: " + staff.getAccountNo() + "\n";
		body += "Effective Date: " + stf.getEffectiveDate() + "\n\n";
		while (iter.hasNext()) {
		    //This field copying part in each compose method could be all rolled together possibly
		    FieldChange nextChange = (FieldChange) iter.next();
		    if (nextChange.getField().equals("ministry")) {   // job change fields
		    	body += "Ministry: " + nextChange.getNewValue() + "\n";
		    } else if (nextChange.getField().equals("jobStatus")) {
		    	body += "Status: " + nextChange.getNewValue() + "\n";
		    } else if (nextChange.getField().equals("region")) {
		    	body += "Region: " + nextChange.getNewValue() + "\n";
		    } else if (nextChange.getField().equals("strategy")) {
		    	body += "Strategy: " + nextChange.getNewValue() + "\n";
		    } else if (nextChange.getField().equals("position")) {
		    	body += "Position: " + nextChange.getNewValue() + "\n";
		    } else if (nextChange.getField().equals("teamID")) {
		    	LocalLevel member = new LocalLevel(nextChange.getNewValue());
				body += "Team: " + member.getName() + "\n";
		    } else if (nextChange.getField().equals("title")) {
		    	body += "Job: " + nextChange.getNewValue() + "\n";
		    } else if (nextChange.getField().equals("workLocation")) {
		    	body += "Work Location: " + nextChange.getNewValue() + "\n";
		    }
		}
		return body;
    }

    private String composeLOABody(Staff staff, StaffChangeRequest stf) throws Exception {
	String body = new String();
	Collection fields = stf.getFieldChanges();
	Iterator iter = fields.iterator();

	body += "Leave of Absence for " + staff.getFirstName() + " " + staff.getLastName() + "\n";
	body += "Account No: " + staff.getAccountNo() + "\n\n";
	while (iter.hasNext()) {
	    FieldChange nextChange = (FieldChange) iter.next();
	    if (nextChange.getField().equals("loaStartDate")) {   // leave of absence fields
		body += "Start Date: " + nextChange.getNewValue() + "\n";
	    } else if (nextChange.getField().equals("loaEndDate")) {
		body += "End Date: " + nextChange.getNewValue() + "\n";
	    } else if (nextChange.getField().equals("loaReason")) {
		body += "Reason: " + nextChange.getNewValue() + "\n";
	    } else if (nextChange.getField().equals("loaNote")) {
		body += "Note: " + "\n";
		Note loaNote = new Note(nextChange.getNewValue());
		body += loaNote.getNote() + "\n";
	    }
	}
	return body;
    }

    private String composeResignationBody(Staff staff, StaffChangeRequest stf) throws Exception {
	String body = new String();
	Collection fields = stf.getFieldChanges();
	Iterator iter = fields.iterator();

	body += "Resignation for " + staff.getFirstName() + " " + staff.getLastName() + "\n";
	body += "Account No: " + staff.getAccountNo() + "\n\n";
	while (iter.hasNext()) {
	    FieldChange nextChange = (FieldChange) iter.next();
	    if (nextChange.getField().equals("resignationDate")) {   // resignation fields
	    	body += "Resignation Date: " + nextChange.getNewValue() + "\n";
	    } else if (nextChange.getField().equals("resignationReason")) {
	    	body += "Reason: " + nextChange.getNewValue() + "\n";
	    } else if (nextChange.getField().equals("severancePayMonthsReq")) {
	    	body += "Severance Pay Requested: " + nextChange.getNewValue() + " months.\n";
	    } else if (nextChange.getField().equals("contributionsToOtherAcct")) {
	    } else if (nextChange.getField().equals("contributionsToAcntNo")) {
	    	body += "Contributions to go to Account number: " + nextChange.getNewValue() + "\n";
	    } else if (nextChange.getField().equals("contributionsToAcntName")) {
	    	body += "\tAccount Name: " + nextChange.getNewValue() + "\n";
	    } else if (nextChange.getField().equals("keepSupport")) {
	    	body += "Keeping Support Team: " + nextChange.getNewValue() + "\n";
	    } else if (nextChange.getField().equals("resignationLetter")) {
	    	body += "Resignation Letter: " + "\n";
	    	Note letter = new Note(nextChange.getNewValue());
	    	body += letter.getNote() + "\n\n\n";
	    }
	}
	return body;
    }

    private String appendAuthorizations(StaffChangeRequest stf) throws Exception {
	String body = new String();
	List orderedAuths = stf.getAuthorizationsBySequence();
	log("orderedAuths is " + orderedAuths.size());
	body += "\n\nApprovals\n";

	Hashtable codes = new Hashtable();
	codes.put(StaffChangeRequest.HR_REGIONAL_DIR, "Regional HR Director");
	codes.put(StaffChangeRequest.HR_NATIONAL_DIR, "National HR Director");
	codes.put(StaffChangeRequest.HR_NON_CAMPUS, "Non-Campus HR Director");

	for (int i = 0; i < orderedAuths.size(); i++) {
	    Authorization a = ((Authorization) orderedAuths.get(i));
	    log("a is " + a.getAuthorizationId() + " :" + a.getAuthorized() + ": " + a.getAuthDate());
	    if ( ((Authorization) orderedAuths.get(i)).getAuthorized().equals("Y") ) {
		Staff authorizer = ((Authorization) orderedAuths.get(i)).getAuthorizedBy();
		if (authorizer == null) {
		    log("the authorizer is null.");
		} // end of if (authorizer == null)
		if (((Authorization) orderedAuths.get(i)).getRole() == null) {
		    log("orderedauth rols is null");
		} // end of if ((Authorization) orderedAuths.get(i)).getRole() == null)
	    
		if ((authorizer != null)&&(((Authorization) orderedAuths.get(i)).getRole() != null)) {		
			body += "Approved by: " + authorizer.getPreferredName() + " " + authorizer.getLastName() + " " + ((Authorization) orderedAuths.get(i)).getRole() + " " + authorizer.getAccountNo()  + "\n";
		}
		} else {
		log("authorzed is NOT 'Y'");
		log(((Authorization) orderedAuths.get(i)).getAuthorizationId() + " is :" + ((Authorization) orderedAuths.get(i)).getAuthorized() + ": " + ((Authorization) orderedAuths.get(i)).getAuthDate());
	    } // end of else
	    
	}
	return body;
    }

    private void getConfigProperties(String propsFilePath) {
	try {
	    Properties p = new Properties();
	    p.load(new FileInputStream(propsFilePath));
	    WEBSITE_EMAIL_ADDR = p.getProperty("website_email_addr");
	    ERROR_EMAIL = p.getProperty("error_email");
	    PIU_STAFF_SERVICES_EMAIL = p.getProperty("piu_staff_services_email");
	    ACS_STAFF_SERVICES_EMAIL = p.getProperty("acs_staff_services_email");
	    ACS_RESIGN_STAFF_SERVICES_EMAIL = p.getProperty("acs_resign_staff_services_email");
	    System.out.println("getConfigProperties Succeeded");
	} catch (Exception e) {
	    e.printStackTrace();
	}	
    }


    static private void log(org.apache.log4j.Priority p, String msg) {
	log(msg);
    }

    static private void log(String msg) {
	System.out.println(msg);
    }

    /**
     *  This should be a generic email address, something like staff.services@uscm.org
     *  All notifications for staff services go to this address.
     */
    public String PIU_STAFF_SERVICES_EMAIL;

    /**
     *  This is the email address that shows up as the 'from'
     */
    public String WEBSITE_EMAIL_ADDR;

    /**
     *  In the case where the authorizing authority can't be found, 
     *  an email is sent here notifying recipient of the problem.
     */
    public String ERROR_EMAIL;
    public String ACS_STAFF_SERVICES_EMAIL;
    public String ACS_RESIGN_STAFF_SERVICES_EMAIL;
    public String RESIGNATION_EMAIL;
}
