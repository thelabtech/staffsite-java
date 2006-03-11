package org.alt60m.ministry.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;

public class RegionalStat extends DBIOEntity {
	private String regionalStatId = new String();
	private Date periodBegin = null;
	private Date periodEnd = null;
	private long nsSc = 0;
	private long nsWsn = 0;
	private long nsCat = 0;
	private long nsIcrD = 0;
	private long nsIcrI = 0;
	private long nsIcrE = 0;
	private long niSc = 0;
	private long niWsn = 0;
	private long niCat = 0;
	private long niIcrD = 0;
	private long niIcrI = 0;
	private long niIcrE = 0;

	private String fk_regionalTeamId = new String();

	public void localinit() throws DBIOEntityException {
		String table = "ministry_RegionalStat";

		setMetadata("RegionalStatId", "RegionalStatID", "IDENTITY");
		setMetadata("RegionalTeamId", "fk_regionalTeamID", table);

		setMetadata("PeriodBegin", "periodBegin", table);
		setMetadata("PeriodEnd", "periodEnd", table);
		setMetadata("NsSc", "nsSc", table);
		setMetadata("NsWsn", "nsWsn", table);
		setMetadata("NsCat", "nsCat", table);
		setMetadata("NsIcrD", "nsIcrD", table);
		setMetadata("NsIcrI", "nsIcrI", table);
		setMetadata("NsIcrE", "nsIcrE", table);
		setMetadata("NiSc", "niSc", table);
		setMetadata("NiWsn", "niWsn", table);
		setMetadata("NiCat", "niCat", table);
		setMetadata("NiIcrD", "niIcrD", table);
		setMetadata("NiIcrI", "niIcrI", table);
		setMetadata("NiIcrE", "niIcrE", table);
	
		setAutodetectProperties(false);
	}
	
	public RegionalStat(String id) {
		regionalStatId = id;
		select();
	}
	public RegionalStat() {}

	public boolean isPKEmpty() {
		return getRegionalStatId().equals("");
	}
	public boolean persist(){
		return isPKEmpty() ? insert() : update();
	}

	
	public String getRegionalStatId() { return regionalStatId; }
	public void setRegionalStatId(String regionalStatId) { this.regionalStatId = regionalStatId; }

	public Date getPeriodBegin() { return periodBegin; }
	public void setPeriodBegin(Date periodBegin) { this.periodBegin = org.alt60m.util.DateUtils.clearTimeFromDate(periodBegin); }

	public Date getPeriodEnd() { return periodEnd; }
	public void setPeriodEnd(Date periodEnd) { this.periodEnd = org.alt60m.util.DateUtils.clearTimeFromDate(periodEnd); }
	
	public long getNsSc() { return nsSc; }
	public void setNsSc(long nsSc) { this.nsSc = nsSc; }
	public long getNsWsn() { return nsWsn; }
	public void setNsWsn(long nsWsn) { this.nsWsn = nsWsn; }
	public long getNsCat() { return nsCat; }
	public void setNsCat(long nsCat) { this.nsCat = nsCat; }
	public long getNsIcrD() { return nsIcrD; }
	public void setNsIcrD(long nsIcrD) { this.nsIcrD = nsIcrD; }
	public long getNsIcrI() { return nsIcrI; }
	public void setNsIcrI(long nsIcrI) { this.nsIcrI = nsIcrI; }
	public long getNsIcrE() { return nsIcrE; }
	public void setNsIcrE(long nsIcrE) { this.nsIcrE = nsIcrE; }
	public long getNiSc() { return niSc; }
	public void setNiSc(long niSc) { this.niSc = niSc; }
	public long getNiWsn() { return niWsn; }
	public void setNiWsn(long niWsn) { this.niWsn = niWsn; }
	public long getNiCat() { return niCat; }
	public void setNiCat(long niCat) { this.niCat = niCat; }
	public long getNiIcrD() { return niIcrD; }
	public void setNiIcrD(long niIcrD) { this.niIcrD = niIcrD; }
	public long getNiIcrI() { return niIcrI; }
	public void setNiIcrI(long niIcrI) { this.niIcrI = niIcrI; }
	public long getNiIcrE() { return niIcrE; }
	public void setNiIcrE(long niIcrE) { this.niIcrE = niIcrE; }
 
	public String getRegionalTeamId() { return fk_regionalTeamId; }
	public void setRegionalTeamId(String regionalTeamId) { this.fk_regionalTeamId = regionalTeamId; }
	public RegionalTeam getRegionalTeam() { return new RegionalTeam(fk_regionalTeamId);	}
	public void setRegionalTeam(RegionalTeam rt) { this.fk_regionalTeamId = rt.getRegionalTeamId(); }
}
