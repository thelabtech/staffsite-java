package org.alt60m.staffSite.bean.dbio;

import java.util.*;

import org.alt60m.staffSite.model.dbio.InfobaseBookmark;
import org.alt60m.staffSite.model.dbio.StaffSitePref;

public class UserPreferences
{


	public UserPreferences() {

	}

	public Collection getPreferences(String userId) {
		InfobaseBookmark pref = new InfobaseBookmark();
		pref.setUser_id(userId);
		return pref.selectList();
//		return _doQuery("select pref from org.alt60m.staffSite.model.StaffSitePref as pref where pref.profile.StaffSiteProfileID = $1", new Object[] {profileID});
	}
	public Collection getPreferences(String userId, String name) {
		InfobaseBookmark pref = new InfobaseBookmark();
		pref.setUser_id(userId);
		pref.setName(name);
		return pref.selectList();
	}
	public String getPreferenceValue(String userId, String name) {
		if (userId == null || userId.equals("")) {
			return null;
		}
		InfobaseBookmark pref = new InfobaseBookmark();
		pref.setUser_id(userId);
		pref.setName(name);
		pref.select();
		return pref.getValue();
	}
	public Collection getPreferences(String userId, String name, String value) {
		InfobaseBookmark pref = new InfobaseBookmark();
		pref.setUser_id(userId);
		pref.setName(name);
		pref.setValue(value);
		return pref.selectList();
//		return _doQuery("select pref from org.alt60m.staffSite.model.StaffSitePref as pref where pref.profile.StaffSiteProfileID = $1 and pref.name like $2 and pref.value like $3", new Object[] {profileID, name.toUpperCase(), value});
	}
	public InfobaseBookmark getPreference(String userId, String name) {
        Collection prefs = getPreferences(userId, name);
        return (InfobaseBookmark) (prefs.iterator().hasNext() ? prefs.iterator().next() : null);
	}
	public InfobaseBookmark getPreference(String userId, String name, String value) {
        Collection prefs = getPreferences(userId, name, value);
        return (InfobaseBookmark) (prefs.iterator().hasNext() ? prefs.iterator().next() : null);
	}
    public void createPreference(String userId, String type, String value) {

    	InfobaseBookmark pref = new InfobaseBookmark();

        pref.setName(type);
        pref.setValue(value);
	    pref.setUser_id(userId);
	    pref.persist();

//        org.alt60m.staffSite.StaffSiteBroker ssb = org.alt60m.factory.ServiceFactory.getStaffSiteBroker();
//		ssb.begin();
//		ssb.createObject(pref);
//        StaffSiteProfile profile = ssb.getProfile(profileID);
//        pref.setProfile(profile);
//        ssb.commit();

    }

    public void deletePreference(String preferenceID) {
    	InfobaseBookmark pref = new InfobaseBookmark(preferenceID);
	    pref.delete();

//        org.alt60m.staffSite.StaffSiteBroker ssb = org.alt60m.factory.ServiceFactory.getStaffSiteBroker();
//		ssb.begin();
//		StaffSitePref pref = (StaffSitePref) ssb.getPreference(preferenceID);
//		ssb.deleteObject(pref);
//		ssb.commit();
    }
	
	public void updatePreference(String userId, String preferenceID, String name, String value) {

//        	org.alt60m.staffSite.StaffSiteBroker ssb = org.alt60m.factory.ServiceFactory.getStaffSiteBroker();
//			ssb.begin();

//			StaffSitePref pref = ssb.getPreference(preferenceID); // (StaffSitePrefObject) _prefAdaptor.ejbNarrow(_prefAdaptor.getEjbObject(preferenceID));
		InfobaseBookmark pref = new InfobaseBookmark(preferenceID);
		pref.setName(name);
		pref.setValue(value);
		pref.persist();

//            ssb.commit();

	}

	public void savePreference(String userId, String name, String value) {
		InfobaseBookmark pref = getPreference(userId, name);
		
		if (pref != null)
			updatePreference(userId, String.valueOf(pref.getId()), name, value);
		else 
			createPreference(userId, name, value);
	}
//    public Collection getPreferencesByQuery(String query, Object[] params) {
//		return _doQuery(query, params);
//    }
    public Collection getPreferencesByQuery(String query) {
		return _doQuery(query);
    }
//    private Collection _doQuery(String query, Object[] params) {
//        org.alt60m.staffSite.StaffSiteBroker ssb = org.alt60m.factory.ServiceFactory.getStaffSiteBroker();
//		ssb.begin();
//		Collection results = ssb.doQuery(query, params);
////		Collection results = ssb.doQuery("select pref from org.alt60m.staffSite.model.StaffSitePref as pref where pref.preferences.StaffSiteProfileID = $1", params);
//		ssb.rollback();
//        return results;
//    }
    private Collection _doQuery(String query) {
        return new InfobaseBookmark().selectList(query);
    }

	public static void main(String[] args) 
	{
		try{
			UserPreferences prefs = new UserPreferences();
			Collection c;

			if (args.length == 1)
				c = prefs.getPreferences(args[0]);
			else
				c = prefs.getPreferences(args[0], args[1]);

			System.out.println(prefs.getPreference(args[0], args[1]).toString());

			Iterator i = c.iterator();
			while(i.hasNext()) {
				System.out.println(((StaffSitePref)i.next()).toString());
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}
}
