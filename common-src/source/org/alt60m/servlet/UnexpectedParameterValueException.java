package org.alt60m.servlet;

import java.util.*;


public class UnexpectedParameterValueException extends Exception {
	public UnexpectedParameterValueException () {}

	public UnexpectedParameterValueException(String parameterName, String[] acceptableValues) {

		super(buildString(parameterName, acceptableValues));

	}
	private static String buildString(String parameterName, String[] acceptableValues)
	{
		String msg = "Parameter '" + parameterName + "' is not in list {";
		for (int i = 0;i<acceptableValues.length ;i++ )
		{
			msg+="'"+acceptableValues[i]+"'";
			if (i!=(acceptableValues.length-1)) msg+=",";
		}
		msg+="}";
		return msg;
	}
}