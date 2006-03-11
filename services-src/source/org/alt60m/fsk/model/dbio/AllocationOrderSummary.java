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
public class AllocationOrderSummary extends Allocation {

	private int orderedKits = 0;

	/**
	 * 
	 */
	public AllocationOrderSummary() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param id
	 */
	public AllocationOrderSummary(int id) {
		super(id);
		// TODO Auto-generated constructor stub
	}

	public void localinit() throws DBIOEntityException {
		super.localinit();
		
		String table = "fsk_order_summary";
		changeTargetTable(table);
		
		setMetadata("OrderedKits", "orderedKits", table);
		
		setAutodetectProperties(false);
	}

	/**
	 * @return Returns the orderedKits.
	 */
	public int getOrderedKits() {
		return orderedKits;
	}
	/**
	 * @param orderedKits The orderedKits to set.
	 */
	public void setOrderedKits(int orderedKits) {
		this.orderedKits = orderedKits;
	}
}
