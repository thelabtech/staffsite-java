/* Generated by Together */

package org.alt60m.security.dbio.manager;

/** This exception is thrown when condition occurred */
public class SecurityManagerFailedException extends SecurityManagerException {
	/** Constructs an Exception without a message. */
	public SecurityManagerFailedException() {
		super();
	}

	/**
	 * Constructs an Exception with a detailed message.
	 * @param Message The message associated with the exception.
	 */
	public SecurityManagerFailedException(String message) {
		super(message);
	}

    public SecurityManagerFailedException(Exception e) {
        super("Failed due to exception", e);
    }
    
    public SecurityManagerFailedException(String message, Throwable t)
    {
    	super(message, t);
    }
}
