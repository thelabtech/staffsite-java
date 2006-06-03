package org.alt60m.ministry.model.dbio;

import java.util.*;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class ChangeRequest extends DBIOEntity {
	private static Log log = LogFactory.getLog(ChangeRequest.class);
	
    private String changeRequestId = new String();
    private Date requestDate = null;
    private Date effectiveDate = null;
    private Date appliedDate = null;
    private String type = "";

	private String fk_requestedById;

	public ChangeRequest(String id) {
		changeRequestId = id;
		select();
	}	
	public ChangeRequest() { }

	public boolean isPKEmpty() {
		return changeRequestId.equals("");
	}

	public void localinit() throws DBIOEntityException {
		String table = "ministry_changerequest";

		setMetadata("ChangeRequestId", "ChangeRequestID", "IDENTITY");

		setMetadata("RequestDate", "requestDate", table);
		setMetadata("EffectiveDate", "effectiveDate", table);
		setMetadata("AppliedDate", "appliedDate", table);
		setMetadata("Type", "type", table);
		setMetadata("RequestedById", "fk_requestedBy", table);
		
		setAutodetectProperties(false);
	}

	public String getChangeRequestId(){ return changeRequestId; }
	public void setChangeRequestId(String changeRequestId){ this.changeRequestId = changeRequestId.toString(); }

	public Date getRequestDate() { return requestDate; }
	public void setRequestDate(Date requestDate) { this.requestDate = org.alt60m.util.DateUtils.clearTimeFromDate(requestDate); }

	public Date getEffectiveDate() { return effectiveDate; }
	public void setEffectiveDate(Date effectiveDate) { this.effectiveDate = org.alt60m.util.DateUtils.clearTimeFromDate(effectiveDate);	}	    

	public Date getAppliedDate() { return appliedDate; }
	public void setAppliedDate(Date appliedDate) { this.appliedDate = org.alt60m.util.DateUtils.clearTimeFromDate(appliedDate); }

	public String getType() { return type; }
	public void setType(String type) { this.type = type; }
   
	public String getRequestedById(){ return this.fk_requestedById; }
	public void setRequestedById(String requestedBy){ this.fk_requestedById = requestedBy; }
	public Staff getRequestedBy(){ return new Staff(fk_requestedById); }
 	public void setRequestedBy(Staff requestedBy){ this.fk_requestedById = requestedBy.getAccountNo(); }
    public void assocRequestedBy(Staff requestedBy){ setRequestedBy(requestedBy); }

	public Vector getAuthorizations(){
		Authorization auth = new Authorization();
		auth.setChangeRequestId(this.getChangeRequestId());
		return auth.selectList();
	}
	public Vector getAuthorizations(String orderField, boolean DESC){
		Authorization auth = new Authorization();
		auth.setChangeRequestId(this.getChangeRequestId());
		return auth.selectList("fk_changeRequestID = '" + this.changeRequestId + "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}
	public void assocAuthorization(Authorization auth) {
		auth.setChangeRequestId(this.changeRequestId);
		auth.persist();
	}
	public void dissocAuthorization(Authorization auth) {
		auth.setChangeRequestId("");
		auth.persist();
	}
	
	public Vector getFieldChanges(){
		FieldChange fc = new FieldChange();
		fc.setChangeRequestId(this.changeRequestId);
		return fc.selectList();
	}
	public Vector getFieldChanges(String orderField, boolean DESC){
		FieldChange fc = new FieldChange();
		fc.setChangeRequestId(this.changeRequestId);
		return fc.selectList("fk_changeRequestID = '" + this.changeRequestId + "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}
	public void assocFieldChange(FieldChange fc) {
		fc.setChangeRequestId(this.changeRequestId);
		fc.persist();
	}
	public void dissocFieldChange(FieldChange fc) {
		fc.setChangeRequestId("");
		fc.persist();
	}
	
	public int getNumRemainingAuths() {
		Authorization auth = new Authorization();
		Vector v = auth.selectList("fk_changeRequestID = '" + this.changeRequestId + "' AND (authorized is null OR authorized = '' OR authorized = 'N')");
		if (v.size()==0) {
			return v.size();
		} else if ((auth.selectList("fk_changeRequestID = '" + this.changeRequestId + "' AND authorized = 'Y' AND sequence = 1 AND role = 'HRRD'").size() == 1) &&
					(auth.selectList("fk_changeRequestID = '" + this.changeRequestId + "' AND authorized = 'Y' AND sequence = 2 AND role = 'HRND'").size() == 1) &&
					(auth.selectList("fk_changeRequestID = '" + this.changeRequestId + "' AND (authorized is null OR authorized = '') AND sequence = 3 AND role = 'HRNC'").size() == 1)) {
			//essentially there are no more remaining auths.  HRNC auth will never come.  everyone else said yes, so there's no one left to say yes
			return 0;
		} else {
			return v.size();
		}
    }

    //is anyone waiting on a non-campus approval?  has everyone before non-campus said yes?  well, then non-campus says yes also
	public void applyHrncApprovals() {
		Collection authorizations = this.getAuthorizationsBySequence();
		Iterator it = authorizations.iterator();
		while (it.hasNext()) {
			Authorization nextAuth = (Authorization) it.next();
			if (nextAuth.getRole().equals("HRRD") || nextAuth.getRole().equals("HRND")) {
				if (!nextAuth.getAuthorized().equals("Y")) {
					break;
				}
			} else if (nextAuth.getRole().equals("HRNC") && (nextAuth.getAuthorized() == null || nextAuth.getAuthorized().equals(""))){
				log.info("making non-campus approval: " + nextAuth.getAuthorizationId());
				nextAuth.setAuthorized("Y");
				nextAuth.setAuthDate(new java.sql.Date(System.currentTimeMillis()));
			}
		}
	}

    public List getAuthorizationsBySequence() {
		List orderedAuths = new ArrayList();
		Vector auths = this.getAuthorizations();
		for (int i=1;i<=auths.size();i++) {
		    Iterator it = auths.iterator();
		    while (it.hasNext()) {
				try {
				    Authorization authObj = (Authorization) it.next();
				    if (authObj.getSequence() == i) {
						orderedAuths.add(authObj);
				    }		     
				} catch (NullPointerException e) {
				    log.error("ChangeRequest " + changeRequestId + " has a null authorization", e);
				}
		    }
		}
		return orderedAuths;
    }
}
