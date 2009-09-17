package org.alt60m.ministry;

import java.util.EnumSet;

public enum Status {
	AC("Launched"), 
	IN("Inactive"),  
	FR("Pioneering"),
	PI("Pioneering"),
	KE("Key Leader"), 
	LA("Launched"), 
	TR("Multiplying (formerly Transformational)"),
	MU("Multiplying (formerly Transformational)"),
	TN("Transitioned");
	private String name;

	Status(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}
	
	public static EnumSet<Status> catalyticStatuses()
	{
		return EnumSet.of(FR, KE, LA, PI, TR,MU);
	}
}
