package org.alt60m.wsn.sp.model.dbio;

import java.util.Date;
import com.kenburcham.framework.dbio.DBIOEntity;
//import com.kenburcham.framework.dbio.DBIOEntityException;

public class WsnUser extends DBIOEntity {
	public boolean isPKEmpty() {
		return wsnUserID == 0;
	}
	public WsnUser() {
	}
	public WsnUser(String id) {
		wsnUserID = (new Integer(id)).intValue();
		select();
	}
	public WsnUser(int id) {
		wsnUserID = id;
		select();
	}
	
	public void localinit() {
		String table = "wsn_sp_wsnusers";
		
		setMetadata("WsnUserID", "wsnUserID", "IDENTITY");
		setMetadata("SsmUserName", "ssmUserName", table);
		setMetadata("Role", "role", table);
		setMetadata("ExpirationDate", "expirationDate", table);
		
		setAutodetectProperties(false);		
	}

    
    private int wsnUserID;
    private String ssmUserName;
    private String role;
    private Date expirationDate;

    /* Getters and Setters */
    public int getWsnUserID(){ return wsnUserID; }
    public void setWsnUserID(int newValue){ wsnUserID = newValue; }

    public String getSsmUserName(){ return ssmUserName; }
    public void setSsmUserName(String newValue){ ssmUserName = newValue; }

    public String getRole(){ return role; }
    public void setRole(String newValue){ role = newValue; }

    public Date getExpirationDate(){ return expirationDate; }
    public void setExpirationDate(Date newValue){ expirationDate = newValue; }

}
