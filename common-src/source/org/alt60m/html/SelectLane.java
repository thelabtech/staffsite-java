package org.alt60m.html;


public class SelectLane implements java.io.Serializable {
	
	// 11/10/2005 - Added Bridges International (BI) to list of lanes
    String[] lanes = {" ",  "FS",  "IC", "WS", "OP", "HR", "FD", "ND", "BR" };
	String[] laneNames = {" ", "Field Strategies", "Ethnic Student Ministries","Worldwide Student Network", "Operations", "Human Resources", "Fund Dev", "National Director's Office", "Bridges Int'l"};
	String currentLane;
    String name;

	public SelectLane() {}

    public void setName(String aName) { name = aName; }

    public void setCurrentValue(String aValue) {
		currentLane = new String(aValue);
    }


    public String print() {
	StringBuffer sb = new StringBuffer();
	int i;

	sb.append("<select name=\"" + name + "\">");

	for (i = 0; i < lanes.length; ++i) {
		if (lanes[i].equals(currentLane)) {
			sb.append("<option value=\"" + lanes[i] + "\" selected>" + laneNames[i] + "</option>");
	    } else {
		sb.append("<option value=\"" + lanes[i] + "\">" + laneNames[i] + "</option>");
	    }
	}
	sb.append("</select>");
	return sb.toString();
    }

	public String display() {
	StringBuffer sb = new StringBuffer();
	int i;

	for (i = 0; i < 9; ++i) {
		if (lanes[i].equals(currentLane)) {
			sb.append(laneNames[i]);
	    } 
	}
	return sb.toString();
    }
}
