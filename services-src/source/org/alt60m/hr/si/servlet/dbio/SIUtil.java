package org.alt60m.hr.si.servlet.dbio;

import org.alt60m.crs.model.Person;
import org.alt60m.hr.si.model.dbio.*;
import org.alt60m.ministry.model.dbio.Staff;
import org.alt60m.ministry.model.dbio.TargetArea;
import org.alt60m.wsn.sp.model.dbio.WsnApplication;
import org.alt60m.security.dbio.manager.*;
import org.alt60m.util.DBConnectionFactory;
import org.alt60m.util.ObjectHashUtil;
import org.alt60m.util.Regions;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.util.*;
import java.sql.Connection;
import java.sql.Statement;
import java.text.SimpleDateFormat;

/**
 This class provides utilities to the actionhandlers
 most methods probably copied from other places.
*/

public class SIUtil {
	private static Log log = LogFactory.getLog(SIUtil.class);
	private static boolean debug = true;

	/*
	 * To change the STINT year, all that is needed to do is to change this variable.
	 */
	public static final String CURRENT_SI_YEAR = "2007";
	public static final int CURRENT_SI_YEAR_INT = Integer.parseInt(CURRENT_SI_YEAR);


	/**
	 * Creates a new person and sets the fk_ssmUserid to the given ssmuserid
	 * NOTE: this should only be called once per ssmUserID
	 * @param userId
	 * @return SIPerson
	 * @throws Exception
	 */
	public static SIPerson createPerson(int userId) throws Exception {
		SIPerson p = new SIPerson();
		p.setFk_ssmUserID(userId);
		p.persist();
		return p;
	}

	/**
	 *  Creates a new application and sets the fk_ssmUserid to the given ssmuserid
	 *  and fk_sipersonid to given sipersonid
	 *  NOTE: this should be called only once per ssmUserID
	 * @param userId
	 * @param sipersonid
	 * @return SIApplication
	 * @throws Exception
	 */
	public static SIApplication createApplication(int userId, String sipersonid) throws Exception {
		//next line added kb 2/4/03
		if (sipersonid == null)
			throw new Exception("ERROR! Cannot create Application without sipersonid! (it was null)");
		SIApplication a = new SIApplication();
		a.setFk_ssmUserID(userId); //deprecated--TODO: remove
		a.setFk_PersonIDString(sipersonid);
		Calendar cin = Calendar.getInstance();
		Calendar cout = Calendar.getInstance();
//		cin.setTime(periodBegin);
		cout.clear();
		cout.set(cin.get(Calendar.YEAR), cin.get(Calendar.MONTH), cin.get(Calendar.DATE));
		a.setDateAppStarted(cout.getTime());
		a.setDateAppLastChanged(cout.getTime());
		a.setAppStatus(SIApplication.STATUS_EDITING);
		a.setSiYear(CURRENT_SI_YEAR);

		//we represent unanswered yes/no questions with the value "2"

		a.setHasMinistryConflict(2);
		a.setHasSpecificLocation(2);
		a.setIsDating(2);
		a.setHasCampusPartnership(2);
		a.setIsDatingStint(2);
		a.setIsEvangelismTrainable(2);
		a.setHasLedDiscipleshipGroup(2);
		a.setHasInvolvementSpeakingTongues(2);
		a.setHasCrimeConviction(2);
		a.setHasDrugUse(2);
		a.setIsTobaccoUser(2);
		a.setIsWillingChangeHabits(2);
		a.setIsWillingRefrainAlcohol(2);
		a.setIsWillingAbstainTobacco(2);
		a.setHasSexualGuidelines(2);
		a.setIsCurrentlyDating(2);
		a.setHasHomosexualInvolvement(2);
		a.setHasRecentPornographicInvolvement(2);
		a.setHasRecentSexualImmorality(2);
		a.setHasOtherDateSinceImmorality(2);
		a.setIsAwareMustRaiseSupport(2);
		a.setIsInDebt(2);
		a.setHasOtherFinancialResponsibility(2);
		a.setIsWillingDevelopPartners(2);
		a.setIsCommittedDevelopPartners(2);

		a.persist();

		//set up applicant in SITracker

		Connection connection = DBConnectionFactory.getDatabaseConn();
		Statement statement = connection.createStatement();
		log.debug("Inserting applicant into SITracker");
		statement.executeUpdate("insert into sitrack_tracking (application_id, status) values (" + a.getApplicationID() + ", 'Applicant')");
		statement.close();
		connection.close();
		return a;
	}

	/**
		* retrieves an object generically. if id is null then it creates a new object.
	 * @param id
	 * @param idName
	 * @param className
	 * @return Hashtable
	 * @throws Exception
	 */
	public static Hashtable getObjectHash(String id, String idName, String className) {
		Hashtable objHash = new Hashtable();
		try {
			if ((id != null) && (!id.equals("new"))) {
				if (className.equals("org.alt60m.hr.si.model.dbio.SIApplication")) {
					return getSIApplicationObjectHash(id);
				} else if (className.equals("org.alt60m.hr.si.model.dbio.SIPayment")) {
					return getSIPaymentObjectHash(id);
				} else if (className.equals("org.alt60m.hr.si.model.dbio.SIPerson")) {
					return getSIPersonObjectHash(id);
				} else if (className.equals("org.alt60m.hr.si.model.dbio.SIReference")) {
					return getSIReferenceObjectHash(id);
				} else if (className.equals("org.alt60m.hr.si.model.dbio.SIProject")) {
					return getSIProjectObjectHash(id);
				} else if (className.equals("org.alt60m.hr.si.model.dbio.SIUser")) {
					return getSIUserObjectHash(id);
				}
			} else
				objHash = null;
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			objHash = null;
		}
		return objHash;
	}
	private static Hashtable getSIApplicationObjectHash(String id) {
		SIApplication obj = new SIApplication();
		if (id == null || "".equals(id)) {
			obj.persist();
		} else {
			obj = new SIApplication(id);
		}
		return ObjectHashUtil.obj2hash(obj);
	}
	private static Hashtable getSIPaymentObjectHash(String id) {
		SIPayment obj = new SIPayment();
		if (id == null || "".equals(id)) {
			obj.persist();
		} else {
			obj = new SIPayment(id);
		}
		return ObjectHashUtil.obj2hash(obj);
	}
	private static Hashtable getSIPersonObjectHash(String id) {
		SIPerson obj = new SIPerson();
		if (id == null || "".equals(id)) {
			obj.persist();
		} else {
			obj = new SIPerson(id);
		}
		return ObjectHashUtil.obj2hash(obj);
	}
	private static Hashtable getSIReferenceObjectHash(String id) {
		SIReference obj = new SIReference();
		if (id == null || "".equals(id)) {
			obj.persist();
		} else {
			obj = new SIReference(id);
		}
		return ObjectHashUtil.obj2hash(obj);
	}
	private static Hashtable getSIProjectObjectHash(String id) {
		SIProject obj = new SIProject();
		if (id == null || "".equals(id)) {
			obj.persist();
		} else {
			obj = new SIProject(id);
		}
		return ObjectHashUtil.obj2hash(obj);
	}
	private static Hashtable getSIUserObjectHash(String id) {
		SIUser obj = new SIUser();
		if (id == null || "".equals(id)) {
			obj.persist();
		} else {
			obj = new SIUser(id);
		}
		return ObjectHashUtil.obj2hash(obj);
	}
	/** added 12-2-02 dc
	 * retrieves an object generically given an INTEGER key. if id is null then it creates a new object.
	 * @param id
	 * @param idName
	 * @param className
	 * @return Hashtable
	 * @throws Exception
	 */
	public static Hashtable getObjectHash(int id, String idName, String className) throws Exception {
		return getObjectHash(Integer.toString(id), idName, className);
	}

	/**
	 * getObject returns a populated object with the id and classname given.
	 * @param id
	 * @param idName
	 * @param className
	 * @return Object
	 * @throws Exception
	 */
	public static Object getObject(String id, String idName, String className) throws Exception {
		if (className.equals("org.alt60m.hr.si.model.dbio.SIApplication")) {
			return getSIApplicationObject(id);
		} else if (className.equals("org.alt60m.hr.si.model.dbio.SIPayment")) {
			return getSIPaymentObject(id);
		} else if (className.equals("org.alt60m.hr.si.model.dbio.SIPerson")) {
			return getSIPersonObject(id);
		} else if (className.equals("org.alt60m.hr.si.model.dbio.SIReference")) {
			return getSIReferenceObject(id);
		} else if (className.equals("org.alt60m.hr.si.model.dbio.SIProject")) {
			return getSIProjectObject(id);
		} else if (className.equals("org.alt60m.hr.si.model.dbio.SIUser")) {
			return getSIUserObject(id);
		} else
			return null;
	}
	private static SIApplication getSIApplicationObject(String id) {
		if (id == null || "".equals(id)) {
			SIApplication obj = new SIApplication();
			obj.persist();
			return obj;
		} else {
			return new SIApplication(id);
		}
	}
	private static SIPayment getSIPaymentObject(String id) {
		if (id == null || "".equals(id)) {
			SIPayment obj = new SIPayment();
			obj.persist();
			return obj;
		} else {
			return new SIPayment(id);
		}
	}
	private static SIPerson getSIPersonObject(String id) {
		if (id == null || "".equals(id)) {
			SIPerson obj = new SIPerson();
			obj.persist();
			return obj;
		} else {
			return new SIPerson(id);
		}
	}
	private static SIReference getSIReferenceObject(String id) {
		if (id == null || "".equals(id)) {
			SIReference obj = new SIReference();
			obj.persist();
			return obj;
		} else {
			return new SIReference(id);
		}
	}

	private static SIProject getSIProjectObject(String id) {
		if (id == null || "".equals(id)) {
			SIProject obj = new SIProject();
			obj.persist();
			return obj;
		} else {
			return new SIProject(id);
		}
	}
	private static SIUser getSIUserObject(String id) {
		if (id == null || "".equals(id)) {
			SIUser obj = new SIUser();
			obj.persist();
			return obj;
		} else {
			return new SIUser(id);
		}
	}

	/**
	* getObject returns a populated object with the id and classname given.
	* @param id
	* @param idName
	* @param className
	* @return Object
	* @throws Exception
	*/
	public static Object getObject(int id, String idName, String className) throws Exception {
		return getObject(Integer.toString(id), idName, className);
	}

	// 11-26-02 dc added
	// Deletes an object from the database, with the specified ID for the specified class.
	public static void deleteObject(String className, String objectID) {
		try {
			if (className.equals("org.alt60m.hr.si.model.dbio.SIApplication")) {
				deleteSIApplicationObject(objectID);
			} else if (className.equals("org.alt60m.hr.si.model.dbio.SIPayment")) {
				deleteSIPaymentObject(objectID);
			} else if (className.equals("org.alt60m.hr.si.model.dbio.SIPerson")) {
				deleteSIPersonObject(objectID);
			} else if (className.equals("org.alt60m.hr.si.model.dbio.SIReference")) {
				deleteSIReferenceObject(objectID);
			} else if (className.equals("org.alt60m.hr.si.model.dbio.SIProject")) {
				deleteSIProjectObject(objectID);
			} else if (className.equals("org.alt60m.hr.si.model.dbio.SIUser")) {
				deleteSIUserObject(objectID);
			}
		} catch (Exception e) {
			log.error("Failed to delete object of type \"" + className + "\" with ID \"" + objectID + "\". [SIUtil.deleteObject] e=" + e, e);
		}
	}
	private static void deleteSIApplicationObject(String objectID) {
		SIApplication obj = new SIApplication(objectID);
		obj.delete();
	}
	private static void deleteSIPaymentObject(String objectID) {
		SIPayment obj = new SIPayment(objectID);
		obj.delete();
	}
	private static void deleteSIPersonObject(String objectID) {
		SIPerson obj = new SIPerson(objectID);
		obj.delete();
	}
	private static void deleteSIReferenceObject(String objectID) {
		SIReference obj = new SIReference(objectID);
		obj.delete();
	}
	private static void deleteSIProjectObject(String objectID) {
		SIProject obj = new SIProject(objectID);
		obj.delete();
	}
	private static void deleteSIUserObject(String objectID) {
		SIUser obj = new SIUser(objectID);
		obj.delete();
	}

	/**
	 * returns a hashtable of payments for a given application
	 * pasted from msinfo without much changes.  kb 12/3/02
	 * returns an entry "ErrorMessage" if there was an error.
	 *
	 * @param appid
	 * @return Hashtable
	 */
	public static Hashtable getPaymentsForApplication(String appid) {
		Hashtable ht = new Hashtable();
		String paymentid = null;
		String posted = null;
		String pending = "Pending";

		if (appid == null) {
			ht.put("ErrorMessage", "ApplicationID was null in getPaymentsForApplication.  Couldn't lookup payments.");
			return ht;
		}
		try {
			String whereClause = "fk_ApplicationID = '" + appid + "' AND paymentFor='STINT System'";
			Collection c = ObjectHashUtil.list((new SIPayment()).selectList(whereClause));
			if (c.size() > 1)
				log.warn("WARNING! There are multiple payments for this application!");
			if (c.size() == 0)
				log.debug("There are no payments for this application (thats ok)");
			else {
				Hashtable h = null;
				for (Iterator i = c.iterator(); i.hasNext();) {
					h = (Hashtable) i.next();

					if (h != null) {
						paymentid = (String) h.get("PaymentID");
						posted = h.get("Posted").toString();

						if(posted.equals("false")) {
							h.put("PageDisplay", pending);
						}
						else {
							h.put("PageDisplay", "");
						}

						//debug--simply outputs the contents of the returned hashtable from the directsql call
						for (Iterator ii = h.keySet().iterator(); ii.hasNext();) {
							String key = (String) ii.next();
							String val = h.get(key).toString();
						}
						ht.put(paymentid, h); //puts into returned hashtable
					}
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			ht.put("ErrorMessage", "Error=" + e.getMessage());
		}
		return ht;
	}
	public static Hashtable getApplicationPaymentForStaff(String appid, String payid) {
		Hashtable ht = new Hashtable();
		Hashtable h = null;
        String paymentid = null;
		String posted = null;
		String pending = "Pending";

		if (appid == null) {
			ht.put("ErrorMessage", "ApplicationID was null in getPaymentsForApplication.  Couldn't lookup payments.");
			return ht;
		}
		try {
			String whereClause = "fk_ApplicationID = '" + appid + "' AND paymentID = '" + payid + "' AND paymentFor='STINT System'";
			Collection c = ObjectHashUtil.list((new SIPayment()).selectList(whereClause));
			if (c.size() > 1)
				log.warn("WARNING! There are multiple payments for this application!");
			if (c.size() == 0)
				log.debug("There are no payments for this application (thats ok)");
			else {
				for (Iterator i = c.iterator(); i.hasNext();) {
					h = (Hashtable) i.next();

					if (h != null) {
						paymentid = (String) h.get("PaymentID");

						log.debug("found a 'PaymentID': " + paymentid + " for person " + appid);

						//debug--simply outputs the contents of the returned hashtable from the directsql call
						for (Iterator ii = h.keySet().iterator(); ii.hasNext();) {
							String key = (String) ii.next();
							String val = h.get(key).toString();
						}
						ht.put(paymentid, h); //puts into returned hashtable
					}
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			ht.put("ErrorMessage", "Error=" + e.getMessage());
		}
		return h; // disregard multiple hashtables for this fix
	}

	/**
	 * returns the number of references for a given application
	 * @param appid
	 * @return int
	 */
	public static int getNumberOfReferences(String appid) {
		int numrefs = 0;

		if (appid == null) {
			log.debug("ApplicationID was null in getNumberOfReferences.  Couldn't lookup references.");
			return numrefs;
		}
		try {
			SIReference ref = new SIReference();
			String qry = "select count(*) as refcount from hr_si_reference where fk_siapplicationid = " + appid;
			numrefs = ObjectHashUtil.countIt(ref, qry);

			log.debug("getNumberOfReferences found(int): " + numrefs);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return numrefs;
	}

	/**
	 * changes any occurrence of ' to ''  call with: (string, 0)
	 * @param target
	 * @param fromIndex
	 * @return String
	 */
	public static String doubleApostrophe(String target, int fromIndex) {
		// (recursive)
		StringBuffer sbuf = new StringBuffer("");
		//see if there is an apostrophe in the target
		int apindex = target.indexOf("'", fromIndex);
		if (apindex > -1) {
			//so we have an apostrophe in target.
			//add the chars up to and including the apostrophe to sbuf
			sbuf.append(target.substring(fromIndex, apindex));
			//add the double apostrophe
			sbuf.append("''");
			//now recursively add the rest
			sbuf.append(doubleApostrophe(target, apindex + 1));

		} else {
			//just do a return here for efficiency sake
			return target.substring(fromIndex, target.length());
		}

		return sbuf.toString();
	}

	// added dc 12/04/02 - looks up a list of possible staff members for the application reference page
	public static Hashtable getReferenceFindStaff(String firstName, String lastName) {
		Hashtable retvals = new Hashtable();
		try {
			if (firstName == null || lastName == null || "".equals(firstName) || "".equals(lastName)) {
				retvals.put("ErrorMessage", "You must enter 1 or more letters of the first name, and the entire last name.");
				return retvals;
			}

			// if either name has an apostrophe in it, change to '' instead.
			firstName = doubleApostrophe(firstName, 0);
			lastName = doubleApostrophe(lastName, 0);

			// find matching staff, but be sure to exclude "secure" staff (those in closed countries has isSecure="T")
			// This should be working the same as the FindStaff on the Payment pages.
			String whereClause = "isSecure = 'F' AND firstname like '" + firstName + "%' AND lastname='" + lastName + "'";
			Collection c = ObjectHashUtil.list((new Staff()).selectList(whereClause));

			for (Iterator i = c.iterator(); i.hasNext();) {
				Hashtable h = (Hashtable) i.next();
				String toput = "AccountNo=" + (String) h.get("AccountNo");
				String name = (String) h.get("FirstName") + " " + (String) h.get("LastName");
				retvals.put(name, toput);
				log.debug("Found a match: " + toput);
			}
		} catch (Exception e) {
			retvals.put("ErrorMessage", "There was an error with your request: " + e.getMessage());
			return retvals;
		}
		return retvals;
	}

	// added dc 12/04/02 - retrieves the specific ministry_staff record, and returns their info for loading into a reference
	public static Hashtable getReferenceStaffMember(String staffNo) {
		Hashtable retvals = new Hashtable();
		try {
			if (staffNo == null)
				return retvals;

			String whereClause = "accountno='" + staffNo + "'";
			Collection c = ObjectHashUtil.list((new Staff()).selectList(whereClause));
			Staff s = new Staff(staffNo);

			// put it into a hashtable
			retvals = ObjectHashUtil.obj2hash(s);

			Hashtable h1 = ObjectHashUtil.obj2hash(s.getPrimaryAddress());
			retvals.put("Address1", (h1.get("Address1") == null) ? "" : h1.get("Address1"));
			retvals.put("Address2", (h1.get("Address2") == null) ? "" : h1.get("Address2"));
			retvals.put("City", (h1.get("City") == null) ? "" : h1.get("City"));
			retvals.put("State", (h1.get("State") == null) ? "" : h1.get("State"));
			retvals.put("Zip", (h1.get("Zip") == null) ? "" : h1.get("Zip"));

		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return retvals;
		}
		return retvals;
	}

	/**
	*  returns the siperson with the given id.  returns null on fail/error/notfound
	*/
	public static SIPerson getSIPerson(String id) {
		return new SIPerson(id);
	}

	/**
	*  returns the siapplication with the given id.  returns null on fail/error/notfound
	*/
	public static SIApplication getSIApplication(String appid) {
		return new SIApplication(appid);
	}

	public static SIReference getSIReference(String refid) {
		return new SIReference(refid);
	}

	public static Collection getSIAppsCollections(String regionID, String yearID) {
		try {
			ArrayList containerID = new ArrayList();
			ArrayList readyID = new ArrayList();
			ArrayList inProcessID = new ArrayList();
			ArrayList startedID = new ArrayList();
			String hr_si_Person = "";
			String hr_si_Application = "";
			String hr_si_Reference = "";
			String sqlYear = "";
			SIApplication a = null;
			SIReference r = null;


			String sql;

			hr_si_Person = "ministry_person";
			hr_si_Application = "hr_si_applications";
			hr_si_Reference = "hr_si_reference";
			a = new SIApplication();
			r = new SIReference();
			sqlYear = yearID;

			sql = "SELECT a.* FROM " + hr_si_Application + " as a INNER JOIN " + hr_si_Person + " as p ON a.fk_PersonID = p.PersonID and a.siYear = '" + sqlYear + "' WHERE ";

			if ("".equals(regionID.trim()))
				//sql += "p.region IS NULL ";
				//4-8-03 kl: removed IS NULL in SQL query, was not processing the apps with 'Unassigned' regions
				sql += "rtrim(p.region) = '' ";
			else
				sql += "p.region = '" + regionID + "'";
			//4-15-03 kl: add SQL sort ORDER BY p.lastName
			sql += "ORDER BY p.lastName";

			Collection appID = ObjectHashUtil.list((a).selectSQLList(sql));

			// Start of main loop, while siApplicants hasnext
			for (Iterator i = appID.iterator(); i.hasNext();) {
				Hashtable h = (Hashtable) i.next();

				if (h != null) {
					// Applicant variables
					String appid = (String) h.get("ApplicationID");
					String dateSubmitted = String.valueOf(h.get("DateSubmitted"));
					if (dateSubmitted.equalsIgnoreCase("null"))
								dateSubmitted = "";
					String isPaid = h.get("IsPaid").toString();

					// get references for each ApplicationID
					String whereClause = "fk_SIApplicationID = " + appid;
					r = new SIReference();
					Collection refID = ObjectHashUtil.list((r).selectList(whereClause));
					//Collection refID = ObjectHashUtil.list((new SIReference_Parent()).selectList(whereClause));

					// Reference variables
					String siReferenceType = "";
					String staffReference = "";
					String disciplerReference = "";
					String roommateReference = "";
					String friendReference = "";
					String srLastName = "";
					String drLastName = "";
					String rrLastName = "";
					String frLastName = "";
					String srFormSubDate = "";
					String drFormSubDate = "";
					String rrFormSubDate = "";
					String frFormSubDate = "";

					// Start sub loop get references while siReferences hasnext
					for (Iterator ir = refID.iterator(); ir.hasNext();) {
						Hashtable hr = (Hashtable) ir.next();

						// find reference
						siReferenceType = (String) hr.get("ReferenceType");
						// Staff reference
						if (siReferenceType.equals("S")) {
							staffReference = (String) hr.get("ReferenceID");
							srLastName = (String) hr.get("LastName");
							srFormSubDate = String.valueOf(hr.get("FormSubmittedDate"));
							if (srFormSubDate.equalsIgnoreCase("null"))
								srFormSubDate = "";
						}
						// Discipler reference
						if (siReferenceType.equals("D")) {
							disciplerReference = (String) hr.get("ReferenceID");
							drLastName = (String) hr.get("LastName");
							drFormSubDate = String.valueOf(hr.get("FormSubmittedDate"));
							if (drFormSubDate.equalsIgnoreCase("null"))
								drFormSubDate = "";
						}
						// Roommate reference
						if (siReferenceType.equals("R")) {
							roommateReference = (String) hr.get("ReferenceID");
							rrLastName = (String) hr.get("LastName");
							rrFormSubDate = String.valueOf(hr.get("FormSubmittedDate"));
							if (rrFormSubDate.equalsIgnoreCase("null"))
								rrFormSubDate = "";
						}
						// Friend reference
						if (siReferenceType.equals("F")) {
							friendReference = (String) hr.get("ReferenceID");
							frLastName = (String) hr.get("LastName");
							frFormSubDate = String.valueOf(hr.get("FormSubmittedDate"));
							if (frFormSubDate.equalsIgnoreCase("null"))
								frFormSubDate = "";
						}
					}

					// check for Ready Applications -- find dateSubmitted, isPaid and FormSubDate

					if ((!dateSubmitted.equals("")) && (!isPaid.equals("false")) && (!srFormSubDate.equals("")) && (!drFormSubDate.equals("")) && (!rrFormSubDate.equals("")) && (!frFormSubDate.equals(""))) {
						Hashtable hr = new Hashtable(1);
						hr.put("ApplicationID", appid);
						readyID.add(hr);
					}

					// check for InProcess Applications -- find dateSubmitted OR isPaid OR FormSubDate
					else if ((!dateSubmitted.equals("")) || (!isPaid.equals("false")) || (!srFormSubDate.equals("")) || (!drFormSubDate.equals("")) || (!rrFormSubDate.equals("")) || (!frFormSubDate.equals(""))) {
						Hashtable hi = new Hashtable(1);
						hi.put("ApplicationID", appid);
						inProcessID.add(hi);
					}

					// check for Started Applications -- find lastname
					else if ((!srLastName.equals("")) || (!drLastName.equals("")) || (!rrLastName.equals("")) || (!frLastName.equals("")))
					{
						Hashtable hs = new Hashtable(1);
						hs.put("ApplicationID", appid);
						startedID.add(hs);
					}
				}
			}
			// build tub container of arrays for 3 collectinos AND return to SIInforBean, projectview.jsp & SIAdminHandler
			Hashtable tub = new Hashtable();
			tub.put("ReadyID", readyID);
			tub.put("InProcessID", inProcessID);
			tub.put("StartedID", startedID);
			containerID.add(tub);
			return (Collection) containerID;
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return null;
		}
	}

	/**
	*  returns application id for a given personid and a given year
	*/
	public static String getApplicationForPerson(String personid, String siYear) {
		if (personid == null) {
			return null;
		}
		String appid = "";
		try {
			String whereClause = "fk_PersonID = '" + personid + "' AND siYear = '" + siYear + "'";
			Collection c = ObjectHashUtil.list((new SIApplication()).selectList(whereClause));
			for (Iterator i = c.iterator(); i.hasNext();) {
				Hashtable h = (Hashtable) i.next();
				if (h != null) {
					appid = (String) h.get("ApplicationID");
					log.debug("Found ApplicationID: " + appid);
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return null;
		}
		log.debug("getApplicationForPerson returning: " + appid);
		return appid;
	}

	// added 6 December 2002 by RDH
	public static SIPerson getSIAdministrator(String staffSiteProfileID) throws Exception {
		try {
			SIPerson p = new SIPerson();
			p.setFk_StaffSiteProfileID(Integer.parseInt(staffSiteProfileID));
			if (p.select()) return p;
			else return null;
		} catch (Exception e) {
			log.error("Exception caught whil trying to get SIAdministrator with staffSiteProfileID: " + staffSiteProfileID, e);
			throw e;
		}
	}


	/**
	 * Finds and returns a staff person with the email address that is given.
	 *
	 * @param email
	 * @return Staff
	 */
	public static Staff getStaffPersonByEmail(String email) {
		try {
			if (email == null || "".equals(email))
				return null;

			Staff person = new Staff();
			person.setEmail(email);
			if (person.select()) {
				return person;
			} else {
				log.debug("-->Didn't find matching Staff.");
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}



	/**
	 * Creates an SIPerson object from a Staff person object.
	 * @param s
	 * @param si_ssm_id
	 * @return SIPerson
	 */
	public static SIPerson createSIPersonFromStaffPerson(Staff s, int si_ssm_id) {
		SIPerson p = new SIPerson();
		try {
			p.setFk_ssmUserID(si_ssm_id);

			//set all other fields

			p.setCurrentEmail(s.getEmail());
			p.setFirstName(s.getFirstName());
			p.setMiddleName(s.getMiddleInitial());
			p.setLastName(s.getLastName());
			p.setGender(s.getIsMale() ? "T" : "F");
			if (s.getCurrentAddress() != null) {
				p.setCurrentAddress1(s.getCurrentAddress().getAddress1());
				p.setCurrentAddress2(s.getCurrentAddress().getAddress2());
				p.setCurrentCity(s.getCurrentAddress().getCity());
				p.setCurrentState(s.getCurrentAddress().getState());
				p.setCurrentZip(s.getCurrentAddress().getZip());
			}
			if (s.getPrimaryAddress() != null) {
				p.setPermAddress1(s.getPrimaryAddress().getAddress1());
				p.setPermAddress2(s.getPrimaryAddress().getAddress2());
				p.setPermCity(s.getPrimaryAddress().getCity());
				p.setPermState(s.getPrimaryAddress().getState());
				p.setPermZip(s.getPrimaryAddress().getZip());
			}
			p.setCurrentHomePhone(s.getHomePhone());
			p.setMaritalStatus(s.getMaritalStatus());
			p.setIsStaff(true); //since we got it out of the staff table.
			//Is this ALWAYS a good assumption?

			p.persist();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return null;
		}
		return p;
	}

	private static String getCampusRegionByName(String universityFullName, String universityState) {
		TargetArea ta = new TargetArea();
		ta.setName(universityFullName);
		ta.setState(universityState);
		try {
			ta.select();
			return ta.getRegion();
		} catch (Exception e) { //likely because multiple campuses returned
			if (universityState != null && !(universityState.trim()).equals("")) {
				return Regions.getRegion(universityState);
			} else {
				log.error("Cannot get region for university: " + universityFullName + "; state: " + universityState, e);
				return null;
			}
		}
	}

	/* Added 12 December 2002 by RDH */
	// returns null if not found, throws exception on error
	/* "It's not failure, but low aim is crime." -Lowell */
	public static String getCampusRegion(String universityFullName, String universityState) {
		if (debug) {
			log.debug("SIUtil.getCampusRegion() says:");
			log.debug("university name: " + universityFullName);
			log.debug("university state: " + universityState);
		}
		if ((universityFullName != null) && !(universityFullName.trim()).equals("")) {
			return getCampusRegionByName(universityFullName, universityState);
		} else if (universityState != null && !(universityState.trim()).equals("")) {
			return Regions.getRegion(universityState);
		} else {
			return null;
		}
	}

	public boolean isUserAuthorized(String userName, String role) {
		try {
			boolean authorized = false;
			if (!userName.equals("")) {
				SimpleSecurityManager ssm = new SimpleSecurityManager();
				int userID = ssm.getUserID(userName);
				SimpleDateFormat redoDate = new SimpleDateFormat("yyyy-MM-dd");
				Date today = redoDate.parse(redoDate.format(new Date()));

				String whereClause = "fk_ssmUserID='"+userID+"'";
				Iterator i = (new SIUser()).selectList(whereClause).iterator();
				while (i.hasNext()) {
					SIUser user = (SIUser) i.next();
					Date expire = redoDate.parse(redoDate.format(user.getExpirationDate()));
					if (role.equals(user.getRole()) && user.getExpirationDate() != null && 1 > today.compareTo(expire))
						authorized = true;
				}
			}
			return authorized;
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return false;
		}
	}

	/** added 3-4-03 kl:  added for refs.jsp stafflist popup processing
	 * returns the ReferenceID of the reference with the given PersonID and ReferenceType
	 * @param userId
	 * @return String
	 */
	public static SIReference getReferenceIDByType(String SIApplicationID, String referenceType) {
		try {
			SIReference siReference = new SIReference();
			siReference.setFk_SIApplicationID(SIApplicationID);
			siReference.setReferenceType(referenceType);
			siReference.select();
			if (siReference != null)
				return siReference;
			else {
				log.warn("WARNING: SIUtil.getReferenceIDByType returning null...");
				return null;
			}
		} catch (Exception e) {
			log.error("Warning: Unable to perform SIUtil.getReferenceIDByType()! Reason:", e);
			return null;
		}
	}
}
