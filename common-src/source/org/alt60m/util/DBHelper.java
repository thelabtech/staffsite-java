package org.alt60m.util;

public class DBHelper {

	public static String escape(String string) {
		return string.replace("'", "''").replace("\\", "\\\\");
	}

}
