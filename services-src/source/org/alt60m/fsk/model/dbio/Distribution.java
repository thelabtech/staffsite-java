/*
 * Created on Apr 16, 2004
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package org.alt60m.fsk.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

/**
 * @author justin.sabelko
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Distribution extends DBIOEntity {

	private int distributionId = 0;
	private String campusName = "";
	private String totalKits = "";
	private int fk_Allocation = 0;
	
	public Distribution() {
		super();
	}
	
	public Distribution( int id ) {
		distributionId = id;
		select();
	}

	/* (non-Javadoc)
	 * @see com.kenburcham.framework.dbio.DBIOEntity#localinit()
	 */
	public void localinit() throws DBIOEntityException {
		String table = "fsk_Distribution";
		
		setMetadata("DistributionId", "distributionID", "IDENTITY");
		setMetadata("CampusName", "campusName", table);
		setMetadata("TotalKits", "totalKits", table);
		setMetadata("Fk_Allocation", "fk_Allocation", table);
		
		setAutodetectProperties(false);
	}

	/* (non-Javadoc)
	 * @see com.kenburcham.framework.dbio.DBIOEntity#isPKEmpty()
	 */
	public boolean isPKEmpty() {
		return ( distributionId == 0 );
	}

	/**
	 * @return
	 */
	public String getCampusName() {
		return campusName;
	}

	/**
	 * @return
	 */
	public int getDistributionId() {
		return distributionId;
	}

	public int getDistributionID() {
		return distributionId;
	}

	/**
	 * @return
	 */
	public int getFk_Allocation() {
		return fk_Allocation;
	}

	/**
	 * @return
	 */
	public String getTotalKits() {
		return totalKits;
	}

	/**
	 * @param string
	 */
	public void setCampusName(String string) {
		campusName = string;
	}

	/**
	 * @param string
	 */
	public void setDistributionId(int string) {
		distributionId = string;
	}

	public void setDistributionID(int string) {
		distributionId = string;
	}

	/**
	 * @param string
	 */
	public void setFk_Allocation(int string) {
		fk_Allocation = string;
	}

	public void setAllocationID(int string) {
		fk_Allocation = string;
	}

	/**
	 * @param string
	 */
	public void setTotalKits(String string) {
		totalKits = string;
	}

	public Allocation getAllocation() {
		return (new Allocation(fk_Allocation));
	}
	
	public void setAllocation(Allocation a) {
		setFk_Allocation(a.getAllocationId());
	}
	
	public void disassocAllocation(Allocation a) {
		setFk_Allocation(0);
	}
}
