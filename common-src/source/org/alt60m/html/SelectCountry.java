package org.alt60m.html;

import java.util.Set;
import java.util.SortedMap;
import java.util.Vector;
import org.alt60m.util.Country;

public class SelectCountry implements java.io.Serializable {

//	String[] countrycodes = CountryCodes.countryList;
 	String currentCountry;
    String name;

    public SelectCountry() {
	}

    public void setName(String aName) { name = aName; }

    public void setCurrentValue(String aValue) {
		currentCountry = new String(aValue);
    }

    public String print() {
    	SortedMap<String, String> countries = Country.getAllCountries();
    	Set<String> countryKeys = countries.keySet();
		StringBuffer sb = new StringBuffer();
		sb.append("<select name=\"" + name + "\"><option value=\"\">&nbsp;</option>");
		for (String country : countryKeys) {
			String code = countries.get(country);
			if (code.equals(currentCountry)) {	
				sb.append("<option value=\"" + code + "\" selected>" + country + " (" + code + ")");
			} else {
				sb.append("<option value=\"" + code + "\">" + country + " (" + code + ")");
			}
		}
		sb.append("</select>");
		return sb.toString();
    }

	public String display() {
    	SortedMap<String, String> countries = Country.getAllCountries();
    	Set<String> countryKeys = countries.keySet();
		StringBuffer sb = new StringBuffer();

		for (String country : countryKeys) {
			String code = countries.get(country);
			if (code.equals(currentCountry)) {
				sb.append(country);
			}
		}
		return sb.toString();
    }
}
