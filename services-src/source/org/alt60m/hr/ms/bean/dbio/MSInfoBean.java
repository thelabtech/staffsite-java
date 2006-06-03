package org.alt60m.hr.ms.bean.dbio;

import java.util.*;

import org.alt60m.hr.ms.servlet.dbio.*;
import org.alt60m.wsn.sp.model.dbio.WsnApplication;
import org.alt60m.wsn.sp.model.dbio.WsnReference;
import org.alt60m.wsn.sp.model.dbio.WsnEvaluation;
import org.alt60m.hr.ms.model.dbio.MSPayment;
import org.alt60m.hr.si.model.dbio.SIProject;
import org.alt60m.hr.si.servlet.dbio.SIProjectHandler;
import org.alt60m.hr.si.servlet.dbio.SIUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Priority;
/* Class added 9 October 2002 by RDH. */

public class MSInfoBean implements java.io.Serializable
{
	private static Log log = LogFactory.getLog(MSInfoBean.class);
	
	private final MSInfo info = new MSInfo();
	protected final String WsnApplicationClassName = "org.alt60m.wsn.sp.model.dbio.WsnApplication";
	protected final String WsnProjectClassName = "org.alt60m.wsn.sp.model.dbio.WsnProject";
	protected final String WsnReferenceClassName = "org.alt60m.wsn.sp.model.dbio.WsnReference";
	protected final String MSPaymentClassName = "org.alt60m.hr.ms.model.dbio.MSPayment";

	public Hashtable getWsnApplicationHash(String userID, String userEmail) {
	// "userID" and "userEmail" will be set as session variables by the AccountManager,
	// the jsp should grab them and pass them here
	
		log.debug("getWsnApplicationHash: "+userID + " -- " + userEmail);
	
		try {
			Hashtable objectHash = new Hashtable();
			
			// TODO: Use this to check for previous year's application -- RDH
			if(userID != null && !userID.equals("")) { // new user
				objectHash = info.getWsnApplicationWithSsmUserID(userID);

			    if (objectHash == null && userEmail != null && !userEmail.equals("")) {
					log.info("User NOT found--assuming NEW");
					objectHash = new Hashtable();
					
					objectHash = info.getWsnPersonInfoFromSSM(userID);
					objectHash.put("WsnApplicationID", "new");
					objectHash.put("CurrentEmail", userEmail);
			    }
			objectHash.put("SsmUserID", userID);
			}
			return objectHash;
		} catch (Exception e) {
			//log(Priority.ERROR, "Failed to perform getWsnApplicationHash(). ", e);
			e.printStackTrace();
			return null;
		}
	}

	/* added 10-17-02 DC
		Used to retrieve a reference form given the applicant's WsnApplicationID and the Reference Type (P, S1, or S2)
		Returns NULL if not found.
	*/
	public Hashtable getWsnReferenceHash(String WsnApplicationID, String referenceType) {
		try {
			log.debug("MSInfoBean.getWsnReferenceHash(" + WsnApplicationID + ", " + referenceType + ")");
			Hashtable objectHash = new Hashtable();
			objectHash = info.getWsnReferenceHashWithWsnApplication(WsnApplicationID, referenceType);
			if (objectHash == null)
				log.debug("MSInfoBean.getWsnReferenceHash objectHash=null, wsnreference not found!");
			else
				log.debug("MSInfoBean.getWsnReferenceHash objectHash!=null, wsnreference FOUND!");
			return objectHash;
		} catch (Exception e) {
			//log(Priority.ERROR, "Failed (). ", e);
			e.printStackTrace();
			return null;
		}
	}

	/* Gets the necessary information about WSN summer projects
	   Returns null on failure or empty result set.
	   Created by RDH */
	public Collection getValidProjects(String region, boolean showAll, String gender, String projectPref1Choice, String projectPref2Choice, String projectPref3Choice, String projectPref4Choice, String projectPref5Choice, boolean forceShowPrefs) {
		try {
			Collection projects = info.getValidProjects(region, showAll, gender, projectPref1Choice, projectPref2Choice, projectPref3Choice, projectPref4Choice, projectPref5Choice,forceShowPrefs);
			if (projects.isEmpty()) return null; else return projects;
		} catch (Exception e) {
			System.err.println("Exception encountered in MSInfoBean.getValidProjects()");
			return null;
		}
	}
	
	// Two below aded by SEP 2/4/05 to enable to get valid projects with or without project prefs
	public Collection getValidProjects(String region, boolean showAll, String gender) {
		return getValidProjects(region,showAll,gender,"0","0","0","0","0",false);
	}

	public Collection getValidProjects(String region, boolean showAll, String gender, String projectPref1Choice, String projectPref2Choice, String projectPref3Choice, String projectPref4Choice, String projectPref5Choice)
	{
		return getValidProjects(region,showAll,gender,projectPref1Choice,projectPref2Choice,projectPref3Choice,projectPref4Choice,projectPref5Choice,true);
	}
	
	
	

	/* AS 1/29/2003 */
	public Hashtable getPayments(String WsnApplicationID) {
		try {
			Hashtable payments = info.getPayments(WsnApplicationID);
			if (payments.isEmpty()) return null; else return payments;
		} catch (Exception e) {
			System.err.println("Exception encountered in MSInfoBean.getPayments()");
			return null;
		}
	}

    public Hashtable getProjectAvailability(String wsnProjectID) {
            return info.getProjectAvailability(wsnProjectID);
    }

	public Collection getCurrentProjectsByType(char type) {
		try {
			// Note: These lines DID NOT work in DBIO, object was incorrectly cast
			// changed info (MSInfo.java) to include the ObjectHashUtil
			Collection projects = info.getCurrentProjectsByType(type);
			if (projects.isEmpty()) return null; else return projects;
		} catch (Exception e) {
			System.err.println("Exception encountered in MSInfoBean.getCurrentProjectsByType()");
			return null;
		}
	}

	/* Added 1/24/03 - SML */
	/* This is to work with thisiswhereilive.info */
	public Collection getCurrentWsnProjectsByRegion(String _region, String _type) {
		try {
			Collection projects = info.getCurrentWsnProjectsByRegion(_region, _type);
			if (projects.isEmpty()) return null; else return projects;
		} catch (Exception e) {
			System.err.println("Exception encountered in MSInfoBean.getCurrentWsnProjectsByRegion()");
			return null;
		}
	}

	public Hashtable getWsnProject(String wsnProjectID) { return getProject(wsnProjectID); }

	public Hashtable getProject(String projectID) {
		try {
			return info.getObjectHash(WsnProjectClassName, projectID);
		}
		catch (Exception e) {
			System.err.println("Exception encountered in MSInfoBean.getProject()");
			return null;
		}
	}
	
	/**
	*
	* @param WsnProjectID
	* @return Hashtable of WsnProject
	*
	* Added 8 March 2005 SEP
	*/
	public Hashtable getWsnProjectHash(String WsnProjectID) {
		Hashtable objectHash = new Hashtable();
		
		if (WsnProjectID == null)
			return objectHash; //early return 

		try {

			objectHash = info.getObjectHash(WsnProjectClassName, WsnProjectID);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return objectHash;
	}
	
	
	public Collection listProjectQuestions(String projectID, String orderField, String orderDirection) {
	try {
		return info.listProjectQuestions(projectID, orderField, orderDirection);
	}catch (Exception e) {
		System.err.println("Exception encountered in MSInfoBean.listProjectQuestions()");
		return null;
	}
	
	}
	
	public Collection listWsnApplicationAnswers(String personID) {
		try {
			return info.listWsnApplicationAnswers(personID);
		}catch (Exception e) {
			System.err.println("Exception encountered in MSInfoBean.listWsnApplicationAnswers()");
			return null;
		}
		
		}
	
	
	public String getCampusRegion(String universityFullName, String universityState) {
		try {
			return info.getCampusRegion(universityFullName, universityState);
		} catch (Exception e) {
			System.err.println("Exception encountered in MSInfoBean.getCampusRegion()");
			return null;
		}
	}

	public Collection getParticipants(String projectID) {
		try {
			return info.getParticipants(projectID);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Hashtable getProjectCoordinator(String projectID) {
		try {
			return info.getProjectCoordinator(projectID);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public Hashtable getProjectDirector(String projectID) {
		try {
			return info.getProjectDirector(projectID);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public Hashtable getAssosciateProjectDirector(String projectID) {
		try {
			return info.getAssosciateProjectDirector(projectID);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/* added 01-10-03 DC
	 * returns the WsnApplication object with the given WsnApplicationID
	*/
	public WsnApplication getWsnApplication(String personID) {
		WsnApplication person = (WsnApplication) info.getObject(WsnApplicationClassName, personID);
		return person;
	}

	/* added 1/29/2003 AS
	 * returns the MSPayment object with the given MSPaymentID
	*/
	public MSPayment getMSPayment(String paymentID) {
		MSPayment payment = (MSPayment) info.getObject(MSPaymentClassName, paymentID);
		return payment;
	}

	/* added 01-14-03 DC
	 * returns the WsnReference object with the given WsnApplicationID and ReferenceType
	*/
	public WsnReference getWsnReference(String personID, String refType) {
		WsnReference reference = info.getWsnReferenceWithWsnApplication(personID, refType);
		return reference;
	}

    /* added 1/19/03 DMB
     * returns the WsnEvaluation object with the given WsnApplicationID
    */
    public WsnEvaluation getWsnEvaluation(String personID) {
        return info.getWsnEvaluationWithWsnApplication(personID);
    }

	/* added 01-16-03 DC
	 * parameter h: hashtable of person object
	 * returns TRUE if 1 or more required fields on the Personal Information page is empty, else return FALSE
	*/
	public boolean checkPersonalInfoRequiredFields(Hashtable h) {
		String temp = "";

		// Note: this list of required fields should match submitApplication() in WsnApplication.java
		temp = (String)h.get("Title");
		if (temp == null  ||  temp.trim().equals(""))
			return true;
		temp = (String)h.get("LegalFirstName");
		if (temp == null  ||  temp.trim().equals(""))
			return true;
		//4-16-03 kl: remove requirement to check MiddleName
		//temp = (String)h.get("LegalMiddleName");
		//if (temp == null  ||  temp.trim().equals(""))
		//	return true;
		temp = (String)h.get("LegalLastName");
		if (temp == null  ||  temp.trim().equals(""))
			return true;
		temp = (String)h.get("Birthdate");
		if (temp == null  ||  temp.trim().equals(""))
			return true;
		temp = (String)h.get("MaritalStatus");
		if (temp == null  ||  temp.trim().equals(""))
			return true;
		temp = (String)h.get("DateBecameChristian");
		if (temp == null  ||  temp.trim().equals(""))
			return true;
		temp = (String)h.get("CurrentAddress");
		if (temp == null  ||  temp.trim().equals(""))
			return true;
		// skip currentAddress2; not required!
		temp = (String)h.get("CurrentCity");
		if (temp == null  ||  temp.trim().equals(""))
			return true;
		temp = (String)h.get("CurrentState");
		if (temp == null  ||  temp.trim().equals(""))
			return true;
		temp = (String)h.get("CurrentZip");
		if (temp == null  ||  temp.trim().equals(""))
			return true;
		// removed 4/12/05 - SEP removed requirement to check date address good until
		//temp = (String)h.get("DateAddressGoodUntil");
		//if (temp == null  ||  temp.trim().equals(""))
		//	return true;
		temp = "";
		temp += (String)h.get("CurrentPhone");
		temp += (String)h.get("CurrentCellPhone");
		if (temp == null  ||  temp.trim().equals(""))
			return true;

		// All required fields are filled in.
		return false;
	}

public boolean checkSchoolInfoRequiredFields(Hashtable h) {
		String temp = "";
		
		// Note: this list of required fields should match submitApplication() in WsnApplication.java
		temp = (String)h.get("UniversityState");
		if (temp == null  ||  temp.trim().equals(""))
			return true;
		
		temp = (String)h.get("UniversityFullName");
		if (temp == null  ||  temp.trim().equals(""))
			return true;

		temp = (String)h.get("YearInSchool");
		if (temp == null  ||  temp.trim().equals(""))
			return true;

		temp = (String)h.get("EarliestAvailableDate");
		if (temp == null  ||  temp.trim().equals(""))
			return true;

		temp = (String)h.get("DateMustReturn");
		if (temp == null  ||  temp.trim().equals(""))
			return true;

		temp = "val";
		temp += h.get("CampusHasStaffTeam").toString();
		temp += h.get("CampusHasStaffCoach").toString();
		temp += h.get("CampusHasMetroTeam").toString();
		temp += h.get("CampusHasOther").toString();
		if(temp.indexOf("true")<1)
			return true;

		temp = "val";
		temp += h.get("ParticipateImpact").toString();
		temp += h.get("ParticipateDestino").toString();
		temp += h.get("ParticipateEpic").toString();
		temp += h.get("ParticipateCCC").toString();
		temp += h.get("ParticipateNone").toString();
		if(temp.indexOf("true")<1)
			return true;

		// All required fields are filled in.
		return false;
	}

}

