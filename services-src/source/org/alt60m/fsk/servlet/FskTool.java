package org.alt60m.fsk.servlet;

//import java.io.*;
//import java.sql.*;
import java.util.*;
//import java.text.*;
//import org.apache.log4j.*;
//import org.alt60m.servlet.*;
import org.alt60m.fsk.model.dbio.*;
import org.alt60m.fsk.bean.*;
import org.alt60m.ministry.model.dbio.Staff;
import org.alt60m.util.ObjectHashUtil;
//import org.alt60m.fsk.*;
//import org.alt60m.fsk.logic.*;
//import org.alt60m.fsk.servlet.*;
//import org.alt60m.ministry.model.*;
//import org.alt60m.ministry.*;
//import org.alt60m.persistence.castor.ObjectMapping;
//import org.alt60m.persistence.castor.ObjectAdaptor;
//import org.alt60m.persistence.castor.ObjectBrokerException;

public class FskTool {
    public Hashtable getStaff(String acctNo) {
		Staff s = new Staff(acctNo);
		Hashtable result = ObjectHashUtil.obj2hash(s);
		
		return result;
    }

	public Collection getRegions() {
		Vector regions = new Vector();
		regions.add("GL");
		regions.add("GP");
		regions.add("MA");
		regions.add("MS");
		regions.add("NE");
		regions.add("NW");
		regions.add("RR");
		regions.add("SE");
		regions.add("SW");
		regions.add("UM");

		return regions;
	}

	public Hashtable generateUberSummary() throws Exception {
		Collection regions = getRegions();
		Collection allocsDist = null;
		Collection allocsOrder = null;
		Hashtable tub = new Hashtable();
		Hashtable regionSummary = new Hashtable();
		Hashtable totals = new Hashtable();
		int rowcount = 0;

		Iterator regionsIter = regions.iterator();
		while(regionsIter.hasNext()) {
			String region = (String)regionsIter.next();
			allocsDist = FskInfo.getRegionalAllocationsDistSum(region);
			allocsOrder = FskInfo.getRegionalAllocationsOrderSum(region);
			regionSummary = generateSummary(allocsDist, allocsOrder);
			regionSummary.put("Region", region);
			tub.put(Integer.toString(rowcount), regionSummary);
			rowcount++;
		}
		allocsDist = FskInfo.getAllAllocationsDistSum();
		allocsOrder = FskInfo.getAllAllocationsOrderSum();
		regionSummary = generateSummary(allocsDist, allocsOrder);
		tub.put("Totals", regionSummary);
		return tub;
	}

	public Hashtable generateNatlSummary() throws Exception {
		Collection allocsDist = null;
		Collection allocsOrder = null;
		Hashtable tub = new Hashtable();

		allocsDist = FskInfo.getNationalAllocationsDistSum();
		allocsOrder = FskInfo.getNationalAllocationsOrderSum();
		tub = generateSummary(allocsDist, allocsOrder);
		return tub;
	}

	public Hashtable generateRegionalSummary(String region) throws Exception {
		Collection allocsDist = null;
		Collection allocsOrder = null;
		Hashtable tub = new Hashtable();

		allocsDist = FskInfo.getRegionalAllocationsDistSum(region);
		allocsOrder = FskInfo.getRegionalAllocationsOrderSum(region);
		tub = generateSummary(allocsDist, allocsOrder);
		return tub;
	}

	public Hashtable generateLocalSummary(String accountno) throws Exception {
		Collection allocsDist = null;
		Collection allocsOrder = null;
		Hashtable tub = new Hashtable();

//			System.out.println("generateLocalSummary");
		allocsDist = FskInfo.listAllocationsByAccountNoDistSum(accountno);
		allocsOrder = FskInfo.listAllocationsByAccountNoOrderSum(accountno);
		tub = generateSummary(allocsDist, allocsOrder);
		return tub;
	}

	public Hashtable generateOrderSummary(int id) throws Exception {
		Collection allocsDist = null;
		Collection allocsOrder = null;
		Hashtable tub = new Hashtable();

//			System.out.println("generateOrderSummary");
		allocsDist = FskInfo.getAllocationsDistSum(id);
		allocsOrder = FskInfo.getAllocationsOrderSum(id);
		tub = generateSummary(allocsDist, allocsOrder);
		return tub;
	}

	public Hashtable listStaffRegion(String region) throws Exception {
		Collection staff = null;
		Hashtable tub = new Hashtable();

		staff = FskInfo.listStaffByRegion(region);
		int i = 0;
		Iterator e = staff.iterator();
		while (e.hasNext()) {
			Hashtable thisStaff = (Hashtable) e.next();
			tub.put(String.valueOf(i), thisStaff);
			i++;
		}
		return tub;
	}

	public Hashtable listStaffLastName(String lastName) throws Exception {
		Collection staff = null;
		Hashtable tub = new Hashtable();

		staff = FskInfo.listStaffByLastName(lastName);
		int i = 0;
		Iterator e = staff.iterator();
		while(e.hasNext()) {
			Hashtable thisStaff = (Hashtable) e.next();
			tub.put(String.valueOf(i), thisStaff);
			i++;
		}
		return tub;
	}

	public Hashtable getHashedAllocation(int id) throws Exception {
		Allocation a = new Allocation(id);
		return (ObjectHashUtil.obj2hash(a));
	}

	public Hashtable getHashedOrder(int id) throws Exception {
		FskOrder f = new FskOrder(id);
		return (ObjectHashUtil.obj2hash(f));
	}

	public Hashtable getHashedDistribution(int id) throws Exception {
		Distribution d = new Distribution(id);
		return (ObjectHashUtil.obj2hash(d));
	}

	public Collection getAllocationsByAcctNo(String acctNo) throws Exception {
		Collection allocations = FskInfo.listAllocationsByAccountNo(acctNo);
		return allocations;
	}

	public Hashtable getAllocationByAcctNoAndRegion(String acctNo, String region) throws Exception {
		Hashtable allocations = null;
		Collection allocs = FskInfo.listAllocationByAcctNoAndRegion(acctNo, region);
		Iterator i = allocs.iterator();
		if (i.hasNext()) {	// Apparently there's only one?
			allocations = (Hashtable) i.next();				
		}
		return allocations;
	}

/*	public Hashtable generateSummary(Collection allocs) throws Exception {
		Hashtable tub = new Hashtable();
		Hashtable totals = new Hashtable();

		int rowcount = 0;
		int colTotNat = 0;
		int colTotRegAlloc = 0;
		int colTotImpAlloc = 0;
		int colTotForeAlloc = 0;
		int colTotRegRaise = 0;
		int colTotLocal = 0;
		int colTotTotAlloc = 0;
		int colTotTotOrder = 0;
		int colTotTotDistribute = 0;
		int colTotTotUnorder = 0;
		int colTotTotUndistribute = 0;

		Iterator e = allocs.iterator();
		while ( e.hasNext() ) {
			Hashtable alloc = (Hashtable) e.next();
			int natlRaised = 0;
			int regAlloc = 0;
			int impAlloc = 0;
			int foreAlloc = 0;
			int regRaised = 0;
			int localRaised = 0;

			try {
				natlRaised = new Integer((String) alloc.get("NatlDonation")).intValue();
			} catch (NumberFormatException nfe1) {}

			try {
				regAlloc = new Integer((String) alloc.get("RegionalAllotment")).intValue();
			} catch (NumberFormatException nfe2) {}

			try {
				impAlloc = new Integer((String) alloc.get("ImpactAllotment")).intValue();
			} catch (NumberFormatException nfe2) {}

			try {
				foreAlloc = new Integer((String) alloc.get("ForerunnerAllotment")).intValue();
			} catch (NumberFormatException nfe2) {}

			try {
				regRaised =  new Integer((String) alloc.get("RegionallyRaised")).intValue();
			} catch (NumberFormatException nfe3) {}

			try {
				localRaised =  new Integer((String) alloc.get("LocallyRaised")).intValue();
			} catch (NumberFormatException nfe4) {}

			int totalAlloc = natlRaised + regAlloc + regRaised + localRaised + impAlloc + foreAlloc;
			int totalOrdered = totalFskOrdersByID(((Integer) alloc.get("AllocationID")).intValue());
			int totalDistributed = totalDistributionsByID(((Integer) alloc.get("AllocationID")).intValue());
			int totalUnordered = totalAlloc - totalOrdered;
			int totalUndistributed = totalAlloc - totalDistributed;	    


			colTotNat = colTotNat + natlRaised;
			colTotRegAlloc = colTotRegAlloc + regAlloc;
			colTotImpAlloc = colTotImpAlloc + impAlloc;
			colTotForeAlloc = colTotForeAlloc + foreAlloc;
			colTotRegRaise = colTotRegRaise + regRaised;
			colTotLocal = colTotLocal + localRaised;
			colTotTotAlloc = colTotTotAlloc + totalAlloc;
			colTotTotOrder = colTotTotOrder + totalOrdered;
			colTotTotDistribute = colTotTotDistribute + totalDistributed;
			colTotTotUnorder = colTotTotUnorder + totalUnordered;
			colTotTotUndistribute = colTotTotUndistribute + totalUndistributed;

			Hashtable t = new Hashtable();
			t.put("NatlDonation", Integer.toString(natlRaised));
			t.put("RegionalAllotment", Integer.toString(regAlloc));
			t.put("ImpactAllotment", Integer.toString(impAlloc));
			t.put("ForerunnerAllotment", Integer.toString(foreAlloc));
			t.put("RegionallyRaised", Integer.toString(regRaised));
			t.put("LocallyRaised", Integer.toString(localRaised));
			t.put("TotalAlloc", Integer.toString(totalAlloc));
			t.put("TotalOrdered", Integer.toString(totalOrdered));
			t.put("TotalDistributed", Integer.toString(totalDistributed));
			t.put("Unordered", Integer.toString(totalUnordered));
			t.put("Undistributed", Integer.toString(totalUndistributed));
			t.put("AllocationID", alloc.get("AllocationId"));
			t.put("AccountNo", alloc.get("AccountNo"));
			t.put("Region", alloc.get("Region"));
			t.put("NatlNotes", alloc.get("NatlNotes"));
			t.put("ImpactNotes", alloc.get("ImpactNotes"));
			t.put("ForerunnerNotes", alloc.get("ForerunnerNotes"));
			t.put("RegNotes", alloc.get("RegNotes"));
			t.put("LocalNotes", alloc.get("LocalNotes"));
			t.put("FirstName", alloc.get("FirstName"));
			t.put("LastName", alloc.get("LastName"));
			tub.put(Integer.toString(rowcount), t);
			rowcount++;
		}

		totals.put("NatlDonation", Integer.toString(colTotNat));
		totals.put("RegionalAllotment", Integer.toString(colTotRegAlloc));
		totals.put("ImpactAllotment", Integer.toString(colTotImpAlloc));
		totals.put("ForerunnerAllotment", Integer.toString(colTotForeAlloc));
		totals.put("RegionallyRaised", Integer.toString(colTotRegRaise));
		totals.put("LocallyRaised", Integer.toString(colTotLocal));
		totals.put("TotalAlloc", Integer.toString(colTotTotAlloc));
		totals.put("TotalOrdered", Integer.toString(colTotTotOrder));
		totals.put("TotalDistributed", Integer.toString(colTotTotDistribute));
		totals.put("Unordered", Integer.toString(colTotTotUnorder));
		totals.put("Undistributed", Integer.toString(colTotTotUndistribute));


		tub.put("Totals", totals);

		return tub;
	}
*/
	public Hashtable generateSummary(Collection allocsDist, Collection allocsOrder) throws Exception {
		if ( allocsDist.size() != allocsOrder.size() ) {
			throw new Exception("Summary Collections Not Same Size!");
		}
		
		Hashtable tub = new Hashtable();
		Hashtable totals = new Hashtable();

		int rowcount = 0;
		int colTotNat = 0;
		int colTotRegAlloc = 0;
		int colTotImpAlloc = 0;
		int colTotForeAlloc = 0;
		int colTotRegRaise = 0;
		int colTotLocal = 0;
		int colTotTotAlloc = 0;
		int colTotTotOrder = 0;
		int colTotTotDistribute = 0;
		int colTotTotUnorder = 0;
		int colTotPastOrderedKits = 0;
		int colTotTotUndistribute = 0;

		Iterator d = allocsDist.iterator();
		Iterator o = allocsOrder.iterator();
		while ( d.hasNext() ) {
			Hashtable allocDist = (Hashtable) d.next();
			Hashtable allocOrder = (Hashtable) o.next();
			
			if ( !((Integer)allocDist.get("AllocationId")).equals((Integer)allocOrder.get("AllocationId")) ) {
				throw new Exception("AllocationIDs are not the same!");
			}
			
			int natlRaised = 0;
			int regAlloc = 0;
			int impAlloc = 0;
			int foreAlloc = 0;
			int regRaised = 0;
			int localRaised = 0;
			int pastOrderedKits = 0;

			try {
				natlRaised = new Integer((String) allocDist.get("NatlDonation")).intValue();
			} catch (NumberFormatException nfe1) {}

			try {
				regAlloc = new Integer((String) allocDist.get("RegionalAllotment")).intValue();
			} catch (NumberFormatException nfe2) {}

			try {
				impAlloc = new Integer((String) allocDist.get("ImpactAllotment")).intValue();
			} catch (NumberFormatException nfe2) {}

			try {
				foreAlloc = new Integer((String) allocDist.get("ForerunnerAllotment")).intValue();
			} catch (NumberFormatException nfe2) {}

			try {
				regRaised =  new Integer((String) allocDist.get("RegionallyRaised")).intValue();
			} catch (NumberFormatException nfe3) {}

			try {
				localRaised =  new Integer((String) allocDist.get("LocallyRaised")).intValue();
			} catch (NumberFormatException nfe4) {}

			try {
				pastOrderedKits =  new Integer((String) allocDist.get("PastOrderedKits")).intValue();
			} catch (NumberFormatException nfe4) {}

			int totalAlloc = natlRaised + regAlloc + regRaised + localRaised + impAlloc + foreAlloc;
			int totalOrdered = ((Integer)allocOrder.get("OrderedKits")).intValue();
			int totalDistributed = ((Integer)allocDist.get("DistributedKits")).intValue();
			int totalUnordered = totalAlloc - (totalOrdered + pastOrderedKits);
			int totalUndistributed = totalAlloc - totalDistributed;	    


			colTotNat = colTotNat + natlRaised;
			colTotRegAlloc = colTotRegAlloc + regAlloc;
			colTotImpAlloc = colTotImpAlloc + impAlloc;
			colTotForeAlloc = colTotForeAlloc + foreAlloc;
			colTotRegRaise = colTotRegRaise + regRaised;
			colTotLocal = colTotLocal + localRaised;
			colTotTotAlloc = colTotTotAlloc + totalAlloc;
			colTotTotOrder = colTotTotOrder + totalOrdered;
			colTotTotDistribute = colTotTotDistribute + totalDistributed;
			colTotTotUnorder = colTotTotUnorder + totalUnordered;
			colTotPastOrderedKits = colTotPastOrderedKits + pastOrderedKits;
			colTotTotUndistribute = colTotTotUndistribute + totalUndistributed;

			Hashtable t = new Hashtable();
			t.put("NatlDonation", Integer.toString(natlRaised));
			t.put("RegionalAllotment", Integer.toString(regAlloc));
			t.put("ImpactAllotment", Integer.toString(impAlloc));
			t.put("ForerunnerAllotment", Integer.toString(foreAlloc));
			t.put("RegionallyRaised", Integer.toString(regRaised));
			t.put("LocallyRaised", Integer.toString(localRaised));
			t.put("TotalAlloc", Integer.toString(totalAlloc));
			t.put("TotalOrdered", Integer.toString(totalOrdered));
			t.put("TotalDistributed", Integer.toString(totalDistributed));
			t.put("Unordered", Integer.toString(totalUnordered));
			t.put("PastOrderedKits", Integer.toString(pastOrderedKits));
			t.put("Undistributed", Integer.toString(totalUndistributed));
			t.put("AllocationID", allocDist.get("AllocationId"));
			t.put("AccountNo", allocDist.get("AccountNo"));
			t.put("Region", allocDist.get("Region"));
			t.put("NatlNotes", allocDist.get("NatlNotes"));
			t.put("ImpactNotes", allocDist.get("ImpactNotes"));
			t.put("ForerunnerNotes", allocDist.get("ForerunnerNotes"));
			t.put("RegNotes", allocDist.get("RegNotes"));
			t.put("LocalNotes", allocDist.get("LocalNotes"));
			t.put("FirstName", allocDist.get("FirstName"));
			t.put("LastName", allocDist.get("LastName"));
			tub.put(Integer.toString(rowcount), t);
			rowcount++;
		}

		totals.put("NatlDonation", Integer.toString(colTotNat));
		totals.put("RegionalAllotment", Integer.toString(colTotRegAlloc));
		totals.put("ImpactAllotment", Integer.toString(colTotImpAlloc));
		totals.put("ForerunnerAllotment", Integer.toString(colTotForeAlloc));
		totals.put("RegionallyRaised", Integer.toString(colTotRegRaise));
		totals.put("LocallyRaised", Integer.toString(colTotLocal));
		totals.put("TotalAlloc", Integer.toString(colTotTotAlloc));
		totals.put("TotalOrdered", Integer.toString(colTotTotOrder));
		totals.put("TotalDistributed", Integer.toString(colTotTotDistribute));
		totals.put("Unordered", Integer.toString(colTotTotUnorder));
		totals.put("PastOrderedKits", Integer.toString(colTotPastOrderedKits));
		totals.put("Undistributed", Integer.toString(colTotTotUndistribute));


		tub.put("Totals", totals);

		return tub;
	}

    private int totalFskOrdersByID(int id) {
		int totalOrdered  = 0;
		Collection orders = FskInfo.getFskOrderList(id);
		Iterator ee = orders.iterator();
		while ( ee.hasNext() ) {
			Hashtable o = (Hashtable) ee.next();
			int kitsOrdered = new Integer((String) o.get("TotalKits")).intValue();
			totalOrdered = totalOrdered + kitsOrdered;
		}
		return totalOrdered;	
    }

    private int totalDistributionsByID(int id) {
		int totalDistributed  = 0;
//			System.out.println("totalDistributionsByID");
		Collection distributions = FskInfo.getDistributionList(id);
		Iterator ee = distributions.iterator();
		while ( ee.hasNext() ) {
			Hashtable d = (Hashtable) ee.next();
			int kitsDistributed = new Integer((String) d.get("TotalKits")).intValue();
			totalDistributed = totalDistributed + kitsDistributed;
		}
		return totalDistributed;	
    }


    public Hashtable ordersHash(int allocationID) {
		Hashtable orderHash = new Hashtable();
		int rowcount = 0;
//			System.out.println("ordersHash");
		Collection orders = FskInfo.getFskOrderList(allocationID);
		Iterator ee = orders.iterator();
		while (ee.hasNext()) {
			Hashtable o = (Hashtable) ee.next();
//			System.out.println(o);
//			System.out.println(Integer.toString(rowcount));
			orderHash.put(Integer.toString(rowcount), o);
			rowcount++;
		}
		return orderHash;	
    }

   public Hashtable distributionsHash(int allocationID) {
		Hashtable distributionHash = new Hashtable();
		int rowcount = 0;
//		System.out.println("distributionsHash");
		Collection distributions = FskInfo.getDistributionList(allocationID);
		Iterator ee = distributions.iterator();
		while (ee.hasNext()) {
			Hashtable d = (Hashtable) ee.next();
//			System.out.println(d);
//			System.out.println(Integer.toString(rowcount));
			distributionHash.put(Integer.toString(rowcount), d);
			rowcount++;
		}
		return distributionHash;	
    }

    public boolean oneAllocation(String acctNo) {
		boolean oneAlloc = false;
		Collection allocs = FskInfo.listAllocationsByAccountNo(acctNo);
		if (allocs.size()<2) {
			oneAlloc = true;
		}
		return oneAlloc;	
    }

    public int getAllocationID(String acctNo) {
		int id = 0;
		Collection allocs = FskInfo.listAllocationsByAccountNo(acctNo);
		Iterator i = allocs.iterator();
		if (i.hasNext()) {	// Apparently there's only one?
			Hashtable alloc = (Hashtable) i.next();
			id = ((Integer) alloc.get("AllocationId")).intValue();
		}
		return id;	
    }

    public void saveAllocation(Hashtable request) {
    	String strId = (String) request.get("AllocationID");
    	int id = 0;
    	if (strId != null) {
    		id = new Integer(strId).intValue();
    	}
		System.out.println("id = " + id);
		Allocation alloc = null;
		if (id != 0)	{
			alloc = new Allocation(id);
		} else {
			alloc = new Allocation();
		}
		System.out.println(request);
		
		ObjectHashUtil.hash2obj(request, alloc);
		
		/*
		alloc.setAccountNo((String)request.get("AccountNo"));
		alloc.setNatlDonation((String)request.get("NatlDonation"));
		alloc.setRegion((String)request.get("Region"));
		alloc.setRegionalAllotment((String)request.get("RegionalAllotment"));
		alloc.setRegionallyRaised((String)request.get("RegionallyRaised"));
		alloc.setLocallyRaised((String)request.get("LocallyRaised"));
		alloc.setNatlNotes((String)request.get("NatlNotes"));
		alloc.setRegNotes((String)request.get("RegNotes"));
		alloc.setLocalNotes((String)request.get("LocalNotes"));
		alloc.setFirstName((String)request.get("firstName"));
		alloc.setLastName((String)request.get("lastName"));
		*/
		
		alloc.persist();
    }

    public Hashtable saveOrder(Hashtable request) throws Exception {
		Hashtable h = new Hashtable();
		String strId = (String) request.get("id");
		int id = 0;
		if ( !strId.equals("") && !strId.equals("null") ) {
			id = new Integer(strId).intValue();
		}
		System.out.println("id = ..." + id + ".....");
		java.util.Date today = new java.util.Date();
		System.out.println("saveOrder");
	    FskOrder order = null;
		if (id != 0)	{
			order = new FskOrder(id);
			order.setDateUpdated(today);
		} else {
			order = new FskOrder();
			order.setDateCreated(today);
			order.setDateUpdated(today);
		}
		System.out.println(request);
		ObjectHashUtil.hash2obj(request, order);
		order.persist();

		MailOrder mail = new MailOrder();
		
		try {
			mail.createConfirmation(order);
			mail.send();
		} catch (Exception e) {
			System.out.println("Couldn't send email");
			throw e;
		}

		h = ObjectHashUtil.obj2hash(order);
		return h;
    }

    public Hashtable saveDistribution(Hashtable request) {
		Hashtable h = new Hashtable();
		String strId = (String) request.get("id");
		int id = 0;
		if (!strId.equals("") && !strId.equals("null")) {
			id = new Integer(strId).intValue();
		}
		System.out.println("id = ..." + id + ".....");
//		java.util.Date today = new java.util.Date();
		System.out.println("saveDistribution");
	    Distribution distribution = null;

		if (id != 0){
			distribution = new Distribution(id);
		} else {
			distribution = new Distribution();
		}
		System.out.println(request);
		ObjectHashUtil.hash2obj(request, distribution);
		distribution.persist();
		h = ObjectHashUtil.obj2hash(distribution);
		return h;
    }

}