package org.alt60m.ministry.servlet;

import org.alt60m.ministry.model.dbio.*;
import org.alt60m.util.DBConnectionFactory;

import java.util.*;
import java.text.*;
import java.sql.*;

public class ApplyStaffChanges {
    
    /**
     *  Static method that will grab all change requests that have not been applied,
     *  and apply those that have been approved or require no approval.
     */
    public static void applyChanges() throws Exception {
		try {
			StaffChangeRequestInfo cri = new StaffChangeRequestInfo();
			java.sql.Date rightNow = new java.sql.Date(System.currentTimeMillis());
			Collection c = cri.getPendingRequests(rightNow);
			log("\nFound " + c.size() + " requests to apply");
			Iterator iter = c.iterator(); 
			int i = 0; 
			int j = 0; 
			int k = 0;
			while (iter.hasNext()) { 
				StaffChangeRequest scro = (StaffChangeRequest) iter.next();
				if (scro.getNumRemainingAuths() == 0 && scro.getAppliedDate() == null) { 
					i++; 
					try { 
						log("\n" + scro.getChangeRequestId() + " has " + scro.getFieldChanges().size() + " changes");
						applyChanges(scro); 
						log("Committed change at " + scro.getAppliedDate());			
					} catch (Exception e) { 
						j++; 
					} 
				} else {
					k++;
				}		
			} 
		    log("\nhave processed " + i + " change requests out of " + c.size()); 
		    log("excluded " + k + " change requests which may have pending approvals or have already been applied");
		    log("failed to apply " + j + " change requests");
		} catch (Exception e) {
		    e.printStackTrace();
		    throw e;
		}
    }

    /**
     *  Method that will apply all changes requested in a changeRequest IF the 
     *  effective date has passed.  
     *  <b>NOTE:</b>This will NOT check to see that all authorizations have been 
     *  fulfilled.  That is the responsibility of the caller.
     */
    public static void applyChanges(StaffChangeRequest change) throws Exception {
		log("have entered applyChanges()");
		java.util.Date effectiveDate = change.getEffectiveDate();
		java.util.Date rightNow = new java.util.Date();

		if (rightNow.compareTo(effectiveDate) >= 0) {
	    	log("apply the change");
		    try {
				Staff parent = change.getUpdateStaff();
				log("updading:"+parent.getAccountNo());
				OldAddress primaryAddr = parent.getPrimaryAddress();
				if (primaryAddr==null) {
					primaryAddr = new OldAddress();
					primaryAddr.persist();
					parent.setPrimaryAddress(primaryAddr);
				}
				Collection fieldChanges = change.getFieldChanges();
				log("there are " + fieldChanges.size() + " to apply");
				Object[] fc = fieldChanges.toArray();
				log("fc.length is " + fc.length);
				for (int i = 0; i < fc.length; i++) {
				    FieldChange nextChange = (FieldChange) fc[i]; 
				    log(i + " setting " + nextChange.getField() + " to " + nextChange.getNewValue());
/*				    if (nextChange.getField().equals("address1")) {
						primaryAddr.setAddress1(nextChange.getNewValue());
				    } else if (nextChange.getField().equals("address2")) {
						primaryAddr.setAddress2(nextChange.getNewValue());
				    } else if (nextChange.getField().equals("address3")) {
						primaryAddr.setAddress3(nextChange.getNewValue());
				    } else if (nextChange.getField().equals("address4")) {
						primaryAddr.setAddress4(nextChange.getNewValue());
				    } else if (nextChange.getField().equals("city")) {
						primaryAddr.setCity(nextChange.getNewValue());
				    } else if (nextChange.getField().equals("state")) {
						primaryAddr.setState(nextChange.getNewValue());
		    		} else if (nextChange.getField().equals("zip")) {
						primaryAddr.setZip(nextChange.getNewValue());
				    } else if (nextChange.getField().equals("country")) {
						primaryAddr.setCountry(nextChange.getNewValue());
				    } else if (nextChange.getField().equals("startDate") && change.getType().equals(StaffChangeRequest.ADDRESS_CHANGE)) {
						java.sql.Date startDate = new java.sql.Date(DateFormat.getDateInstance(DateFormat.SHORT).parse(nextChange.getNewValue()).getTime());
						primaryAddr.setStartDate(startDate);
				    } else if (nextChange.getField().equals("endDate") && change.getType().equals(StaffChangeRequest.ADDRESS_CHANGE)) {
						java.sql.Date endDate = new java.sql.Date(DateFormat.getDateInstance(DateFormat.SHORT).parse(nextChange.getNewValue()).getTime());
						primaryAddr.setEndDate(endDate);
				    } else if (nextChange.getField().equals("countryStatus")) {
						parent.setCountryStatus(nextChange.getNewValue());
				    } else if (nextChange.getField().equals("homePhone")) {
						parent.setHomePhone(nextChange.getNewValue());
				    } else if (nextChange.getField().equals("workPhone")) {
						parent.setWorkPhone(nextChange.getNewValue());
				    } else if (nextChange.getField().equals("email")) {
						parent.setEmail(nextChange.getNewValue());
				    } else if (nextChange.getField().equals("spouseEmail")) {
						parent.setSpouseEmail(nextChange.getNewValue());
				    } else if (nextChange.getField().equals("primaryEmpLocState")) {
						parent.setPrimaryEmpLocState(nextChange.getNewValue());
				    } else if (nextChange.getField().equals("primaryEmpLocCountry")) {
						parent.setPrimaryEmpLocCountry(nextChange.getNewValue());
				    } else if (nextChange.getField().equals("primaryEmpLocCity")) {
						parent.setPrimaryEmpLocCity(nextChange.getNewValue());
				    } else if (nextChange.getField().equals("maritalStatus")) { // time sensitive marriage fields
						parent.setMaritalStatus(nextChange.getNewValue());
				    } else if (nextChange.getField().equals("spouseFirstName")) {  
						parent.setSpouseFirstName(nextChange.getNewValue());
				    } else if (nextChange.getField().equals("spouseMiddleName")) {  
						parent.setSpouseMiddleName(nextChange.getNewValue());
				    } else if (nextChange.getField().equals("spouseLastName")) {  
						parent.setSpouseLastName(nextChange.getNewValue());
		    		} else if (nextChange.getField().equals("spouseAccountNo")) {  
						parent.setSpouseAccountNo(nextChange.getNewValue()); 
		    		} else if (nextChange.getField().equals("fianceeMiddleName")) {  
						parent.setFianceeMiddleName(nextChange.getNewValue()); 
		    		} else if (nextChange.getField().equals("fianceeLastName")) {  
						parent.setFianceeLastName(nextChange.getNewValue()); 
		    		} else if (nextChange.getField().equals("fianceeFirstName")) {  
						parent.setFianceeFirstName(nextChange.getNewValue()); 
		    		} else if (nextChange.getField().equals("fianceeAccountNo")) {  
						parent.setFianceeAccountNo(nextChange.getNewValue()); 
		    		} else if (nextChange.getField().equals("isFianceeStaff")) {  
						parent.setIsFianceeStaff(new Boolean(nextChange.getNewValue()).booleanValue());
				    } else if (nextChange.getField().equals("fianceeJoinStaffDate")) {
						java.sql.Date date = new java.sql.Date(DateFormat.getDateInstance(DateFormat.SHORT).parse(nextChange.getNewValue()).getTime());			
						parent.setFianceeJoinStaffDate(date);
		    		} else if (nextChange.getField().equals("isFianceeJoiningNS")) {
						parent.setIsFianceeJoiningNS(new Boolean(nextChange.getNewValue()).booleanValue());
					} else if (nextChange.getField().equals("joiningNS")) {
						parent.setJoiningNS(new Boolean(nextChange.getNewValue()).booleanValue());
					} else if (nextChange.getField().equals("marriageDate")) {  
						java.sql.Date date = new java.sql.Date(DateFormat.getDateInstance(DateFormat.SHORT).parse(nextChange.getNewValue()).getTime());
						parent.setMarriageDate(date);
				    } else if (nextChange.getField().equals("firstName")) {  
						parent.setFirstName(nextChange.getNewValue()); 
				    } else if (nextChange.getField().equals("middleInitial")) {   
						parent.setMiddleInitial(nextChange.getNewValue()); 
					} else if (nextChange.getField().equals("lastName")) {   
						parent.setLastName(nextChange.getNewValue()); 
					} else if (nextChange.getField().equals("accountNo")) {   
						changeAccountNo(change, nextChange.getNewValue());
						parent.setAccountNo(nextChange.getNewValue()); 
		    		} else if (nextChange.getField().equals("ministry")) {   // job change fields
						parent.setMinistry(nextChange.getNewValue());
		    		} else if (nextChange.getField().equals("jobStatus")) {
						parent.setJobStatus(nextChange.getNewValue());
		    		} else if (nextChange.getField().equals("region")) {
						parent.setRegion(nextChange.getNewValue());
		    		} else if (nextChange.getField().equals("strategy")) {
						parent.setStrategy(nextChange.getNewValue());
		    		} else if (nextChange.getField().equals("role")) {
						parent.setPosition(nextChange.getNewValue());
		    		} else if (nextChange.getField().equals("position")) {
						parent.setPosition(nextChange.getNewValue());
		    		} else */if (nextChange.getField().equals("teamID")) {
						parent.setLocalLevelId(nextChange.getNewValue());
				    }/* else if (nextChange.getField().equals("title")) {
						parent.setJobTitle(nextChange.getNewValue());
				    } else if (nextChange.getField().equals("loaStartDate")) {   // leave of absence fields
						java.sql.Date date = new java.sql.Date(DateFormat.getDateInstance(DateFormat.SHORT).parse(nextChange.getNewValue()).getTime());
						parent.setLoaStartDate(date);
		    		} else if (nextChange.getField().equals("loaEndDate")) {
						java.sql.Date date = new java.sql.Date(DateFormat.getDateInstance(DateFormat.SHORT).parse(nextChange.getNewValue()).getTime());
						parent.setLoaEndDate(date);
		    		} else if (nextChange.getField().equals("loaReason")) {
						parent.setLoaReason(nextChange.getNewValue());
		    		} */else if (nextChange.getField().equals("loaNote")) {
						Note loa = new Note();
						loa.setNote(nextChange.getNewValue());
						loa.persist();
						parent.assocLoaNote(loa);
		    		}/* else if (nextChange.getField().equals("resignationDate")) {   // resignation fields
						java.sql.Date date = new java.sql.Date(DateFormat.getDateInstance(DateFormat.SHORT).parse(nextChange.getNewValue()).getTime());
						parent.setResignationDate(date);
				    }*/ else if (nextChange.getField().equals("resignationLetter")) {
						Note resignLetter = new Note();
						resignLetter.setNote(nextChange.getNewValue());
						resignLetter.persist();
						parent.assocResignationLetter(resignLetter);
				    }/* else if (nextChange.getField().equals("resignationReason")) {
						parent.setResignationReason(nextChange.getNewValue());
				    } else if (nextChange.getField().equals("severancePayMonthsReq")) {
						parent.setSeverancePayMonthsReq(Integer.parseInt(nextChange.getNewValue()));
				    } else if (nextChange.getField().equals("contributionsToOtherAcct")) {
						parent.setContributionsToOtherAcct((new Boolean(nextChange.getNewValue())).booleanValue());
				    } else if (nextChange.getField().equals("contributionsToAcntNo")) {
						parent.setContributionsToAcntNo(nextChange.getNewValue());
				    } else if (nextChange.getField().equals("contributionsToAcntName")) {
						parent.setContributionsToAcntName(nextChange.getNewValue());
				    } else {
						log("Parent = " + parent.getAccountNo());
						throw new RuntimeException("Unable to apply change of field " + nextChange.getField());
		    		}*/
				}
				change.setAppliedDate(new java.sql.Date(System.currentTimeMillis()));
				parent.persist();
				//primaryAddr.persist();
				change.persist();
		    } catch (Exception  e) {
				e.printStackTrace();
				throw e;
		    }	    
		} else {
		    log("this change is not effective yet");
		    log("effectiveDate is " + effectiveDate);
		    log("rightNow is " + rightNow);
		}
		log("leaving applyChanges");
    }
    
    private static void changeAccountNo(StaffChangeRequest change, String newAccountNo) {
		try {
			String currentStaffId = change.getUpdateStaffId();
			String changeRequestId = change.getChangeRequestId();
			
			log("changing account number.  probably because spouse getting married.");
			Connection conn = org.alt60m.util.DBConnectionFactory.getDatabaseConn();
			Statement statement = conn.createStatement();
			
			String columnNames = getColumnNames(statement);
			
			String qry = "insert into ministry_staff (accountNo) values ('"+newAccountNo+"')";
			
			statement.executeUpdate(qry);
			
			statement.close();
			conn.close();			
		} catch (Exception e) {
			e.printStackTrace();			
		}
    }

	private static String getColumnNames(Statement statement){
		
		return null;
	}
	
    static private void log(String msg) {
		System.out.println(msg);
    }

    public static void main (String[] args) {
		try {
			org.alt60m.servlet.ObjectMapping.setConfigPath(args[0]);
			DBConnectionFactory.setupPool();
		    applyChanges(); 	     
		} catch (Exception e) {	e.printStackTrace(); }
    }    
}
