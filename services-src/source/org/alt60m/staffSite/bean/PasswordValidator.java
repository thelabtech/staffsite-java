package org.alt60m.staffSite.bean;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

//import java.util.*;

public class PasswordValidator {


	public static List<String> validate(String newPassword, String newPasswordVerify) {
		List<String> errors = new ArrayList<String>();
		if (!newPassword.equals(newPasswordVerify)) {
			errors.add("Your passwords do not match.");
		}
		if (!Pattern.matches(".*[a-z]+.*[A-Z]+.*|.*[A-Z]+.*[a-z]+.*",
				newPassword)) {
			errors.add("Your password must contain upper and lower case letters.");
		}
		if (newPassword.length() < 8) {
			errors.add("Your password must be at least 8 characters long.");
		}

		return errors;
	}
}
