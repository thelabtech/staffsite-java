/*
 * Created on Jul 27, 2004
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package org.alt60m.cas;

import java.util.Collections;
import java.util.Map;
import java.io.Serializable;

/**
 * @author justin.sabelko
 *
 */
public class CASUser implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String username;
	private String pgtIou;
	private Map<String, String> attributes;
	public static final String ATTR_GUID = "ssoGuid";
	public static final String ATTR_DESIGNATION_NO = "designation";
	public static final String ATTR_EMPLOYEE_ID = "emplid";
	public static final String ATTR_PEOPLE_ID = "peopleid";
	public static final String ATTR_FIRSTNAME = "firstName";
	public static final String ATTR_LASTNAME = "lastName";

	/**
	 * @param user
	 * @param attributes
	 */
	public CASUser(String user, String pgtiou, Map<String, String> attr) {
		username = user;
		pgtIou = pgtiou;
		if (attr == null) {
			throw new IllegalArgumentException("attribute map cannot be null!");
		}
		attributes = attr;
	}
	
	/**
	 * @return Returns the attributes.
	 */
	public Map getAttributes() {
		return Collections.unmodifiableMap(attributes);
	}
	/**
	 * @return Returns the username.
	 */
	public String getUsername() {
		return username;
	}

	public String getPgtIou() {
		return pgtIou;
	}	
	
	//convenience methods
	
	/**
	 * @return
	 */
	public String getGUID() {
		return attributes.get(ATTR_GUID);
	}

	/**
	 * @return a valid account number, or null if the user has none
	 */
	public String getAcctNo() {
		String accountNo = attributes.get(ATTR_EMPLOYEE_ID);
		if (accountNo == null || accountNo.equals("")) {
			accountNo = attributes.get(ATTR_DESIGNATION_NO);
			if (accountNo == null || accountNo.equals("")) {
				return null;
			}
		}
		if (accountNo.length() == 7
				|| (accountNo.length() == 8 && accountNo.endsWith("S"))) {
			accountNo = "00" + accountNo;
		}
		if (accountNo.length() != 9 && !(accountNo.length() == 10 && accountNo
				.endsWith("S"))) {
			throw new RuntimeException("Invalid account no: " + accountNo);
		}
		return accountNo;
	}
	
	public String getFirstName()
	{
		return attributes.get(ATTR_FIRSTNAME);
	}
	
	public String getLastName()
	{
		return attributes.get(ATTR_LASTNAME);
	}

	@Override
	public String toString() {
		StringBuffer out = new StringBuffer();
		out.append("{");
		out.append("username=").append(username).append("; ");
		out.append("pgtIou=").append(pgtIou).append("; ");
		out.append("attributes=").append(attributes);
		out.append("}");
		return out.toString();
	}
}
