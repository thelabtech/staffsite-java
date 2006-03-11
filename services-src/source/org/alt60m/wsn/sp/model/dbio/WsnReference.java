package org.alt60m.wsn.sp.model.dbio;

import java.util.*;
import org.alt60m.util.SendMessage;
import java.text.SimpleDateFormat;

import com.kenburcham.framework.dbio.DBIOEntity;
//import com.kenburcham.framework.dbio.DBIOEntityException;

public class WsnReference extends DBIOEntity {
	public final static String DEFAULT_FROM_EMAIL = "help@campuscrusadeforchrist.com";
	
	public WsnReference() {
//		createDate = org.alt60m.util.DateUtils.clearTimeFromDate(new Date());
//		formWorkflowStatus = "N";	// status of "new"
	}
	public boolean persist() { return isPKEmpty() ? insert() : update(); }
	public boolean insert() {
		createDate = org.alt60m.util.DateUtils.clearTimeFromDate(new Date());
		formWorkflowStatus = "N";	// status of "new"
		return super.insert();
	}
	public WsnReference(String id) {
		referenceID = (new Integer(id)).intValue();
		select();
	}
	public WsnReference(int id) {
		referenceID = id;
		select();
	}
	public boolean isPKEmpty() {
		return referenceID == 0;
	}
	public void localinit() {
		String table = "wsn_sp_Reference";
		
		setMetadata("ReferenceID", "referenceID", "IDENTITY");
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
		setMetadata("SendMidEval", "sendMidEval", table);
		setMetadata("_1a", "_1a", table);
		setMetadata("_2a", "_2a", table);
		setMetadata("_3a", "_3a", table);
		setMetadata("_4a", "_4a", table);
		setMetadata("_5a", "_5a", table);
		setMetadata("_6a", "_6a", table);
		setMetadata("_7a", "_7a", table);
		setMetadata("_8a", "_8a", table);
		setMetadata("_9a", "_9a", table);
		setMetadata("_10a", "_10a", table);
		setMetadata("_11a", "_11a", table);
		setMetadata("_12a", "_12a", table);
		setMetadata("_13a", "_13a", table);
		setMetadata("_14a", "_14a", table);
		setMetadata("_15a", "_15a", table);
		setMetadata("_16a", "_16a", table);
		setMetadata("_17a", "_17a", table);
		setMetadata("_18a", "_18a", table);
		setMetadata("_19a", "_19a", table);
		setMetadata("_20a", "_20a", table);
		setMetadata("_21a", "_21a", table);
		setMetadata("_1sa", "_1sa", table);
		setMetadata("_2sa", "_2sa", table);
		setMetadata("_3sa", "_3sa", table);
		setMetadata("_4sa", "_4sa", table);
		setMetadata("_5sa", "_5sa", table);
		setMetadata("_6sa", "_6sa", table);
		setMetadata("_6sb", "_6sb", table);
		setMetadata("_6sc", "_6sc", table);
		setMetadata("_7sa", "_7sa", table);
		setMetadata("_8sa", "_8sa", table);
		setMetadata("ClosingRemarks", "closingRemarks", table);
		setMetadata("WsnApplicationId", "fk_WsnApplicationID", table);
		
		setAutodetectProperties(false);
	}

	private int referenceID;

	private String formWorkflowStatus = "";
	// N = new
	// E = invitation email has been sent
	// P = reference form printed
	// I = in progress, reference has begun entering form
	// D = done, reference form has been submitted

	private Date createDate;
	private Date lastChangedDate;
	private String lastChangedBy = "";
	private boolean isFormSubmitted;
	private Date formSubmittedDate;
	private String referenceType = "";
	private String title = "";
	private String firstName = "";
	private String lastName = "";
	private boolean isStaff;
	private String staffNumber = "";
	private String currentAddress1 = "";
	private String currentAddress2 = "";
	private String currentCity = "";
	private String currentState = "";
	private String currentZip = "";
	private String cellPhone = "";
	private String homePhone = "";
	private String workPhone = "";
	private String currentEmail = "";
	private String howKnown = "";
	private String howLongKnown = "";
	private String howWellKnown = "";
	private String appType = "";
	private boolean sendMidEval;
	private int _1a;
	private int _2a;
	private int _3a;
	private int _4a;
	private int _5a;
	private int _6a;
	private int _7a;
	private int _8a;
	private int _9a;
	private int _10a;
	private int _11a;
	private int _12a;
	private int _13a;
	private int _14a;
	private int _15a;
	private int _16a;
	private int _17a;
	private int _18a;
	private int _19a;
	private int _20a;
	private int _21a;
	private String _1sa = "";
	private String _2sa = "";
	private String _3sa = "";
	private String _4sa = "";
	private String _5sa = "";
	private String _6sa = "";
	private String _6sb = "";
	private String _6sc = "";
	private String _7sa = "";
	private String _8sa = "";
	private String closingRemarks = "";
	private int fk_WsnApplicationID = 0;

	private String fk_WsnApplication = "";

	public int getReferenceID() { return referenceID; }
	public void setReferenceID(int referenceID) { this.referenceID = referenceID; }
	public void setReferenceID(String refID) {
		if(refID != null && !refID.equals("")) {
			referenceID = Integer.parseInt(refID);
		}
	}

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

	public String getAppType() { return appType; }
	public void setAppType(String appType) {this.appType = appType; }

	public String getHowLongKnown() { return howLongKnown; }
	public void setHowLongKnown(String howLongKnown) {this.howLongKnown = howLongKnown; }

	public String getHowWellKnown() { return howWellKnown; }
	public void setHowWellKnown(String howWellKnown) {this.howWellKnown = howWellKnown; }

	public boolean getSendMidEval() { return sendMidEval; }
	public void setSendMidEval(boolean sendMidEval) {this.sendMidEval = sendMidEval; }

	public int get_1a() { return _1a; }
	public void set_1a(int _1a) {this._1a = _1a; }

	public int get_2a() { return _2a; }
	public void set_2a(int _2a) {this._2a = _2a; }

	public int get_3a() { return _3a; }
	public void set_3a(int _3a) {this._3a = _3a; }

	public int get_4a() { return _4a; }
	public void set_4a(int _4a) {this._4a = _4a; }

	public int get_5a() { return _5a; }
	public void set_5a(int _5a) {this._5a = _5a; }

	public int get_6a() { return _6a; }
	public void set_6a(int _6a) {this._6a = _6a; }

	public int get_7a() { return _7a; }
	public void set_7a(int _7a) {this._7a = _7a; }

	public int get_8a() { return _8a; }
	public void set_8a(int _8a) {this._8a = _8a; }

	public int get_9a() { return _9a; }
	public void set_9a(int _9a) {this._9a = _9a; }

	public int get_10a() { return _10a; }
	public void set_10a(int _10a) {this._10a = _10a; }

	public int get_11a() { return _11a; }
	public void set_11a(int _11a) {this._11a = _11a; }

	public int get_12a() { return _12a; }
	public void set_12a(int _12a) {this._12a = _12a; }

	public int get_13a() { return _13a; }
	public void set_13a(int _13a) {this._13a = _13a; }

	public int get_14a() { return _14a; }
	public void set_14a(int _14a) {this._14a = _14a; }

	public int get_15a() { return _15a; }
	public void set_15a(int _15a) {this._15a = _15a; }

	public int get_16a() { return _16a; }
	public void set_16a(int _16a) {this._16a = _16a; }

	public int get_17a() { return _17a; }
	public void set_17a(int _17a) {this._17a = _17a; }

	public int get_18a() { return _18a; }
	public void set_18a(int _18a) {this._18a = _18a; }

	public int get_19a() { return _19a; }
	public void set_19a(int _19a) {this._19a = _19a; }

	public int get_20a() { return _20a; }
	public void set_20a(int _20a) {this._20a = _20a; }

	public int get_21a() { return _21a; }
	public void set_21a(int _21a) {this._21a = _21a; }

	public String get_1sa() { return _1sa; }
	public void set_1sa(String _1sa) {this._1sa = _1sa; }

	public String get_2sa() { return _2sa; }
	public void set_2sa(String _2sa) {this._2sa = _2sa; }

	public String get_3sa() { return _3sa; }
	public void set_3sa(String _3sa) {this._3sa = _3sa; }

	public String get_4sa() { return _4sa; }
	public void set_4sa(String _4sa) {this._4sa = _4sa; }

	public String get_5sa() { return _5sa; }
	public void set_5sa(String _5sa) {this._5sa = _5sa; }

	public String get_6sa() { return _6sa; }
	public void set_6sa(String _6sa) {this._6sa = _6sa; }

	public String get_6sb() { return _6sb; }
	public void set_6sb(String _6sb) {this._6sb = _6sb; }

	public String get_6sc() { return _6sc; }
	public void set_6sc(String _6sc) {this._6sc = _6sc; }

	public String get_7sa() { return _7sa; }
	public void set_7sa(String _7sa) {this._7sa = _7sa; }

	public String get_8sa() { return _8sa; }
	public void set_8sa(String _8sa) {this._8sa = _8sa; }

	public String getClosingRemarks() { return closingRemarks; }
	public void setClosingRemarks(String closingRemarks) {this.closingRemarks = closingRemarks; }

	public String getWsnApplicationId() { return String.valueOf(fk_WsnApplicationID); }
	public void setWsnApplicationId(int WsnApplicationID) {this.fk_WsnApplicationID = WsnApplicationID; }
	public void setWsnApplicationIdStr(String WsnApplicationID) {
		if (WsnApplicationID != null && !WsnApplicationID.equals("")) {
			this.fk_WsnApplicationID = Integer.parseInt(WsnApplicationID); 
		}
	}

	public WsnApplication getWsnApplication() { return new WsnApplication(fk_WsnApplicationID); }
	public void setWsnApplication(WsnApplication WsnApplicationID){ this.fk_WsnApplicationID = WsnApplicationID.getWsnApplicationIdInt(); }


	// ***********************************************************************
	// Other Object Processing Methods


	// encodes the object's referenceId and returns it.
	// used for emailing the referenceId as a hyperlink.
	public String encodeReferenceID() {
		long coefficient = 2125551212L;  // largest integer is: 214 748 3647
		long refID = (long) getReferenceID();
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
		// skip title 2003-01-31
		if (firstName == null  ||  firstName.length() == 0) mc++;
		if (lastName == null  ||  lastName.length() == 0) mc++;
		if (currentAddress1 == null  ||  currentAddress1.length() == 0) mc++;
		// skip currentAddress2; not required!
		if (currentCity == null  ||  currentCity.length() == 0) mc++;
		if (currentState == null  ||  currentState.length() == 0) mc++;
		if (currentZip == null  ||  currentZip.length() == 0) mc++;
		if (howKnown == null  ||  howKnown.length() == 0) mc++;
		if (howLongKnown == null  ||  howLongKnown.length() == 0) mc++;
		if (howWellKnown == null  ||  howWellKnown.length() == 0) mc++;
		if (_1sa == null  ||  _1sa.length() == 0) mc++;
		if (_2sa == null  ||  _2sa.length() == 0) mc++;
		if (_3sa == null  ||  _3sa.length() == 0) mc++;
		if (_4sa == null  ||  _4sa.length() == 0) mc++;
		if (_5sa == null  ||  _5sa.length() == 0) mc++;
		if (_6sa == null  ||  _6sa.length() == 0) mc++;
		if (referenceType != null  &&  (referenceType.equalsIgnoreCase("S1") || referenceType.equalsIgnoreCase("S2"))) {
			// Spiritual leader reference has more required fields than Peer reference
			if (_6sb == null  ||  _6sb.length() == 0) mc++;
			if (_6sc == null  ||  _6sc.length() == 0) mc++;
			if (_7sa == null  ||  _7sa.length() == 0) mc++;
			if (_8sa == null  ||  _8sa.length() == 0) mc++;
		}
		if (closingRemarks == null  ||  closingRemarks.length() == 0) mc++;

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
	public boolean sendEmailInvite(String serverName) {
		try {
			String staffsiteLink = "http://staff.campuscrusadeforchrist.com";
			String applicationLink = "http://www.apply4summerproject.com";
			String refFullName = this.getFirstName() + " " + this.getLastName();
			String referenceLink = "http://" + serverName + "/servlet/MSController?action=refFormEncEdit&encRefID=" + this.encodeReferenceID();

			WsnApplication person = this.getWsnApplication();
			String applicantFullName = person.getLegalFirstName() + " " + person.getLegalLastName();
			String applicantEmailAddress = person.getCurrentEmail();
			String applicantPhone = person.getCurrentPhone();
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

			// send applicant email invitation
			
			// OLD html version...  blocked by iHateSpam
/*			String text = "Dear " + refFullName + ":\n\n"+"<BR><BR>";
			text += applicantFullName + " has just applied for an exciting missions opportunity this summer with Campus Crusade for Christ and has suggested that we contact you as a reference. If you could take some time and fill out a recommendation for this applicant, we can continue with the application process.  The application materials will then be reviewed and a decision will be given as soon as possible.\n\n"+"<BR><BR>";
			text += "In case you don't have time to finish the reference form in one sitting, we allow you to save and come back to it whenever it is convenient for you to finish.\n\n"+"<BR><BR>";
			text += "The reference form is on our secure web site.  Just click on the link below to go directly to the reference form for " + applicantFullName + ".  Your reference will be kept confidential, and the applicant will not be able to read the information you share with us.  The insight that you provide will be very helpful in determining a decision about this applicant's summer!\n\n"+"<BR><BR>";
			text += "You may contact the applicant " + emailContactText + "by phone at " + applicantPhone + ".\n\n"+"<BR><BR>";
			text += "If you would prefer not to participate, please notify the applicant yourself so that they can take you off of their reference list.  If you would prefer to fill out a paper reference form, please ask the applicant to provide you one.\n\n"+"<BR><BR>";
			text += "Please do not forward this email to the applicant, so that they do not receive the link for editing their own reference form.\n\n"+"<BR><BR>";
			text += "Thank you very much.\n\n"+"<BR><BR>";
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

			text += "You do not have to fill out the entire form at one time.  After you start filling out the form, you may exit at any time and return later to finish.  Just click on the same link to return to finishing the form.\n"+"<BR>";
			SendMessage msg = new SendMessage();
			msg.setTo(this.getCurrentEmail());
			msg.setFrom(applicantEmailAddress);
			msg.setSubject("Project Reference for " + applicantFullName);
			msg.setBody(text, "text/html");
			msg.send();
*/
			// New text version... passes iHateSpam
			String text = "Dear " + refFullName + ":\n\n";
			text += applicantFullName + " has just applied for an exciting missions opportunity this summer with Campus Crusade for Christ and has suggested that we contact you as a reference. If you could take some time and fill out a recommendation for this applicant, we can continue with the application process.  The application materials will then be reviewed and a decision will be given as soon as possible.\n\n";
			text += "In case you don't have time to finish the reference form in one sitting, we allow you to save and come back to it whenever it is convenient for you to finish.\n\n";
			text += "The reference form is on our secure web site.  Just use the link below to go directly to the reference form for " + applicantFullName + ".  Your reference will be kept confidential, and the applicant will not be able to read the information you share with us.  The insight that you provide will be very helpful in determining a decision about this applicant's summer!\n\n";
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
			msg.setSubject("Project Reference for " + applicantFullName);
			msg.setBody(text, "text/plain");
			msg.send();

			// send notification email to the applicant
			// check for applicant email
			if (emailContactText.length() != 0){
				text = "Dear " + applicantFullName + ":\n\n";
				text += "This email is to notify you that we have sent an email on your behalf to " + refFullName + " inviting him or her to submit a reference for your participation on Summer Project.  The email was sent to:" + this.getCurrentEmail() + ".\n\n";
				text += "If the email address is invalid or the message is returned for any reason, you will receive the returned email.  If this happens, 1) please login to your Summer Project application, 2) go to the References page, 3) correct the reference's email address, and 4) click the 'Send Email Invitation' button.\n\n";
				text += "To make any changes to your application form or to this reference, please click on this link:\n" + applicationLink + ".\n\n";
				text += "Sincerely,\n";
				text += "Campus Crusade for Christ\n";
				System.out.println("\n\nsendEmailInvite to applicant=" + text + "\n\n");
				msg.setTo(applicantEmailAddress);
				msg.setFrom(DEFAULT_FROM_EMAIL);
				msg.setSubject("Project Reference for " + applicantFullName);
				msg.setBody(text);
				msg.send();
			}

			return true;
		} catch(Exception e) {
			System.err.println("sendEmailRefInvite(): Exception=" + e);
			if (!e.getMessage().equals("No recipient addresses")) {
				e.printStackTrace();
			}
			return false;
		}
	}

	// Send the "Reference Complete" email to applicant and others.
	public boolean sendEmailRefComplete() {
		try {
			String refFullName = this.getFirstName() + " " + this.getLastName();
			WsnApplication person = this.getWsnApplication();
			String applicantFullName = person.getLegalFirstName() + " " + person.getLegalLastName();
			String applicantEmailAddress = person.getCurrentEmail();

			String text = "Dear " + applicantFullName + ":\n\n";
			text += "A reference form filled out by " + refFullName + " recommending you for summer project has been completed and was submitted on " + (new SimpleDateFormat("MM/dd/yyyy")).format(getFormSubmittedDate()) + ".  You are now one step closer to finding out the decision about your summer project application!   When a final decision is reached, we will let you know.  We trust that God will use this time of waiting as you continue to seek His will for your summer.\n\n";
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
				msg.setSubject("Summer Project Reference Complete for " + applicantFullName);
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
			WsnApplication person = this.getWsnApplication();
			String staffsiteLink = "http://staff.campuscrusadeforchrist.com";
			String applicantFullName = person.getLegalFirstName() + " " + person.getLegalLastName();
			String applicantEmailAddress = person.getCurrentEmail();
			String referenceLink = "http://" + serverName + "/servlet/MSController?action=refFormEncEdit&encRefID=" + this.encodeReferenceID();
			String refFullName = this.getFirstName() + " " + this.getLastName();
			// check for applicant email
			if (applicantEmailAddress == null  ||  applicantEmailAddress.trim().equals("")){
				applicantEmailAddress = DEFAULT_FROM_EMAIL;
			}

			String text = "Dear " + refFullName + ":\n\n"+"<BR><BR>";
			text += "Thank you for beginning to fill out the reference form for " + applicantFullName + ".  Your input is very valuable to us!  Before an applicant's materials can be reviewed for a decision about acceptance to a summer missions project with Campus Crusade for Christ, all references must be complete.  Please remember to return to the reference form so that you can finish it in a timely manner.  We greatly appreciate the part that you play in this applicant's spiritual life!\n\n"+"<BR><BR>";
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
			msg.setSubject("Reminder: Project Reference for " + applicantFullName);
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
			WsnApplication person = this.getWsnApplication();
			String applicantFullName = person.getLegalFirstName() + " " + person.getLegalLastName();

			String text = "Dear " + refFullName + ":\n\n";
			text += "Thank you for completing the reference form for " + applicantFullName + "!  You are helping this applicant to make an eternal spiritual investment!  We thank you for giving of your limited time in order to give us insight about this applicant to our summer missions projects.\n\n";
			text += "Sincerely,\n";
			text += "Campus Crusade for Christ\n\n\n";

System.out.println("\n\nsendEmailThankYou=" + text + "\n\n");
			SendMessage msg = new SendMessage();
			msg.setTo(this.getCurrentEmail());
			msg.setFrom(DEFAULT_FROM_EMAIL);
			msg.setSubject("Thank You for Completing a Project Reference for " + applicantFullName);
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

		if (this.isStaff) {
			// 2003-01-31 dc:
			// if staff, then they loaded the information from the staff search table.
			// Just a few things to check:
			if (this.staffNumber == null  ||  this.staffNumber.equals("")) {
				returnVal = "You must select a staff person from the Staff Search window.";
			}
			return returnVal;
		}

		// 2003-01-13: For missing fields, actually list the name of the field.
		int mc = 0;	// missing counter
		// skip title 2003-01-31
		if (firstName == null  ||  firstName.length() == 0) {
			mc++;
			returnVal = returnVal + ", First Name";
		}
		if (lastName == null  ||  lastName.length() == 0) {
			mc++;
			returnVal = returnVal + ", Last Name";
		}
		if (currentAddress1 == null  ||  currentAddress1.length() == 0) {
			mc++;
			returnVal = returnVal + ", Address 1";
		}
		// skip currentAddress2; not required!
		if (currentCity == null  ||  currentCity.length() == 0) {
			mc++;
			returnVal = returnVal + ", City";
		}
		if (currentState == null  ||  currentState.length() == 0) {
			mc++;
			returnVal = returnVal + ", State";
		}
		if (currentZip == null  ||  currentZip.length() == 0) {
			mc++;
			returnVal = returnVal + ", Zip";
		}

		// at least 1 phone must be entered (note: this doesn't verify valid format of phone number in any way)
		int phoneCounter = 0;
		if (cellPhone != null  &&  cellPhone.length() != 0) phoneCounter++;
		if (homePhone != null  &&  homePhone.length() != 0) phoneCounter++;
		if (workPhone != null  &&  workPhone.length() != 0) phoneCounter++;
		if (phoneCounter == 0) {
			mc++;
			returnVal += ". You must enter at least one phone number.";
		}

		// any problems?
		if (mc > 0) {
			// strip leading "," out
			returnVal = returnVal.substring(1, returnVal.length());
			// submission failed, return error message
			if (mc==1)
				returnVal = "There is 1 field that has not been entered: " + returnVal;
			else
				returnVal = "There are " + mc + " fields that have not been entered: " + returnVal;
		}
		return returnVal;
	}
}