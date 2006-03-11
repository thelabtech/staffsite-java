package org.alt60m.staffSite.bean;

//import java.util.*;

public class PasswordValidator {

/*	public static String validate(String passwd1, String passwd2, String firstName, String lastName) throws Exception {
		try {
			if (!passwd1.equals(passwd2)) {
				return "Password and confirmation do not match.";
			}

			String returnVal = "";

			if (passwd1.length() < 10 || passwd1.length() > 14) {
				returnVal += "* Your password needs to be between 10 and 14 characters in length.<BR>";
			}

			int checks = 0;

			// check for a lower case
			if (!passwd1.equals(passwd1.toUpperCase()))
				checks++;

			// check for an upper case
			if (!passwd1.equals(passwd1.toLowerCase()))
				checks++;

			// check for a number or punctuation
			char[] a = passwd1.toCharArray();
			boolean hasDigit = false;
			boolean hasPunctuation = false;
			for (int i = 0; i < a.length; i++) {
				Character passwordChar = new Character(a[i]);
				if (Character.isDigit(a[i]))
					hasDigit = true;
				if (!Character.isLetterOrDigit(a[i]))
					hasPunctuation = true;
			}
			if (hasDigit)
				checks++;
			if (hasPunctuation)
				checks++;

			// must have a combination of 3 of the above checks
			if (checks < 3) {
				returnVal += "* You must match 3 of the 4 password criteria shown.<BR>";
			}

			// can't include "password"
			if (passwd1.toLowerCase().indexOf("password") != -1) {
				returnVal += "* Your password cannot include the word 'password'.<BR>";
			}

			// can't include first or last name
			if ((passwd1.toLowerCase().indexOf(firstName.toLowerCase()) != -1) || (passwd1.toLowerCase().indexOf(lastName.toLowerCase()) != -1)) {
				returnVal += "* Your password cannot include your name.<BR>";
			}
			return returnVal;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
*/
	public static String validate(String passwd1, String passwd2, String firstName, String lastName) throws Exception {
		try {
			if (!passwd1.equals(passwd2)) {
				return "* Password and confirmation do not match.";
			}

			String returnVal = "";

			if (passwd1.length() < 8 || passwd1.length() > 14) {
				returnVal += "* Your password needs to be at least 8 characters long.<BR>";
			}

			int checks = 0;

			// check for a lower case
			if (!passwd1.equals(passwd1.toUpperCase()))
				checks++;

			// check for an upper case
			if (!passwd1.equals(passwd1.toLowerCase()))
				checks++;

			// check for a number or punctuation
			char[] a = passwd1.toCharArray();
			boolean hasDigit = false;
			boolean hasPunctuation = false;
			for (int i = 0; i < a.length; i++) {
				Character passwordChar = new Character(a[i]);
				if (Character.isDigit(a[i]))
					hasDigit = true;
				if (!Character.isLetterOrDigit(a[i]))
					hasPunctuation = true;
			}
			if (hasDigit)
				checks++;
			if (hasPunctuation)
				checks++;

			// must have a combination of 2 of the above checks
			if (checks < 2) {
				returnVal += "* You must match 2 of the 4 password criteria shown.<BR>";
			}

			// can't include "password"
			if (passwd1.toLowerCase().indexOf("password") != -1) {
				returnVal += "* Your password cannot include the word 'password'.<BR>";
			}

			// can't include first or last name
			if ((passwd1.toLowerCase().indexOf(firstName.toLowerCase()) != -1) || (passwd1.toLowerCase().indexOf(lastName.toLowerCase()) != -1)) {
				returnVal += "* Your password cannot include your name.<BR>";
			}
			return returnVal;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public static String simpleValidate(String passwd1, String passwd2, String firstName, String lastName) {

		if (!passwd1.equals(passwd2)) {
			return "Password and confirmation do not match.";
		}

		String returnVal = "";

		if (passwd1.length() < 6 || passwd1.length() > 25) {
			returnVal += "* Your password needs to be between 6 and 25 characters in length.<BR>";
		}
		return returnVal;
	}
}
