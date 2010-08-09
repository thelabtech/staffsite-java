package org.alt60m.html;


public class SelectLane implements java.io.Serializable {
	
	// 11/10/2005 - Added Bridges International (BI) to list of lanes
    String[] lanes = {" ",  
    		"FS",  
    		"IC", 
    		"ID",
    		"IE",
    		"II",
    		"IN",
    		"WS", 
    		"OP", 
    		"HR", 
    		"FD", 
    		"BR",
    		"SV",
    		"FC",
    		"OT"};
	String[] laneNames = {" ", 
			"Campus Field Ministry", 
			"Ethnic Student Ministries",
			"Destino",
    		"Epic",
    		"Impact",
    		"Nations",
			"Worldwide Student Network", 
			"Operations", 
			"Human Resources", 
			"Fund Dev", 
			"Bridges Int'l",
			"Student Venture",
			"Faculty Commons",
			"Other"};
	String currentLane;
    String name;

	public SelectLane() {}

    public void setName(String aName) { name = aName; }

    public void setCurrentValue(String aValue) {
		currentLane = new String(aValue);
    }
    public  String transLane(String aValue){
    	String result=aValue;
    	for (int i = 0; i < lanes.length; ++i) {
    		if (lanes[i].equals(aValue)) {
    			result=laneNames[i];
    		} 
    	    }
    	return result;
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

	for (i = 0; i < 15; ++i) {
		if (lanes[i].equals(currentLane)) {
			sb.append(laneNames[i]);
	    } 
	}
	return sb.toString();
    }
}
