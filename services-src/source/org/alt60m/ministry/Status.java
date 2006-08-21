package org.alt60m.ministry;

import java.util.EnumSet;

public enum Status {
	AC("Active"), 
	IN("Inactive"),  
	FR("Forerunner"),
	KE("Key Contact"), 
	LA("Launched"), 
	PI("Pioneering"), 
	TR("Transformational");

	private String name;

	Status(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}
	
	public static EnumSet<Status> catalyticStatuses()
	{
		return EnumSet.of(FR, KE, LA, PI, TR);
	}
}
