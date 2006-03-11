/* Generated by Together */

package org.alt60m.ministry.model;
import java.util.*;

/**
 * @persistent 
 * @table ministry_RegionalStat
 * @key-generator UUID
 * @cache-type none
 * @access shared
 */
public class RegionalStat {
	/**
	 * @primary-key
	 */
    private String regionalStatID = new String();
    private Date periodBegin;
    private Date periodEnd;
    private long nsSc;
    private long nsWsn;
    private long nsCat;
    private long nsIcrD;
    private long nsIcrI;
    private long nsIcrE;
    private long niSc;
    private long niWsn;
    private long niCat;
    private long niIcrD;
    private long niIcrI;
    private long niIcrE;

    /**
    * @sql-name fk_regionalTeamID
    */
    private RegionalTeam regionalTeam;

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
	public long getNsSc() {
		return nsSc; 
	}
	public void setNsSc(long nsSc) {
		this.nsSc = nsSc; 
	}
	public long getNsWsn() {
		return nsWsn; 
	}
	public void setNsWsn(long nsWsn) {
		this.nsWsn = nsWsn; 
	}
	public long getNsCat() {
		return nsCat; 
	}
	public void setNsCat(long nsCat) {
		this.nsCat = nsCat; 
	}
	public long getNsIcrD() {
		return nsIcrD; 
	}
	public void setNsIcrD(long nsIcrD) {
		this.nsIcrD = nsIcrD; 
	}
	public long getNsIcrI() {
		return nsIcrI; 
	}
	public void setNsIcrI(long nsIcrI) {
		this.nsIcrI = nsIcrI; 
	}
	public long getNsIcrE() {
		return nsIcrE; 
	}
	public void setNsIcrE(long nsIcrE) {
		this.nsIcrE = nsIcrE; 
	}
	public long getNiSc() {
		return niSc; 
	}
	public void setNiSc(long niSc) {
		this.niSc = niSc; 
	}
	public long getNiWsn() {
		return niWsn; 
	}
	public void setNiWsn(long niWsn) {
		this.niWsn = niWsn; 
	}
	public long getNiCat() {
		return niCat; 
	}
	public void setNiCat(long niCat) {
		this.niCat = niCat; 
	}
	public long getNiIcrD() {
		return niIcrD; 
	}
	public void setNiIcrD(long niIcrD) {
		this.niIcrD = niIcrD; 
	}
	public long getNiIcrI() {
		return niIcrI; 
	}
	public void setNiIcrI(long niIcrI) {
		this.niIcrI = niIcrI; 
	}
	public long getNiIcrE() {
		return niIcrE; 
	}
	public void setNiIcrE(long niIcrE) {
		this.niIcrE = niIcrE; 
	}

    public String getRegionalStatID(){
            return regionalStatID;
        }

    public void setRegionalStatID(String regionalStatID){
            this.regionalStatID = regionalStatID;
        }

    public RegionalTeam getRegionalTeam(){
            return regionalTeam;
        }

    public void setRegionalTeam(RegionalTeam regionalTeam){
            this.regionalTeam = regionalTeam;
        }
}
