package org.alt60m.hr.si.model.dbio;

import java.util.Date;
import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class SIUser extends DBIOEntity {
	public boolean isPKEmpty() {
		return siUserID == 0;
	}
	public SIUser() {
	}
	public SIUser(String id) {
		siUserID= (new Integer(id)).intValue();
		select();
	}
	public SIUser(int id) {
		siUserID= id;
		select();
	}
	public void localinit() {
		String table = "hr_si_Users";

		setMetadata("SiUserID", "siUserID", "IDENTITY");
		setMetadata("Fk_ssmUserID", "fk_ssmUserID", table);
		setMetadata("Role", "role", table);
		setMetadata("ExpirationDate", "expirationDate", table);
		
		setAutodetectProperties(false);		
	}
   
    private int siUserID;
    private int fk_ssmUserID;
    private String role;
    private Date expirationDate;

    /* Getters and Setters */
    public int getSiUserID(){ return siUserID; }
    public void setSiUserID(int newValue){ siUserID = newValue; }

    public int getFk_ssmUserID(){ return fk_ssmUserID; }
    public void setFk_ssmUserID(int newValue){ fk_ssmUserID = newValue; }

    public String getRole(){ return role; }
    public void setRole(String newValue){ role = newValue; }

    public Date getExpirationDate(){ return expirationDate; }
    public void setExpirationDate(Date newValue){ expirationDate = newValue; }

}
