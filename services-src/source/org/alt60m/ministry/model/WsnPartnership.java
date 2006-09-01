/* Generated by Together */

package org.alt60m.ministry.model;
import java.util.*;

/**
 * @persistent 
 * @table ministry_WsnPartnership
 * @key-generator UUID
 * @cache-type none
 * @access shared
 */
public class WsnPartnership {
	/**
	 * @primary-key
	 */
    private String wsnPartnershipID = new String();

    private String status = new String();
    private Date periodBegin;
    private Date periodEnd;
    private String strategy = new String();
    private String name = new String();
    private boolean isApproved;
    private String wsnStatus = new String();
    private String accountingUnit = new String();
    private String annualBudget = new String();
    private String notes = new String();
    private String transUsername = new String();

    public String getStatus() {
	return status; 
	}
	public void setStatus(String status) {
		this.status = status; 
	}
	public Date getPeriodBegin() {
		return periodBegin; 
	}
	public void setPeriodBegin(Date periodBegin) {
	    if (periodBegin != null) {
		Calendar cin = Calendar.getInstance();
		Calendar cout = Calendar.getInstance();
		cin.setTime(periodBegin);
		cout.clear();
		cout.set(cin.get(Calendar.YEAR), cin.get(Calendar.MONTH), cin.get(Calendar.DATE));
		this.periodBegin = cout.getTime();
	    } else {
		this.periodBegin = periodBegin;
	    }	    
	}
	public Date getPeriodEnd() {
		return periodEnd; 
	}
	public void setPeriodEnd(Date periodEnd) {
	    if (periodEnd != null) {
		Calendar cin = Calendar.getInstance();
		Calendar cout = Calendar.getInstance();
		cin.setTime(periodEnd);
		cout.clear();
		cout.set(cin.get(Calendar.YEAR), cin.get(Calendar.MONTH), cin.get(Calendar.DATE));
		this.periodEnd = cout.getTime();
	    } else {
		this.periodEnd = periodEnd;
	    }	    
	}
	public String getStrategy() {
		return strategy; 
	}
	public void setStrategy(String strategy) {
		this.strategy = strategy; 
	}
	public String getName() {
		return name; 
	}
	public void setName(String name) {
		this.name = name; 
	}
	public boolean getIsApproved() {
		return isApproved; 
	}
	public void setIsApproved(boolean isApproved) {
		this.isApproved = isApproved; 
	}
	public String getWsnStatus() {
		return wsnStatus; 
	}
	public void setWsnStatus(String wsnStatus) {
		this.wsnStatus = wsnStatus; 
	}
	public String getAccountingUnit() {
		return accountingUnit; 
	}
	public void setAccountingUnit(String accountingUnit) {
		this.accountingUnit = accountingUnit; 
	}
	public String getAnnualBudget() {
		return annualBudget; 
	}
	public void setAnnualBudget(String annualBudget) {
		this.annualBudget = annualBudget; 
	}
	public String getNotes() {
		return notes; 
	}
	public void setNotes(String notes) {
		this.notes = notes; 
	}
	public String getTransUsername() {
		return transUsername; 
	}
	public void setTransUsername(String transUsername) {
		this.transUsername = transUsername; 
	}

    public String getWsnPartnershipID(){
            return wsnPartnershipID;
        }

    public void setWsnPartnershipID(String wsnPartnershipID){
            this.wsnPartnershipID = wsnPartnershipID;
        }
}
