package org.alt60m.ministry.servlet;

import java.util.*;
import org.alt60m.ministry.model.dbio.*;
import org.alt60m.util.*;
import org.apache.log4j.Priority;

/* 
   Not sure that the main applychanges() call really works. i don't think the query returns anything to apply
*/

/**
 * @stereotype tested
 * @testcase org.alt60m.ministry.test.TestHRTool 
 */
public class HRTool {
	//Log Helper Code//
	private static LogHelper logHelper = new LogHelper();
	private void log(Priority p, String msg) { logHelper.log(this.getClass().toString(),p,msg); }
	private void log(Priority p, String msg, java.lang.Throwable t) { logHelper.log(this.getClass().toString(),p,msg,t); }
	//End of Log Helper Code//

    public void addressChangeRequest(final String staffID, final String requestorStaffID, final Map newValues) throws Exception {
        QueueChangeRequest qcr = new QueueChangeRequest();
        qcr.addressChangeRequest(staffID, requestorStaffID, newValues);
    }

    public void maritalStatusChangeRequest(final String staffID, final String requestorStaffID, final Map newValues) throws Exception {
		dumpValues((Hashtable)newValues);
        QueueChangeRequest qcr = new QueueChangeRequest();
        qcr.maritalStatusChangeRequest(staffID, requestorStaffID, newValues);
    }

    public void dependentChangeRequest(final String staffID, final String requestorStaffID, final Map newValues) throws Exception {
        QueueChangeRequest qcr = new QueueChangeRequest();
        qcr.dependentChangeRequest(staffID, requestorStaffID, newValues);
    }

    public void jobChangeRequest(final String staffID, final String requestorStaffID, final Map newValues) throws Exception {
		QueueChangeRequest qcr = new QueueChangeRequest();
        qcr.jobChangeRequest(staffID, requestorStaffID, newValues);
    }

    public void leaveOfAbsence(final String staffID, final String requestorStaffID, final Map newValues) throws Exception {
        QueueChangeRequest qcr = new QueueChangeRequest();
        qcr.leaveOfAbsence(staffID, requestorStaffID, newValues);
    }

    public void resignation(final String staffID, final String requestorStaffID, final Map newValues) throws Exception {
        QueueChangeRequest qcr = new QueueChangeRequest();
        qcr.resignation(staffID, requestorStaffID, newValues);
    }

	/** <PRE>
	* Instantiates an ObjectAdaptor for Staff objects 
	*  by calling {@link org.alt60m.factory.ServiceFactory#getMinistryAdaptor(Class, String) ServiceFactory.getMinistryAdaptor(Class, String)}
	* By passing <code>acctNo</code> to {@link ObjectAdaptor#find(String) find(String)} in {@link ObjectAdaptor},
	*  get this person's staff table record as a hashtable
	* Calling {@link StaffInfo#getStaffObject(java.lang.String) getStaffObject} in {@link StaffInfo}, get this person's staff table record
	*  as a {@link Staff} object
	* On that staff object, call {@link Staff#getdependents() getDependents} on the staff object
	*  to get the collection of their {@link Dependent dependents}
	* Iterate through that collection, call {@link ObjectAdaptor#obj2hash(Object) obj2hash} to convert the object to a hashtable
	*    and add that hashtable to a new collection
	* put that collection in the staff hashtable we are making
	* if they have a primary address,
	*    use {@link ObjectAdaptor#obj2hash(Object) obj2hash} to convert this staff's {@link Address primaryAddress} object to a hashtable,
	*    and add that hashtable to their staff hashtable
	* do it again with their secondary addess
	* if they're on a team,
	*    put their team name and team id in their staff hashtable
	* if requestedBy is not null,
	*    put requestedBy in the staff hashtable
	* if they have a spouse account number,
	*    go get the spouse object
	*    add job information about the spouse, from the spouse's staff object,
	*     to this staff hashtable
	*    if the spouse is on a team,
	*       add the team name and id to the staff hashtable
	* </PRE>
	* @param profile     a hashtable representation of this user's profile (their staffsiteprofile record)
	* @param acctNo      the account number of the person for whom the change is being made
	* @param requestedBy the account number of the person requesting the change
	* @return            a hashtable representing the staff table record of the person for whom the change is requested 
	* @throws
	*/
    public Hashtable getUserData(Hashtable profile, String acctNo, String requestedBy) throws Exception {
		Hashtable staffInfo = new Hashtable();

    	Staff s = new Staff(acctNo);
    	staffInfo = ObjectHashUtil.obj2hash(s);
   	    StaffInfo si = new StaffInfo();
    	Collection dependents = ObjectHashUtil.list(s.getDependents());
    	staffInfo.put("dependents", dependents);

	    Hashtable primaryAddress = null;
	    Hashtable secondaryAddress = null;
	    if (s.getPrimaryAddressId() != null) {
			primaryAddress = ObjectHashUtil.obj2hash(s.getPrimaryAddress());
			staffInfo.put("primaryAddress", primaryAddress);
	    }	    
    	if (s.getSecondaryAddressId() != null) {
			secondaryAddress = ObjectHashUtil.obj2hash(s.getSecondaryAddress());
			staffInfo.put("secondaryAddress", secondaryAddress);
	    }	    
	    LocalLevel team = s.getMembership();
    	if (team != null) {
			staffInfo.put("TeamName", team.getName());
			staffInfo.put("TeamID", team.getLocalLevelId());
    	}
	    if (requestedBy != null) {
			staffInfo.put("RequestedBy", requestedBy);  // ACS purposes only
    	}
    	String spouseAccountNo = (String)staffInfo.get("SpouseAccountNo");
	    if (spouseAccountNo != null && !spouseAccountNo.equals("")) {
			Staff spouse = new Staff(spouseAccountNo);
			staffInfo.put("SpouseMinistry", spouse.getMinistry());
			staffInfo.put("SpouseJobStatus", spouse.getJobStatus());
			staffInfo.put("SpouseTitle", spouse.getJobTitle());
			staffInfo.put("SpouseStrategy", spouse.getStrategy());
			staffInfo.put("SpouseRegion", spouse.getRegion());
			if (spouse.getMembership() != null) {
			    staffInfo.put("SpouseTeamID", spouse.getMembership().getLocalLevelId());
			    staffInfo.put("SpouseTeamName", spouse.getMembership().getName());
			}
			staffInfo.put("SpouseTitle", spouse.getJobTitle());
			staffInfo.put("SpouseRole", spouse.getPosition());
    	}
		return staffInfo;
    }

    public Collection findByLastName(String lastname) throws Exception {
		StaffInfo si = new StaffInfo();
		return si.listStaffByLastName(lastname);
    }

    public Collection getTeamList(String region) throws Exception {
	    TeamInfo ti = new TeamInfo();
	    if (region.equals("null")) {
			return ti.getLocalLevelTeams();
	    } else {
			return ti.getLocalLevelTeamsByRegion(region);
	    }
    }

    public Collection getTeamList() throws Exception {
	    TeamInfo ti = new TeamInfo();
		return ti.getActiveLocalLevelTeams();
    }

    public String getTeamName(String teamID) throws Exception {
	    LocalLevel member = new LocalLevel(teamID);
	    return member.getName();	     
    }
    
    public List getPendingRequests(String position, String strategy, String region) throws Exception {
		String role = new String("unspecified");

		if (strategy.equals("HR") && position.equals("National Director")) {
			role = StaffChangeRequest.HR_NATIONAL_DIR;
		} else if (strategy.equals("HR")) {
			role = StaffChangeRequest.HR_REGIONAL_DIR;
		} else if (strategy.equals("HRNC")) {
			role = StaffChangeRequest.HR_NON_CAMPUS;
		}

		AuthorizationInfo ai = new AuthorizationInfo();
		Collection requests;
		
		if (role.equals(StaffChangeRequest.HR_REGIONAL_DIR)) {
			requests = ai.getRegionalPendingApprovals(region);
		} else if (role.equals(StaffChangeRequest.HR_NON_CAMPUS)) {
			requests = ai.getNonCampusPendingApprovals();
		} else {
			requests = ai.getNationalPendingApprovals();
		}

		List myPendingRequests = new ArrayList();
		Iterator it = requests.iterator();
		while (it.hasNext()) {
			StaffChangeRequest scro = (StaffChangeRequest) it.next();
			Collection changes = scro.getFieldChanges();
			Iterator iter2 = changes.iterator();
			String destinationRegion = null;
			while (iter2.hasNext()) {
				FieldChange fld = (FieldChange) iter2.next();
				if (fld.getField().equals("region")) {
					destinationRegion = fld.getNewValue();
				}		     
			}
			List authList = scro.getAuthorizationsBySequence();
			ListIterator lit = authList.listIterator();
			while (lit.hasNext()) {
				Authorization auth = (Authorization) lit.next();
				if (auth.getAuthorized() == null || auth.getAuthorized().equals("")) {
					if (auth.getRole().equals(role)) {
						Staff s = scro.getUpdateStaff();
						if (role.equals(StaffChangeRequest.HR_REGIONAL_DIR) && destinationRegion != null) {
							if ( (region.equals(s.getRegion()) && auth.getSequence() == 1) || 
									(region.equals(destinationRegion) && auth.getSequence() == 2) ||
									(region.equals(destinationRegion) && auth.getSequence() == 3) ) {
								Hashtable h = new Hashtable();
								h.put("changeRequestID", scro.getChangeRequestId());
								h.put("updateStaffName", s.getFirstName() + " " + s.getLastName());
								h.put("changeRequestType", scro.getType());
								h.put("requestDate", scro.getRequestDate().toString());
								h.put("authorizationID", auth.getAuthorizationId());
								myPendingRequests.add(h);
							} else {
								break;
							}
						} else {
							if (s!=null) {
								Hashtable h = new Hashtable();
								h.put("changeRequestID", scro.getChangeRequestId());
								h.put("updateStaffName", s.getFirstName() + " " + s.getLastName());
								h.put("changeRequestType", scro.getType());
								h.put("requestDate", scro.getRequestDate().toString());
								h.put("authorizationID", auth.getAuthorizationId());
								myPendingRequests.add(h);
							}
						}
						break;
					} else {
							break;
					}
				} else {
					if (auth.getAuthorized() == "N") {
							break;
					}
				}
			}
		}
		return myPendingRequests;
    }
    
    public StaffChangeRequest getChangeRequest(String changeRequestID) throws Exception {
		return new StaffChangeRequest(changeRequestID);
    }

    public void authorize(String changeRequestID, String authorizationID, String comments, String accountNo) throws Exception {
		AuthorizeChangeRequest acr = new AuthorizeChangeRequest();
		acr.authorize(changeRequestID, authorizationID, comments, accountNo);
    }

    public void unauthorize(String changeRequestID, String authorizationID, String comments) throws Exception {
		AuthorizeChangeRequest acr = new AuthorizeChangeRequest();
		acr.unauthorize(changeRequestID, authorizationID, comments);
    }

    static private void log(String msg) {
		System.out.println(msg);
    }

    private void dumpValues(Hashtable newValues) {
	log("********************************************************");
	log("                      DUMPING VALUES");
	for (Enumeration e = newValues.keys(); e.hasMoreElements();) {
	    String key = (String) e.nextElement();
	    log(key + " --> " + newValues.get(key));
	}
	    log("********************************************************");
    }
}