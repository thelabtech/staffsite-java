/*
 * Created on Apr 30, 2004
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package org.alt60m.ministry;

import org.alt60m.ministry.model.dbio.StaffChangeRequest;

/**
 * @author justin.sabelko
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class AuthorizerNotFoundException extends Exception {

	private String authRole;
	private String authRegion;
	
	/**
	 * 
	 */
	public AuthorizerNotFoundException() {
		super();
	}

	/**
	 * @param message
	 */
	public AuthorizerNotFoundException(String message) {
		super(message);
	}

	public AuthorizerNotFoundException(String role, String region) {
		authRole = role;
		authRegion = region;
	}

	/**
	 * @param message
	 * @param cause
	 */
	public AuthorizerNotFoundException(String message, Throwable cause) {
		super(message, cause);
	}

	/**
	 * @param cause
	 */
	public AuthorizerNotFoundException(Throwable cause) {
		super(cause);
	}

	/**
	 * @return
	 */
	public String getAuthRegion() {
		return authRegion;
	}

	/**
	 * @return
	 */
	public String getAuthRole() {
		String result = authRole;
		if (authRole.equals(StaffChangeRequest.HR_NATIONAL_DIR)) {
			result = "Human Resources National Director";
		}
		else if (authRole.equals(StaffChangeRequest.HR_REGIONAL_DIR)) {
			result = "Human Resources Regional Director";
		}
		return result;
	}

	/**
	 * @param string
	 */
	public void setAuthRegion(String string) {
		authRegion = string;
	}

	/**
	 * @param string
	 */
	public void setAuthRole(String string) {
		authRole = string;
	}

}
