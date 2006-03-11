package org.alt60m.html;


public class SelectStatus implements java.io.Serializable {

    String[] status = {" ", "AC", "IN", "FR", "PI", "KE", "LA", "TR" };
    String[] statusName = {" ",  "Active", "Inactive", "Forerunner", "Pioneering", "Key Contact", "Launched", "Transformational" };
    String[] statusNameCap = {" ",  "ACTIVE", "INACTIVE", "FORERUNNER", "PIONEERING", "KEY CONTACT", "LAUNCHED", "TRANSFORMATIONAL" };
	String[] statusDef = {" ",  "active", "inactive", "forerunner", "pioneering", "keycontact", "launched", "transformational" };
	String currentStatus;
    String name;

    public SelectStatus() {}


    

    public void setName(String aName) { name = aName; }

    public void setCurrentValue(String aValue) {
		currentStatus = new String(aValue);
    }


    public String print() {
	StringBuffer sb = new StringBuffer();
	int i;

	sb.append("<select name=\"" + name + "\">");

	for (i = 0; i < 8; ++i) {
		if (status[i].equals(currentStatus)) {
			sb.append("<option value=\"" + status[i] + "\" selected>" + statusName[i] + "</option>");
	    } else {
		sb.append("<option value=\"" + status[i] + "\">" + statusName[i] + "</option>");
	    }
	}
	sb.append("</select>");
	return sb.toString();
    }


    public String printRadio() {
	StringBuffer sb = new StringBuffer();
	int i;

	for (i = 3; i < 8; ++i) {
		if (status[i].equals(currentStatus)) {
			sb.append("<input type=radio name=updateoption value=nc CHECKED> <SPAN NAME=\"" + statusDef[i] + "\" onMouseOver=\"setDefinition(" + statusDef[i] + ")\" onMouseOut=\"setDefinition(empty)\">" + statusNameCap[i] + "</SPAN> Catalytic campus.<br>");
	    } else {
		sb.append("<input type=radio name=updateoption value='" + status[i] + "'> <SPAN NAME=\"" + statusDef[i] + "\" onMouseOver=\"setDefinition(" + statusDef[i] + ")\" onMouseOut=\"setDefinition(empty)\">" + statusNameCap[i] + "</SPAN> Catalytic campus.<br>");
	    }
	}
	return sb.toString();
    }


    public String display() {
	StringBuffer sb = new StringBuffer();
	int i;

	for (i = 0; i < 7; ++i) {
		if (status[i].equals(currentStatus)) {
			sb.append(statusName[i]);
	    }
	}
	return sb.toString();
    }

}