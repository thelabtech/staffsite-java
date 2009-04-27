package org.alt60m.ministry.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;

public class LocalLevel extends DBIOEntity {
	public LocalLevel(String id) {
		localLevelId = id;
		select();
	}
	public LocalLevel() {}

	public boolean isPKEmpty() {
		return localLevelId.equals("");
	}
	public boolean persist(){
		return isPKEmpty() ? insert() : update();
	}

	public void localinit() throws DBIOEntityException {
		String table = "ministry_locallevel";
		setMetadata("LocalLevelId","teamID","IDENTITY");

		setMetadata("Name","name",table);
		setMetadata("Lane","lane",table);
		setMetadata("Note","note",table);
		setMetadata("Region","region",table);
		setMetadata("Address1","address1",table);
		setMetadata("Address2","address2",table);
		setMetadata("City","city",table);
		setMetadata("State","state",table);
		setMetadata("Zip","zip",table);
		setMetadata("Country","country",table);
		setMetadata("Phone","phone",table);
		setMetadata("Fax","fax",table);
		setMetadata("Email","email",table);
		setMetadata("Url","url",table);
		setMetadata("IsActiveString","isActive",table);
		setMetadata("HasMultiRegionalAccess","hasMultiRegionalAccess",table);
		setMetadata("StartDate","startdate",table);
		setMetadata("StopDate","stopdate",table);
		setMetadata("No","no",table);
		setMetadata("Abbrv","abbrv",table);
		setMetadata("DeptID","dept_id",table);
		setAutodetectProperties(false);
	}

    private String localLevelId = "";

	private String name = "";
	private String lane = "";
	private String note = "";
	private String region = "";
	private String address1 = "";
	private String address2 = "";
	private String city = "";
	private String state = "";
	private String zip = "";
	private String country = "";
	private String phone = "";
	private String fax = "";
	private String email = "";
	private String url = "";
	private String isActive = "";
	private String hasMultiRegionalAccess = "";
	private Date   startDate = null;
	private Date   stopDate = null;
	private String no = "";
	private String abbrv = "";
	private String deptID = "";
	
	public String getLocalLevelId(){ return localLevelId; }
    public void setLocalLevelId(String localLevelId){ this.localLevelId = localLevelId; }

    public String getName(){ return name; }
    public void setName(String name){ this.name = name; }

    public String getLane(){ return lane; }
    public void setLane(String lane){ this.lane = lane; }

    public String getNote(){ return note; }
    public void setNote(String note){ this.note = note; }

    public String getRegion(){ return region; }
    public void setRegion(String region){ this.region = region; }

    public String getAddress1(){ return address1; }
    public void setAddress1(String address1){ this.address1 = address1; }

    public String getAddress2(){ return address2; }
    public void setAddress2(String address2){ this.address2 = address2; }

    public String getCity(){ return city; }
    public void setCity(String city){ this.city = city; }

    public String getState(){ return state; }
    public void setState(String state){ this.state = state; }

    public String getZip(){ return zip; }
    public void setZip(String zip){ this.zip = zip; }

    public String getCountry(){ return country; }
    public void setCountry(String country){ this.country = country; }

	public String getPhone(){ return phone; }
    public void setPhone(String phone){ this.phone = phone; }

	public String getFax(){ return fax; }
    public void setFax(String fax){ this.fax = fax; }

    public String getEmail(){ return email; }
    public void setEmail(String email){ this.email = email; }
    
	public String getUrl(){ return url; }
    public void setUrl(String url){ this.url = url; }

	public boolean getIsActive(){ return isActive != null && isActive.equals("T"); }
	public void setIsActive(boolean isActive){ this.isActive = isActive ? "T" : "F"; }

	public String getIsActiveString(){ return isActive; }
	public void setIsActiveString(String isActive){ this.isActive = isActive; }

	public boolean getHasMultiRegionalAccess(){ return hasMultiRegionalAccess != null && hasMultiRegionalAccess.equals("T"); }
	public void setHasMultiRegionalAccess(boolean hasMultiRegionalAccess){ this.hasMultiRegionalAccess = hasMultiRegionalAccess ? "T" : "F"; }

	public String getHasMultiRegionalAccessString(){ return hasMultiRegionalAccess; }
	public void setHasMultiRegionalAccessString(String hasMultiRegionalAccess){ this.hasMultiRegionalAccess = hasMultiRegionalAccess; }
	
	public Date getStartDate(){ return startDate; }
    public void setStartDate(Date startDate){ this.startDate = org.alt60m.util.DateUtils.clearTimeFromDate(startDate); }

	public Date getStopDate(){ return stopDate; }
    public void setStopDate(Date stopDate){ this.stopDate = org.alt60m.util.DateUtils.clearTimeFromDate(stopDate); }
  
	public String getNo(){ return no; }
    public void setNo(String no){ this.no = no; }
    
	public String getAbbrv(){ return abbrv; }
    public void setAbbrv(String abbrv){ this.abbrv = abbrv; }

    public String getDeptID(){ return deptID; }
    public void setDeptID(String deptID){ this.deptID = deptID; }
    
	public Vector getSortedActivities() {
            Activity a = new Activity();
            String table = "ministry_viewSortedActivities";
            a.changeTargetTable(table);
            return a.selectList("fk_teamID = '"+this.getLocalLevelId()+"'");
		/*Vector acts = new Vector();
		acts.addAll(this.getActivities());
		Activity a, b;
		TargetArea ta1, ta2;
		SortedSet activitySet = new TreeSet(new ActivityComparator());
		for (int i = 0; i < acts.size(); i++) {
			a = (Activity)acts.get(i);
			if(a.getTargetArea() != null) {
				ta1 = a.getTargetArea();
				for(int j = 0; j < acts.size(); j++) {
					b = (Activity)acts.get(j);
					if(b.getTargetArea() != null) {
						ta2 = b.getTargetArea();
						if(ta1.getName().compareToIgnoreCase(ta2.getName()) == 0)
							if(a.getPeriodEnd() == null)
								if(b.getPeriodEnd() == null)
									if(a.getPeriodBegin().compareTo(b.getPeriodBegin()) < 0)
										activitySet.add(b);
									else activitySet.add(a);
								else activitySet.add(a);
							else if(b.getPeriodEnd() == null)
								if(a.getPeriodBegin().compareTo(b.getPeriodBegin()) < 0)
									activitySet.add(b);
								else activitySet.add(a);
							else if(a.getPeriodEnd().compareTo(b.getPeriodEnd()) < 0)
								activitySet.add(b);
							else
								activitySet.add(a);
						else
							activitySet.add(a);
					}
				}
			}
		}
		return activitySet; */
	}

	public Vector getActivities() {
		Activity a = new Activity();
		a.setLocalLevelId(this.localLevelId);
		return a.selectList();
	}
	public Vector getActivities(String orderField, boolean DESC) {
		Activity a = new Activity();
		return a.selectList("fk_teamID = '" + this.localLevelId + "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}
	public void assocActivity(Activity a) {
		a.setLocalLevelId(this.localLevelId);
		a.update();
	}
	public void dissocActivity(Activity a) {
		a.setLocalLevelId("");
		a.update();
	}	

	public Vector getStaff() {
		Staff s = new Staff();
		s.setLocalLevelId(this.localLevelId);
		return s.selectList();
	}
	public Vector getStaff(String orderField, boolean DESC) {
		Staff s = new Staff();
		return s.selectList("fk_teamID = '" + this.localLevelId + "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}
	public Vector getMembers() {
		return getStaff();
	}
	public Vector getMembers(String orderField, boolean DESC) {
		return getStaff(orderField, DESC);
	}
	public void assocStaff(Staff s) {
		s.setLocalLevelId(this.localLevelId);
		s.update();
	}
	public void dissocStaff(Staff s) {
		s.setLocalLevelId("");
		s.update();	
	}
	public void addMembers(Staff s) {
		assocStaff(s);
	}
	public Boolean hasNoActiveActivities() {
		 Activity a = new Activity();
       String table = "ministry_viewSortedActivities";
       a.changeTargetTable(table);
       return (a.selectList("fk_teamID = '"+this.getLocalLevelId()+"' and status in ('AC','LA','TR','KE','PI','FR')")).isEmpty();
	}
}