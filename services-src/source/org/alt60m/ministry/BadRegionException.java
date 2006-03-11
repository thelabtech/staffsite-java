/*
 * Created on Apr 30, 2004
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package org.alt60m.ministry;

/**
 * @author justin.sabelko
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class BadRegionException extends Exception {

	private String authRegion;
	
	/**
	 * 
	 */
	public BadRegionException() {
		super();
	}

	/**
	 * @param message
	 */
	public BadRegionException(String message) {
		super(message);
	}

	public BadRegionException(String region, String message) {
		authRegion = region;
	}

	/**
	 * @param message
	 * @param cause
	 */
	public BadRegionException(String message, Throwable cause) {
		super(message, cause);
	}

	/**
	 * @param cause
	 */
	public BadRegionException(Throwable cause) {
		super(cause);
	}

	/**
	 * @return
	 */
	public String getAuthRegion() {
		return authRegion;
	}

	/**
	 * @param string
	 */
	public void setAuthRegion(String string) {
		authRegion = string;
	}
}