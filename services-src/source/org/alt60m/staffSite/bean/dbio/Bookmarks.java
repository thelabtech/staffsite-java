package org.alt60m.staffSite.bean.dbio;

import java.util.*;

import org.alt60m.staffSite.model.dbio.InfobaseBookmark;
import org.alt60m.staffSite.model.dbio.StaffSitePref;

public class Bookmarks
{
	public final static int TARGET_AREA = 0;
	public final static int TEAM = 1;
	public final static int LOCAL_LEVEL = 1;
	public final static int ACTIVITY   = 2;
	public final static int STATISTIC = 2;

	private final String[] _names = new String[] {"target_area", "team", "activity"};
	private UserPreferences _prefs;

	public Bookmarks() throws Exception {
		_prefs = new UserPreferences();
	}

	public boolean hasBookmark(String userId, int type, String value) {
		if (getBookmark(userId, type, value) == null)
			return false;
		else
			return true;
	}
	public Collection getBookmarks(String userId) {
//        Object[] params = new Object[] {profileID,"TARGETAREA","LOCALLEVEL","STATISTIC"};
		return _prefs.getPreferencesByQuery("user_id = "+userId+" and (name like 'target_area' or name like 'team' or name like 'activity')");
	}
	public Collection getBookmarks(String userId, int type) {
//        Object[] params = new Object[] {profileID, _names[type]};
		return _prefs.getPreferencesByQuery("user_id = "+userId+" and name like '"+_names[type]+"'");
	}
	public Collection getBookmarkValues(String userId, int type) {
//		return _prefs.getPreferencesByQuery("CALL SQL SELECT displayName, value from staffsite_staffsitepref as pref where pref.fk_StaffSiteProfile = '"+profileID+"' and pref.name like '"+_names[type]+"' AS org.alt60m.persistence.castor.util.TwoFields");
		return _prefs.getPreferencesByQuery("user_id = "+userId+" and name like '"+_names[type]+"'");
	}
	public InfobaseBookmark getBookmark(String userId, int type, String value) {
		return _prefs.getPreference(userId, _names[type], value);
	}
	public void addBookmark(String userId, int type, String value) {
		InfobaseBookmark pref = getBookmark(userId, type, value);
		if (pref != null) { //exists 
			removeBookmark(pref.getId());
		}
		_prefs.createPreference(userId, _names[type], value);
	}
	public void removeBookmark(String bookmarkID) {
		_prefs.deletePreference(bookmarkID);
	}

	public void removeBookmark(int bookmarkID) {
		_prefs.deletePreference(String.valueOf(bookmarkID));
	}

	public void removeBookmark(String userId, int type, String value) {
		InfobaseBookmark p = getBookmark(userId, type, value);

		if (p!=null) removeBookmark(p.getId());
	}

/*
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
*/
}
