package org.alt60m.html;

import org.alt60m.util.ArrayHelper;

public class SelectRegion implements java.io.Serializable {

	// *****
	// Use regions and region names statically, moved the empty field out
	// AS 1/6/2003
	// 11/10/2005 - Added Bridges Nat'l Office (BN) to Regions list.
	// 11/11/2005 - Removed Bridges Nat'l Office (BN) from Regions list.
    public static String[] regions = {"NE", "MA", "MS", "SE", "GL", "UM", "GP", "RR", "NW", "SW", "NC"};
	public static String[] regionNames = {"Northeast","Mid-Atlantic","MidSouth","Southeast","Great Lakes","Upper Midwest","Great Plains Int'l","Red River","Greater Northwest","Pacific Southwest","Nat'l Campus Office"};
	// ******
	String currentRegion;
    String name;
	String blankTitle = "";

    public SelectRegion() {}

    public void setName(String aName) { name = aName; }

    public void setBlankTitle(String aValue) {
		blankTitle = aValue;
    }

    public void setCurrentValue(String aValue) {
		currentRegion = new String(aValue);
    }

    public String print() {
		StringBuffer sb = new StringBuffer();
		int i;

		sb.append("<select name=\"" + name + "\">");
		sb.append("<option  value=\" \">" + blankTitle + "</option>");

		for (i = 0; i < regions.length; ++i) {
			if (regions[i].equals(currentRegion)) {
				sb.append("<option value=\"" + regions[i] + "\" selected>" + regionNames[i] + "</option>");
			} else {
				sb.append("<option value=\"" + regions[i] + "\">" + regionNames[i] + "</option>");
			}
		}
		sb.append("</select>");
		return sb.toString();
    }

	public String display() {
		if(ArrayHelper.indexOf(currentRegion,regions) >= 0)
			return regionNames[ArrayHelper.indexOf(currentRegion,regions)];
		else
			return "";
    }
}
