package org.alt60m.html;
import org.alt60m.util.CountryCodes;

public class SelectCountry implements java.io.Serializable {

	String[] countrycodes = CountryCodes.countryList;
 	String currentCountry;
    String name;

    public SelectCountry() {
	}

    public void setName(String aName) { name = aName; }

    public void setCurrentValue(String aValue) {
		currentCountry = new String(aValue);
    }

    public String print() {
		StringBuffer sb = new StringBuffer();
		sb.append("<select name=\"" + name + "\"><option value=\"\">&nbsp;</option>");
		for (int i=0; i<countrycodes.length; i=i+2) {
			if (countrycodes[i+1].equals(currentCountry)) {	
				sb.append("<option value=\"" + countrycodes[i+1] + "\" selected>" + countrycodes[i] + " (" + countrycodes[i+1] + ")");
			} else {
				sb.append("<option value=\"" + countrycodes[i+1] + "\">" + countrycodes[i] + " (" + countrycodes[i+1] + ")");
			}
		}
		sb.append("</select>");
		return sb.toString();
    }

	public String display() {
		StringBuffer sb = new StringBuffer();
		int i;

		for (i = 0; i < countrycodes.length; i=i+2) {
			if (countrycodes[i+1].equals(currentCountry)) {
				sb.append(countrycodes[i]);
			}
		}
		return sb.toString();
    }
}
