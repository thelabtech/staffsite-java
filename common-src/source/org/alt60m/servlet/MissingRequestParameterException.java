package org.alt60m.servlet;

import java.util.*;


public class MissingRequestParameterException extends Exception {
	public MissingRequestParameterException() {}

	public MissingRequestParameterException(String parameterName) {
		super("Parameter '" + parameterName + "' was missing from the HTTPRequest");

	}
}