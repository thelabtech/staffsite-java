package org.alt60m.ministry.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntityException;

public class StaffChangeRequest extends ChangeRequest {

    /**
     *  Constant for a type of change, this is used both for the 'changeType' field
     *  in the Change Request table as well as many places through these objects.
     *  <b>NOTE:</b> A copy of these constants exists in the /CampusHR/formConfirm.jsp
     *  file, because these constants cannot be accessed from a JSP.
     */
    public static final String ADDRESS_CHANGE = "Address Change";
	
    /**
     *  Constant for a type of change, this is used both for the 'changeType' field
     *  in the Change Request table as well as many places through these objects.
     *  <b>NOTE:</b> A copy of these constants exists in the /CampusHR/formConfirm.jsp
     *  file, because these constants cannot be accessed from a JSP.
     */
    public static final String MARITAL_STATUS_CHANGE = "Marital Status Change";
	
    /**
     *  Constant for a type of change, this is used both for the 'changeType' field
     *  in the Change Request table as well as many places through these objects.
     *  <b>NOTE:</b> A copy of these constants exists in the /CampusHR/formConfirm.jsp
     *  file, because these constants cannot be accessed from a JSP.
     */
    public static final String DEPENDENT_CHANGE = "Dependent Change";
	
    /**
     *  Constant for a type of change, this is used both for the 'changeType' field
     *  in the Change Request table as well as many places through these objects.
     *  <b>NOTE:</b> A copy of these constants exists in the /CampusHR/formConfirm.jsp
     *  file, because these constants cannot be accessed from a JSP.
     */
    public static final String JOB_CHANGE = "Job Change Request";
	
    /**
     *  Constant for a type of change, this is used both for the 'changeType' field
     *  in the Change Request table as well as many places through these objects.
     *  <b>NOTE:</b> A copy of these constants exists in the /CampusHR/formConfirm.jsp
     *  file, because these constants cannot be accessed from a JSP.
     */
    public static final String LEAVE_OF_ABSENCE = "Leave of Absence";
	
    /**
     *  Constant for a type of change, this is used both for the 'changeType' field
     *  in the Change Request table as well as many places through these objects.
     *  <b>NOTE:</b> A copy of these constants exists in the /CampusHR/formConfirm.jsp
     *  file, because these constants cannot be accessed from a JSP.
     */
    public static final String RESIGNATION = "Resignation";

    /**
     *  The constant used for an HR regional director.  A compare is done with this 
     *  constant and the value of the 'role' column in the Staff table.
     */
    public static final String HR_REGIONAL_DIR = "HRRD";
	
    /**
     *  The constant used for an HR national director.  A compare is done with this 
     *  constant and the value of the 'role' column in the Staff table.
     */
    public static final String HR_NATIONAL_DIR = "HRND";

    public static final String HR_NON_CAMPUS = "HRNC";

    public String getUpdateStaffId() { return this.fk_updateStaffId; }
    public void setUpdateStaffId(String staffId) { this.fk_updateStaffId = staffId; }
    public Staff getUpdateStaff() { return new Staff(this.fk_updateStaffId); }
    public void setUpdateStaff(Staff staff) { this.fk_updateStaffId = staff.getAccountNo(); }
    public void assocUpdateStaff(Staff staff) { setUpdateStaff(staff); }
    public String getRegion() { return region; }
	public void setRegion(String region) { this.region = region; }
	
	private String fk_updateStaffId;
	private String region = null;
	
	public StaffChangeRequest(String id) {
		setChangeRequestId(id);
		select();
	}	
	public StaffChangeRequest() { }

	public void localinit() throws DBIOEntityException {
		String table = "ministry_ChangeRequest";

		super.localinit();
		setMetadata("UpdateStaffId","updateStaff",table);
		setMetadata("Region","region",table);
		
		setAutodetectProperties(false);
	}     
}
