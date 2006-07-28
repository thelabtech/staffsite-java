/*
 * Created on Jul 28, 2004
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package org.alt60m.cas;

/**
 * @author justin.sabelko
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class NotAuthenticatedException extends Exception {

	private String errCode;

	/**
	 * @param errorCode
	 * @param errorMessage
	 */
	public NotAuthenticatedException(String errorCode, String errorMessage) {
		super(errorMessage);
		errCode = errorCode;
	}

}
