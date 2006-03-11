/*
 * Created on Sep 15, 2004
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package org.alt60m.fsk.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntityException;

/**
 * @author justin.sabelko
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class AllocationDistSummary extends Allocation {

	private int distributedKits = 0;

	/**
	 * 
	 */
	public AllocationDistSummary() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param id
	 */
	public AllocationDistSummary(int id) {
		super(id);
		// TODO Auto-generated constructor stub
	}
	
	public void localinit() throws DBIOEntityException {
		super.localinit();
		
		String table = "fsk_dist_summary";
		changeTargetTable(table);
		
		setMetadata("DistributedKits", "distributedKits", table);
		
		setAutodetectProperties(false);
	}

	/**
	 * @return Returns the distributedKits.
	 */
	public int getDistributedKits() {
		return distributedKits;
	}
	/**
	 * @param distributedKits The distributedKits to set.
	 */
	public void setDistributedKits(int distributedKits) {
		this.distributedKits = distributedKits;
	}
}
