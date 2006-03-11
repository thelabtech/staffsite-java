package org.alt60m.crs.model;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class MerchandiseChoice extends DBIOEntity {

	private int fk_MerchandiseID;

	private int fk_RegistrationID;

	public MerchandiseChoice() {
	}

	public boolean isPKEmpty() {
		return fk_MerchandiseID == 0 && fk_RegistrationID == 0;
	}

	public void localinit() throws DBIOEntityException {
		String table = "crs_MerchandiseChoice";
		setMetadata("RegistrationID", "fk_RegistrationID", "KEY");
		setMetadata("MerchandiseID", "fk_MerchandiseID", table);
		setAutodetectProperties(false);
	}

	public int getMerchandiseID() {
		return fk_MerchandiseID;
	}

	public void setMerchandiseID(int fk_MerchandiseID) {
		this.fk_MerchandiseID = fk_MerchandiseID;
	}

	public int getRegistrationID() {
		return fk_RegistrationID;
	}

	public void setRegistrationID(int fk_RegistrationID) {
		this.fk_RegistrationID = fk_RegistrationID;
	}
}