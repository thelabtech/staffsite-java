package org.alt60m.html;


public class SelectAoA implements java.io.Serializable {

    String[] AoAs = {" ", "East Asia Opportunities", "East Asia Orient", "Eastern Europe/Russia", "Francophone Africa", "Latin America", "NAME", "Nigeria and West Africa", "North America and Oceania", "PACT", "South Asia", "SouthEast Asia", "Southern and Eastern Africa", "Western Europe" };
	String currentAoA;
    String name;

    public SelectAoA() {}

    public void setName(String aName) { name = aName; }

    public void setCurrentValue(String aValue) {
		currentAoA = new String(aValue);
    }


    public String print() {
	StringBuffer sb = new StringBuffer();
	int i;

	sb.append("<select name=\"" + name + "\">");

	for (i = 0; i < 15; ++i) {
		if (AoAs[i].equals(currentAoA)) {
			sb.append("<option value=\"" + AoAs[i] + "\" selected>" + AoAs[i] + "</option>");
	    } else {
		sb.append("<option value=\"" + AoAs[i] + "\">" + AoAs[i] + "</option>");
	    }
	}
	sb.append("</select>");
	return sb.toString();
    }
}