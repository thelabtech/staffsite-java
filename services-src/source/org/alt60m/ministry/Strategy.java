package org.alt60m.ministry;

import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;

public enum Strategy {
	FS ("Campus Field Ministry"),
	IE ("Epic"),
	ID ("Destino"), 
	II ("Impact"),
	IN ("Nations"),
	WS ("WSN"),
	BR ("Bridges"),
	AA ("Athletes In Action"),
	FC ("Faculty Commons"),
	KC ("Korea CCC"),
	GK ("Greek"),
	VL ("Valor"),
	SV ("Student Venture"),
	EV ("Events"),
	OT ("Other")
	;
	
	
	private String name;

	Strategy(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public static String expandStrategy(String abbrev) {
		try{
		return valueOf(abbrev).getName();
		}
		catch (Exception e){
		return "";	
		}
	}

	public static EnumSet<Strategy> microCultures() {
		return EnumSet.of(GK, VL, SV, OT);
	}

	public static EnumSet<Strategy> nonCampusStrategies() {
		return EnumSet.of(AA);
	
	}

	public static EnumSet<Strategy> internationalCampusStrategies() {
		return EnumSet.of( WS);
	}

	public static EnumSet<Strategy> usCampusStrategies() {
		return EnumSet.of(FS,  IE, ID, II, IN, BR);
	}

	public static EnumSet<Strategy> campusNoSuccessCriteriaStrategies() {
		return EnumSet.of(FC, KC);
	}
	
	public static EnumSet<Strategy> campusStrategies() {
		EnumSet<Strategy> all = EnumSet.noneOf(Strategy.class);
		all.addAll(Strategy.usCampusStrategies());
		all.addAll(Strategy.internationalCampusStrategies());
		
//      These 3 calls are added to cause all ministries to be treated the same way.	This is 
		// a part of the  "Success Criteria" and "Status" changes.
		all.addAll(Strategy.nonCampusStrategies());
		all.addAll(Strategy.campusNoSuccessCriteriaStrategies());
		all.addAll(Strategy.microCultures());		
		return all;
	}

	public static String[] strategiesArray() {
		List<String> strategies = new ArrayList<String>();
		for (Strategy strategy : values()) {
			strategies.add(strategy.toString());
		}
		return strategies.toArray(new String[values().length]);
	}
	
	public static String formatStrategies(ArrayList<String> strategies) {
		String result = "";
		for (int i = 0; i < strategies.size(); i++) {
			result += "'" + strategies.get(i) + "', ";
		}
		return result.substring(0, result.length() - 2);  //Chop off last ", "
	}

	public static ArrayList<String> listStrategiesToCheck(String strategy) {
		ArrayList<String> result = new ArrayList<String>();
		result.add(strategy);
		
		return result;
	}
}