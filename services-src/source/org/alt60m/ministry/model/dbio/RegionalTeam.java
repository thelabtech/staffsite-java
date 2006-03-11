package org.alt60m.ministry.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;

public class RegionalTeam extends DBIOEntity {

	private String regionalTeamId = new String();

	private String no = new String();
	private String abbrv = new String();
	private String address1 = new String();
	private String address2 = new String();
	private String country = new String();
	private String city = new String();
	private String email = new String();
	private String fax = new String();
	private String region = new String();
	private String state = new String();
	private String url = new String();
	private String zip = new String();
	private String phone = new String();
	private String note = new String();
	private String name = new String();

	public RegionalTeam(String id) {
		regionalTeamId = id;
		select();
	}
	public RegionalTeam() {}

	public void localinit() throws DBIOEntityException {
		String table = "ministry_RegionalTeam";

		setMetadata("RegionalTeamId", "teamID", "IDENTITY");

		setMetadata("No", "no", table);
		setMetadata("Abbrv", "abbrv", table);
		setMetadata("Address1", "address1", table);
		setMetadata("Address2", "address2", table);
		setMetadata("Country", "country", table);
		setMetadata("City", "city", table);
		setMetadata("Email", "email", table);
		setMetadata("Fax", "fax", table);
		setMetadata("Region", "region", table);
		setMetadata("State", "state", table);
		setMetadata("Url", "url", table);
		setMetadata("Zip", "zip", table);
		setMetadata("Phone", "phone", table);
		setMetadata("Note", "note", table);
		setMetadata("Name", "name", table);

		setAutodetectProperties(false);
	}

	public boolean isPKEmpty() {
		return getRegionalTeamId().equals("");
	}
	public boolean persist(){
		return isPKEmpty() ? insert() : update();
	}
	
	public String getRegionalTeamId() { return regionalTeamId; }
	public void setRegionalTeamId(String teamId) { this.regionalTeamId = teamId; }

	public String getNo() { return no; }
	public void setNo(String no) { this.no = no; }
	
	public String getAbbrv() { return abbrv; }
	public void setAbbrv(String abbrv) { this.abbrv = abbrv; }

	public String getFax() { return fax; }
	public void setFax(String fax) { this.fax = fax; }

	public String getCountry() { return country; }
	public void setCountry(String country) { this.country = country; }

	public String getUrl() { return url; }
	public void setUrl(String url) { this.url = url; }

	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }

	public String getAddress1() { return address1; }
	public void setAddress1(String address1){ this.address1 = address1; }

	public String getCity() { return city; }
	public void setCity(String city) { this.city = city; }

	public String getNote() { return note; }
	public void setNote(String note) { this.note = note; }

	public String getAddress2() { return address2; }
	public void setAddress2(String address2) { this.address2 = address2; }

	public String getName() { return name; }
	public void setName(String name) { this.name = name; }

	public String getPhone() { return phone; }
	public void setPhone(String phone) { this.phone = phone; }

	public String getRegion() { return region; }
	public void setRegion(String region) { this.region = region; }

	public String getState() { return state; }
	public void setState(String state) { this.state = state; }

	public String getZip() { return zip; }
	public void setZip(String zip) { this.zip = zip; }
	
	public Vector getRegionalStats() {
		RegionalStat rs = new RegionalStat();
		rs.setRegionalTeamId(this.regionalTeamId);
		return rs.selectList();
	}
	public Vector getRegionalStats(String orderField, boolean DESC) {
		RegionalStat rs = new RegionalStat();
		return rs.selectList("fk_regionalTeamID = '" + this.regionalTeamId + "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}
	public void assocRegionalStat(RegionalStat rs) {
		rs.setRegionalTeamId(this.regionalTeamId);
		rs.update();
	}
	public void dissocRegionalStat(RegionalStat rs) {
		rs.setRegionalTeamId("");
		rs.update();
	}
}
 