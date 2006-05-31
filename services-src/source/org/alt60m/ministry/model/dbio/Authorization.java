package org.alt60m.ministry.model.dbio;

import java.util.*;
import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;
import com.kenburcham.framework.dbio.DBIOException;

public class Authorization extends DBIOEntity {
    private String authorizationId = "";

    private Date authDate = null;
    private String role = "";
    private String authorized = "";
    private long sequence;

    private String fk_authorizedById;
    private String fk_authorizationNoteId;
	private String fk_changeRequestId;

	public Authorization(String id) {
		authorizationId = id;
		select();
	}	
	public Authorization() { }

	public boolean isPKEmpty() {
		return authorizationId.equals("");
	}

	public void localinit() throws DBIOEntityException {
		String table = "ministry_authorization";

		setMetadata("AuthorizationId", "AuthorizationID", "IDENTITY");

		setMetadata("AuthDate", "authDate", table);
		setMetadata("Role", "role", table);
		setMetadata("Authorized", "authorized", table);
		setMetadata("Sequence", "sequence", table);
		setMetadata("AuthorizedById", "fk_AuthorizedBy", table);
		setMetadata("AuthorizationNoteId", "fk_AuthorizationNote", table);
		setMetadata("ChangeRequestId", "fk_changeRequestID", table);

		setAutodetectProperties(false);
	}

	public Date getAuthDate() { return this.authDate; }
	public void setAuthDate(Date authDate) { this.authDate = org.alt60m.util.DateUtils.clearTimeFromDate(authDate); }
	
	public String getRole() { return this.role; }
	public void setRole(String role) { this.role = role; }
	
	public String getAuthorized() { return this.authorized; }
	public void setAuthorized(String authorized) { this.authorized = authorized; }
	public boolean getIsAuthorized() { return this.authorized == "Y"; }
		
	public long getSequence() { return this.sequence; }
	public void setSequence(long sequence) { this.sequence = sequence; }

    public String getAuthorizationId(){ return this.authorizationId; }
    public void setAuthorizationId(String authorizationId){ this.authorizationId = authorizationId; }

	public String getAuthorizedById(){ return this.fk_authorizedById; }
	public void setAuthorizedById(String authorizedById){ this.fk_authorizedById = authorizedById; }
	public Staff getAuthorizedBy(){ 
		if ((fk_authorizedById == null) || (fk_authorizedById.equals(""))) { 
			return null;
		} else {
			return new Staff(fk_authorizedById);
		}
	}
	public void setAuthorizedBy(Staff authorizedBy){ this.fk_authorizedById = authorizedBy.getAccountNo(); }
	public void assocAuthorizedBy(Staff authorizedBy){ setAuthorizedBy(authorizedBy); }

	public String getAuthorizationNoteId(){ return this.fk_authorizationNoteId; }
	public void setAuthorizationNoteId(String authorizationNoteId){ this.fk_authorizationNoteId = authorizationNoteId; }
	public Note getAuthorizationNote(){ return new Note(fk_authorizationNoteId); }
	public void setAuthorizationNote(Note authorizationNote){ this.fk_authorizationNoteId = authorizationNote.getNoteId(); }
	public void assocAuthorizationNote(Note authorizationNote){ setAuthorizationNote(authorizationNote); }

	public String getChangeRequestId(){ return this.fk_changeRequestId; }
	public void setChangeRequestId(String changeRequestId){ this.fk_changeRequestId = changeRequestId; }
	public ChangeRequest getChangeRequest(){ return new ChangeRequest(fk_changeRequestId); }
	public void setChangeRequest(ChangeRequest changeRequest){ this.fk_changeRequestId = changeRequest.getChangeRequestId(); }
	public void assocChangeRequest(ChangeRequest changeRequest){ setChangeRequest(changeRequest); }
}
