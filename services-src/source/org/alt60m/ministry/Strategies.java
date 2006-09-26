package org.alt60m.ministry;

import java.util.Arrays;
import java.util.Collection;
import java.util.EnumSet;


public class Strategies {



	/**
	 * @deprecated Use {@link Strategy#strategiesArray()} instead
	 */
	public static String[] strategiesArray() {
		return Strategy.strategiesArray();
	}
	
	/**
	 * @deprecated Use {@link Strategy#campusStrategies()} instead
	 */
	public static EnumSet<Strategy> campusStrategies() {
		return Strategy.campusStrategies();
	}
	
	/**
	 * @deprecated Use {@link Strategy#usCampusStrategies()} instead
	 */
	public static EnumSet<Strategy> usCampusStrategies() {
		return Strategy.usCampusStrategies();
	}

	/**
	 * @deprecated Use {@link Strategy#internationalCampusStrategies()} instead
	 */
	public static EnumSet<Strategy> internationalCampusStrategies() {
		return Strategy.internationalCampusStrategies();
	}
	
	/**
	 * @deprecated Use {@link Strategy#nonCampusStrategies()} instead
	 */
	public static EnumSet<Strategy> nonCampusStrategies() {
		return Strategy.nonCampusStrategies();
	}
	
	/**
	 * @deprecated Use {@link Strategy#microCultures()} instead
	 */
	public static EnumSet<Strategy> microCultures() {
		return Strategy.microCultures();
	}
	
	
	/**
	 * @deprecated Use {@link Strategy#expandStrategy(String)} instead
	 */
	public static String expandStrategy(String abbrev) {
		return Strategy.expandStrategy(abbrev);
	}

}
