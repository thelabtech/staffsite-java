

package org.alt60m.ministry;

import java.util.*;


public class States {

    // Static stuff
    // ****************************************
	// User-readable string
	public static final String[] abbrevState = new String[] {
		"AL","AK","AS","AZ","AR","CA","CO","CT","DE","DC","FM","FL","GA","GU","HI","ID","IL","IN","IA","KS"
		,"KY","LA","ME","MH","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","MP"
		,"OH","OK","OR","PW","PA","PR","RI","SC","SD","TN","TX","UT","VT","VI","VA","WA","WV","WI","WY"};
	public static final String[] expandedState = new String[] {
		"Alabama","Alaska","American Samoa","Arizona","Arkansas","California","Colorado","Connecticut",
		"Delaware","District of Columbia","Federated States of Micronesia","Florida","Georgia","Guam","Hawaii",
		"Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Marshall Islands",
		"Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska",
		"Nevada","New Hampshire","New Jersey","New Mexico","New York","North Carolina","North Dakota","Northern Mariana Islands",
		"Ohio","Oklahoma","Oregon","Palau","Pennsylvania","Puerto Rico","Rhode Island","South Carolina",
		"South Dakota","Tennessee","Texas","Utah","Vermont","Virgin Islands","Virginia ","Washington",
		"West Virginia","Wisconsin","Wyoming"};
	

	public static String expandState(String abbrev) {
		return org.alt60m.util.TextUtils.translate(abbrevState, expandedState, abbrev);
	}
	public static Vector<String> partialToCodes(String partial) {
		partial=partial.toLowerCase().replaceAll("[ \t\n\f\r]+", "");
		Vector<String>result=new Vector<String>();
		for(int i=0; i < expandedState.length; i++) {
			if(partial.length()>3&&expandedState[i].toLowerCase().replaceAll("[ \t\n\f\r]+", "").contains(partial)||
					partial.length()<=3&&expandedState[i].toLowerCase().replaceAll("[ \t\n\f\r]+", "").equals(partial)) {
				result.add(abbrevState[i]);
			}
		}
		
		return result;

	}
	public static boolean hasState(String partial) {
		partial=partial.toUpperCase().replaceAll("[ \t\n\f\r]+", "");
		boolean result=false;
		for(int i=0; i < expandedState.length; i++) {
			if(expandedState[i].toUpperCase().replaceAll("[ \t\n\f\r]+", "").contains(partial.toUpperCase())) {
				result=true;
			}
		}
		
		return result;

	}

}
