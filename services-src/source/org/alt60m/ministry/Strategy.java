package org.alt60m.ministry;

import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;

public enum Strategy {
	CA ("Catalytic"), 
	SC ("Staffed Campus"),
	IE ("Epic"),
	ID ("Destino"), 
	II ("Impact"),
	IN ("Nations"),
	WI ("WSN ICS"),
	WS ("WSN Stint"),
	BR ("Bridges"),
	MM ("Military Ministry"),
	AA ("Athletes In Action"),
	GR ("Grad Resources"),
	CL ("Christian Leadership Ministries"),
	KC ("Korean CCC"),
	GK ("Greek"),
	VL ("Valor"),
	OT ("Other");
	
	private String name;

	Strategy(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public static String expandStrategy(String abbrev) {
		return valueOf(abbrev).getName();
	}

	public static EnumSet<Strategy> microCultures() {
		return EnumSet.of(GK, VL, OT);
	}

	public static EnumSet<Strategy> nonCampusStrategies() {
		return EnumSet.of(MM, AA);
	}

	public static EnumSet<Strategy> internationalCampusStrategies() {
		return EnumSet.of(WI, WS);
	}

	public static EnumSet<Strategy> usCampusStrategies() {
		return EnumSet.of(CA, SC, IE, ID, II, IN, BR);
	}

	public static EnumSet<Strategy> campusNoSuccessCriteriaStrategies() {
		return EnumSet.of(GR, CL, KC);
	}
	
	public static EnumSet<Strategy> campusStrategies() {
		EnumSet<Strategy> all = EnumSet.noneOf(Strategy.class);
		all.addAll(Strategy.usCampusStrategies());
		all.addAll(Strategy.internationalCampusStrategies());
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
		if("CA".equals(strategy)) {
			result.add("SC");
		} else if ("SC".equals(strategy)) {
			result.add("CA");
		}
		return result;
	}
}