/* Generated by Together */

package org.alt60m.ministry.model.locator;
import java.util.*;

/**
 * @persistent 
 * @table ministry_staff
 * @cache-type none
 * @access shared
 */
public class Staff {

    private String firstName = new String();

    private String lastName = new String();

    private String homePhone = new String();
    private String workPhone = new String();
    private String mobilePhone = new String();
    private String email = new String();

    /**
     * @stereotype key 
     * @rdbPrimaryKey
     * @rdbNotNull
     * @rdbSize 20
     * @rdbPhysicalName accountNo
     * @rdbLogicalType VARCHAR
	 * @primary-key
     */
    private String accountNo = new String();
    private String otherPhone = new String();
    private String preferredName = new String();

	public String getFirstName() {
		return firstName; 
	}
	public void setFirstName(String firstName){
        this.firstName = firstName;
    }
	public String getLastName() {
		return lastName; 
	}
	public void setLastName(String lastName) {
		this.lastName = lastName; 
	}
	public String getHomePhone() {
		return homePhone; 
	}
	public void setHomePhone(String homePhone) {
		this.homePhone = homePhone; 
	}
	public String getWorkPhone() {
		return workPhone; 
	}
	public void setWorkPhone(String workPhone) {
		this.workPhone = workPhone; 
	}
	public String getMobilePhone() {
		return mobilePhone; 
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone; 
	}
	public String getEmail() {
		return email; 
	}
	public void setEmail(String email) {
		this.email = email; 
	}
	public String getAccountNo() {
		return accountNo; 
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo; 
	}

	public String getOtherPhone() {
		return otherPhone; 
	}
	public void setOtherPhone(String otherPhone) {
		this.otherPhone = otherPhone; 
	}
	public String getPreferredName() {
		return preferredName; 
	}
	public void setPreferredName(String preferredName) {
		this.preferredName = preferredName; 
	}



}
