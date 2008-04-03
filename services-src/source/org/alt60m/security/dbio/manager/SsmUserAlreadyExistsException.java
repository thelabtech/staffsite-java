package org.alt60m.security.dbio.manager;

/** This exception is thrown when condition occurred */
public class SsmUserAlreadyExistsException extends SecurityManagerException {
	/** Constructs an Exception without a message. */
	public SsmUserAlreadyExistsException() {
		super();
	}

	/**
	 * Constructs an Exception with a detailed message.
	 * @param Message The message associated with the exception.
	 */
	public SsmUserAlreadyExistsException(String message) {
		super(message);
	}
	
    public SsmUserAlreadyExistsException(String message, Throwable t) {
        super(message, t);
    }
}