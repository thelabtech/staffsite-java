package org.alt60m.html;


public class SelectMonth implements java.io.Serializable {

    String[] months = {" ", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12" };
	String[] monthNames = {" ","Jan","Feb","Mar","Apr","May","June","July","Aug","Sept","Oct","Nov","Dec"};
	String currentMonth;
    String name;

    public SelectMonth() {}


    public void setName(String aName) { name = aName; }

    public void setCurrentValue(String aValue) {
		currentMonth = new String(aValue);
    }


    public String print() {
		StringBuffer sb = new StringBuffer();
		int i;

		sb.append("<select name=\"" + name + "\">");

		for (i = 0; i < 12; ++i) {
			if (months[i].equals(currentMonth)) {
				sb.append("<option value=\"" + months[i] + "\" selected>" + monthNames[i] + "</option>");
			} else {
				sb.append("<option value=\"" + months[i] + "\">" + monthNames[i] + "</option>");
			}
		}
		sb.append("</select>");
		return sb.toString();
    }

	public String display() {
		StringBuffer sb = new StringBuffer();
		int i;

		for (i = 0; i < 12; ++i) {
			if (months[i].equals(currentMonth)) {
				sb.append(monthNames[i]);
			}
		}
		return sb.toString();
    }
}
