package org.alt60m.ministry.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class FieldChange extends DBIOEntity {

    public FieldChange() {}
    public FieldChange(String field, String oldValue, String newValue) {
        this.field = field;
        this.oldValue = oldValue;
        this.newValue = newValue;
    }
	public FieldChange(String id) {
		fieldChangeId = id;
		select();
	}	

	public boolean isPKEmpty() {
		return fieldChangeId.equals("");
	}

	public void localinit() throws DBIOEntityException {
		String table = "ministry_fieldchange";

		setMetadata("FieldChangeId", "FieldChangeID", "IDENTITY");

		setMetadata("Field", "field", table);
		setMetadata("OldValue", "oldValue", table);
		setMetadata("NewValue", "newValue", table);
		setMetadata("ChangeRequestId", "fk_hasFieldChanges", table);

		setAutodetectProperties(false);
	}

    private String fieldChangeId = "";

    private String field = "";
    private String oldValue = "";
    private String newValue = "";
	private String fk_changeRequestId = "";

    public String getField() { return field; }
	public void setField(String field) { this.field = field; }
	public String getOldValue() { return oldValue; }
	public void setOldValue(String oldValue) { this.oldValue = oldValue; }
	public String getNewValue() { return newValue; }
	public void setNewValue(String newValue) { this.newValue = newValue; }

    public String getFieldChangeId(){ return this.fieldChangeId; }
    public void setFieldChangeId(String fieldChangeId){ this.fieldChangeId = fieldChangeId; }

	public String getChangeRequestId(){ return fk_changeRequestId; }
	public void setChangeRequestId(String changeRequest){ this.fk_changeRequestId = changeRequest; }
	public ChangeRequest getChangeRequest(){ return new ChangeRequest(fk_changeRequestId); }
	public void setChangeRequest(ChangeRequest changeRequest){ this.fk_changeRequestId = changeRequest.getChangeRequestId(); }
}
