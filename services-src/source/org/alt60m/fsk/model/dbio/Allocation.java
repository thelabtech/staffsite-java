/*
 * Created on Apr 16, 2004
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package org.alt60m.fsk.model.dbio;

import java.util.*;
import org.alt60m.ministry.model.dbio.Staff;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

/**
 * @author justin.sabelko
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Allocation extends DBIOEntity {

	private int allocationId = 0;
	private String accountNo = "";
	private String pastOrderedKits = "";
	private String natlDonation = "";
	private String region = "";
	private String impactAllotment = "";
	private String forerunnerAllotment = "";
	private String regionalAllotment = "";
	private String regionallyRaised = "";
	private String locallyRaised = "";
	private String natlNotes = "";
	private String impactNotes = "";
	private String forerunnerNotes = "";
	private String regNotes = "";
	private String localNotes = "";
	private String firstName = "";
	private String lastName = "";
	private String localAcctNo1 = "";
	private String localAcctNo2 = "";
	private String localAcctNo3 = "";
	private String localAcctNo4 = "";
	
	public Allocation() {
		super();
	}

	public Allocation(int id) {
		allocationId = id;
		select();
	}
	/* (non-Javadoc)
	 * @see com.kenburcham.framework.dbio.DBIOEntity#localinit()
	 */
	public void localinit() throws DBIOEntityException {
		String table = "fsk_Allocation";
		
		setMetadata("AllocationId", "allocationID", "IDENTITY");
		setMetadata("AccountNo", "accountNo", table);
		setMetadata("PastOrderedKits", "pastOrderedKits", table);
		setMetadata("NatlDonation", "natlDonation", table);
		setMetadata("Region", "region", table);
		setMetadata("RegionalAllotment", "regionalAllotment", table);
		setMetadata("ImpactAllotment", "impactAllotment", table);
		setMetadata("ForerunnerAllotment", "forerunnerAllotment", table);
		setMetadata("RegionallyRaised", "regionallyRaised", table);
		setMetadata("LocallyRaised", "locallyRaised", table);
		setMetadata("NatlNotes", "natlNotes", table);
		setMetadata("ImpactNotes", "impactNotes", table);
		setMetadata("ForerunnerNotes", "forerunnerNotes", table);
		setMetadata("RegNotes", "regNotes", table);
		setMetadata("LocalNotes", "localNotes", table);
		setMetadata("FirstName", "firstName", table);
		setMetadata("LastName", "lastName", table);
		setMetadata("LocalAcctNo1", "localAcctNo1", table);
		setMetadata("LocalAcctNo2", "localAcctNo2", table);
		setMetadata("LocalAcctNo3", "localAcctNo3", table);
		setMetadata("LocalAcctNo4", "localAcctNo4", table);
		
		setAutodetectProperties(false);
	}

	/* (non-Javadoc)
	 * @see com.kenburcham.framework.dbio.DBIOEntity#isPKEmpty()
	 */
	public boolean isPKEmpty() {
		return (allocationId == 0);
	}
	
	public Staff getAllocator() {
		return (new Staff(accountNo));
	}
	
	public void setAllocator(Staff s) {
		setAccountNo(s.getAccountNo());
		setFirstName(s.getPreferredName());
		setLastName(s.getLastName());
	}
	
	public void assocAllocator(Staff s) {
		setAllocator(s);
	}
	
	public void disassocAllocator(Staff s) {
		setAccountNo("");
		setFirstName("");
		setLastName("");
	}

	/**
	 * @return
	 */
	public String getAccountNo() {
		return accountNo;
	}

	/**
	 * @return
	 */
	public int getAllocationId() {
		return allocationId;
	}

	public int getAllocationID() {
		return allocationId;
	}

	/**
	 * @return
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @return
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @return
	 */
	public String getLocallyRaised() {
		return locallyRaised;
	}

	/**
	 * @return
	 */
	public String getLocalNotes() {
		return localNotes;
	}

	/**
	 * @return
	 */
	public String getNatlDonation() {
		return natlDonation;
	}

	/**
	 * @return
	 */
	public String getNatlNotes() {
		return natlNotes;
	}

	/**
	 * @return
	 */
	public String getRegion() {
		return region;
	}

	/**
	 * @return
	 */
	public String getRegionalAllotment() {
		return regionalAllotment;
	}

	/**
	 * @return
	 */
	public String getRegionallyRaised() {
		return regionallyRaised;
	}

	/**
	 * @return
	 */
	public String getRegNotes() {
		return regNotes;
	}

	/**
	 * @param string
	 */
	public void setAccountNo(String string) {
		accountNo = string;
	}

	/**
	 * @param string
	 */
	public void setAllocationId(int string) {
		allocationId = string;
	}

	public void setAllocationID(int string) {
		allocationId = string;
	}

	/**
	 * @param string
	 */
	public void setFirstName(String string) {
		firstName = string;
	}

	/**
	 * @param string
	 */
	public void setLastName(String string) {
		lastName = string;
	}

	/**
	 * @param string
	 */
	public void setLocallyRaised(String string) {
		locallyRaised = string;
	}

	/**
	 * @param string
	 */
	public void setLocalNotes(String string) {
		localNotes = string;
	}

	/**
	 * @param string
	 */
	public void setNatlDonation(String string) {
		natlDonation = string;
	}

	/**
	 * @param string
	 */
	public void setNatlNotes(String string) {
		natlNotes = string;
	}

	/**
	 * @param string
	 */
	public void setRegion(String string) {
		region = string;
	}

	/**
	 * @param string
	 */
	public void setRegionalAllotment(String string) {
		regionalAllotment = string;
	}

	/**
	 * @param string
	 */
	public void setRegionallyRaised(String string) {
		regionallyRaised = string;
	}

	/**
	 * @param string
	 */
	public void setRegNotes(String string) {
		regNotes = string;
	}

	public void assocDistribution(Distribution distribution) {
		distribution.setAllocation(this);
	}
	public void dissocDistribution(Distribution distribution) {
		distribution.setFk_Allocation(0);
	}

	public void assocFskOrder(FskOrder fskOrder) {
		fskOrder.setAllocation(this);
	}
	public void dissocFskOrder(FskOrder fskOrder) {
		fskOrder.setFk_Allocation(0);
	}
  
	public Collection getDistributions(){
		Distribution d = new Distribution();
		return ( d.selectList( "fk_Allocation = '" + allocationId + "'" ));
	}

	public Collection getFskOrders(){
		FskOrder f = new FskOrder();
		return ( f.selectList( "fk_Allocation = '" + allocationId + "'" ));
	}
	/**
	 * @return
	 */
	public String getForerunnerAllotment() {
		return forerunnerAllotment;
	}

	/**
	 * @return
	 */
	public String getForerunnerNotes() {
		return forerunnerNotes;
	}

	/**
	 * @return
	 */
	public String getImpactAllotment() {
		return impactAllotment;
	}

	/**
	 * @return
	 */
	public String getImpactNotes() {
		return impactNotes;
	}

	/**
	 * @param string
	 */
	public void setForerunnerAllotment(String string) {
		forerunnerAllotment = string;
	}

	/**
	 * @param string
	 */
	public void setForerunnerNotes(String string) {
		forerunnerNotes = string;
	}

	/**
	 * @param string
	 */
	public void setImpactAllotment(String string) {
		impactAllotment = string;
	}

	/**
	 * @param string
	 */
	public void setImpactNotes(String string) {
		impactNotes = string;
	}

	/**
	 * @return
	 */
	public String getLocalAcctNo1() {
		return localAcctNo1;
	}

	/**
	 * @return
	 */
	public String getLocalAcctNo2() {
		return localAcctNo2;
	}

	/**
	 * @return
	 */
	public String getLocalAcctNo3() {
		return localAcctNo3;
	}

	/**
	 * @return
	 */
	public String getLocalAcctNo4() {
		return localAcctNo4;
	}

	/**
	 * @param string
	 */
	public void setLocalAcctNo1(String string) {
		localAcctNo1 = string;
	}

	/**
	 * @param string
	 */
	public void setLocalAcctNo2(String string) {
		localAcctNo2 = string;
	}

	/**
	 * @param string
	 */
	public void setLocalAcctNo3(String string) {
		localAcctNo3 = string;
	}

	/**
	 * @param string
	 */
	public void setLocalAcctNo4(String string) {
		localAcctNo4 = string;
	}

	/**
	 * @return Returns the pastOrderedKits.
	 */
	public String getPastOrderedKits() {
		return pastOrderedKits;
	}
	/**
	 * @param pastOrderedKits The pastOrderedKits to set.
	 */
	public void setPastOrderedKits(String pastOrderedKits) {
		this.pastOrderedKits = pastOrderedKits;
	}
}
