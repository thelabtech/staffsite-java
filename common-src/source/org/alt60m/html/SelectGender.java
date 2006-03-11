package org.alt60m.html;

public class SelectGender implements java.io.Serializable {


    private String male = "1";
    private String female = "0";
    private String currentValue = "0";
    private String name;
    private String size;


    public SelectGender() {}


    public SelectGender(String aName) {
	name = aName;
    }


    public SelectGender(String aName, String aValue) {
	name = aName;
	makeSelected(aValue);
    }


    public SelectGender(String aName, String aSize, String aValue) {
	name = aName;
	size = aSize;
	makeSelected(aValue);
    }


    public void setName(String aName) {
	name = aName;
    }


    public void setSize(String aSize) {
	size = aSize;
    }


    public void setCurrentValue(String aValue) {
	currentValue = aValue;
    }


    public void makeSelected(String aValue) {
	currentValue = aValue;
    }


    public String print() { 
	StringBuffer ob = new StringBuffer();

	ob.append("<select name=\"" + name + "\" ");


	// ToDo: add this capability to the bean
	/*
	if (!size.equals(null)) {
	    ob.append("size=\"" + size + "\"");
	}
	*/

	ob.append(">");

	if (currentValue.equals(male)) {
	    ob.append("<option value=\"1\" selected=\"selected\">Male</option>");
	    ob.append("<option value=\"0\" >Female</option>");
	} else {
	    ob.append("<option value=\"1\" >Male</option>");
	    ob.append("<option value=\"0\" selected=\"selected\">Female</option>");
	}

	ob.append("</select>");

	return ob.toString();
    }
}
