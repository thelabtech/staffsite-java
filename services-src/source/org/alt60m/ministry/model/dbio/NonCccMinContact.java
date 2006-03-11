package org.alt60m.ministry.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class NonCccMinContact extends DBIOEntity {

	private String fk_NonCccMinId = new String();
	private String fk_TargetAreaId = new String();
	
	public NonCccMinContact() {}
	
	public boolean isPKEmpty() {
		return fk_NonCccMinId.equals("") && fk_TargetAreaId.equals("");
	}
	public boolean persist(){
		return isPKEmpty() ? insert() : update();
	}


	public void localinit() throws DBIOEntityException {
		String table = "ministry_Assoc_otherMinistries";
		setMetadata("TargetAreaId","TargetAreaID","KEY");
		setMetadata("NonCccMinId","NonCccMinID","KEY");
		setMetadata("DbioDummy","dbioDummy",table);
		setAutodetectProperties(false);
	}
	private boolean dbioDummy = true;
	public boolean getDbioDummy(){return this.dbioDummy;}
	public void setDbioDummy(boolean dbioDummy){this.dbioDummy = dbioDummy;}

	public String getNonCccMinId() { return fk_NonCccMinId; }
	public void setNonCccMinId(String fk_NonCccMinId) { this.fk_NonCccMinId = fk_NonCccMinId; }
	public NonCccMin getNonCccMin() { return new NonCccMin(this.fk_NonCccMinId); }
	public void setNonCccMin(NonCccMin ncm) { this.fk_NonCccMinId = ncm.getNonCccMinId(); }

	public String getTargetAreaId() { return fk_TargetAreaId; }
	public void setTargetAreaId(String fk_TargetAreaId) { this.fk_TargetAreaId = fk_TargetAreaId; }
	public TargetArea getTargetArea(){ return new TargetArea(this.fk_TargetAreaId); }
	public void setTargetArea(TargetArea ta){ this.fk_TargetAreaId = ta.getTargetAreaId(); }
}