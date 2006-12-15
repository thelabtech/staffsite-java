package org.alt60m.html;

////////////// Form Helper
////////////// collected by G. Wilson


public class FormHelper implements java.io.Serializable {

    public FormHelper() {}

/* ------------------    STANDARD ENTRY BOX          ------------------------*/
	public String value(String value1) { 
		
		if (value1 != null)
			return value1;
		else 
			return "";
    }

/* ------------------    SELECT FORMS          ------------------------*/
	public String select(String value1, String value2) { 
		
		String s = new String();
		try {
			if (value1.equals(value2)) {
				s = "selected";
			} else {
				s = "";
			}
		}
		catch (Exception e) {
			s="";
		}
		return s;
    }

	public String select(int value1, String value2) { 
		
		String s = new String();
		try {
			if (value2.equals(new String().valueOf(value1))) {   
				s = "selected";
			} else {
				s = "";
			}
		}
		catch (Exception e) {
			s="";
		}
		return s;
    }


/* -----------------       RADIO BUTTONS         ----------------------*/
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
