package org.alt60m.ministry.bean;

import org.alt60m.ministry.model.dbio.*;
import org.alt60m.ministry.servlet.Notifier;

public class AuthorizeChangeRequest {
    /**
     *  Method that gives go ahead to a change request.
     *  This will set the 'authorized' field on AuthorizationObject to 'Y'
     *  AND notify the next authorizor that it's their turn to look at it.
     */
    public void authorize(String changeRequestID, String authorizationId, String comments, String authorizorID) throws Exception {
		if (authorizorID == null) {
		    throw new Exception("AuthorizorID is NULL");
		}
    	Authorization auth = new Authorization(authorizationId);
    	auth.setAuthorized("Y");
    	auth.setAuthDate(new java.sql.Date(System.currentTimeMillis()));
    	auth.setAuthorizedById(authorizorID);
		auth.persist();
		if (comments != null) {
			Note note = new Note();
			note.setNote(comments);
			note.setDateEntered(new java.sql.Date(System.currentTimeMillis()));
			note.setAuthorizationNoteId(authorizationId);
			note.persist();
	    }
		StaffChangeRequest changeRequest = new StaffChangeRequest(changeRequestID);
    	if (changeRequest.getNumRemainingAuths() == 0) {
			ApplyStaffChanges.applyChanges(changeRequest);
			new Notifier().emailStaffServices(changeRequest.getChangeRequestId());
	    } else {
			new Notifier().notifyNextAuthorizor(changeRequest);
	    }	    
    }

    /**
     *  Method that will put the kabash on a change request.
     *  Sets the authorized field on the AuthorizationObject to 'N'.
     */
    public void unauthorize(String changeRequestId, String authorizationId, String comments) throws Exception{
	try {
	    StaffChangeRequest changeRequest = new StaffChangeRequest(changeRequestId);
	    Authorization auth = new Authorization(authorizationId);
	    auth.setAuthorized("N");
	    auth.setAuthDate(new java.sql.Date(System.currentTimeMillis()));
		auth.persist();

	    if (comments != null) {
			Note note = new Note();
			note.setNote(comments);
			note.setDateEntered(new java.sql.Date(System.currentTimeMillis()));
			note.setAuthorizationNoteId(authorizationId);
			note.persist();
	    }
	    //			No longer required, but this is where the call would go.
	    //			notifyPastAuthorizors(changeRequest);
	} catch (Exception e) {
	    throw e;
	}
    }
}
