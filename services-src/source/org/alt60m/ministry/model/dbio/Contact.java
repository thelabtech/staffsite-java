package org.alt60m.ministry.model.dbio;



public class Contact extends Object {
	


	public boolean isPKEmpty() {
		return personID == 0;
	}
	public Contact() {
	}
	
	public Contact(int id) {
		personID=id;
	}
	
	


    private int personID = 0;
    private String accountNo = "";
	private String lastName = "";
	private String firstName = "";
	private String preferredName="";
	private String email="";
	private int fk_ssmUserID = 0;
    
	/**
	 * @return Returns the firstName.
	 */
	public String getFirstName() {
		return firstName;
	}
	/**
	 * @param firstName The firstName to set.
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	/**
	 * @return Returns the preferredName.
	 */
	public String getPreferredName() {
		return preferredName;
	}
	/**
	 * @param lastName The preferredName to set.
	 */
	public void setPreferredName(String preferredName) {
		this.preferredName = preferredName;
	}
	/**
	 * @return Returns the lastName.
	 */
	
	public String getLastName() {
		return lastName;
	}
	/**
	 * @param lastName The lastName to set.
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}	
	/**
	 * @return Returns the personID.
	 */
	public int getPersonID() {
		return personID;
	}
	public String getAccountNo() { return accountNo; }
	public void setAccountNo(String accountNo) { this.accountNo = accountNo; }
	/**
	 * @param lastName The personID to set.
	 */
	public void setPersonID(int personID) {
		this.personID = personID;
	}
	/**
	 * @return Returns the fk_ssmUserId.
	 */
	public int getFk_ssmUserID() {
		return fk_ssmUserID;
	}
	/**
	 * @param lastName The fk_ssmUserId to set.
	 */
	public void setFk_ssmUserID(int fk_ssmUserID) {
		this.fk_ssmUserID = fk_ssmUserID;
	}
	/**
	 * @return Returns the email.
	 */
	
	public String getEmail() {
		return email;
	}
	/**
	 * @return Sets the email.
	 */
		
	public void  setEmail(String email) {
			this.email=email;
	}
	
	

}