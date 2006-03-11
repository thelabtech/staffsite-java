package org.alt60m.html;

// 10-23-02 dc: added disabled

public class SelectState implements java.io.Serializable {
	String required = "";
	String disabled = "";

    String[] states = {"", 
	
 "AK",
 "AL",
 "AR",
 "AZ",
 "CA",
 "CO",
 "CT",
 "DE",
 "FL",
 "GA",
 "HI",
 "IA",
 "ID",
 "IL",
 "IN",
 "KS",
 "KY",
 "LA",
 "MA",
 "MD",
 "ME",
 "MI",
 "MN",
 "MO",
 "MS",
 "MT",
 "NC",
 "ND",
 "NE",
 "NH",
 "NJ",
 "NM",
 "NV",
 "NY",
 "OH",
 "OK",
 "OR",
 "PA",
 "RI",
 "SC",
 "SD",
 "TN",
 "TX",
 "UT",
 "VA",
 "VT",
 "WA",
 "WI",
 "WV",
 "WY",
 "DC" };
	
	
	
	String currentState;
    String name;

    public SelectState() {}


    

    public void setName(String aName) { name = aName; }

    public void setCurrentValue(String aValue) {
		currentState = new String(aValue);
    }

    public void setRequired(String aValue) {
		required = new String(aValue);
    }

    public void setDisabled(String aValue) {
		disabled = new String(aValue);
    }

    public String print() {
	StringBuffer sb = new StringBuffer();
	int i;

	if(required.equals(""))
		sb.append("<select " + disabled + " name=\"" + name + "\">");
	else{
		// Added by Andy Stanberry for MS fully backward compatible
		sb.append("<select " + disabled + " class=\"" + required + "\" onFocus=\"Highlight(this)\" onBlur=\"UnHighlight(this)\" name=\"" + name + "\">");
	}

	for (i = 0; i < 52; ++i) {
		if (states[i].equals(currentState)) {	
			sb.append("<option value=\"" + states[i] + "\" selected>" + states[i] + "</option>");
	    } else {
			sb.append("<option value=\"" + states[i] + "\">" + states[i] + "</option>");
	    }
	}
	sb.append("</select>");
	return sb.toString();
    }
}
