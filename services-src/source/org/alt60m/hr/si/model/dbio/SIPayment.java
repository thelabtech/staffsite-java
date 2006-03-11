package org.alt60m.hr.si.model.dbio;

import java.util.Date;
import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class SIPayment extends DBIOEntity {
	public boolean isPKEmpty() {
		return paymentID == 0;
	}
	public SIPayment() {}
	public SIPayment(String id) {
		paymentID = (new Integer(id)).intValue();
		select();
	}
	public SIPayment(int id) {
		paymentID = id;
		select();
	}
	public void localinit() {
		String table = "hr_si_Payment";
		
		setMetadata("PaymentID", "paymentID", "IDENTITY");
		setMetadata("PaymentFor", "paymentFor", table);
		setMetadata("PaymentDate", "paymentDate", table);
		setMetadata("Credit", "credit", table);
		setMetadata("Debit", "debit", table);
		setMetadata("Type", "type", table);
		setMetadata("AuthCode", "authCode", table);
		setMetadata("AccountNo", "accountNo", table);
		setMetadata("BusinessUnit", "businessUnit", table);
		setMetadata("Region", "region", table);
		setMetadata("Project", "project", table);
		setMetadata("Comment", "comment", table);
		setMetadata("Posted", "posted", table);
		setMetadata("PostedDate", "postedDate", table);
		setMetadata("Fk_ApplicationID", "fk_ApplicationID", table);		
		
		setAutodetectProperties(false);		
	}

	private String fk_ApplicationID;
	public void setPaymentFor(String value) {
		this.paymentFor = value;
	}
	public String getPaymentFor() {
		return paymentFor;
	}

	public String getPaymentID() {
		return Integer.toString(paymentID);
	}

	public void setPaymentID(String paymentID) {
		this.paymentID = Integer.parseInt(paymentID);
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = org.alt60m.util.DateUtils.clearTimeFromDate(paymentDate);
	}

	public float getCredit() {
		return credit;
	}

	public void setCredit(float credit) {
		this.credit = credit;
	}

	public float getDebit() {
		return debit;
	}

	public void setDebit(float debit) {
		this.debit = debit;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAuthCode() {
		return authCode;
	}

	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getBusinessUnit() {
		return businessUnit;
	}

	public void setBusinessUnit(String businessUnit) {
		this.businessUnit = businessUnit;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public boolean getPosted() {
		return posted;
	}

	public void setPosted(boolean posted) {
		this.posted = posted;
	}

	public Date getPostedDate() {
		return postedDate;
	}

	public void setPostedDate(Date postedDate) {
		this.postedDate = org.alt60m.util.DateUtils.clearTimeFromDate(postedDate);
	}

	/**
	 * @primary-key
	 */
	private int paymentID = 0;
	private Date paymentDate;
	private float credit;
	private float debit;

	/**
	 * @sql-type varchar
	 * @sql-size 80
	 */
	private String type = "";

	/**
	 * @sql-type varchar
	 * @sql-size 80
	 */
	private String authCode;

	/**
	 * @sql-type varchar
	 * @sql-size 80
	 */
	private String accountNo;
	private String businessUnit;
	private String dept;
	private String region;
	private String project;

	/**
	 * @sql-type varchar
	 * @sql-size 255
	 */
	private String comment = "";

	/**
	 * @sql-type char
	 * @sql-size 1
	 */
	private boolean posted;
	private Date postedDate;

	private String paymentFor; //added kb 9/24/02

	/**
	 * Returns the fk_ApplicationID.
	 * @return String
	 */
	public String getFk_ApplicationID() {
		return fk_ApplicationID;
	}

	/**
	 * Sets the fk_ApplicationID.
	 * @param fk_ApplicationID The fk_ApplicationID to set
	 */
	public void setFk_ApplicationID(String fk_ApplicationID) {
		this.fk_ApplicationID = fk_ApplicationID;
	}

}
