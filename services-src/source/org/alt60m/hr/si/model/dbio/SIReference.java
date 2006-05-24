package org.alt60m.hr.si.model.dbio;

import java.util.*;
import org.alt60m.util.SendMessage;
import org.alt60m.hr.si.servlet.dbio.SIUtil;
import java.text.SimpleDateFormat;
//import com.kenburcham.framework.dbio.DBIOEntity;
//import com.kenburcham.framework.dbio.DBIOEntityException;
import org.alt60m.util.DateUtils;
import com.kenburcham.framework.dbio.DBIOEntity;
/**
 * @persistent 
 * @table si_SIReference
 * @cache-type none
 * @access shared
 * @key-generator IDENTITY
 */
public class SIReference extends DBIOEntity {
	public final static String DEFAULT_FROM_EMAIL = "help@campuscrusadeforchrist.com";
    public static final String APPLICATIONCLASS = "org.alt60m.hr.si.model.dbio.SIApplication";
	public static final String PERSONCLASS = "org.alt60m.hr.si.model.dbio.SIPerson";
	public static final String REFERENCECLASS = "org.alt60m.hr.si.model.dbio.SIReference";
	private static final String TABLENAME_BASE = "hr_si_Reference_";
	
	public SIReference() {
//      createDate = DateUtils.clearTimeFromDate(new Date());
//		formWorkflowStatus = "N";	// status of "new"
    }
	public boolean persist() { return isPKEmpty() ? insert() : update(); }
	public boolean insert() {
		createDate = DateUtils.clearTimeFromDate(new Date());
		formWorkflowStatus = "N";	// status of "new"
		return super.insert();
	}
	public boolean isPKEmpty() {
		return referenceID == 0;
	}
	
	public void changeYear(String yearID) {
		changeTargetTable(TABLENAME_BASE + yearID);
	}
	
	public SIReference(String id) {
		if ( id != null && !id.equals("") ) {
			referenceID= (new Integer(id)).intValue();
			select();
		}
	}
	public SIReference(String id, String yearid) {
		changeYear(yearid);
		referenceID= (new Integer(id)).intValue();
		select();
	}
	public SIReference(int id) {
		referenceID= id;
		select();
	}

	public void localinit() {
		String table = TABLENAME_BASE + SIUtil.CURRENT_SI_YEAR;

		setMetadata("ReferenceIDInt", "referenceID", "IDENTITY");
		setMetadata("FormWorkflowStatus", "formWorkflowStatus", table);
		setMetadata("CreateDate", "createDate", table);
		setMetadata("LastChangedDate", "lastChangedDate", table);
		setMetadata("LastChangedBy", "lastChangedBy", table);
		setMetadata("IsFormSubmitted", "isFormSubmitted", table);
		setMetadata("FormSubmittedDate", "formSubmittedDate", table);
		setMetadata("ReferenceType", "referenceType", table);
		setMetadata("Title", "title", table);
		setMetadata("FirstName", "firstName", table);
		setMetadata("LastName", "lastName", table);
		setMetadata("IsStaff", "isStaff", table);
		setMetadata("StaffNumber", "staffNumber", table);
		setMetadata("CurrentAddress1", "currentAddress1", table);
		setMetadata("CurrentAddress2", "currentAddress2", table);
		setMetadata("CurrentCity", "currentCity", table);
		setMetadata("CurrentState", "currentState", table);
		setMetadata("CurrentZip", "currentZip", table);
		setMetadata("CellPhone", "cellPhone", table);
		setMetadata("HomePhone", "homePhone", table);
		setMetadata("WorkPhone", "workPhone", table);
		setMetadata("CurrentEmail", "currentEmail", table);
		setMetadata("HowKnown", "howKnown", table);
		setMetadata("HowLongKnown", "howLongKnown", table);
		setMetadata("HowWellKnown", "howWellKnown", table);
		setMetadata("HowWellComm", "howWellComm", table);
		setMetadata("_rg1", "_rg1", table);
		setMetadata("_rg2", "_rg2", table);
		setMetadata("_rg3", "_rg3", table);
		setMetadata("_rg4", "_rg4", table);
		setMetadata("_rg5", "_rg5", table);
		setMetadata("_rg1c", "_rg1c", table);
		setMetadata("_rg2c", "_rg2c", table);
		setMetadata("_rg3c", "_rg3c", table);
		setMetadata("_rg4c", "_rg4c", table);
		setMetadata("_rg5c", "_rg5c", table);
		setMetadata("_rg6", "_rg6", table);
		setMetadata("_rg7", "_rg7", table);
		setMetadata("_rg8", "_rg8", table);
		setMetadata("_rg9", "_rg9", table);
		setMetadata("_ro1", "_ro1", table);
		setMetadata("_ro2", "_ro2", table);
		setMetadata("_ro3", "_ro3", table);
		setMetadata("_ro4", "_ro4", table);
		setMetadata("_ro5", "_ro5", table);
		setMetadata("_ro6", "_ro6", table);
		setMetadata("_ro7", "_ro7", table);
		setMetadata("_ro1c", "_ro1c", table);
		setMetadata("_ro2c", "_ro2c", table);
		setMetadata("_ro3c", "_ro3c", table);
		setMetadata("_ro4c", "_ro4c", table);
		setMetadata("_ro5c", "_ro5c", table);
		setMetadata("_ro6c", "_ro6c", table);
		setMetadata("_ro7c", "_ro7c", table);
		setMetadata("_ro8", "_ro8", table);
		setMetadata("_ro9", "_ro9", table);
		setMetadata("_ro10", "_ro10", table);
		setMetadata("_dd1", "_dd1", table);
		setMetadata("_dd2", "_dd2", table);
		setMetadata("_dd3", "_dd3", table);
		setMetadata("_dd4", "_dd4", table);
		setMetadata("_dd1c", "_dd1c", table);
		setMetadata("_dd2c", "_dd2c", table);
		setMetadata("_dd3c", "_dd3c", table);
		setMetadata("_dd4c", "_dd4c", table);
		setMetadata("_dd5", "_dd5", table);
		setMetadata("_dd6", "_dd6", table);
		setMetadata("_if1", "_if1", table);
		setMetadata("_if2", "_if2", table);
		setMetadata("_if3", "_if3", table);
		setMetadata("_if4", "_if4", table);
		setMetadata("_if1c", "_if1c", table);
		setMetadata("_if2c", "_if2c", table);
		setMetadata("_if3c", "_if3c", table);
		setMetadata("_if4c", "_if4c", table);
		setMetadata("_if5", "_if5", table);
		setMetadata("_if6", "_if6", table);
		setMetadata("_ch1", "_ch1", table);
		setMetadata("_ch2", "_ch2", table);
		setMetadata("_ch3", "_ch3", table);
		setMetadata("_ch4", "_ch4", table);
		setMetadata("_ch5", "_ch5", table);
		setMetadata("_ch1c", "_ch1c", table);
		setMetadata("_ch2c", "_ch2c", table);
		setMetadata("_ch3c", "_ch3c", table);
		setMetadata("_ch4c", "_ch4c", table);
		setMetadata("_ch5c", "_ch5c", table);
		setMetadata("_ch6", "_ch6", table);
		setMetadata("_ch7", "_ch7", table);
		setMetadata("_ch8", "_ch8", table);
		setMetadata("_ew1", "_ew1", table);
		setMetadata("_ew2", "_ew2", table);
		setMetadata("_ew3", "_ew3", table);
		setMetadata("_ew4", "_ew4", table);
		setMetadata("_ew5", "_ew5", table);
		setMetadata("_ew1c", "_ew1c", table);
		setMetadata("_ew2c", "_ew2c", table);
		setMetadata("_ew3c", "_ew3c", table);
		setMetadata("_ew4c", "_ew4c", table);
		setMetadata("_ew5c", "_ew5c", table);
		setMetadata("_ew6", "_ew6", table);
		setMetadata("_ew7", "_ew7", table);
		setMetadata("_ew8", "_ew8", table);
		setMetadata("_ew9", "_ew9", table);
		setMetadata("_ew10", "_ew10", table);
		setMetadata("_ms1", "_ms1", table);
		setMetadata("_ms2", "_ms2", table);
		setMetadata("_ms3", "_ms3", table);
		setMetadata("_ms4", "_ms4", table);
		setMetadata("_ms1c", "_ms1c", table);
		setMetadata("_ms2c", "_ms2c", table);
		setMetadata("_ms3c", "_ms3c", table);
		setMetadata("_ms4c", "_ms4c", table);
		setMetadata("_ms5", "_ms5", table);
		setMetadata("_ls1", "_ls1", table);
		setMetadata("_ls2", "_ls2", table);
		setMetadata("_ls3", "_ls3", table);
		setMetadata("_ls4", "_ls4", table);
		setMetadata("_ls5", "_ls5", table);
		setMetadata("_ls1c", "_ls1c", table);
		setMetadata("_ls2c", "_ls2c", table);
		setMetadata("_ls3c", "_ls3c", table);
		setMetadata("_ls4c", "_ls4c", table);
		setMetadata("_ls5c", "_ls5c", table);
		setMetadata("_ls6", "_ls6", table);
		setMetadata("_ls7", "_ls7", table);
		setMetadata("_ls8", "_ls8", table);
		setMetadata("_re1", "_re1", table);
		setMetadata("_re2", "_re2", table);
		setMetadata("_re3", "_re3", table);
		setMetadata("_re4", "_re4", table);
		setMetadata("_re5", "_re5", table);
		setMetadata("Fk_SIApplicationIntID", "fk_SIApplicationID", table);
		
		setAutodetectProperties(false);		
	}


	/**
	 * @primary-key
	 */
	private int referenceID = 0;

	/**
	 * @sql-type varchar
	 * @sql-size 1
	 */
	private String formWorkflowStatus = "";
	// N = new
	// E = invitation email has been sent
	// P = reference form printed
	// I = in progress, reference has begun entering form
	// D = done, reference form has been submitted

	private Date createDate;

	private Date lastChangedDate;

	/**
	 * @sql-type varchar
	 * @sql-size 64
	 */
	private String lastChangedBy = "";

	/**
	 * @sql-type varchar
	 * @sql-size 1
	 */
	private boolean isFormSubmitted;

	private Date formSubmittedDate;

	/**
	 * @sql-type varchar
	 * @sql-size 1
	 */
	private String referenceType = "";

	/**
	 * @sql-type varchar
	 * @sql-size 64
	 */
	private String title = "";

	/**
	 * @sql-type varchar
	 * @sql-size 64
	 */
	private String firstName = "";

	/**
	 * @sql-type varchar
	 * @sql-size 64
	 */
	private String lastName = "";

	/**
	 * @sql-type varchar
	 * @sql-size 1
	 */
	private boolean isStaff;

	/**
	 * @sql-type varchar
	 * @sql-size 
	 */
	private String staffNumber = "";

	/**
	 * @sql-type varchar
	 * @sql-size 64
	 */
	private String currentAddress1 = "";

	/**
	 * @sql-type varchar
	 * @sql-size 64
	 */
	private String currentAddress2 = "";

	/**
	 * @sql-type varchar
	 * @sql-size 16
	 */
	private String currentCity = "";

	/**
	 * @sql-type varchar
	 * @sql-size 2
	 */
	private String currentState = "";

	/**
	 * @sql-type varchar
	 * @sql-size 5
	 */
	private String currentZip = "";

	/**
	 * @sql-type varchar
	 * @sql-size 10
	 */
	private String cellPhone = "";

	/**
	 * @sql-type varchar
	 * @sql-size 10
	 */
	private String homePhone = "";

	/**
	 * @sql-type varchar
	 * @sql-size 10
	 */
	private String workPhone = "";

	/**
	 * @sql-type varchar
	 * @sql-size 32
	 */
	private String currentEmail = "";
	
	/**
	 * @sql-type varchar
	 * @sql-size 64
	 */
	private String howKnown = "";

	/**
	 * @sql-type varchar
	 * @sql-size 64
	 */
	private String howLongKnown = "";

	/**
	 * @sql-type varchar
	 * @sql-size 50
	 */
	private String appType = "";

	/**
	 * @sql-type integer
	 * @sql-size 4
	 */
	private int howWellKnown;

	/**
	 * @sql-type integer
	 * @sql-size 4
	 */
	private int howWellComm;
	
	private int _rg1;
	private int _rg2;
	private int _rg3;
	private int _rg4;
	private int _rg5;
	private String _rg1c = "";
	private String _rg2c = "";
	private String _rg3c = "";
	private String _rg4c = "";
	private String _rg5c = "";
	private String _rg6 = "";
	private boolean _rg7;
	private String _rg8 = "";
	private String _rg9 = "";

	private int _ro1;
	private int _ro2;
	private int _ro3;
	private int _ro4;
	private int _ro5;
	private int _ro6;
	private int _ro7;
	private String _ro1c = "";
	private String _ro2c = "";
	private String _ro3c = "";
	private String _ro4c = "";
	private String _ro5c = "";
	private String _ro6c = "";
	private String _ro7c = "";
	private String _ro8 = "";
	private String _ro9 = "";
	private String _ro10 = "";

	private int _dd1;
	private int _dd2;
	private int _dd3;
	private int _dd4;
	private String _dd1c = "";
	private String _dd2c = "";
	private String _dd3c = "";
	private String _dd4c = "";
	private String _dd5 = "";
	private String _dd6 = "";

	private int _if1;
	private int _if2;
	private int _if3;
	private int _if4;
	private String _if1c = "";
	private String _if2c = "";
	private String _if3c = "";
	private String _if4c = "";
	private String _if5 = "";
	private String _if6 = "";

	private int _ch1;
	private int _ch2;
	private int _ch3;
	private int _ch4;
	private int _ch5;
	private String _ch1c = "";
	private String _ch2c = "";
	private String _ch3c = "";
	private String _ch4c = "";
	private String _ch5c = "";
	private String _ch6 = "";
	private String _ch7 = "";
	private String _ch8 = "";

	private int _ew1;
	private int _ew2;
	private int _ew3;
	private int _ew4;
	private int _ew5;
	private String _ew1c = "";
	private String _ew2c = "";
	private String _ew3c = "";
	private String _ew4c = "";
	private String _ew5c = "";
	private String _ew6 = "";
	private boolean _ew7;
	private String _ew8 = "";
	private boolean _ew9;
	private String _ew10 = "";

	private int _ms1;
	private int _ms2;
	private int _ms3;
	private int _ms4;
	private String _ms1c = "";
	private String _ms2c = "";
	private String _ms3c = "";
	private String _ms4c = "";
	private String _ms5 = "";

	private int _ls1;
	private int _ls2;
	private int _ls3;
	private int _ls4;
	private int _ls5;
	private String _ls1c = "";
	private String _ls2c = "";
	private String _ls3c = "";
	private String _ls4c = "";
	private String _ls5c = "";
	private String _ls6 = "";
	private String _ls7 = "";
	private String _ls8 = "";

	private String _re1 = "";
	private String _re2 = "";
	private String _re3 = "";
	private int _re4;
	private String _re5 = "";

	private int fk_SIApplicationID;
	
	// The following are not in the database, but can be in the object if someone loads them into the object using ref.loadRelated()
	private SIApplication application;
	private String fk_SIPersonID = "";
	private SIPerson person;

	/**
	 * get & set methods
	*/	
	public String getReferenceID() { return String.valueOf(referenceID); }
	public void setReferenceID(String referenceID) { this.referenceID = Integer.parseInt(referenceID); }

	public int getReferenceIDInt() { return referenceID; }
	public void setReferenceIDInt(int referenceID) { this.referenceID = referenceID; }

	public String getFormWorkflowStatus() { return formWorkflowStatus; }
	public void setFormWorkflowStatus(String formWorkflowStatus) {this.formWorkflowStatus = formWorkflowStatus; }

	public Date getCreateDate() { return createDate; }
	public void setCreateDate(Date createDate) {this.createDate = org.alt60m.util.DateUtils.clearTimeFromDate(createDate); }

	public Date getLastChangedDate() { return lastChangedDate; }
	public void setLastChangedDate(Date lastChangedDate) {this.lastChangedDate = org.alt60m.util.DateUtils.clearTimeFromDate(lastChangedDate); }

	public String getLastChangedBy() { return lastChangedBy; }
	public void setLastChangedBy(String lastChangedBy) {this.lastChangedBy = lastChangedBy; }

	public boolean getIsFormSubmitted() { return isFormSubmitted; }
	public void setIsFormSubmitted(boolean isFormSubmitted) {this.isFormSubmitted = isFormSubmitted; }

	public Date getFormSubmittedDate() { return formSubmittedDate; }
	public void setFormSubmittedDate(Date formSubmittedDate) {this.formSubmittedDate = org.alt60m.util.DateUtils.clearTimeFromDate(formSubmittedDate); }

	public String getReferenceType() { return referenceType; }
	public void setReferenceType(String referenceType) {this.referenceType = referenceType; }

	public String getTitle() { return title; }
	public void setTitle(String title) {this.title = title; }

	public String getFirstName() { return firstName; }
	public void setFirstName(String firstName) {this.firstName = firstName; }

	public String getLastName() { return lastName; }
	public void setLastName(String lastName) {this.lastName = lastName; }

	public boolean getIsStaff() { return isStaff; }
	public void setIsStaff(boolean isStaff) {this.isStaff = isStaff; }

	public String getStaffNumber() { return staffNumber; }
	public void setStaffNumber(String staffNumber) {this.staffNumber = staffNumber; }

	public String getCurrentAddress1() { return currentAddress1; }
	public void setCurrentAddress1(String currentAddress1) {this.currentAddress1 = currentAddress1; }

	public String getCurrentAddress2() { return currentAddress2; }
	public void setCurrentAddress2(String currentAddress2) {this.currentAddress2 = currentAddress2; }

	public String getCurrentCity() { return currentCity; }
	public void setCurrentCity(String currentCity) {this.currentCity = currentCity; }

	public String getCurrentState() { return currentState; }
	public void setCurrentState(String currentState) {this.currentState = currentState; }

	public String getCurrentZip() { return currentZip; }
	public void setCurrentZip(String currentZip) {this.currentZip = currentZip; }

	public String getCellPhone() { return cellPhone; }
	public void setCellPhone(String cellPhone) {this.cellPhone = cellPhone; }

	public String getHomePhone() { return homePhone; }
	public void setHomePhone(String homePhone) {this.homePhone = homePhone; }

	public String getWorkPhone() { return workPhone; }
	public void setWorkPhone(String workPhone) {this.workPhone = workPhone; }

	public String getCurrentEmail() { return currentEmail; }
	public void setCurrentEmail(String currentEmail) {this.currentEmail = currentEmail; }

	public String getHowKnown() { return howKnown; }
	public void setHowKnown(String howKnown) {this.howKnown = howKnown; }

	public String getHowLongKnown() { return howLongKnown; }
	public void setHowLongKnown(String howLongKnown) {this.howLongKnown = howLongKnown; }

	public int getHowWellKnown() { return howWellKnown; }
	public void setHowWellKnown(int howWellKnown) {this.howWellKnown = howWellKnown; }

	public int getHowWellComm() { return howWellComm; }
	public void setHowWellComm(int howWellComm) {this.howWellComm = howWellComm; }

	public String getAppType() { return appType; }
	public void setAppType(String appType) {this.appType = appType; }

	public int get_rg1() { return _rg1; }
	public void set_rg1(int _rg1) {this._rg1 = _rg1; }

	public int get_rg2() { return _rg2; }
	public void set_rg2(int _rg2) {this._rg2 = _rg2; }

	public int get_rg3() { return _rg3; }
	public void set_rg3(int _rg3) {this._rg3 = _rg3; }

	public int get_rg4() { return _rg4; }
	public void set_rg4(int _rg4) {this._rg4 = _rg4; }

	public int get_rg5() { return _rg5; }
	public void set_rg5(int _rg5) {this._rg5 = _rg5; }

	public String get_rg1c() { return _rg1c; }
	public void set_rg1c(String _rg1c) {this._rg1c = _rg1c; }

	public String get_rg2c() { return _rg2c; }
	public void set_rg2c(String _rg2c) {this._rg2c = _rg2c; }

	public String get_rg3c() { return _rg3c; }
	public void set_rg3c(String _rg3c) {this._rg3c = _rg3c; }

	public String get_rg4c() { return _rg4c; }
	public void set_rg4c(String _rg4c) {this._rg4c = _rg4c; }

	public String get_rg5c() { return _rg5c; }
	public void set_rg5c(String _rg5c) {this._rg5c = _rg5c; }

	public String get_rg6() { return _rg6; }
	public void set_rg6(String _rg6) {this._rg6 = _rg6; }

	public boolean get_rg7() { return _rg7; }
	public void set_rg7(boolean _rg7) {this._rg7 = _rg7; }

	public String get_rg8() { return _rg8; }
	public void set_rg8(String _rg8) {this._rg8 = _rg8; }

	public String get_rg9() { return _rg9; }
	public void set_rg9(String _rg9) {this._rg9 = _rg9; }

	public int get_ro1() { return _ro1; }
	public void set_ro1(int _ro1) {this._ro1 = _ro1; }

	public int get_ro2() { return _ro2; }
	public void set_ro2(int _ro2) {this._ro2 = _ro2; }

	public int get_ro3() { return _ro3; }
	public void set_ro3(int _ro3) {this._ro3 = _ro3; }

	public int get_ro4() { return _ro4; }
	public void set_ro4(int _ro4) {this._ro4 = _ro4; }

	public int get_ro5() { return _ro5; }
	public void set_ro5(int _ro5) {this._ro5 = _ro5; }

	public int get_ro6() { return _ro6; }
	public void set_ro6(int _ro6) {this._ro6 = _ro6; }

	public int get_ro7() { return _ro7; }
	public void set_ro7(int _ro7) {this._ro7 = _ro7; }

	public String get_ro1c() { return _ro1c; }
	public void set_ro1c(String _ro1c) {this._ro1c = _ro1c; }

	public String get_ro2c() { return _ro2c; }
	public void set_ro2c(String _ro2c) {this._ro2c = _ro2c; }

	public String get_ro3c() { return _ro3c; }
	public void set_ro3c(String _ro3c) {this._ro3c = _ro3c; }

	public String get_ro4c() { return _ro4c; }
	public void set_ro4c(String _ro4c) {this._ro4c = _ro4c; }

	public String get_ro5c() { return _ro5c; }
	public void set_ro5c(String _ro5c) {this._ro5c = _ro5c; }

	public String get_ro6c() { return _ro6c; }
	public void set_ro6c(String _ro6c) {this._ro6c = _ro6c; }

	public String get_ro7c() { return _ro7c; }
	public void set_ro7c(String _ro7c) {this._ro7c = _ro7c; }

	public String get_ro8() { return _ro8; }
	public void set_ro8(String _ro8) {this._ro8 = _ro8; }

	public String get_ro9() { return _ro9; }
	public void set_ro9(String _ro9) {this._ro9 = _ro9; }

	public String get_ro10() { return _ro10; }
	public void set_ro10(String _ro10) {this._ro10 = _ro10; }


	public int get_dd1() { return _dd1; }
	public void set_dd1(int _dd1) {this._dd1 = _dd1; }

	public int get_dd2() { return _dd2; }
	public void set_dd2(int _dd2) {this._dd2 = _dd2; }

	public int get_dd3() { return _dd3; }
	public void set_dd3(int _dd3) {this._dd3 = _dd3; }

	public int get_dd4() { return _dd4; }
	public void set_dd4(int _dd4) {this._dd4 = _dd4; }

	public String get_dd1c() { return _dd1c; }
	public void set_dd1c(String _dd1c) {this._dd1c = _dd1c; }

	public String get_dd2c() { return _dd2c; }
	public void set_dd2c(String _dd2c) {this._dd2c = _dd2c; }

	public String get_dd3c() { return _dd3c; }
	public void set_dd3c(String _dd3c) {this._dd3c = _dd3c; }

	public String get_dd4c() { return _dd4c; }
	public void set_dd4c(String _dd4c) {this._dd4c = _dd4c; }

	public String get_dd5() { return _dd5; }
	public void set_dd5(String _dd5) {this._dd5 = _dd5; }

	public String get_dd6() { return _dd6; }
	public void set_dd6(String _dd6) {this._dd6 = _dd6; }


	public int get_if1() { return _if1; }
	public void set_if1(int _if1) {this._if1 = _if1; }

	public int get_if2() { return _if2; }
	public void set_if2(int _if2) {this._if2 = _if2; }

	public int get_if3() { return _if3; }
	public void set_if3(int _if3) {this._if3 = _if3; }

	public int get_if4() { return _if4; }
	public void set_if4(int _if4) {this._if4 = _if4; }

	public String get_if1c() { return _if1c; }
	public void set_if1c(String _if1c) {this._if1c = _if1c; }

	public String get_if2c() { return _if2c; }
	public void set_if2c(String _if2c) {this._if2c = _if2c; }

	public String get_if3c() { return _if3c; }
	public void set_if3c(String _if3c) {this._if3c = _if3c; }

	public String get_if4c() { return _if4c; }
	public void set_if4c(String _if4c) {this._if4c = _if4c; }

	public String get_if5() { return _if5; }
	public void set_if5(String _if5) {this._if5 = _if5; }

	public String get_if6() { return _if6; }
	public void set_if6(String _if6) {this._if6 = _if6; }


	public int get_ch1() { return _ch1; }
	public void set_ch1(int _ch1) {this._ch1 = _ch1; }

	public int get_ch2() { return _ch2; }
	public void set_ch2(int _ch2) {this._ch2 = _ch2; }

	public int get_ch3() { return _ch3; }
	public void set_ch3(int _ch3) {this._ch3 = _ch3; }

	public int get_ch4() { return _ch4; }
	public void set_ch4(int _ch4) {this._ch4 = _ch4; }

	public int get_ch5() { return _ch5; }
	public void set_ch5(int _ch5) {this._ch5 = _ch5; }

	public String get_ch1c() { return _ch1c; }
	public void set_ch1c(String _ch1c) {this._ch1c = _ch1c; }

	public String get_ch2c() { return _ch2c; }
	public void set_ch2c(String _ch2c) {this._ch2c = _ch2c; }

	public String get_ch3c() { return _ch3c; }
	public void set_ch3c(String _ch3c) {this._ch3c = _ch3c; }

	public String get_ch4c() { return _ch4c; }
	public void set_ch4c(String _ch4c) {this._ch4c = _ch4c; }

	public String get_ch5c() { return _ch5c; }
	public void set_ch5c(String _ch5c) {this._ch5c = _ch5c; }

	public String get_ch6() { return _ch6; }
	public void set_ch6(String _ch6) {this._ch6 = _ch6; }

	public String get_ch7() { return _ch7; }
	public void set_ch7(String _ch7) {this._ch7 = _ch7; }

	public String get_ch8() { return _ch8; }
	public void set_ch8(String _ch8) {this._ch8 = _ch8; }



	public int get_ew1() { return _ew1; }
	public void set_ew1(int _ew1) {this._ew1 = _ew1; }

	public int get_ew2() { return _ew2; }
	public void set_ew2(int _ew2) {this._ew2 = _ew2; }

	public int get_ew3() { return _ew3; }
	public void set_ew3(int _ew3) {this._ew3 = _ew3; }

	public int get_ew4() { return _ew4; }
	public void set_ew4(int _ew4) {this._ew4 = _ew4; }

	public int get_ew5() { return _ew5; }
	public void set_ew5(int _ew5) {this._ew5 = _ew5; }

	public String get_ew1c() { return _ew1c; }
	public void set_ew1c(String _ew1c) {this._ew1c = _ew1c; }

	public String get_ew2c() { return _ew2c; }
	public void set_ew2c(String _ew2c) {this._ew2c = _ew2c; }

	public String get_ew3c() { return _ew3c; }
	public void set_ew3c(String _ew3c) {this._ew3c = _ew3c; }

	public String get_ew4c() { return _ew4c; }
	public void set_ew4c(String _ew4c) {this._ew4c = _ew4c; }

	public String get_ew5c() { return _ew5c; }
	public void set_ew5c(String _ew5c) {this._ew5c = _ew5c; }

	public String get_ew6() { return _ew6; }
	public void set_ew6(String _ew6) {this._ew6 = _ew6; }

	public boolean get_ew7() { return _ew7; }
	public void set_ew7(boolean _ew7) {this._ew7 = _ew7; }

	public String get_ew8() { return _ew8; }
	public void set_ew8(String _ew8) {this._ew8 = _ew8; }

	public boolean get_ew9() { return _ew9; }
	public void set_ew9(boolean _ew9) {this._ew9 = _ew9; }

	public String get_ew10() { return _ew10; }
	public void set_ew10(String _ew10) {this._ew10 = _ew10; }


	public int get_ms1() { return _ms1; }
	public void set_ms1(int _ms1) {this._ms1 = _ms1; }

	public int get_ms2() { return _ms2; }
	public void set_ms2(int _ms2) {this._ms2 = _ms2; }

	public int get_ms3() { return _ms3; }
	public void set_ms3(int _ms3) {this._ms3 = _ms3; }

	public int get_ms4() { return _ms4; }
	public void set_ms4(int _ms4) {this._ms4 = _ms4; }

	public String get_ms1c() { return _ms1c; }
	public void set_ms1c(String _ms1c) {this._ms1c = _ms1c; }

	public String get_ms2c() { return _ms2c; }
	public void set_ms2c(String _ms2c) {this._ms2c = _ms2c; }

	public String get_ms3c() { return _ms3c; }
	public void set_ms3c(String _ms3c) {this._ms3c = _ms3c; }

	public String get_ms4c() { return _ms4c; }
	public void set_ms4c(String _ms4c) {this._ms4c = _ms4c; }

	public String get_ms5() { return _ms5; }
	public void set_ms5(String _ms5) {this._ms5 = _ms5; }



	public int get_ls1() { return _ls1; }
	public void set_ls1(int _ls1) {this._ls1 = _ls1; }

	public int get_ls2() { return _ls2; }
	public void set_ls2(int _ls2) {this._ls2 = _ls2; }

	public int get_ls3() { return _ls3; }
	public void set_ls3(int _ls3) {this._ls3 = _ls3; }

	public int get_ls4() { return _ls4; }
	public void set_ls4(int _ls4) {this._ls4 = _ls4; }

	public int get_ls5() { return _ls5; }
	public void set_ls5(int _ls5) {this._ls5 = _ls5; }

	public String get_ls1c() { return _ls1c; }
	public void set_ls1c(String _ls1c) {this._ls1c = _ls1c; }

	public String get_ls2c() { return _ls2c; }
	public void set_ls2c(String _ls2c) {this._ls2c = _ls2c; }

	public String get_ls3c() { return _ls3c; }
	public void set_ls3c(String _ls3c) {this._ls3c = _ls3c; }

	public String get_ls4c() { return _ls4c; }
	public void set_ls4c(String _ls4c) {this._ls4c = _ls4c; }

	public String get_ls5c() { return _ls5c; }
	public void set_ls5c(String _ls5c) {this._ls5c = _ls5c; }

	public String get_ls6() { return _ls6; }
	public void set_ls6(String _ls6) {this._ls6 = _ls6; }

	public String get_ls7() { return _ls7; }
	public void set_ls7(String _ls7) {this._ls7 = _ls7; }

	public String get_ls8() { return _ls8; }
	public void set_ls8(String _ls8) {this._ls8 = _ls8; }


	public String get_re1() { return _re1; }
	public void set_re1(String _re1) {this._re1 = _re1; }

	public String get_re2() { return _re2; }
	public void set_re2(String _re2) {this._re2 = _re2; }

	public String get_re3() { return _re3; }
	public void set_re3(String _re3) {this._re3 = _re3; }

	public int get_re4() { return _re4; }
	public void set_re4(int _re4) {this._re4 = _re4; }

	public String get_re5() { return _re5; }
	public void set_re5(String _re5) {this._re5 = _re5; }

	public String getFk_SIApplicationID() { return String.valueOf(fk_SIApplicationID); }
	public int getFk_SIApplicationIntID() { return fk_SIApplicationID; }
	public void setFk_SIApplicationID(String fk_SIApplicationID) {this.fk_SIApplicationID = Integer.parseInt(fk_SIApplicationID); }
	public void setFk_SIApplicationIntID(int fk_SIApplicationID) {this.fk_SIApplicationID = fk_SIApplicationID; }
	public SIApplication getSIApplication() { return new SIApplication(fk_SIApplicationID); }
	public void setSIApplication(SIApplication application) {this.setFk_SIApplicationID(application.getApplicationID()); }

	public String getFk_SIPersonID() { return fk_SIPersonID; }
	public void setFk_SIPersonID(String fk_SIPersonID) {this.fk_SIPersonID = fk_SIPersonID; }
	
	public SIPerson getSIPerson() { return person; }
	public void setSIPerson(SIPerson person) {this.person = person; }

	public void loadRelated() {
		//  Loads the non-database properties:
		//	load the application object into self
		//	load the SIPersonID into self
		//	load the person object into self
		try {
			this.application = (SIApplication) SIUtil.getObject(String.valueOf(this.fk_SIApplicationID), "SIApplicationID", APPLICATIONCLASS);			
			if (application != null) {
				this.fk_SIPersonID = application.getFk_PersonIDString();
				this.person = (SIPerson) SIUtil.getObject(String.valueOf(this.fk_SIPersonID), "SIPersonID", PERSONCLASS);
			}
		}
		catch (Exception e) {
		} 
	}

	public String loadWorkflowStatusText() {
		String text = "";
		if (this.formWorkflowStatus.equals("N"))
			text = "New";
		else if (this.formWorkflowStatus.equals("E"))
			text = "Emailed";
		else if (this.formWorkflowStatus.equals("P"))
			text = "Printed";
		else if (this.formWorkflowStatus.equals("I"))
			text = "In progress";
		else if (this.formWorkflowStatus.equals("D"))
			text = "Done";
		return text;
	}

	// ***********************************************************************
	// Other Object Processing Methods


	// encodes the object's referenceId and returns it.
	// used for emailing the referenceId as a hyperlink.
	public String encodeReferenceID() {
		long coefficient = 2125551212L;  // largest integer is: 214 748 3647
		long refID = (long) getReferenceIDInt();
		Long result = new Long (coefficient * refID);
		return result.toString();
	}

	// Given an encoded referenceId, decodes it back to a form that can be used for query on referenceId field
	public String decodeReferenceID(String encRefID) {
		long coefficient = 2125551212L;  // largest integer is: 214 748 3647
		long refID = Long.valueOf(encRefID).longValue();
		Long result = new Long (refID/ coefficient);
		return result.toString();
	}


	// used to submit a reference form for processing.
	// - If can't submit:
	//		the details of the errors are returned in HTML format.
	// - If can submit:
	//		an empty string is returned
	//		the submission fields are updated
	//		the caller must Persist the object!
	public String submitReference() {
		String returnVal = "";
		int ec = 0; // error counter

		if (isFormSubmitted) {
			// form already submitted, submission failed, return error message
			returnVal += "Form has already been submitted.<BR>";
			return returnVal;
		}

		// check to see all required fields are filled in
		// at least 1 phone must be entered (note: this doesn't verify valid format of phone number in any way)
		int phoneCounter = 0;
		if (cellPhone != null  &&  cellPhone.length() != 0) phoneCounter++;
		if (homePhone != null  &&  homePhone.length() != 0) phoneCounter++;
		if (workPhone != null  &&  workPhone.length() != 0) phoneCounter++;
		if (phoneCounter == 0) {
			ec++;
			returnVal += ec + ". You must enter at least one phone number.<BR>";
		}

		// if reference is a staff member, must provide an email address also
		if (isStaff) {
			if (currentEmail == null  ||  currentEmail.length() == 0) {
				ec++;
				returnVal += ec + ". You must enter an Email Address.<BR>";
			}
		}

		// rest of fields do not give specific error message, rather just count the number of missing fields and have 1 error message
		int mc = 0;	// missing counter
		// if (title == null  ||  title.length() == 0) mc++; // skip title 03-22-2004
		if (firstName == null  ||  firstName.length() == 0) mc++;
		if (lastName == null  ||  lastName.length() == 0) mc++;
		if (currentAddress1 == null  ||  currentAddress1.length() == 0) mc++;
		// skip currentAddress2; not required!
		if (currentCity == null  ||  currentCity.length() == 0) mc++;
		if (currentState == null  ||  currentState.length() == 0) mc++;
		if (currentZip == null  ||  currentZip.length() == 0) mc++;
		if (howKnown == null  ||  howKnown.length() == 0) mc++;
		if (howLongKnown == null  ||  howLongKnown.length() == 0) mc++;
/** todo: are any other fields required?
// below are most of the rest of the text fields:
		if (_rg6 == null  ||  _rg6.length() == 0) mc++;
		if (_rg8 == null  ||  _rg8.length() == 0) mc++;
		if (_rg9 == null  ||  _rg9.length() == 0) mc++;
		if (_ro8 == null  ||  _ro8.length() == 0) mc++;
		if (_ro9 == null  ||  _ro9.length() == 0) mc++;
		if (_ro10 == null  ||  _ro10.length() == 0) mc++;
		if (_dd5 == null  ||  _dd5.length() == 0) mc++;
		if (_dd6 == null  ||  _dd6.length() == 0) mc++;
		if (_if5 == null  ||  _if5.length() == 0) mc++;
		if (_if6 == null  ||  _if6.length() == 0) mc++;
		if (_ch6 == null  ||  _ch6.length() == 0) mc++;
		if (_ch7 == null  ||  _ch7.length() == 0) mc++;
		if (_ch8 == null  ||  _ch8.length() == 0) mc++;
		if (_ew6 == null  ||  _ew6.length() == 0) mc++;
		if (_ew8 == null  ||  _ew8.length() == 0) mc++;
		if (_ew10 == null  ||  _ew10.length() == 0) mc++;
		if (_ms5 == null  ||  _ms5.length() == 0) mc++;
		if (_ls6 == null  ||  _ls6.length() == 0) mc++;
		if (_ls7 == null  ||  _ls7.length() == 0) mc++;
		if (_ls8 == null  ||  _ls8.length() == 0) mc++;
		if (_re1 == null  ||  _re1.length() == 0) mc++;
		if (_re2 == null  ||  _re2.length() == 0) mc++;
		if (_re3 == null  ||  _re3.length() == 0) mc++;
		if (_re5 == null  ||  _re5.length() == 0) mc++;
**/

		// any problems?
		if (mc > 0) {
			// submission failed, return error message
			ec++;
			if (mc==1)
				returnVal += ec + ". There is 1 field that has not been entered. It is highlighted in Yellow.<BR>";
			else
				returnVal += ec + ". There are " + mc + " fields that have not been entered. These are highlighted in Yellow.<BR>";
			return returnVal;
		}
		
		// submission allowed!
		// caller must update the object and persist it!
		return returnVal;
	}

	// Send the "Reference Invitation" email to this reference.
	public boolean sendEmailInvite(String serverName, SIPerson person) {
		try {
			String staffsiteLink = "http://staff.campuscrusadeforchrist.com";
			String applicationLink = "http://www.apply4internship.com";
			String referenceLink = "http://" + serverName + "/servlet/SIController?action=postRefFormEncEdit&encRefID=" + this.encodeReferenceID();
			String refFullName = this.getFirstName() + " " + this.getLastName();
			String applicantFullName = person.getFirstName() + " " + person.getLastName();
			String applicantEmailAddress = person.getCurrentEmail();
			String applicantPhone = person.getCurrentHomePhone();
			String applicantCellPhone = person.getCurrentCellPhone();
			String emailContactText = "by email at " + applicantEmailAddress + " or ";
			// check for applicant phone
			if (applicantPhone == null  ||  applicantPhone.trim().equals(""))
				applicantPhone = applicantCellPhone;
			// check for applicant email
			if (applicantEmailAddress == null  ||  applicantEmailAddress.trim().equals("")){
				emailContactText = "";
				applicantEmailAddress = DEFAULT_FROM_EMAIL;
			}

			// send applicant email invitation. New text version... passes iHateSpam
			String text = "Dear " + refFullName + ":\n\n";
			text += applicantFullName + " has just applied for an exciting internship opportunity with Campus Crusade for Christ and has suggested that we contact you as a reference. If you could take some time and fill out a recommendation for this applicant, we can continue with the application process.  The application materials will then be reviewed and a decision will be given as soon as possible.\n\n";
			text += "In case you don't have time to finish the reference form in one sitting, we allow you to save and come back to it whenever it is convenient for you to finish.\n\n";
			text += "The reference form is on our secure web site.  Just use the link below to go directly to the reference form for " + applicantFullName + ".  Your reference will be kept confidential, and the applicant will not be able to read the information you share with us.  The insight that you provide will be very helpful in determining a decision about this applicant's internship!\n\n";
			text += "You may contact the applicant " + emailContactText + "by phone at " + applicantPhone + ".\n\n";
			text += "If you would prefer not to participate, please notify the applicant yourself so that they can take you off of their reference list.  If you would prefer to fill out a paper reference form, please ask the applicant to provide you one.\n\n";
			text += "Please do not forward this email to the applicant, so that they do not receive the link for editing their own reference form.\n\n";
			text += "Thank you very much.\n\n";
			text += "Sincerely,\n";
			text += "Campus Crusade for Christ\n\n\n";

			if (this.isStaff) {
				text += "Login to the staff site at " + staffsiteLink + " and click on the applicant's name ('" + applicantFullName + "') in the list of references on your home page.\n\n";
				text += "If the above link does not work or you cannot get into the staff site, please use the following link to get to the reference form.  ";  
			}
			else {
				text += "Please use the following link.  ";
			}
			text += "The link should be all in one line, so if it is split up into more than one line, " +
					"you may need to copy the entire address (including both/all of the lines) into your web browser's address bar.\n\n";

			text += referenceLink + "\n\n";

			text += "You do not have to fill out the entire form at one time.  After you start filling out the form, you may exit at any time and return later to finish.  Just use the same link to return to finishing the form.\n";
			SendMessage msg = new SendMessage();
			msg.setTo(this.getCurrentEmail());
			msg.setFrom(applicantEmailAddress);
			msg.setSubject("STINT/Internship Reference for " + applicantFullName);
			msg.setBody(text, "text/plain");
			msg.send();

			// send notification email to the applicant
			if (emailContactText.length() != 0){
				text = "Dear " + applicantFullName + ":\n\n";
				text += "This email is to notify you that we have sent an email on your behalf to " + refFullName + " inviting him or her to submit a reference for your participation in a  STINT or Internship.  The email was sent to:" + this.getCurrentEmail() + ".\n\n";
				text += "If the email address is invalid or the message is returned for any reason, you will receive the returned email.  If this happens, 1) please login to your STINT/Internship application, 2) go to the References page, 3) correct the reference's email address, and 4) click the 'Send Email Invitation' button.\n\n";
				text += "To make any changes to your application form or to this reference, please click on this link:\n" + applicationLink + ".\n\n";
				text += "Sincerely,\n";
				text += "Campus Crusade for Christ\n";
				msg.setTo(applicantEmailAddress);
				msg.setFrom(DEFAULT_FROM_EMAIL);
				msg.setSubject("STINT/Internship Reference for " + applicantFullName);
				msg.setBody(text);
				msg.send();
			}

			return true;
		} catch(Exception e) {
			System.err.println("sendEmailRefInvite(): Exception=" + e);
			e.printStackTrace();
			return false;
		}
	}

	// Send the "Reference Complete" email to applicant and others.
	public boolean sendEmailRefComplete() {
		try {
			String refFullName = this.getFirstName() + " " + this.getLastName();
			SIPerson person = this.getSIPerson();
			String applicantFullName = person.getFirstName() + " " + person.getLastName();
			String applicantEmailAddress = person.getCurrentEmail();
			
			String text = "Dear " + applicantFullName + ":\n\n";
			text += "A reference form filled out by " + refFullName + " recommending you for a STINT/Internship has been completed and was submitted on " + (new SimpleDateFormat("MM/dd/yyyy")).format(getFormSubmittedDate()) + ".  You are now one step closer to finding out the decision about your internship application!   When a final decision is reached, we will let you know.  We trust that God will use this time of waiting as you continue to seek His will.\n\n";
			text += "Sincerely,\n";
			text += "Campus Crusade for Christ\n\n\n";
			
			// check for applicant email
			if (applicantEmailAddress == null  ||  applicantEmailAddress.trim().equals("")){
				System.out.println(	"!!!!!!!!!!applicantEmailAddress does not exist, disregard SendMessage to applicant");
				return true;
			}
			else {
				SendMessage msg = new SendMessage();
				msg.setTo(applicantEmailAddress);
				msg.setFrom(DEFAULT_FROM_EMAIL);
				msg.setSubject("STINT/Internship Reference Complete for " + applicantFullName);
				msg.setBody(text);
				msg.send();
				return true;
			}
		} catch(Exception e) {
			System.err.println("sendEmailRefComplete(): send email failed.");
			e.printStackTrace();
			return false;
		}
	}

	// Send the "Reference Reminder" email to this reference.
	public boolean sendEmailReminder(String serverName) {
		try {
			SIPerson person = this.getSIPerson();
			String staffsiteLink = "http://staff.campuscrusadeforchrist.com";
			String applicantFullName = person.getFirstName() + " " + person.getLastName();
			String applicantEmailAddress = person.getCurrentEmail();
			String referenceLink = "http://" + serverName + "/servlet/SIController?action=postRefFormEncEdit&encRefID=" + this.encodeReferenceID();
			String refFullName = this.getFirstName() + " " + this.getLastName();
			// check for applicant email
			if (applicantEmailAddress == null  ||  applicantEmailAddress.trim().equals("")){
				applicantEmailAddress = DEFAULT_FROM_EMAIL;
			}

			String text = "Dear " + refFullName + ":\n\n"+"<BR><BR>";
			text += "Thank you for beginning to fill out the reference form for " + applicantFullName + ".  Your input is very valuable to us!  Before an applicant's materials can be reviewed for a decision about acceptance to an internship with Campus Crusade for Christ, all references must be complete.  Please remember to return to the reference form so that you can finish it in a timely manner.  We greatly appreciate the part that you play in this applicant's spiritual life!\n\n"+"<BR><BR>";
			text += "Sincerely,\n"+"<BR>";
			text += "Campus Crusade for Christ\n\n\n"+"<BR><BR>";

			if (this.isStaff) {
				text += "Login to the staff site at <a href=" + staffsiteLink + ">" + staffsiteLink + "</a>, and click on the applicant's name ('" + applicantFullName + "') in the list of references on your home page.\n\n"+"<BR><BR>";
			}
			else {
				text += "<a href=" + referenceLink + ">Click here to access reference form for " + applicantFullName + "</a>.\n\n"+"<BR><BR>";
			}
			text += "If the above link does not work.  Please use the following link.  The link should be all in one line, so if it is split up into more than one line, you may need to copy and paste the link into a web browser.\n\n"+"<BR><BR>";

			text += "<a href=" + referenceLink + ">" + referenceLink + "</a>\n\n"+"<BR><BR>";

			SendMessage msg = new SendMessage();
			msg.setTo(this.getCurrentEmail());
			msg.setFrom(applicantEmailAddress);
			msg.setSubject("Reminder: Internship Reference for " + applicantFullName);
			msg.setBody(text, "text/html");
			msg.send();
			return true;
		} catch(Exception e) {
			System.err.println("sendEmailReminder(): send email failed.");
			e.printStackTrace();
			return false;
		}
	}

	// Send the "Reference Thank You" email to this reference.
	public boolean sendEmailThankYou() {
		try {
			String refFullName = this.getFirstName() + " " + this.getLastName();
			SIPerson person = this.getSIPerson();
			String applicantFullName = person.getFirstName() + " " + person.getLastName();

			String text = "Dear " + refFullName + ":\n\n";
			text += "Thank you for completing the reference form for " + applicantFullName + "!  You are helping this applicant to make an eternal spiritual investment!  We thank you for giving of your limited time in order to give us insight about this applicant.\n\n";
			text += "Sincerely,\n";
			text += "Campus Crusade for Christ\n\n\n";

			SendMessage msg = new SendMessage();
			msg.setTo(this.getCurrentEmail());
			msg.setFrom(DEFAULT_FROM_EMAIL);
			msg.setSubject("Thank You for Completing an Internship Reference for " + applicantFullName);
			msg.setBody(text);
			msg.send();
			return true;
		} catch(Exception e) {
			System.err.println("sendEmailThankYou(): send email failed.");
			e.printStackTrace();
			return false;
		}
	}

	// for this reference, check to see if all required fields are filled in for the application form
	public String checkAppRequiredFields() {
		String returnVal = "";

		int mc = 0;	// missing counter
		if (title == null  ||  title.length() == 0) mc++;
		if (firstName == null  ||  firstName.length() == 0) mc++;
		if (lastName == null  ||  lastName.length() == 0) mc++;
		if (currentAddress1 == null  ||  currentAddress1.length() == 0) mc++;
		// skip currentAddress2; not required!
		if (currentCity == null  ||  currentCity.length() == 0) mc++;
		if (currentState == null  ||  currentState.length() == 0) mc++;
		if (currentZip == null  ||  currentZip.length() == 0) mc++;

		// any problems?
		if (mc > 0) {
			// submission failed, return error message
			if (mc==1)
				returnVal += "There is 1 field that has not been entered. It is highlighted in Yellow. ";
			else
				returnVal += "There are " + mc + " fields that have not been entered. These are highlighted in Yellow. ";
		}

		// at least 1 phone must be entered (note: this doesn't verify valid format of phone number in any way)
		int phoneCounter = 0;
		if (cellPhone != null  &&  cellPhone.length() != 0) phoneCounter++;
		if (homePhone != null  &&  homePhone.length() != 0) phoneCounter++;
		if (workPhone != null  &&  workPhone.length() != 0) phoneCounter++;
		if (phoneCounter == 0) {
			returnVal += "You must enter at least one phone number.";
		}
		return returnVal;
	}
}
