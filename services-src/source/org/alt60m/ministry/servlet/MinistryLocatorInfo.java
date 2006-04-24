package org.alt60m.ministry.servlet;

import org.alt60m.ministry.model.dbio.*;

import java.util.*;

public class MinistryLocatorInfo {

    public TargetArea getTargetAreaObject(String id) throws  Exception {
		return new TargetArea(id);
    }
    public Collection getTargetAreasByRegion(String region) throws Exception {
		return getTargetAreas("UPPER(region) LIKE '%"+region.toUpperCase()+"%'");
    }
    public Collection getTargetAreasByState(String state) throws Exception {
		TargetArea ta = new TargetArea();
		return ta.selectList("UPPER(state) LIKE '%"+state.toUpperCase()+"%' ORDER BY name");
    }
	public Collection getTargetAreaNamesByState(String state) throws Exception {
		return getTargetAreas("UPPER(state) LIKE '%"+state.toUpperCase()+"%'");
	}    
	public Vector getAllTargetAreaNamesByState(String state) throws Exception {
		return getAllTargetAreas("UPPER(state) LIKE '%"+state.toUpperCase()+"%'");
	}    
	public Collection getTargetAreasByCountry(String country) throws Exception {
		return getTargetAreas("UPPER(country) LIKE '%"+country.toUpperCase()+"%'");
	}
	public Collection getTargetAreasByStrategy(String strategy, String state) throws Exception {
		TargetArea ta = new TargetArea();
		return ta.selectSQLList("SELECT * FROM  istprod.ministry_Activity INNER JOIN ministry_TargetArea ON ministry_Activity.fk_targetAreaID = ministry_TargetArea.TargetAreaID WHERE (ministry_Activity.strategy = '"+strategy.toUpperCase()+"') AND UPPER(state) LIKE '%"+state.toUpperCase()+"%' ORDER BY name");
	}
	
	public Collection getTargetAreasByStateAndZip(String state, int number) {

		//prints out the rest of the CA area besides San Fransisco Bay and LA / San Diego Area
		if(state.equals("CA") && number == 3){
			return getTargetAreas("UPPER(state)LIKE '%"+state.toUpperCase()+"%' "
				+ " AND (zip <= " + getHigherBoundZipCode(state, number)
				+ " AND zip > " + getLowerBoundZipCode(state, number)
 				+ ") OR (zip <= " + getHigherBoundZipCode(state, number+1)
				+ " AND zip > " + getLowerBoundZipCode(state, number+1)
				+ ")");
		}
		
		//prints out the rest of the New York Area (besides Metro)
		else if(state.equals("NY") && number == 2) {
			return getTargetAreas("UPPER(state)LIKE '%"+state.toUpperCase()+"%' "
					+ " AND zip <= " + getHigherBoundZipCode(state, number)
					+ " AND zip > " + getLowerBoundZipCode(state, number));
		}
	
		//works for all test cases
		else {
			return getTargetAreas("UPPER(state)LIKE '%"+state.toUpperCase()+"%' "
					+ " AND zip <= " + getHigherBoundZipCode(state, number)
					+ " AND zip > " + getLowerBoundZipCode(state, number));
		}
	}
	
	public static String getLowerBoundZipCode(String state, int number) {
		if(state.equals("CA")) {
			if(number == 1) {return "'94000'";}//san fransisco bay area
			if(number == 2) {return "'90000'";}//LA / San Diego Area
			if(number == 3) {return "'93000'";}//other area
			if(number == 4) {return "'95000'";}//other area
		}
		
		if(state.equals("NY")) {
			if(number == 1) {return "'10000'";}//New York City Metro
			if(number == 2) {return "'12700'";}//area for non metro
		}
		
		return null;
	}

	public static String getHigherBoundZipCode(String state, int number) {	
		if(state.equals("CA")) {
			if(number == 1) {return "'94999'";}//san fransisco bay area
			if(number == 2) {return "'92999'";}//LA / San Diego Area
			if(number == 3) {return "'93999'";}//other area
			if(number == 4) {return "'95999'";}//other area
		}
		
		if(state.equals("NY")) {
			if(number == 1) {return "'12699'";}//New York City Metro
			if(number == 2) {return "'14999'";}//area for non metro
		}
		
		return null;
		
	}
	
	public Collection getTargetAreasByZip(String zip) throws Exception {
		return getTargetAreas("UPPER(zip) LIKE '%"+zip.toUpperCase()+"%'");
	}
	public Collection getTargetAreasByCity(String city) throws Exception {
		return getTargetAreas("UPPER(city) LIKE '%"+city.toUpperCase()+"%'");
    }
	public Collection getTargetAreasByName(String name) throws Exception {
    	return getTargetAreas("UPPER(name) LIKE '%"+name.toUpperCase()+"%'");
    }
	private Vector getTargetAreas(String where) {
		TargetArea ta = new TargetArea();
		return ta.selectList(where + " AND isSecure <> 'T' ORDER BY name");
	}
	private Vector getAllTargetAreas(String where) {
		TargetArea ta = new TargetArea();
		return ta.selectList(where + " ORDER BY name");
	}
}
