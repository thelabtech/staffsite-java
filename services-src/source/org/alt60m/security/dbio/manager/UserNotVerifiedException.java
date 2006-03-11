package org.alt60m.security.dbio.manager;

/** This exception is thrown when condition occurred */
public class UserNotVerifiedException extends SecurityManagerException {
	/** Constructs an Exception without a message. */
	public UserNotVerifiedException() {
		super();
	}

	/**
	 * Constructs an Exception with a detailed message.
	 * @param Message The message associated with the exception.
	 */
	public UserNotVerifiedException(String message) {
		super(message);
	}
}
