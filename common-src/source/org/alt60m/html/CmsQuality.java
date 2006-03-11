package org.alt60m.html;

public class CmsQuality implements java.io.Serializable {

	String currentValue = "3";
    String name = "qualitySelect";
	boolean blank = false;

    public CmsQuality() {}

    public void setName(String aName) { name = aName; }

    public void setBlank(boolean v) { blank = v; }

    public void setCurrentValue(String aValue) {
		currentValue = new String(aValue);
    }

	public String printSelect() {
		StringBuffer sb = new StringBuffer();
		int i;
		sb.append("<select name=\"" + name + "\">");
		if (blank) sb.append("<option value=\"\"></option>");
		sb.append("<option value=\"C\"");
		if (currentValue.equals("C")) sb.append(" selected");
		sb.append(">C - Staff Submitted</option>");
		sb.append("<option value=\"B\"");
		if (currentValue.equals("B")) sb.append(" selected");
		sb.append(">B - Nationally Reviewed</option>");
		sb.append("<option value=\"A\"");
		if (currentValue.equals("A")) sb.append(" selected");
		sb.append(">A - WSN Press and other Nationally Published</option>");
		sb.append("</select>");
		return sb.toString();
	}
/*
	public static String getName(Integer v) {
		if (v.equals(new Integer(1))) {
			return "A - WSN Press and other Nationally Published";
		} else if (v.equals(new Integer(2))) {
			return "B - Nationally Reviewed";
		} else if (v.equals(new Integer(3))) {
			return "C - Staff Submitted";
		} else {
			return "";
		}
	}
*/
	public static String getName(String v) {
		if (v.equals("A")) {
			return "A - WSN Press and other Nationally Published";
		} else if (v.equals("B")) {
			return "B - Nationally Reviewed";
		} else if (v.equals("C")) {
			return "C - Staff Submitted";
		} else {
			return "";
		}
	}

}
