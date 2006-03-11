package org.alt60m.util;

import java.util.*;

public class Validate {

	public static final boolean validateEmail(String s){
		boolean valid = true;
		if (s.indexOf("@")>0) {
			String sub = s.substring(s.indexOf("@"));
			valid = sub.indexOf(".")>0;
		} else valid = false;
		return valid;
	}
}
