package org.alt60m.security.dbio.model;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;

public class User extends DBIOEntity {

	private int userID;
	private String username;
//	private String email;
	private String password;
	private String passwordQuestion;
	private String passwordAnswer;
	private Date lastFailure;
	private int lastFailureCnt;
	private Date lastLogin;
	private Date createdOn;
	private boolean emailVerified;
	private String globallyUniqueID;

	public User(int id) {
		userID = id;
		select();
	}
	public User() { }

	public boolean isPKEmpty() { return userID<1; }
	public boolean persist() { return isPKEmpty() ? insert() : update(); }

	public void localinit() throws DBIOEntityException {
		String table = "simplesecuritymanager_user";

		setMetadata("UserID","userID","IDENTITY");
		setMetadata("Username","username",table);
		//setMetadata("Email","email",table);
		setMetadata("Password","password",table);
		setMetadata("PasswordQuestion","passwordQuestion",table);
		setMetadata("PasswordAnswer","passwordAnswer",table);
		setMetadata("LastFailure","lastFailure",table);
		setMetadata("LastFailureCnt","lastFailureCnt",table);
		setMetadata("LastLogin","lastLogin",table);
		setMetadata("CreatedOn","createdOn",table);
		setMetadata("EmailVerified","emailVerified",table);
		setMetadata("GloballyUniqueID","globallyUniqueID",table);

		setAutodetectProperties(false);
	}


    public int getUserID(){
            return userID;
        }

    public void setUserID(int userID){
            this.userID = userID;
        }

	public String getUsername(){
			return username;
		}

	public void setUsername(String username){
			this.username = username;
		}

	//public String getEmail(){
		//	return email;
		//}

	//public void setEmail(String email){
		//	this.email = email;
		//}

	public String getPassword(){
			return password;
		}

	public void setPassword(String password){
			this.password = password;
		}

    public String getPasswordQuestion(){ return passwordQuestion; }

    public void setPasswordQuestion(String passwordQuestion){ this.passwordQuestion = passwordQuestion; }

    public String getPasswordAnswer(){ return passwordAnswer; }

    public void setPasswordAnswer(String passwordAnswer){ this.passwordAnswer = passwordAnswer; }

    public Date getLastFailure(){ return lastFailure; }

    public void setLastFailure(Date lastFailure){ this.lastFailure = org.alt60m.util.DateUtils.clearTimeFromDate(lastFailure); }

    public int getLastFailureCnt(){
            return lastFailureCnt;
        }

    public void setLastFailureCnt(int lastFailureCnt){
            this.lastFailureCnt = lastFailureCnt;
        }

	public Date getLastLogin(){
			return lastLogin;
		}

	public void setLastLogin(Date lastLogin){
			this.lastLogin = lastLogin;
		}

    public Date getCreatedOn(){
            return createdOn;
        }

    public void setCreatedOn(Date createdOn){
            this.createdOn = createdOn;
        }

	public boolean getEmailVerified(){
            return emailVerified;
        }

    public void setEmailVerified(boolean emailVerified){
            this.emailVerified = emailVerified;
        }

    public void hadSuccessfulLogin() {
		setLastLogin(new Date());
		setLastFailure(null);
		setLastFailureCnt(0);
    }

    public void hadFailedLogin() {

		// last failure happened today, increment count
		if( org.alt60m.util.DateUtils.isToday(getLastFailure() ) ) {
			setLastFailureCnt(getLastFailureCnt()+1);
		} else { // not today, reset count
			setLastFailure(new Date());
			setLastFailureCnt(1);
		}

    }

	/**
	 * @return Returns the globallyUniqueID.
	 */
	public String getGloballyUniqueID() {
		return globallyUniqueID;
	}
	/**
	 * @param globallyUniqueID The globallyUniqueID to set.
	 */
	public void setGloballyUniqueID(String globallyUniqueID) {
		this.globallyUniqueID = globallyUniqueID;
	}
}
