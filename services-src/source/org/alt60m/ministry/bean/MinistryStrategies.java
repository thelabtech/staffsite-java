package org.alt60m.ministry.bean;

public class MinistryStrategies
{

	private static final String[] _abbrevStrategy = new String[] {"CA", "SC", "IE", "ID", "II", "WI", "WS", "BR"};
	
	// User-readable string
	private static final String[] _expandStrategy = new String[] {"Catalytic", "Staffed Campus", "ESM-Epic", "ESM-Destino", "ESM-Impact", "WSN ICS", "WSN STInt", "Bridges"};


	public static String expandStrategy(String abbrevStrategy) {
		return translate(_abbrevStrategy, _expandStrategy, abbrevStrategy);
	}

	public static String[] getAllAbbrevStrategies() {
		return _abbrevStrategy;
	}
	public static String[] getAllStrategies() {
		return _expandStrategy;
	}

	private static String translate(String[] from, String[] to, String word)
	{
		for(int i =0; i< from.length;i++)
			if (word.equalsIgnoreCase(from[i]))
				return to[i];
		
		// Nothing matched - return unchanged
		return word;
	}
	
	public static void main(String[] args) 
	{
		System.out.println("All abbrev: " + getAllAbbrevStrategies());
		System.out.println("All full:   " + getAllStrategies());
		System.out.println("Expand CA: " + expandStrategy("CA"));
		System.out.println("Expand ca: " + expandStrategy("ca"));
		System.out.println("Expand WS: " + expandStrategy("WS"));



	}
}
