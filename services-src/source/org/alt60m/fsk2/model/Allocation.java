package org.alt60m.fsk2.model;

public class Allocation extends Persistent {

	public Allocation()
	{
		super(Allocation.class);
	}
	
	public Allocation(int id)
	{
		super(Allocation.class);
		setId(id);
	}
	
	private String region;

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}
	
}
