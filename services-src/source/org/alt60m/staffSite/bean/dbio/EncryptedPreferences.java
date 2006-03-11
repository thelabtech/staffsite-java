package org.alt60m.staffSite.bean.dbio;

import org.alt60m.staffSite.model.dbio.StaffSitePref;
import org.alt60m.util.*;

public class EncryptedPreferences
{
	private Encryptor _enigma;
	private UserPreferences _prefs;

	public EncryptedPreferences() throws Exception {
		// Super-secret password
		_enigma = new Encryptor("25TKSXZsIdKrrdnfbKLXyQys7jfpgSpVngqs99T9Q");
		_prefs = new UserPreferences();
	}

	public StaffSitePref getPreference(String profileID, String name) throws EncryptorException {
		StaffSitePref p = _prefs.getPreference(profileID, name);
		
		if (p != null) {
			p.setValue( _enigma.decrypt(p.getValue()) );
			return p;
		} else {
			return null;
		}

	}
	public void savePreference(String profileID, String name, String displayName, String value) throws EncryptorException {
		
		String encryptedValue = _enigma.encrypt(value);

		_prefs.savePreference(profileID, name, displayName, encryptedValue); 
	}
	
	public static void main(String[] args) 
	{
		try{

			EncryptedPreferences prefs = new EncryptedPreferences();
			StaffSitePref p = prefs.getPreference(args[0], args[1]);
			
			System.out.println(p.toString());

		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

}
