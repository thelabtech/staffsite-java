package org.alt60m.staffSite.bean.dbio;

import java.util.*;
import org.alt60m.staffSite.model.dbio.StaffSitePref;

public class UserPreferences
{


	public UserPreferences() {

	}

	public Collection getPreferences(String profileID) {
		StaffSitePref pref = new StaffSitePref();
		pref.setProfileID(profileID);
		return pref.selectList();
//		return _doQuery("select pref from org.alt60m.staffSite.model.StaffSitePref as pref where pref.profile.StaffSiteProfileID = $1", new Object[] {profileID});
	}
	public Collection getPreferences(String profileID, String name) {
		StaffSitePref pref = new StaffSitePref();
		pref.setProfileID(profileID);
		pref.setName(name);
		return pref.selectList();
//		return _doQuery("select pref from org.alt60m.staffSite.model.StaffSitePref as pref where pref.profile.StaffSiteProfileID = $1 and pref.name like $2", new Object[] {profileID, name.toUpperCase()});
	}
	public String getPreferenceValue(String profileID, String name) {
		StaffSitePref pref = new StaffSitePref();
		pref.setProfileID(profileID);
		pref.setName(name);
		pref.select();
		return pref.getValue();
//		Collection pref = _doQuery("CALL SQL SELECT value from staffsite_staffsitepref as pref where pref.fk_StaffSiteProfile = '"+profileID+"' and pref.name like '"+name+"' AS org.alt60m.persistence.castor.util.SingleField");
//		Iterator prefIt = pref.iterator();
//		String value = null;
//		if (prefIt.hasNext()) {
//			org.alt60m.persistence.castor.util.SingleField field = (org.alt60m.persistence.castor.util.SingleField)prefIt.next();
//			value = field.getField1();
//		}
//		return value;
	}
	public Collection getPreferences(String profileID, String name, String value) {
		StaffSitePref pref = new StaffSitePref();
		pref.setProfileID(profileID);
		pref.setName(name);
		pref.setValue(value);
		return pref.selectList();
//		return _doQuery("select pref from org.alt60m.staffSite.model.StaffSitePref as pref where pref.profile.StaffSiteProfileID = $1 and pref.name like $2 and pref.value like $3", new Object[] {profileID, name.toUpperCase(), value});
	}
	public StaffSitePref getPreference(String profileID, String name) {
        Collection prefs = getPreferences(profileID, name);
        return (StaffSitePref) (prefs.iterator().hasNext() ? prefs.iterator().next() : null);
	}
	public StaffSitePref getPreference(String profileID, String name, String value) {
        Collection prefs = getPreferences(profileID, name, value);
        return (StaffSitePref) (prefs.iterator().hasNext() ? prefs.iterator().next() : null);
	}
    public void createPreference(String profileID, String type, String displayName, String value) {

		StaffSitePref pref = new StaffSitePref();

        pref.setName(type);
        pref.setDisplayName(displayName);
        pref.setValue(value);
	    pref.setProfileID(profileID);
	    pref.persist();

//        org.alt60m.staffSite.StaffSiteBroker ssb = org.alt60m.factory.ServiceFactory.getStaffSiteBroker();
//		ssb.begin();
//		ssb.createObject(pref);
//        StaffSiteProfile profile = ssb.getProfile(profileID);
//        pref.setProfile(profile);
//        ssb.commit();

    }

    public void deletePreference(String preferenceID) {
	    StaffSitePref pref = new StaffSitePref(preferenceID);
	    pref.delete();

//        org.alt60m.staffSite.StaffSiteBroker ssb = org.alt60m.factory.ServiceFactory.getStaffSiteBroker();
//		ssb.begin();
//		StaffSitePref pref = (StaffSitePref) ssb.getPreference(preferenceID);
//		ssb.deleteObject(pref);
//		ssb.commit();
    }
	
	public void updatePreference(String profileID, String preferenceID, String name, String displayName, String value) {

//        	org.alt60m.staffSite.StaffSiteBroker ssb = org.alt60m.factory.ServiceFactory.getStaffSiteBroker();
//			ssb.begin();

//			StaffSitePref pref = ssb.getPreference(preferenceID); // (StaffSitePrefObject) _prefAdaptor.ejbNarrow(_prefAdaptor.getEjbObject(preferenceID));
		StaffSitePref pref = new StaffSitePref(preferenceID);
		pref.setName(name);
		pref.setDisplayName(displayName);
		pref.setValue(value);
		pref.persist();

//            ssb.commit();

	}

	public void savePreference(String profileID, String name, String displayName, String value) {
		StaffSitePref pref = getPreference(profileID, name);
		
		if (pref != null)
			updatePreference(profileID, pref.getStaffSitePrefID(), name, displayName, value);
		else 
			createPreference(profileID, name, displayName, value);
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
        return new StaffSitePref().selectList(query);
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
