package org.alt60m.hr.si.bean.dbio;

import java.io.Serializable;
import java.util.*;

import org.alt60m.hr.si.servlet.dbio.*;
import org.alt60m.hr.si.model.dbio.*;
import org.alt60m.util.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.text.SimpleDateFormat;
/**
 * @author Ken Burcham
 * This class is a bean used on JSP pages in the SI system to retrieve the 
 * necessary entity information for a specific entity.  Used to display edit
 * data in the form fields.
 */
public class SIInfoBean implements Serializable {

	private static Log log = LogFactory.getLog(SIInfoBean.class);
	/**
	 * returns person object with given ssmid.
	 * returns null if person not found.
	 * 
	 * @param userId
	 * @param emailAddr
	 * @return SIPerson
	 */
	public synchronized static SIPerson getSIPersonBySSM(String userId, String emailAddr) {
		SIPerson p = null;
		try {
			String SIPersonID = getPersonIDBySSM(userId);
			if ("".equals(SIPersonID) || SIPersonID == null) {
				//then the object doesn't exist so freak out!
				throw new RuntimeException("The code shouldn't get here.");
			} else {
				p = (SIPerson) SIUtil.getObject(SIPersonID, "SIPersonID", org.alt60m.hr.si.servlet.dbio.SIAppHandler.PERSONCLASS);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return p;

	}

	/**
	 * returns an siapplication looked up by the sipersonid
	 * 
	 * added kb 2/4/03
	 * 
	 * @param sipersonid
	 * @return SIApplication
	 */
	public synchronized static SIApplication getSIApplicationByPersonID(String sipersonid, int si_ssm_id) {
		SIApplication a = null;
		try {
			String appID = getApplicationIDByPersonID(sipersonid);
			//if its empty then the app isn't created yet
			if ("".equals(appID) || appID == null) {
				a = SIUtil.createApplication(si_ssm_id, sipersonid);
			} else {
				a = (SIApplication) SIUtil.getObject(appID, "ApplicationID", org.alt60m.hr.si.servlet.dbio.SIAppHandler.APPLICATIONCLASS);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return a;

	}

	/**
	 * returns the SIApplication object with the given appid
	 *
	 * @param appid
	 * @return SIApplication
	 */
	public SIApplication getSIApplication(String appid) {

		return SIUtil.getSIApplication(appid);
	}

	public Collection getAppsCollections(String regionID, String yearID) {
		return SIUtil.getSIAppsCollections(regionID, yearID);
	}

	/**
	* returns the SIApplication object with the given appid
	*
	* @param appid
	* @return SIApplication
	*
	* Added 3 December 2002 RDH
	*/
	public SIProject getSIProject(int SIProjectID) {
		SIProject a = new SIProject();

		try {
			a = (SIProject) SIUtil.getObject(SIProjectID, "SIProjectID", SIProjectHandler.PROJECTCLASS);
		} catch (Exception e) {
			// just ignore the exception, probably ObjectNotFound exception
		}

		return a;
	}
	/**
	*
	* @param SIProjectID
	* @return Hashtable of SIProject
	*
	* Added 8 March 2005 SEP
	*/
	public Hashtable getSIProjectHash(int SIProjectID) {
		Hashtable objectHash = new Hashtable();
		
		if (SIProjectID == 0)
			return objectHash; //early return 

		try {

			objectHash = SIUtil.getObjectHash(SIProjectID, "SIProjectID", SIProjectHandler.PROJECTCLASS);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return objectHash;
	}
	/** 
	 * DEPRECATED...  Use the methods that return objects instead.  
	 *                 I'm keeping around just in case the references need them
	 * 
	 * This method will return the SIPerson information represented as a hashtable.
	 *  Will return empty hashtable if empty. 
	 * The userId is the authenication system userid...  we store this to use as a cross-ref
	 * Email addr is used to cross-ref in other systems. 
	 * @param userId
	 * @param emailAddr
	 * @return Hashtable
	 */
	public Hashtable getSIPersonHashBySSM(String userId, String emailAddr) {

		Hashtable objectHash = new Hashtable();

		if (userId == null)
			return objectHash;
		//early return //TODO we want to look up other systems first.

		try {

			//TODO: look in the other systems to see if we have them already. kb 11/22

			String SIPersonID = getPersonIDBySSM(userId);

			//we may or may not have an SIPersonID at this point.
			//  if we don't it will create a new one, if we do it will find it.
			objectHash = SIUtil.getObjectHash(SIPersonID, "SIPersonID", org.alt60m.hr.si.servlet.dbio.SIAppHandler.PERSONCLASS);

			/*
			 * TODO: need to lookup this user in other systems  
			 * 
			 
			// TODO: Use this to check for previous year's application -- RDH
			if(objectHash == null) { // new user
				objectHash = new Hashtable();
				// Okay, the user is not in the WsnApplication table, but can we pull any info from CRSPerson?
				Hashtable crsHash = info.getWsnApplicationInfoFromCRSPersonWithEmailAddress(userEmail);
				if (crsHash != null)
					objectHash = info.saveObjectHash(crsHash, null, "WsnApplicationID", WsnApplicationClassName);
				else
					objectHash.put("WsnApplicationID", "new");
				// Since WsnApplication email is not yet specified, force it to be the same as their SSM account
				objectHash.put("CurrentEmail", userEmail);
			}
			*/

		} catch (Exception e) {
			e.printStackTrace();
		}

		objectHash.put("fk_ssmUserID", userId);

		return objectHash;
	}

	/**
	 * This gets the person info for the given the SIPersonID
	 * DEPRECATED...  Use the methods that return objects instead.  
	 *                 I'm keeping around just in case the references need them
	 * 
	 * returns empty hashtable if not found
	 * 
	 * @param sipersonid
	 * @return Hashtable
	 */
	public Hashtable getSIPersonHash(String sipersonid) {

		Hashtable objectHash = new Hashtable();

		if (sipersonid == null)
			return objectHash;
		//early return //TODO we want to look up other systems first.

		try {

			objectHash = SIUtil.getObjectHash(sipersonid, "SIPersonID", SIAppHandler.PERSONCLASS);
			/*
			 * TODO: need to lookup this user in other systems  
			 * 
			 
			// TODO: Use this to check for previous year's application -- RDH
			if(objectHash == null) { // new user
				objectHash = new Hashtable();
				// Okay, the user is not in the WsnApplication table, but can we pull any info from CRSPerson?
				Hashtable crsHash = info.getWsnApplicationInfoFromCRSPersonWithEmailAddress(userEmail);
				if (crsHash != null)
					objectHash = info.saveObjectHash(crsHash, null, "WsnApplicationID", WsnApplicationClassName);
				else
					objectHash.put("WsnApplicationID", "new");
				// Since WsnApplication email is not yet specified, force it to be the same as their SSM account
				objectHash.put("CurrentEmail", userEmail);
			}
			*/

		} catch (Exception e) {
			e.printStackTrace();
		}

		return objectHash;
	}

	/**
	 * returns siperson with given sipersonid
	 *
	 * @param sipersonid
	 * @return SIPerson
	 */
	public SIPerson getSIPerson(String sipersonid) {

		return SIUtil.getSIPerson(sipersonid);

	}
	
	/**
	 * DEPRECATED...  Use the methods that return objects instead.  
	 *                 I'm keeping around just in case the references need them
	 * getSIApplicationHash -
	 * @param userId
	 * @param personID
	 * @return Hashtable
	 */

	public Hashtable getSIApplicationHash(String userId, String appID) {

		Hashtable objectHash = new Hashtable();

		if (appID == null)
			return objectHash; //early return

		try {

			//TODO: if id == null, look in the other systems to see if we have them already. kb 11/22

			objectHash = SIUtil.getObjectHash(appID, "ApplicationID", SIAppHandler.APPLICATIONCLASS);

			/*
			 * TODO: this was here from copying in from MSInfoBean.  might need to do more here 
			 * 
			 
			// TODO: Use this to check for previous year's application -- RDH
			if(objectHash == null) { // new user
				objectHash = new Hashtable();
				// Okay, the user is not in the WsnApplication table, but can we pull any info from CRSPerson?
				Hashtable crsHash = info.getWsnApplicationInfoFromCRSPersonWithEmailAddress(userEmail);
				if (crsHash != null)
					objectHash = info.saveObjectHash(crsHash, null, "WsnApplicationID", WsnApplicationClassName);
				else
					objectHash.put("WsnApplicationID", "new");
				// Since WsnApplication email is not yet specified, force it to be the same as their SSM account
				objectHash.put("CurrentEmail", userEmail);
			}
			*/
			//objectHash.put("PersonID", personID); need this?

		} catch (Exception e) {
			e.printStackTrace();
		}

		return objectHash;
	}

	/**
	 * returns the personid of the person with the given ssmid
	 * @param userId
	 * @return String
	 */
	private static String getPersonIDBySSM(String userId) throws Exception {
		String SIPersonID = "";
		SIPerson p = new SIPerson();
		p.setFk_ssmUserID(Integer.parseInt(userId));
		//IF THERE ARE MULTIPLE SIPERSONS WITH THIS SSMUSERID, THIS WILL NOT LIKE IT
		if (p.select())
			SIPersonID = p.getSIPersonID();
		return SIPersonID;
	}

	/**
	 * 2/4/03 kb - looks up appid by personid
	 * looks up
	 * @param sipersonid
	 * @return String
	 * @throws Exception
	 */
	private static String getApplicationIDByPersonID(String sipersonid) throws Exception {
		String AppId = "";
		SIApplication a = new SIApplication();
		a.setFk_PersonIDString(sipersonid);
		a.setSiYear(SIUtil.CURRENT_SI_YEAR);
		//IF THERE ARE MULTIPLE SIAPPLICATIONS WITH THIS SIPERSONID, THIS WILL NOT LIKE IT
		if (a.select())
			AppId = a.getApplicationID();
		return AppId;
	}

	/* added 11-25-02 DC
		Used to retrieve a hashtable with the reference of the given applicant's WsnApplicationID and the Reference Type (S, D, R, F).
		Returns NULL if not found.
	*/
	public Hashtable getSIReferenceHashByType(String SIApplicationID, String referenceType) {
		log.debug("SIInfoBean.getSIReferenceHashByType(" + SIApplicationID + ", " + referenceType + ")");
		Hashtable objectHash = new Hashtable();
		try {
			String SIReferenceID = getReferenceIDByType(SIApplicationID, referenceType);
			if (SIReferenceID == "")
				return null;
			objectHash = SIUtil.getObjectHash(SIReferenceID, "ReferenceID", "org.alt60m.hr.si.model.dbio.SIReference");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return objectHash;
	}

	/* added 12-09-02 DC
		Used to retrieve a reference object of the given applicant's WsnApplicationID and the Reference Type (S, D, R, F).
		Returns NULL if not found.
	*/
	public SIReference getSIReferenceByType(String SIApplicationID, String referenceType) {
		log.debug("--->SIInfoBean.getSIReferenceByType(" + SIApplicationID + ", " + referenceType + ")");
		try {
			String SIReferenceID = getReferenceIDByType(SIApplicationID, referenceType);
			if (SIReferenceID == "") {
				SIReference r = new SIReference();
				return r;
			}
			return getSIReference(SIReferenceID);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/** added 11-25-02 DC
	 * returns the ReferenceID of the reference with the given PersonID and ReferenceType
	 * @param userId
	 * @return String
	 */
	public String getReferenceIDByType(String SIApplicationID, String referenceType) throws Exception {
		String SIReferenceID = "";
		SIReference r = new SIReference();
		r.setFk_SIApplicationID(SIApplicationID);
		r.setReferenceType(referenceType);
		Iterator itr = ObjectHashUtil.list(r.selectList()).iterator();
		if (itr.hasNext())
			SIReferenceID = (String) ((Hashtable) itr.next()).get("ReferenceID");
		return SIReferenceID;
	}

	/**
	 * returns the SIReference object with the given SIReferenceID
	 *
	 * @param SIReferenceID
	 * @return SIReference
	 */
	public SIReference getSIReference(String refID) {
		if (refID == null)
			return null; //early return
		SIReference r = null;
		try {
			r = (SIReference) SIUtil.getSIReference(refID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return r;
	}

	public Collection getCurrentProjectsByType(char type) throws Exception {
		String whereClause = "projectType = '" + type + "' AND siYear = \'" + SIUtil.CURRENT_SI_YEAR + "\' AND (onHold <> \'1\') ORDER BY name";
		Collection projects = ObjectHashUtil.list((new SIProject()).selectList(whereClause));
		return projects;
	}

	/* Added 1/24/03 - SML */
	/* This is to work with thisiswhereilive.info */
	public Collection getCurrentProjectsByRegion(String _region, String _type) {
		try {
			String whereClause =
				"upper(partnershipRegion) = upper('"
					+ _region
					+ "') AND projectType = '"
					+ _type 
					+ "' AND siYear = \'"
					+ SIUtil.CURRENT_SI_YEAR
					+ " AND onHold <> \'1\' ORDER BY name";
			Collection projects = ObjectHashUtil.list((new SIProject()).selectList(whereClause));
			return projects;
		} catch (Exception e) {
			log.error("Warning: Unable to perform SIInfoBean.getCurrentProjectsByRegion()!", e);
			return null;
		}
	}

	/* Added 3 December 2002 by RDH. */
	/* "Sometimes it pays to stay in bed in Monday, rather than spending the rest of the week debuging Monday's code." -Dan Salomon */
	public Collection getValidProjects(String region, boolean showAll, String gender, String locationAChoice, String locationBChoice, String locationCChoice) throws Exception {
		String query = "";
		String currYear = SIUtil.CURRENT_SI_YEAR;
		try {
			String today = (new SimpleDateFormat("MM/dd/yyyy")).format(new Date());
			String locatoinChoices = " (project.SIProjectID in (\'" + locationAChoice + "\', \'" + locationBChoice + "\',  \'" + locationCChoice + "\')) or ";
			String dateCheck =
				"(project.studentStartDate > \'"
					+ today
					+ "\') AND (project.studentStartDate is not null) AND (project.studentEndDate > project.studentStartDate) AND (project.siYear = \'"
					+ SIUtil.CURRENT_SI_YEAR
					+ "\')";
			String holdCheck = " AND ((project.onHold <> \'1\') or (project.onHold is null))";
			String maxSAMCheck = "", maxSPMCheck = "", maxSAFCheck = "", maxSPFCheck = "", maxSACheck = "", maxSPCheck = "", maxGenderACheck = "", maxGenderPCheck = "";

			boolean haveRegion = false;
			if ((region != null) && (!(region.trim()).equals("")))
				haveRegion = true;
			String typeCheck = " AND ((project.projectType = 'n')";
			if (haveRegion) {
				typeCheck += " or (project.partnershipRegion = '" + region + "')";
				if (showAll)
					typeCheck += " or ((project.partnershipRegionOnly <> \'1\') or (project.partnershipRegionOnly is null))";
			}
			typeCheck += ")";

			// set male and female values
			String maleValue = "1", femaleValue = "0";

			// To check number of student applicants
			maxSACheck =
				" AND (project.maxNoStudentA >"
					+ " (SELECT Count(application0.assignedToProject) as numSA"
					+ " FROM hr_si_applications as application0 "
					+ " WHERE ((application0.assignedToProject = project.SIProjectID) AND (application0.appStatus <> \'"
					+ SIApplication.STATUS_WITHDRAWN
					+ "\') AND (application0.siYear = \'"
					+ SIUtil.CURRENT_SI_YEAR
					+ "\') ) ) )";
			// To check number of male student applicants
			maxSAMCheck =
				" AND (project.maxNoStudentAMale >"
					+ " (SELECT Count(application2.assignedToProject) as numSAM"
					+ " FROM hr_si_applications as application2 INNER JOIN ministry_person as person2 ON application2.fk_SIPersonID = person2.SIPersonID"
					+ " WHERE ((person2.gender = \'"
					+ maleValue
					+ "\') AND (application2.assignedToProject = project.SIProjectID) AND (application2.appStatus <> \'"
					+ SIApplication.STATUS_WITHDRAWN
					+ "\') AND (application2.siYear = \'"
					+ SIUtil.CURRENT_SI_YEAR
					+ "\') ) ) )";
			// To check number of female student applicants
			maxSAFCheck =
				" AND (project.maxNoStudentAFemale >"
					+ " (SELECT Count(application2.assignedToProject) as numSAM"
					+ " FROM hr_si_applications as application2 INNER JOIN ministry_person as person2 ON application2.fk_SIPersonID = person2.SIPersonID"
					+ " WHERE ((person2.gender = \'"
					+ femaleValue
					+ "\') AND (application2.assignedToProject = project.SIProjectID) AND (application2.appStatus <> \'"
					+ SIApplication.STATUS_WITHDRAWN
					+ "\') AND (application2.siYear = \'"
					+ SIUtil.CURRENT_SI_YEAR
					+ "\') ) ) )";
			// To check number of student participants
			maxSPCheck =
				" AND (project.maxNoStudentP >"
					+ " (SELECT Count(application3.finalProject) as numSP"
					+ " FROM hr_si_applications as application3 "
					+ " WHERE ((application3.finalProject=project.SIProjectID) AND (application3.appStatus <> \'"
					+ SIApplication.STATUS_WITHDRAWN
					+ "\') AND (application3.siYear = \'"
					+ SIUtil.CURRENT_SI_YEAR
					+ "\') ) ) )";
			// To check number of male student participants
			maxSPMCheck =
				" AND (project.maxNoStudentPMale >"
					+ " (SELECT Count(application5.finalProject) as numSPF"
					+ " FROM hr_si_applications as application5 INNER JOIN ministry_person as person5 ON application5.fk_SIPersonID = person5.SIPersonID"
					+ " WHERE ( ( person5.gender = \'"
					+ maleValue
					+ "\') AND (application5.finalProject = project.SIProjectID) AND (application5.appStatus <> \'"
					+ SIApplication.STATUS_WITHDRAWN
					+ "\') AND (application5.siYear=\'"
					+ SIUtil.CURRENT_SI_YEAR
					+ "\') ) ) )";
			// To check number of female student participants
			maxSPFCheck =
				" AND (project.maxNoStudentPFemale >"
					+ " (SELECT Count(application5.finalProject) as numSPF"
					+ " FROM hr_si_applications as application5 INNER JOIN ministry_person as person5 ON application5.fk_SIPersonID = person5.SIPersonID"
					+ " WHERE ( ( person5.gender = \'"
					+ femaleValue
					+ "\') AND (application5.finalProject = project.SIProjectID) AND (application5.appStatus <> \'"
					+ SIApplication.STATUS_WITHDRAWN
					+ "\') AND (application5.siYear=\'"
					+ SIUtil.CURRENT_SI_YEAR
					+ "\') ) ) )";

			if (gender != null) {
				if (gender.equals(maleValue)) { // male
					maxGenderACheck = maxSAMCheck;
					maxGenderPCheck = maxSPMCheck;
				} else if (gender.equals(femaleValue)) { // female
					maxGenderACheck = maxSAFCheck;
					maxGenderPCheck = maxSPFCheck;
				}
			}

			query =
				"SELECT project.SIProjectID, project.name, project.partnershipRegion, project.studentStartDate, project.studentEndDate, project.displayLocation"
					+ " FROM hr_si_project project"
					+ " WHERE"
					+ locatoinChoices
					+ dateCheck
					+ holdCheck
					+ typeCheck
					+ maxSACheck
					+ maxGenderACheck
					+ maxSPCheck
					+ maxGenderPCheck
					+ " ORDER BY project.name";

			Collection projects = ObjectHashUtil.list((new SIProject()).selectSQLList(query));
			return projects;
		} catch (Exception e) {
			log.error("Exception encountered in SIInfoBean.getValidProjects()", e);
			log.debug("Offending query: " + query);
			throw e;
		}
	}

	/* Added 12 December 2002 by RDH. */
	/* "Insanity: doing the same thing over and over again and expecting different results." -Albert Einstein  */
	public String getCampusRegion(String universityFullName, String universityState) {
		try {
			return SIUtil.getCampusRegion(universityFullName, universityState);
		} catch (Exception e) {
			log.error("Exception encountered in SIInfoBean.getCampusRegion()", e);
			return null;
		}
	}

public boolean checkPersonalInfoRequiredFields(SIPerson p) {
		String temp = "";
		
		temp = p.getLastName();
		if (temp == null  ||  temp.trim().equals(""))
			return true;

		temp = p.getFirstName();
		if (temp == null  ||  temp.trim().equals(""))
			return true;

		temp = "";
		temp += p.getCurrentHomePhone();
		temp += p.getCurrentCellPhone();
		if (temp == null  ||  temp.trim().equals(""))
			return true;

		// All required fields are filled in.
		return false;
	}

}
