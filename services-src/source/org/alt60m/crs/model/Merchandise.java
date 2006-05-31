package org.alt60m.crs.model;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.log.*;
import com.kenburcham.framework.system.*;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;

public class Merchandise extends DBIOEntity {

	public static SystemLog log = (SystemLog) SystemManager
			.getLog(Merchandise.class.getName());

	// IDENTITY
	private int merchandiseID;

	// KEY
	private int fk_ConferenceID;

	private int fk_RegistrationTypeID;

	private String name = "";

	private String note = "";

	private float amount = 0;

	private String required = "";

	private String registrationType = "";

	private int displayOrder = 0;

	public Merchandise() {
	}

	public Merchandise(int PK) {
		setMerchandiseID(PK);
		select();
	}
	
	public boolean equals(Object o) {
		Merchandise m = (Merchandise)o;
		return( merchandiseID == m.merchandiseID );
	}

	public void localinit() throws DBIOEntityException {
		String table = "crs_merchandise";
		setMetadata("MerchandiseID", "merchandiseID", "IDENTITY");

		setMetadata("ConferenceID", "fk_ConferenceID", "KEY");
		setMetadata("RegistrationTypeID", "fk_RegistrationTypeID", "KEY");

		setMetadata("Name", "name", table);
		setMetadata("Note", "note", table);
		setMetadata("Amount", "amount", table);
		setMetadata("RequiredString", "required", table);
//		setMetadata("RegistrationType", "registrationType", table);			/* to be deprecated gdw - 2004-09-17 */
		setMetadata("DisplayOrder", "displayOrder", table);

		setAutodetectProperties(false);
	}

	public boolean isPKEmpty() {
		return getMerchandiseID() == 0;
	}

	public int getMerchandiseID() {
		return merchandiseID;
	}

	public void setMerchandiseID(int merchandiseID) {
		this.merchandiseID = merchandiseID;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public boolean getRequired() {
		return required != null && required.equals("T");
	}

	public void setRequired(boolean required) {
		this.required = required ? "T" : "F";
	}

	public String getRequiredString() {
		return required;
	}

	public void setRequiredString(String required) {
		this.required = required;
	}
/* deprecated gdw - 2004-09-17 */
/*	public String getRegistrationType() {			
		return this.registrationType;
	}

	public void setRegistrationType(String registrationType) {
		this.registrationType = registrationType;
	}
*/
	public int getRegistrationTypeID() {
		return fk_RegistrationTypeID;
	}

	public void setRegistrationTypeID(int registrationTypeID) {
		this.fk_RegistrationTypeID = registrationTypeID;
	}

	public RegistrationType getRegistrationType() {
		RegistrationType rt = new RegistrationType();
		rt.setRegistrationTypeID(fk_RegistrationTypeID);
		rt.select();
		return rt;
	}

	public void setRegistrationType(RegistrationType rt) {
		fk_RegistrationTypeID = rt.getRegistrationTypeID();
	}
	
	public void setRegistrationType(int registrationTypeID) {
		fk_RegistrationTypeID = registrationTypeID;
	}
	public int getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}

	public int getConferenceID() {
		return fk_ConferenceID;
	}

	public void setConferenceID(int conferenceID) {
		this.fk_ConferenceID = conferenceID;
	}

	public Conference getConference() {
		Conference c = new Conference();
		c.setConferenceID(fk_ConferenceID);
		c.select();
		return c;
	}

	public void setConference(Conference c) {
		fk_ConferenceID = c.getConferenceID();
	}

	public Vector getRegistrations() {
		Registration r = new Registration();

		r.clearMetadata();

		String table = "crs_viewmerchandisechoice";

		r.setMetadata("RegistrationID", "registrationID", "IDENTITY");
		r.setMetadata("RegistrationTypeID", "fk_RegistrationTypeID", table);
		r.setMetadata("ConferenceID", "fk_conferenceID", table);
		r.setMetadata("PersonID", "fk_personID", table);

		r.setMetadata("RegistrationDate", "registrationDate", table);
		r.setMetadata("PreRegisteredString", "preRegistered", table);

		return r.selectList("merchandiseID = '" + merchandiseID + "'");
	}

	public Vector getRegistrations(String orderField, boolean DESC) {
		Registration r = new Registration();

		r.clearMetadata();

		String table = "crs_viewmerchandisechoice";

		r.setMetadata("RegistrationID", "registrationID", "IDENTITY");

		r.setMetadata("ConferenceID", "fk_conferenceID", table);
		r.setMetadata("RegistrationTypeID", "fk_RegistrationTypeID", table);
		r.setMetadata("PersonID", "fk_personID", table);

		r.setMetadata("RegistrationDate", "registrationDate", table);
		r.setMetadata("PreRegisteredString", "preRegistered", table);

		return r.selectList("merchandiseID = '" + merchandiseID + "' ORDER BY "
				+ orderField + " " + (DESC ? "DESC" : "ASC"));
	}

	public void assocRegistration(Registration rel) {
		MerchandiseChoice mc = new MerchandiseChoice();
		mc.setMerchandiseID(merchandiseID);
		mc.setRegistrationID(rel.getRegistrationID());
		mc.insert();
	}

	public void dissocRegistration(Registration rel) {
		MerchandiseChoice mc = new MerchandiseChoice();
		mc.setMerchandiseID(merchandiseID);
		mc.setRegistrationID(rel.getRegistrationID());
		mc.delete();
	}
}
