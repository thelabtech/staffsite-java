package org.alt60m.hr.si.servlet.dbio;

import org.alt60m.hr.si.model.dbio.*;
import org.alt60m.util.ObjectHashUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;
//import org.exolab.castor.jdo.OQLQuery;
//import org.exolab.castor.jdo.QueryResults;


public class SIInfo {
	private static Log log = LogFactory.getLog(SIInfo.class);
	/***** Storage Functions *****/
	/*
	public String saveApplication(Hashtable formData, String applicationID) {
		try {
			SIBroker broker = new ServiceFactory().getSIBroker();
			broker.begin();
			SIApplication application = new SIApplication();
			if (applicationID.equals("new")) {
				formData.remove("ApplicationID"); // to avoid DB issues new IDs must be null
				broker.createObject(application);
			} else application = broker.getApplicationObject(Integer.parseInt(applicationID));
			ObjectAdaptor.hash2obj(formData, application);
			broker.commit();
			applicationID = (new Integer(application.getApplicationID())).toString();
		}
		catch (Exception e) {
			log.error(e, e);
		}
		return applicationID;
	}
*/
	/* this is here because I was going to generalize the save function so that it would
	save any of the forms, like staff application or us summer projects or STINT or whatever,
	not just the WSN application. But I ended up not doing that for time reasons (I wrote this
	on the morning of my last day on OSP). This is untested, but it should work fine. --RDH 15 August 2002 */
	// returns null on failure
	public Hashtable saveObject(Hashtable formData, String id, String idName, String className) {
		if (className.equals("org.alt60m.hr.si.model.dbio.SIApplication")) {
			return saveSIApplication(formData, id, idName);
		} else if (className.equals("org.alt60m.hr.si.model.dbio.SIPayment")) {
			return saveSIPayment(formData, id, idName);
		} else if (className.equals("org.alt60m.hr.si.model.dbio.SIPerson")) {
			return saveSIPerson(formData, id, idName);
		} else if (className.equals("org.alt60m.hr.si.model.dbio.SIProject")) {
			return saveSIProject(formData, id, idName);
		} else if (className.equals("org.alt60m.hr.si.model.dbio.SIReference")) {
			return saveSIReference(formData, id, idName);
		} else if (className.equals("org.alt60m.hr.si.model.dbio.SIUser")) {
			return saveSIUser(formData, id, idName);
		} else return null;
	}
	private Hashtable saveSIApplication(Hashtable formData, String id, String idName) {
		Hashtable objHash = new Hashtable();
		try {
			SIApplication obj = new SIApplication();
			if (id.equalsIgnoreCase("new")) {
				formData.remove(idName); // to avoid database issues new IDs must be null
			} else if (id != null)
				obj = new SIApplication(id);
			ObjectHashUtil.hash2obj(formData, obj);
			obj.persist();
			objHash = ObjectHashUtil.obj2hash(obj);
		} catch (Exception e) {
			log.error(e, e);
			objHash = null;
		}
		return objHash;
	}
	private Hashtable saveSIPayment(Hashtable formData, String id, String idName) {
		Hashtable objHash = new Hashtable();
		try {
			SIPayment obj = new SIPayment();
			if (id.equalsIgnoreCase("new")) {
				formData.remove(idName); // to avoid database issues new IDs must be null
			} else if (id != null)
				obj = new SIPayment(id);
			ObjectHashUtil.hash2obj(formData, obj);
			obj.persist();
			objHash = ObjectHashUtil.obj2hash(obj);
		} catch (Exception e) {
			log.error(e, e);
			objHash = null;
		}
		return objHash;
	}
	private Hashtable saveSIPerson(Hashtable formData, String id, String idName) {
		Hashtable objHash = new Hashtable();
		try {
			SIPerson obj = new SIPerson();
			if (id.equalsIgnoreCase("new")) {
				formData.remove(idName); // to avoid database issues new IDs must be null
			} else if (id != null)
				obj = new SIPerson(id);
			ObjectHashUtil.hash2obj(formData, obj);
			obj.persist();
			objHash = ObjectHashUtil.obj2hash(obj);
		} catch (Exception e) {log.error(e, e);
			objHash = null;
		}
		return objHash;
	}
	private Hashtable saveSIProject(Hashtable formData, String id, String idName) {
		Hashtable objHash = new Hashtable();
		try {
			SIProject obj = new SIProject();
			if (id.equalsIgnoreCase("new")) {
				formData.remove(idName); // to avoid database issues new IDs must be null
			} else if (id != null)
				obj = new SIProject(id);
			ObjectHashUtil.hash2obj(formData, obj);
			obj.persist();
			objHash = ObjectHashUtil.obj2hash(obj);
		} catch (Exception e) {
			log.error(e, e);
			objHash = null;
		}
		return objHash;
	}
	private Hashtable saveSIReference(Hashtable formData, String id, String idName) {
		Hashtable objHash = new Hashtable();
		try {
			SIReference obj = new SIReference();
			if (id.equalsIgnoreCase("new")) {
				formData.remove(idName); // to avoid database issues new IDs must be null
			} else if (id != null)
				obj = new SIReference(id);
			ObjectHashUtil.hash2obj(formData, obj);
			obj.persist();
			objHash = ObjectHashUtil.obj2hash(obj);
		} catch (Exception e) {
			log.error(e, e);
			objHash = null;
		}
		return objHash;
	}
	private Hashtable saveSIUser(Hashtable formData, String id, String idName) {
		Hashtable objHash = new Hashtable();
		try {
			SIUser obj = new SIUser();
			if (id.equalsIgnoreCase("new")) {
				formData.remove(idName); // to avoid database issues new IDs must be null
			} else if (id != null)
				obj = new SIUser(id);
			ObjectHashUtil.hash2obj(formData, obj);
			obj.persist();
			objHash = ObjectHashUtil.obj2hash(obj);
		} catch (Exception e) {
			log.error(e, e);
			objHash = null;
		}
		return objHash;
	}

	/***** Retreival Functions *****/
	/*
	public Hashtable getApplicationData(String applicationID) {
		try {
			SIBroker broker = new ServiceFactory().getSIBroker();
			broker.begin();
			if (!applicationID.equals("new")) {
				SIApplication application = broker.getApplicationObject(Integer.parseInt(applicationID));
				broker.rollback();
				return ObjectAdaptor.obj2hash(application);
			} else return new Hashtable();
		}
		catch (Exception e) {
			log.error(e, e);
			return null;
		}
	}*/
}