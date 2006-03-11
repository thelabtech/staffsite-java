package org.alt60m.hr.ms.model.dbio;

import java.util.Date;
import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class MSPayment extends DBIOEntity {
	public boolean isPKEmpty() {
		return paymentID == 0;
	}
	public MSPayment() {
	}
	public MSPayment(String id) {
		paymentID = (new Integer(id)).intValue();
		select();
	}
	public MSPayment(int id) {
		paymentID = id;
		select();
	}
	public void localinit() {
		String table = "hr_ms_Payment";
		
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
		setMetadata("Fk_WsnApplicationID", "fk_WsnApplicationID", table);
		
		setAutodetectProperties(false);
	}
    
    private int fk_WsnApplicationID = 0;

    //added kb 9/24/02
    public void setPaymentFor(String value) { this.paymentFor = value; }

    //added kb 9/24/02    
    public String getPaymentFor() { return paymentFor; }

	public String getPaymentID(){ return (new Integer(paymentID)).toString(); }

	public void setPaymentID(String paymentID){ this.paymentID = (new Integer(paymentID)).intValue(); }

	public int getPaymentIDInt(){ return paymentID; }

	public void setPaymentIDInt(int paymentID){ this.paymentID = paymentID; }

    public Date getPaymentDate(){ return paymentDate; }

    public void setPaymentDate(Date paymentDate){ this.paymentDate = org.alt60m.util.DateUtils.clearTimeFromDate(paymentDate); }

    public float getCredit(){ return credit; }

    public void setCredit(float credit){ this.credit = credit; }

    public float getDebit(){ return debit; }

    public void setDebit(float debit){ this.debit = debit; }

    public String getType(){ return type; }

    public void setType(String type){ this.type = type; }

    public String getAuthCode(){ return authCode; }

    public void setAuthCode(String authCode){ this.authCode = authCode; }

    public String getAccountNo(){ return accountNo; }

    public void setAccountNo(String accountNo){ this.accountNo = accountNo; }

    public String getBusinessUnit(){ return businessUnit; }

    public void setBusinessUnit(String businessUnit){ this.businessUnit = businessUnit; }

    public String getDept(){ return dept; }

    public void setDept(String dept){ this.dept = dept; }

    public String getRegion(){ return region; }

    public void setRegion(String region){ this.region = region; }

    public String getProject(){ return project; }

    public void setProject(String project){ this.project = project; }

    public String getComment(){ return comment; }

    public void setComment(String comment){ this.comment = comment; }

    public boolean getPosted(){ return posted; }

    public void setPosted(boolean posted){ this.posted = posted; }

    public Date getPostedDate(){ return postedDate; }

    public void setPostedDate(Date postedDate){ this.postedDate = org.alt60m.util.DateUtils.clearTimeFromDate(postedDate); }

    public String getFk_WsnApplicationID(){ return String.valueOf(this.fk_WsnApplicationID); }

    public void setFk_WsnApplicationID(int value){ this.fk_WsnApplicationID = value; }
    public void setFk_WsnApplicationIDStr(String value){
    	if (value != null && !value.equals("")) {
    		this.fk_WsnApplicationID = Integer.parseInt(value);
    	}
    }

    private int paymentID;

    private Date paymentDate;
    private float credit;
    private float debit;
	private String type = "";	
    private String authCode;
    private String accountNo;
    private String businessUnit;
    private String dept;
    private String region;
    private String project;
    private String comment = "";
    private boolean posted;
    private Date postedDate;

    private String paymentFor; //added kb 9/24/02
}
