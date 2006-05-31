package org.alt60m.wsn.sp.model.dbio;

import java.util.Collection;
import java.util.Vector;
import java.util.Date;
import java.util.Iterator;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class WsnProjectLight extends DBIOEntity {
	public boolean isPKEmpty() {
		return WsnProjectID == 0;
	}
	public void localinit() throws DBIOEntityException {
		String table = "wsn_sp_wsnproject";
		
		setMetadata("WsnProjectIdInt", "WsnProjectID", "IDENTITY");
		setMetadata("Name", "name", table);
		setMetadata("StudentStartDate", "studentStartDate", table);
		setMetadata("StudentEndDate", "studentEndDate", table);
		setMetadata("ProjectType", "projectType", table);
		setMetadata("PartnershipRegion", "partnershipRegion", table);
		setMetadata("PartnershipRegionOnly", "partnershipRegionOnly", table);
		
		setAutodetectProperties(false);
	}

	public WsnProjectLight() {
//		createDate = org.alt60m.util.DateUtils.clearTimeFromDate(new Date());
	}
	public WsnProjectLight(String id) {
		if (id != null && !id.equals("")) {
			WsnProjectID = (new Integer(id)).intValue();
			select();
		}
	}
	public WsnProjectLight(int id) {
		WsnProjectID = id;
		select();
	}
	public boolean persist() { return isPKEmpty() ? insert() : update(); }
	public boolean insert() {
		return super.insert();
	}
	
    private int WsnProjectID = 0;

	private String name = "";
	private String partnershipRegion = "";
	private Date studentStartDate, studentEndDate;
	private String projectType = "";
	private boolean partnershipRegionOnly;
	
	/* end PS 8 FIN additions */
	public String getWsnProjectID() {
		return String.valueOf(WsnProjectID);
	}
	public void setWsnProjectID(String WsnProjectID) {
		if (WsnProjectID != null) {
			this.WsnProjectID = Integer.parseInt(WsnProjectID);
		}
	} 
	public int getWsnProjectIdInt() {
		return WsnProjectID; 
	}
	public void setWsnProjectIdInt(int WsnProjectID) {
		this.WsnProjectID = WsnProjectID; 
	}
	public String getName() {
		return name; 
	}
	public void setName(String name) {
		this.name = name; 
	}

	public String getPartnershipRegion() {
		return partnershipRegion; 
	}
	public void setPartnershipRegion(String partnershipRegion) {
		this.partnershipRegion = partnershipRegion; 
	}
	
	public String getProjectType() {
		return projectType; 
	}
	public void setProjectType(String projectType) {
		this.projectType = projectType; 
	}
	public boolean getPartnershipRegionOnly() { return partnershipRegionOnly; }
	public void setPartnershipRegionOnly(boolean partnershipRegionOnly) { this.partnershipRegionOnly = partnershipRegionOnly; }
	
	public Vector getIsMember() {
		WsnApplication person = new WsnApplication();
		person.setIsMemberId(this.getWsnProjectID());
		return person.selectList(); 
	}
	public void setIsMember(Collection isMember) {
		Iterator iter = isMember.iterator();
		while (iter.hasNext()) {
			WsnApplication person = (WsnApplication)iter.next();
			person.setIsMemberId(this.getWsnProjectID());
			person.persist();
		}
	}

	/* end PS 8 FIN update additions */

	/**
	 * @return Returns the studentEndDate.
	 */
	public Date getStudentEndDate() {
		return studentEndDate;
	}
	/**
	 * @param studentEndDate The studentEndDate to set.
	 */
	public void setStudentEndDate(Date studentEndDate) {
		this.studentEndDate = studentEndDate;
	}
	/**
	 * @return Returns the studentStartDate.
	 */
	public Date getStudentStartDate() {
		return studentStartDate;
	}
	/**
	 * @param studentStartDate The studentStartDate to set.
	 */
	public void setStudentStartDate(Date studentStartDate) {
		this.studentStartDate = studentStartDate;
	}
}
