package org.alt60m.staffSite.bean.dbio;

import java.util.*;
import org.alt60m.staffSite.model.dbio.StaffSitePref;

public class Bookmarks
{
	public final static int TARGET_AREA = 0;
	public final static int LOCAL_LEVEL = 1;
	public final static int STATISTIC   = 2;

	private final String[] _names = new String[] {"TARGETAREA", "LOCALLEVEL", "STATISTIC"};
	private UserPreferences _prefs;

	public Bookmarks() throws Exception {
		_prefs = new UserPreferences();
	}

	public boolean		hasBookmark(String profileID, int type, String value) {
		if (getBookmark(profileID, type, value) == null)
			return false;
		else
			return true;
	}
	public Collection getBookmarks(String profileID) {
//        Object[] params = new Object[] {profileID,"TARGETAREA","LOCALLEVEL","STATISTIC"};
		return _prefs.getPreferencesByQuery("fk_StaffSiteProfile = "+profileID+" and (name like 'TARGETAREA' or name like 'LOCALLEVEL' or name like 'STATISTIC')");
	}
	public Collection getBookmarks(String profileID, int type) {
//        Object[] params = new Object[] {profileID, _names[type]};
		return _prefs.getPreferencesByQuery("fk_StaffSiteProfile = "+profileID+" and name like '"+_names[type]+"'");
	}
	public Collection getBookmarkValues(String profileID, int type) {
//		return _prefs.getPreferencesByQuery("CALL SQL SELECT displayName, value from staffsite_staffsitepref as pref where pref.fk_StaffSiteProfile = '"+profileID+"' and pref.name like '"+_names[type]+"' AS org.alt60m.persistence.castor.util.TwoFields");
		return _prefs.getPreferencesByQuery("fk_StaffSiteProfile = "+profileID+" and name like '"+_names[type]+"'");
	}
	public StaffSitePref getBookmark(String profileID, int type, String value) {
		return _prefs.getPreference(profileID, _names[type], value);
	}
	public void addBookmark(String profileID, int type, String displayName, String value) {
		StaffSitePref pref = getBookmark(profileID, type, value);
		if (pref != null) { //exists 
			removeBookmark(pref.getStaffSitePrefID());
		}
		_prefs.createPreference(profileID, _names[type], displayName, value);
	}
	public void removeBookmark(String bookmarkID) {
		_prefs.deletePreference(bookmarkID);
	}

	public void removeBookmark(String profileID, int type, String value) {
		StaffSitePref p = getBookmark(profileID, type, value);

		if (p!=null) removeBookmark(p.getStaffSitePrefID());
	}

	
	public static void main(String[] args) 
	{
		try{

			Bookmarks prefs = new Bookmarks();

			Collection col = prefs.getBookmarks(args[0], Bookmarks.TARGET_AREA);
			System.out.println("************************************** target area");
			Iterator i = col.iterator();
			while(i.hasNext()) {
				System.out.println(i.next().toString());
			}
			
			col = prefs.getBookmarks(args[0], Bookmarks.LOCAL_LEVEL);
			System.out.println("************************************** local level");
			i = col.iterator();
			while(i.hasNext()) {
				System.out.println(i.next().toString());
			}
			
			col = prefs.getBookmarks(args[0], Bookmarks.STATISTIC);
			System.out.println("************************************** statistic");
			i = col.iterator();
			while(i.hasNext()) {
				System.out.println(i.next().toString());
			}

			System.out.println("Adding bookmark...");
			prefs.addBookmark(args[0], Bookmarks.TARGET_AREA, "DisplayName", "Value");
			System.out.println("Verifying add...");

			System.out.println("Should be true: " + prefs.hasBookmark(args[0], Bookmarks.TARGET_AREA,  "Value"));
			System.out.println("Should be false: " + prefs.hasBookmark(args[0], Bookmarks.TARGET_AREA, "Value2"));
			System.out.println("Removing bookmark...");
			prefs.removeBookmark(args[0], Bookmarks.TARGET_AREA, "Value");
			System.out.println("Should be false: " + prefs.hasBookmark(args[0], Bookmarks.TARGET_AREA, "Value"));

			prefs.addBookmark(args[0], Bookmarks.TARGET_AREA, "Test display name run " + new Date().toString(), "DateStamp");


		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

}
