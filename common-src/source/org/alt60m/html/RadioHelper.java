package org.alt60m.html;

public class RadioHelper implements java.io.Serializable {

    public RadioHelper() {}

    public String check(String value1, String value2) { 
		
		String s = new String();
		try {
			if (value1.equals(value2)) {
				s = "checked";
			} else {
				s = "";
			}
		}
		catch (Exception e) {
			s="";
		}
		return s;
    }

	public String check(Boolean value1, Boolean value2) { 
		String s = new String();
		try {
			if (value1.equals(value2)) {
				s = "checked";
			} else {
				s = "";
			}
		}
		catch (Exception e) {
			s="";
		}
		return s;
    }

	public String check(boolean value1, boolean value2) {
		return check(new Boolean(value1),new Boolean(value2));
	}
	
	public String check(Boolean value1, boolean value2) {
		return check(value1,new Boolean(value2));
	}
}
