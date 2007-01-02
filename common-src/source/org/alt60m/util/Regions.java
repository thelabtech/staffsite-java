package org.alt60m.util;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

/**
 * Approximation.  Some universities are exceptions; 
 * use targetArea table for more authoritative data
 */
public class Regions {

	static Map<String, String> stateRegions = new HashMap<String, String>();
	static {
//		 Regions::= "NE", "MA", "MS", "SE", "GL", "UM", "GP", "RR", "NW", "SW", "NC"
		stateRegions.put("AK", "NW");
		stateRegions.put("AL", "SE");
		stateRegions.put("AR", "RR");
		stateRegions.put("AZ", "SW");
		stateRegions.put("CA", "SW");
		stateRegions.put("CO", "GP");
		stateRegions.put("CT", "NE");
		stateRegions.put("DE", "MA");
		stateRegions.put("FL", "SE");
		stateRegions.put("GA", "SE");
		stateRegions.put("HI", "SW");
		stateRegions.put("IA", "UM");
		stateRegions.put("ID", "NW");
		stateRegions.put("IL", "GL");
		stateRegions.put("IN", "GL");
		stateRegions.put("KS", "GP");
		stateRegions.put("KY", "MS");
		stateRegions.put("LA", "RR");
		stateRegions.put("MA", "NE");
		stateRegions.put("MD", "MA");
		stateRegions.put("ME", "NE");
		stateRegions.put("MI", "GL");
		stateRegions.put("MN", "UM");
		stateRegions.put("MO", "GP");
		stateRegions.put("MS", "SE");
		stateRegions.put("MT", "NW");
		stateRegions.put("NC", "MS");
		stateRegions.put("ND", "UM");
		stateRegions.put("NE", "GP");
		stateRegions.put("NH", "NE");
		stateRegions.put("NJ", "MA");
		stateRegions.put("NM", "GP");
		stateRegions.put("NV", "NW");
		stateRegions.put("NY", "NE");
		stateRegions.put("OH", "GL");
		stateRegions.put("OK", "RR");
		stateRegions.put("OR", "NW");
		stateRegions.put("PA", "MA");
		stateRegions.put("RI", "NE");
		stateRegions.put("SC", "MS");
		stateRegions.put("SD", "UM");
		stateRegions.put("TN", "MS");
		stateRegions.put("TX", "RR");
		stateRegions.put("UT", "NW");
		stateRegions.put("VA", "MA");
		stateRegions.put("VT", "NE");
		stateRegions.put("WA", "NW");
		stateRegions.put("WI", "UM");
		stateRegions.put("WV", "MA");
		stateRegions.put("WY", "GP");
		stateRegions.put("DC", "MA");
	}
	
	public static String getRegion(String universityState) {
		String theRegion = null;
		universityState = universityState.toUpperCase();
		if (stateRegions.containsKey(universityState)) {
			theRegion = stateRegions.get(universityState);
		}
		
		return theRegion;
	}
}
