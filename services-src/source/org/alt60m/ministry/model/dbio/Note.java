package org.alt60m.ministry.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;

public class Note extends DBIOEntity {

	private String noteId = new String();

    private Date dateEntered = null;
    private String title = new String();
    private String note = new String();
	private String fk_resignationLetterId = new String();
    private String fk_loaNoteId = new String();
	private String fk_authorizationNoteId = new String();
    
	public Note(String id) {
		noteId = id;
		select();
	}
	public Note() {
		dateEntered = org.alt60m.util.DateUtils.clearTimeFromDate(new Date());
	}

    public boolean isPKEmpty() {
		return noteId.equals("");
	}
	public boolean persist(){
		return isPKEmpty() ? insert() : update();
	}

    public void localinit() throws DBIOEntityException {
		String table ="ministry_note";

		setMetadata("NoteId","NoteID","IDENTITY");
	    setMetadata("DateEntered","dateEntered",table);
		setMetadata("Title","title",table);
		setMetadata("Note","note",table);
		setMetadata("LoaNoteId","Fk_loaNote",table);
		setMetadata("ResignationLetterId","Fk_resignationLetter",table);
		setMetadata("AuthorizationNoteId","Fk_authorizationNote",table);

		setAutodetectProperties(false);
	}

	public String getNoteId() { return noteId; }
	public void setNoteId(String noteId) { this.noteId = noteId; }
		
	public Date getDateEntered() { return dateEntered;}
	public void setDateEntered(Date dateEntered) { this.dateEntered = org.alt60m.util.DateUtils.clearTimeFromDate(dateEntered); }
	
	public String getTitle() { return title;	}
	public void setTitle(String title) { this.title = title;}
	
	public String getNote() { return note; }
	public void setNote(String note) { this.note = note; }

    public String getLoaNoteId() { return fk_loaNoteId; }
    public void setLoaNoteId(String id) { this.fk_loaNoteId = id; }
	public Staff getLoaNote() { return new Staff(this.fk_loaNoteId); }
    public void setLoaNote(Staff loaNote) { this.fk_loaNoteId = loaNote.getAccountNo(); }
	public void assocLoaNote(Staff loaNote){ setLoaNote(loaNote); }

    public String getResignationLetterId() { return fk_resignationLetterId; }
	public void setResignationLetterId(String id) { this.fk_resignationLetterId = id; }
	public Staff getResignationLetter() { return new Staff(this.fk_resignationLetterId);}
	public void setResignationLetter(Staff resignationLetter) { this.fk_resignationLetterId = resignationLetter.getAccountNo(); }	
    public void assocResignationLetter(Staff resignationLetter){ setResignationLetter(resignationLetter); }

	public String getAuthorizationNoteId() { return fk_authorizationNoteId; }
	public void setAuthorizationNoteId(String id) { this.fk_authorizationNoteId = id; }
	public Authorization getAuthorizationNote() { return new Authorization(this.fk_authorizationNoteId);}
	public void setAuthorizationNote(Authorization authorization) { this.fk_authorizationNoteId = authorization.getAuthorizationId(); }	
    public void assocAuthorizationNote(Authorization authorization){ setAuthorizationNote(authorization); }
}