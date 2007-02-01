package org.alt60m.hr.ms.servlet.dbio;

import org.alt60m.hr.ms.model.dbio.*;
import org.alt60m.wsn.sp.model.dbio.*;
import org.alt60m.ministry.model.dbio.*;
import org.alt60m.util.OnlinePayment;
import org.alt60m.util.SendMessage;
import org.alt60m.util.ObjectHashUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.text.SimpleDateFormat;
import java.util.*;

public class MSInfo {
	private static Log log = LogFactory.getLog(MSInfo.class);
	
	public static final String CURRENT_WSN_YEAR = "2007";
	public static final int CURRENT_WSN_YEAR_INT = Integer.parseInt(CURRENT_WSN_YEAR);
	
	private static final String APPFEE = "25";
	private static final Date APPFEEDEADLINE = new Date("02/25/" + CURRENT_WSN_YEAR); //for 2003, always $25
	private static final String APPFEELATE = "35";
	private static final String AUTHNETPASSWORD = "Summerproj1";
	private static final String MERCHANTACCTNUM = "campussummer*1";
	private static final boolean PAYMENTTESTMODE = false;

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

	private final String EMAILFROM = "help@campuscrusadeforchrist.com";
	private final String WsnApplicationClassName = "org.alt60m.wsn.sp.model.dbio.WsnApplication";
	private final String WsnProjectClassName = "org.alt60m.wsn.sp.model.dbio.WsnProject";
	private void deleteMSPaymentObject(String objectID) {
		MSPayment obj = new MSPayment(objectID);
		obj.delete();
	}
	/*
	10-11-02 Note! Could not get this to work!  Tried with the reference object in MSController.java.refFormSubmit().
	
	// 10-11-02 dc added
	// Same as saveObjectHash, but give it an object, not a hash table
	// Returns the saved object, or null on failure.
	public Object saveObject(Object obj, String id, String idName, String className) {
		try {
			log.debug("-->saveObject: hs = ObjectAdaptor.obj2hash(obj);");
			Hashtable hs = ObjectAdaptor.obj2hash(obj);	// convert object to be saved to hashtable
			log.debug("-->saveObject: hs = saveObjectHash(hs, id, idName, className);");
			log.debug("-->id=" + id + " idName=" + idName + " className=" + className);
			hs = saveObjectHash(hs, id, idName, className);
			log.debug("-->saveObject: Object newObj = (Class.forName(className)).newInstance();");
			Object newObj = (Class.forName(className)).newInstance();
			log.debug("-->saveObject: ObjectAdaptor.hash2obj(hs, newObj);");
			ObjectAdaptor.hash2obj(hs, newObj);
			return newObj;
		}
		catch (Exception e) {
			log.error(e);
			return null;
		}
	}
	*/

	// 10-21-02 dc added
	// Deletes an object from the database, with the specified ID for the specified class.
	public void deleteObject(String className, String objectID) {
		try {
			if (className.equals("org.alt60m.wsn.sp.model.dbio.WsnApplication")) {
				deleteWsnApplicationObject(objectID);
			} else if (className.equals("org.alt60m.wsn.sp.model.dbio.WsnProject")) {
				deleteWsnProjectObject(objectID);
			} else if (className.equals("org.alt60m.wsn.sp.model.dbio.WsnReference")) {
				deleteWsnReferenceObject(objectID);
			} else if (className.equals("org.alt60m.wsn.sp.model.dbio.WsnEvaluation")) {
				deleteWsnEvaluationObject(objectID);
			} else if (className.equals("org.alt60m.hr.ms.model.dbio.MSPayment")) {
				deleteMSPaymentObject(objectID);
			}
		} catch (Exception e) {
			log.error("Failed to delete object of type \"" + className + "\" with ID \"" + objectID + "\". [MSInfo.deleteObject] e=" + e);
		}
	}

	//added 3/5/03 - kb
	/**
	 * removes an S2 reference if it exists.
	 */
	public void deleteS2IfExists(String WsnApplicationID) {
		log.debug("Deleting (if exists) S2 Reference for : " + WsnApplicationID);
		if (WsnApplicationID == null)
			return;
		try {
			WsnReference wsnReference = new WsnReference();
			wsnReference.setWsnApplicationIdStr(WsnApplicationID);
			wsnReference.setReferenceType("S2");
			if (wsnReference.select())
				wsnReference.delete();
		} catch (Exception e) {
			log.error("Problem deleting S2 Reference for: " + WsnApplicationID, e);
		}
	}
	private void deleteWsnEvaluationObject(String objectID) {
		WsnEvaluation obj = new WsnEvaluation(objectID);
		obj.delete();
	}
	private void deleteWsnApplicationObject(String objectID) {
		WsnApplication obj = new WsnApplication(objectID);
		obj.delete();
	}
	private void deleteWsnProjectObject(String objectID) {
		WsnProject obj = new WsnProject(objectID);
		obj.delete();
	}
	private void deleteWsnReferenceObject(String objectID) {
		WsnReference obj = new WsnReference(objectID);
		obj.delete();
	}

	//kb 10/28/02 - emails the applicant about the staff having paid their app fee.
	private boolean emailPaymentStaffAcceptance(String WsnApplicationid) {
		try {
			WsnApplication person = new WsnApplication(WsnApplicationid);

			String applicantFullName = person.getLegalFirstName() + " " + person.getLegalLastName();
			String applicantEmailAddress = person.getCurrentEmail();

			StringBuffer text = new StringBuffer("Dear ");
			text.append(applicantFullName);
			text.append(":\n\n");
			text.append("A staff member has just paid for your application via account transfer.  Your application is now ready to be processed!");
			text.append("Thank you very much.\n\n");
			text.append("Sincerely,\n");
			text.append("Campus Crusade for Christ\n\n\n");

			log.debug("TEXT=" + text.toString() + "=");
			log.debug("person.getCurrentEmail()=" + applicantEmailAddress);
			log.debug("fromEmailAddress=" + this.EMAILFROM);

			SendMessage msg = new SendMessage(); //"smtp.comcast.net"
			msg.setTo(applicantEmailAddress);
			msg.setFrom(EMAILFROM);
			msg.setSubject("Application Payment Notification");
			msg.setBody(text.toString());

			msg.send();

			return true;
		} catch (Exception e) {
			log.error("emailpaymentstaffacceptance(): send email failed.", e);
			return false;
		}
	}

	//kb 10/28/02 - emails the applicant about the staff having paid their app fee.
	private boolean emailPaymentStaffRefusal(String WsnApplicationid) {
		try {
			WsnApplication person = new WsnApplication(WsnApplicationid);

			String applicantFullName = person.getLegalFirstName() + " " + person.getLegalLastName();
			String applicantEmailAddress = person.getCurrentEmail();

			StringBuffer text = new StringBuffer("Dear ");
			text.append(applicantFullName);
			text.append(":\n\n");
			text.append("The staff member you requested payment from for your Application has just ");
			text.append("notified us of their refusal to pay.  Please contact them or make other payment ");
			text.append("arrangements.  You can log onto the system and pay via credit card or check/money order.\n\n");
			text.append("Sorry for the inconvenience...  Please remember your application will not be processed until the fee is paid.\n\n");
			text.append("Sincerely,\n");
			text.append("Campus Crusade for Christ\n\n\n");

			log.debug("TEXT=" + text.toString() + "=");
			log.debug("person.getCurrentEmail()=" + applicantEmailAddress);
			log.debug("fromEmailAddress=" + this.EMAILFROM);

			SendMessage msg = new SendMessage(); //"smtp.comcast.net"
			msg.setTo(applicantEmailAddress);
			msg.setFrom(EMAILFROM);
			msg.setSubject("Application Payment Notification");
			msg.setBody(text.toString());

			msg.send();

			return true;
		} catch (Exception e) {
			log.error("emailpaymentstaffacceptance(): send email failed.", e);
			return false;
		}

	}

	//kb 11/4
	//returns the application fee.  currently based on a 
	// cutoff date.  So if today is before or equal to
	// the APPFEEDEADLINE then charge the APPFEE if after, charge
	// the APPFEELATE
	public String getApplicationFee() {
		if (APPFEEDEADLINE.after(new Date())) {
			return APPFEE;
		} else {
			return APPFEELATE;
		}
	}
	// Added 20 Novmber 2002 by RDH.
	public Hashtable getAssosciateProjectDirector(String projectID) {
		try {
			WsnProject project = new WsnProject(projectID);
			WsnApplication apd = project.getIsAPD();
			if (apd != null)
				return ObjectHashUtil.obj2hash(apd);
			else
				return null;
		} catch (Exception e) {
			log.error("Warning: Unable to perform MSInfo.getAssosciateProjectDirector()!", e);
			return null;
		}
	}

	/* Added 8 November 2002 by RDH */
	// returns null if not found, throws exception on error
	/* "It's not failure, but low aim is crime." -Lowell */
	public String getCampusRegion(String universityFullName, String universityState) throws Exception {
		try {
			String theRegion = new String();
			if ((universityFullName != null) && !(universityFullName.trim()).equals("")) {
				theRegion = getCampusRegionByName(universityFullName);
			} else if ((universityState != null) && !(universityState.trim()).equals("")) {
				/* Okay, I know this isn't the best (i.e., most accurate) way to do this.
					I don't know if there is code somewhere else to do this or not. I was told
					this may have come up elsewhere (getting staff from poplesoft?) but I
					couldn't find it anywhere. So we're stuck with this unless someone else
					knows a better way to do this --RDH */
				Hashtable stateRegions = new Hashtable();
				// Regions::= "NE", "MA", "MS", "SE", "GL", "UM", "GP", "RR", "NW", "SW", "NC"
				stateRegions.put("AK", "NW");
				stateRegions.put("AL", "SE");
				stateRegions.put("AR", "RR");
				stateRegions.put("AZ", "SW");
				stateRegions.put("CA", "SW");
				stateRegions.put("CO", "GP");
				stateRegions.put("CT", "NE");
				stateRegions.put("DE", "MA");
				stateRegions.put("FL", "SE");
				stateRegions.put("GA", "SE");
				stateRegions.put("HI", "SW");
				stateRegions.put("IA", "UM");
				stateRegions.put("ID", "NW");
				stateRegions.put("IL", "GL");
				stateRegions.put("IN", "GL");
				stateRegions.put("KS", "GP");
				stateRegions.put("KY", "MS");
				stateRegions.put("LA", "RR");
				stateRegions.put("MA", "NE");
				stateRegions.put("MD", "MA");
				stateRegions.put("ME", "NE");
				stateRegions.put("MI", "GL");
				stateRegions.put("MN", "UM");
				stateRegions.put("MO", "GP");
				stateRegions.put("MS", "SE");
				stateRegions.put("MT", "NW");
				stateRegions.put("NC", "MS");
				stateRegions.put("ND", "UM");
				stateRegions.put("NE", "GP");
				stateRegions.put("NH", "NE");
				stateRegions.put("NJ", "MA");
				stateRegions.put("NM", "GP");
				stateRegions.put("NV", "NW");
				stateRegions.put("NY", "NE");
				stateRegions.put("OH", "GL");
				stateRegions.put("OK", "RR");
				stateRegions.put("OR", "NW");
				stateRegions.put("PA", "MA");
				stateRegions.put("RI", "NE");
				stateRegions.put("SC", "MS");
				stateRegions.put("SD", "UM");
				stateRegions.put("TN", "MS");
				stateRegions.put("TX", "RR");
				stateRegions.put("UT", "NW");
				stateRegions.put("VA", "MA");
				stateRegions.put("VT", "NE");
				stateRegions.put("WA", "NW");
				stateRegions.put("WI", "UM");
				stateRegions.put("WV", "MA");
				stateRegions.put("WY", "GP");
				stateRegions.put("DC", "MA"); // I think ...
				// All that for this line ...
				if (stateRegions.containsKey(universityState))
					theRegion = (String) stateRegions.get(universityState.toUpperCase());
				else
					return null;
			} else
				return null;
			return theRegion;
		} catch (Exception e) {
			log.error("Exception encountered in MSInfo.getCampusRegion()", e);
			throw e;
		}
	}

	/* Created 8 November 2002 RDH */
	public String getCampusRegionByName(String universityFullName) throws Exception {
		try {
			org.alt60m.ministry.model.dbio.TargetArea ta = new org.alt60m.ministry.model.dbio.TargetArea();
			ta.setName(universityFullName);
			ta.select();
			if (ta != null)
				return ta.getRegion();
			else
				return null;
		} catch (Exception e) {
			log.error("Failed to getCampusRegionByName()!", e);
			throw e;
		}
	}

	/* This function gets the info for all the projects in the database.
		 Created 10 September 2002 RDH
		   Re-written 6 November 2002 to use getOpenProjectsByType RDH
	*/
	public Collection getCurrentProjects() throws Exception {
		/* 5 Kinds of projects to get:
				  U.S. (u)
				  W.S.N. (w)
				  School of Leadership (s)
				  Regional (r)
				  Institute of Biblical Studies (i)
		*/
		Collection projects = getCurrentProjectsByType('u'); // get US Summer Projects
		projects.addAll(getCurrentProjectsByType('w')); // add WSN Projects
		projects.addAll(getCurrentProjectsByType('s')); // add SOL Projects
		projects.addAll(getCurrentProjectsByType('r')); // add regional Projects
		projects.addAll(getCurrentProjectsByType('i')); // add IBS Projects

		return projects;
	}

	/* Created 30 October 2002 RDH */
	public Collection getCurrentProjectsByType(char type) throws Exception {
		WsnProjectLight project = new WsnProjectLight();
		project.changeTargetTable("wsn_sp_viewcurrentprojects");  //only includes projects that aren't full for both men and women
		String today = (new SimpleDateFormat("MM/dd/yyyy")).format(new Date());
		String whereClause = "(projectType = '" + type + "')" + " AND (studentStartDate > '" + today + "')" + " AND (studentEndDate > '" + today + "')" + " AND (onHold <> \'1\')" + " AND (wsnYear = '" + CURRENT_WSN_YEAR + "')" + " ORDER BY name";
		Collection projects = ObjectHashUtil.list((project).selectList(whereClause));
		return projects;
	}

	/* Created 1/24/03 - SML */
	/* This is to work with thisiswhereilive.info */
	public Collection getCurrentWsnProjectsByRegion(String _region, String _type) throws Exception {
		WsnProjectLight project = new WsnProjectLight();
		project.changeTargetTable("wsn_sp_viewcurrentprojects");
		String today = (new SimpleDateFormat("MM/dd/yyyy")).format(new Date());
		return project.selectList("(projectType = '" + _type + "')" + " AND (upper(partnershipRegion) = upper('" + _region + "'))" + " AND (studentStartDate > '" + today + "')" + " AND (studentEndDate > '" + today + "')" + " AND (onHold <> \'1\')" + " AND (wsnYear = '" + CURRENT_WSN_YEAR + "')" + " ORDER BY name");
	}

	//added kb 11/1/02 
	//  returns the list of payments for a specific person
	public Hashtable getExistingPayments(Hashtable formData) {
		String WsnApplicationid = (String) formData.get("Fk_WsnApplicationID");

		// try to find existing payments for this WsnApplicationID
		Hashtable payments = getPayments(WsnApplicationid);

		return payments;
	}
	private MSPayment getMSPaymentObject(String id) {
		if ((id != null) && (!id.equals("new"))) {
			return new MSPayment(id);
		} else
			return null;
	}
	private Hashtable getMSPaymentObjectHash(String objectID) {
		return ObjectHashUtil.obj2hash(new MSPayment(objectID));
	}

	//added kb 10/1/02
	// returns the next page view based upon the payment method chosen
	// current options are payccard, paymail, paystaff)
	public String getNextPaymentPage(Hashtable formData) {
		String currentpage = (String) formData.get("page");

		String paymentmethod = (String) formData.get("ChoosePayment");
		if (paymentmethod != null) {
			if (paymentmethod.equals("CCard"))
				currentpage = "payccard";
			if (paymentmethod.equals("Mail"))
				currentpage = "paymail";
			if (paymentmethod.equals("Staff"))
				currentpage = "paystaff";
		}

		return currentpage;
	}

	// 10-8-02 dc added
	// Same as getObjectHash, but returns the object, not a hash table
	// Returns null on failure or if objectID is null.
	public Object getObject(String className, String objectID) {
		if (className.equals("org.alt60m.wsn.sp.model.dbio.WsnApplication")) {
			return getWsnApplicationObject(objectID);
		} else if (className.equals("org.alt60m.wsn.sp.model.dbio.WsnProject")) {
			return getWsnProjectObject(objectID);
		} else if (className.equals("org.alt60m.wsn.sp.model.dbio.WsnReference")) {
			return getWsnReferenceObject(objectID);
		} else if (className.equals("org.alt60m.wsn.sp.model.dbio.WsnEvaluation")) {
			return getWsnEvaluationObject(objectID);
		} else if (className.equals("org.alt60m.hr.ms.model.dbio.MSPayment")) {
			return getMSPaymentObject(objectID);
		} else
			return null;
	}

	/***** Retreival Methods *****/

	// Created 5 September 2002 RDH
	// Returns null on failure or if objectID is null.
	public Hashtable getObjectHash(String className, String objectID) {
		Hashtable objHash = new Hashtable();
		try {
			if ((objectID != null) && (!objectID.equals("new"))) {
				if (className.equals("org.alt60m.wsn.sp.model.dbio.WsnApplication")) {
					return getWsnApplicationHash(objectID);
				} else if (className.equals("org.alt60m.wsn.sp.model.dbio.WsnProject")) {
					return getWsnProjectObjectHash(objectID);
				} else if (className.equals("org.alt60m.wsn.sp.model.dbio.WsnReference")) {
					return getWsnReferenceObjectHash(objectID);
				} else if (className.equals("org.alt60m.wsn.sp.model.dbio.WsnEvaluation")) {
					return getWsnEvaluationObjectHash(objectID);
				} else if (className.equals("org.alt60m.hr.ms.model.dbio.MSPayment")) {
					return getMSPaymentObjectHash(objectID);
				}
			} else
				objHash = null;
		} catch (Exception e) {
			log.error("Failed to retrieve object of type \"" + className + "\" with ID \"" + objectID + "\". [MSInfo.getObjectHash]", e);
			objHash = null;
		}
		return objHash;
	}


	// Added 19 November 2002 RDH
	public Collection getParticipants(String projectID) {
		try {
			WsnApplication person = new WsnApplication();
			return ObjectHashUtil.list(person.selectList("finalWsnProjectID = '" + projectID + "' AND wsnYear = '" + CURRENT_WSN_YEAR + "' AND role <= 1"));
		} catch (Exception e) {
			log.error("Exception encountered in MSInfo.getParticipants()", e);
			return null;
		}
	}

	//kb 10/21 - looks up staff info who will pay this person's application
	public Hashtable getPaymentFindStaff(Hashtable formData) {
		Hashtable retvals = new Hashtable();

		try {
			String firstname = (String) formData.get("firstname");
			String lastname = (String) formData.get("lastname");
			String amount = this.getApplicationFee();

			if (firstname == null || lastname == null || "".equals(firstname) || "".equals(lastname)) {
				retvals.put("ErrorMessage", "You must enter both a first and last name.");
				return retvals;
			}

			// if either name has an apostrophe in it, change to '' instead.
			firstname = doubleApostrophe(firstname, 0);
			lastname = doubleApostrophe(lastname, 0);

			Staff staff = new Staff();
			Collection c = staff.selectList("isSecure <> 'T' AND firstname like '" + firstname + "%' AND lastname='" + lastname + "'");

			log.debug("Number of Staff Matches found: " + c.size());

			for (Iterator i = c.iterator(); i.hasNext();) {
				Hashtable h = ObjectHashUtil.obj2hash((Staff) i.next());
				String toput = "AccountNo=" + (String) h.get("AccountNo") + "&" + "Email=" + (String) h.get("Email") + "&" + "FirstName=" + (String) h.get("FirstName") + "&" + "LastName=" + (String) h.get("LastName") + "&" + "Amount=" + amount;
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

	//kb 10/28/02 - returns the staff/applicant info needed for the staff
	// person to pay for the applicant's application.
	public Hashtable getPaymentFromStaffInfo(Hashtable formData) {
		Hashtable info = new Hashtable();
		String WsnApplicationid = (String) formData.get("encodedPersID");
		if (WsnApplicationid == null) {
			log.warn("There was no PersonID associated with your request.  You followed an invalid link.");
			info.put("ErrorMessage", "There was no PersonID associated with your request.  You followed an invalid link.");
			return info;
		}

		try {

			//get the person 
			WsnApplication person = new WsnApplication(WsnApplicationid);
			MSPayment payment = new MSPayment();
			//get the payment
			Collection c = payment.selectList("type='Staff Intent' AND fk_WsnApplicationID = '" + WsnApplicationid + "'");
			if (c.size() == 0) {
				log.error("There were no StaffIntent payment types found.  This is a strange error.");
				info.put("ErrorMessage", "The record saved by the Applicant that had the required information could not be found.  This is an internal error.  Please contact the System Administrator.");
				return info;
			}

			String NF = "NOTFOUND";

			String applicationAmount = NF;
			Float appAmount = null;
			String staffAccountNo = NF;
			String paymentId = NF;

			//put together the information and add it to the info hash
			for (Iterator i = c.iterator(); i.hasNext();) {
				Hashtable h = ObjectHashUtil.obj2hash((MSPayment) i.next());
				if (h != null) {
					log.debug("Found a record... setting...");
					appAmount = (Float)h.get("Credit");
					staffAccountNo = (String) h.get("AccountNo");
					paymentId = (String) h.get("PaymentID");
				}
			}

			if (appAmount != null) {
				applicationAmount = "" + appAmount.intValue();
			}

			//put in each item
			info.put("applicationAmount", applicationAmount);
			info.put("staffAccountNo", staffAccountNo);
			info.put("applicantName", person.getLegalFirstName() + " " + person.getLegalLastName());
			info.put("applicantEmail", person.getCurrentEmail());
			info.put("applicantPhone", person.getCurrentPhone());
			info.put("WsnApplicationID", WsnApplicationid);

			log.debug(applicationAmount);
			log.debug(staffAccountNo);

		} catch (Exception e) {
			log.error(e);
		}

		return info;
	}

	//added kb 10/14/02 updated 11/1/02 kb
	// returns the payments for a person
	// they are in the form: Hashtable (paymentid, hashtable(field, value))
	// fields included: PaymentID, PaymentDate, Credit, Type
	public Hashtable getPayments(String WsnApplicationid) {
		Hashtable ht = new Hashtable();
		String paymentid = null;
		String type = null;
		String pending = "Pending";
		String notAccepted = "Not Accepted";
		String staffIntent = "Staff Intent";

		if (WsnApplicationid == null) {
			ht.put("ErrorMessage", "WsnApplicationID was null.  Couldn't lookup payments.");
			return ht;
		}
		try {
			MSPayment payment = new MSPayment();
			payment.setFk_WsnApplicationIDStr(WsnApplicationid);
			payment.setPaymentFor("Mobilization System");
			Collection c = payment.selectList();
			if (c.size() > 1)
				log.warn("WARNING! There are multiple payments for this person!");

			if (c.size() == 0)
				log.debug("There are no payments for this person (thats ok)");
			else {
				MSPayment pay = null;
				for (Iterator i = c.iterator(); i.hasNext();) {
					pay = (MSPayment) i.next();
					if (pay != null) {
						Hashtable h = ObjectHashUtil.obj2hash(pay);
						paymentid = pay.getPaymentID();
						type = pay.getType();
						if (!pay.getPosted()) {
							h.put("Credit", pending);
						}
						if(type.equals("Not Accepted")) {
							h.put("Type", staffIntent);
							h.put("Credit", notAccepted);
						}
						ht.put(paymentid, h); //puts into returned hashtable
					}
				}
			}
		} catch (Exception e) {
			log.error(e);
			ht.put("ErrorMessage", "Error=" + e.getMessage());
		}

		return ht;
	}

	public Hashtable getProject(String projectID) {
		try {
			return ObjectHashUtil.obj2hash(new WsnProject(projectID));
		} catch (Exception e) {
			log.error("Warning: Unable to perform MSInfo.getProject()!", e);
			return null;
		}
	}

	public Hashtable getProjectAvailability(String projectID) {
		try {
			WsnProject project = new WsnProject();
			project.setWsnProjectID(projectID);
			Hashtable availability = getProject(projectID);
			WsnApplication person = new WsnApplication();
			String qry = "";
			
			qry = "SELECT COUNT(*) FROM wsn_sp_viewapplication WHERE gender = '1' AND assignedToProject = '" + project.getWsnProjectID() + "'";
			availability.put("MaleStudents", new Integer(ObjectHashUtil.countIt(person, qry)));
			qry = "SELECT COUNT(*) FROM wsn_sp_viewapplication WHERE gender = '0' AND assignedToProject = '" + project.getWsnProjectID() + "'";
			availability.put("FemaleStudents", new Integer(ObjectHashUtil.countIt(person, qry)));
			
			// instead of comparing # of applicants accepted to the project(is this even accurate?) and comparing to the max number, 
			// just check the viewCurrentProjects_maxS(F/M)Check table to see if this project is in there
			String m_table = "wsn_sp_viewcurrentprojects_maxsmcheck";
			String f_table = "wsn_sp_viewcurrentprojects_maxsfcheck";
			
			String queryString= "WsnProjectID="+projectID+" ORDER BY name";
			
			Collection m_result = new Vector();
			Collection f_result = new Vector();
			
			WsnProjectLight projectLight = new WsnProjectLight();
			
			projectLight.changeTargetTable(m_table);
			m_result = ObjectHashUtil.list(projectLight.selectList(queryString));
			projectLight.changeTargetTable(f_table);
			f_result = ObjectHashUtil.list(projectLight.selectList(queryString));
			
			
			//if (Integer.parseInt(availability.get("MaxNoStudentAMale").toString()) > Integer.parseInt(availability.get("MaleStudents").toString()))
			if(!m_result.isEmpty())
				availability.put("Men", "True");
			else
				availability.put("Men", "False");

			//if (Integer.parseInt(availability.get("MaxNoStudentAFemale").toString()) > Integer.parseInt(availability.get("FemaleStudents").toString()))
			if(!f_result.isEmpty())
				availability.put("Women", "True");
			else
				availability.put("Women", "False");

			return availability;
		} catch (Exception e) {
			log.error("Exception encountered in MSInfo.getProjectAvailability()", e);
			return null;
		}
	}

	// Added 20 Novmber 2002 by RDH.
	public Hashtable getProjectCoordinator(String projectID) {
		try {
			WsnProject project = new WsnProject(projectID);
			WsnApplication coordinator = project.getIsCoord();
			if (coordinator != null)
				return ObjectHashUtil.obj2hash(coordinator);
			else
				return null;
		} catch (Exception e) {
			log.error("Warning: Unable to perform MSInfo.getProjectCoordinator()!", e);
			return null;
		}
	}
	// Added 20 Novmber 2002 by RDH.
	public Hashtable getProjectDirector(String projectID) {
		try {
			WsnProject project = new WsnProject(projectID);
			WsnApplication director = project.getIsPD();
			if (director != null)
				return ObjectHashUtil.obj2hash(director);
			else
				return null;
		} catch (Exception e) {
			log.error("Warning: Unable to perform MSInfo.getProjectDirector()!", e);
			return null;
		}
	}

	//returns the list of people it finds that aren't paid that match.
	//kb 10-22-02
	public Hashtable getReceivePaymentFind(Hashtable formData) {
		log.debug("Looking for payments...");
		Hashtable retvals = new Hashtable();

		try {
			String firstname = (String) formData.get("firstname");
			String lastname = (String) formData.get("lastname");

			if (firstname == null || lastname == null || "".equals(firstname) || "".equals(lastname)) {
				retvals.put("ErrorMessage", "You must enter both a first and last name.");
				return retvals;
			}

			WsnApplication person = new WsnApplication();
			Collection c = person.selectList("legalfirstname like '" + firstname + "%' AND legallastname like '" + lastname + "' AND isPaid = 0");

			for (Iterator i = c.iterator(); i.hasNext();) {
				Hashtable h = ObjectHashUtil.obj2hash((WsnApplication) i.next());
				String toput = "WsnApplicationID=" + (String) h.get("WsnApplicationID") + "&" + "CurrentEmail=" + (String) h.get("CurrentEmail") + "&" + "FirstName=" + (String) h.get("FirstName") + "&" + "LastName=" + (String) h.get("LastName");
				String name = (String) h.get("FirstName") + " " + (String) h.get("LastName");
				h.put("link", toput); //add link to the this person's hashtable
				retvals.put(name, h);
			}
		} catch (Exception e) {
			log.error("Error!", e);
			retvals.put("ErrorMessage", "You must enter both a first and last name.");
			return retvals;
		}
		return retvals;
	}

	// added dc 10/29/02 - looks up a list of possible staff members for the application reference page
	public Hashtable getReferenceFindStaff(String firstName, String lastName) {
		Hashtable retvals = new Hashtable();

		try {
			if (firstName == null || lastName == null || "".equals(firstName) || "".equals(lastName)) {
				retvals.put("ErrorMessage", "You must enter both a first and last name.");
				return retvals;
			}
			// if either name has an apostrophe in it, change to '' instead.
			firstName = doubleApostrophe(firstName, 0);
			lastName = doubleApostrophe(lastName, 0);

			// find matching staff, but be sure to exclude "secure" staff (those in closed countries)
			// This should be working the same as the FindStaff on the Payment pages.
			Staff staff = new Staff();
			Collection c = staff.selectList("isSecure = 'F' AND removedFromPeopleSoft<>'Y' AND firstname like '" + firstName + "%' AND lastname='" + lastName + "'");

			for (Iterator i = c.iterator(); i.hasNext();) {
				Hashtable h = ObjectHashUtil.obj2hash((Staff) i.next());
				String toput = "AccountNo=" + (String) h.get("AccountNo");
				String name = (String) h.get("FirstName") + " " + (String) h.get("LastName");
				retvals.put(name, toput);
			}
		} catch (Exception e) {
			retvals.put("ErrorMessage", "There was an error with your request: " + e.getMessage());
			return retvals;
		}
		return retvals;
	}

	// 2003-01-28 dc Looks up a list of possible staff members for the application reference page
	public Collection getReferenceFindStaff(String firstName, String lastName, String city, String state) {
		Vector v = new Vector();
		Collection c = v;
		log.debug("info.getReferenceFindStaff(first=" + firstName + ", last=" + lastName + ", city=" + city + ", state=" + state + ")");

		try {
			if (firstName == null || lastName == null || "".equals(firstName) || "".equals(lastName)) {
				return c;
			}

			// if either name has an apostrophe in it, change to '' instead.
			firstName = doubleApostrophe(firstName, 0);
			lastName = doubleApostrophe(lastName, 0);
			city = doubleApostrophe(city, 0);

			// find matching staff, but be sure to exclude "secure" staff (those in closed countries)
			// This should be working the same as the FindStaff on the Payment pages.
			Staff staff = new Staff();
			Iterator staffiter = staff.selectList("isSecure = 'F' AND removedFromPeopleSoft<>'Y' AND s.firstname like '" + firstName + "%' AND s.lastname like '" + lastName + "%'").iterator();
			while (staffiter.hasNext()) {
				staff = (Staff) staffiter.next();
				if (staff.getPrimaryAddress() != null) {
					OldAddress address = staff.getPrimaryAddress();
					if (address.getCity().startsWith(city) && address.getState().startsWith(state)) {
						c.add(staff);
					}
				}
			}
			return ObjectHashUtil.list(c);
		} catch (Exception e) {
			log.error("Exception encountered in MSInfo.getReferenceFindStaff()", e);
			return null;
		}
	}



	// added dc 10/30/02 - looks up a staff person, and returns their info for loading into a reference
	public Hashtable getReferenceStaffMember(String staffNo) {
		Hashtable retvals = new Hashtable();

		try {
			if (staffNo == null || staffNo == null)
				return retvals;
			Staff staff = new Staff(staffNo);

			// put it into a hashtable
			retvals = ObjectHashUtil.obj2hash(staff);

			if (staff.getPrimaryAddress() != null) {
				OldAddress addr = staff.getPrimaryAddress();
				retvals.put("Address1", addr.getAddress1() == null ? "" : addr.getAddress1());
				retvals.put("Address2", addr.getAddress2() == null ? "" : addr.getAddress2());
				retvals.put("City", addr.getCity() == null ? "" : addr.getCity());
				retvals.put("State", addr.getState() == null ? "" : addr.getState());
				retvals.put("Zip", addr.getZip() == null ? "" : addr.getZip());
			}

		} catch (Exception e) {
			log.error(e);
			return retvals;
		}
		return retvals;
	}

	// added dc 01/16/03 - looks up th region for a state.  Uses the ministry_target_area table.
	// Assumes all univerisities in a state are the same region, so first record found is used.
	// This may not always be true, but this was decided by Scott to be close enough.
	public String getRegionForState(String state) {
		String result = "";
		try {
			if (state == null)
				return result;
			TargetArea ta = new TargetArea();
			Collection c = ta.selectList("region is not NULL AND state='" + state + "'");
			// put it into a hashtable
			Iterator i = c.iterator();
			if (i.hasNext()) {
				Hashtable h = ObjectHashUtil.obj2hash((TargetArea) i.next());
				result = (h.get("Region") == null) ? "" : (String) h.get("Region");
			}
		} catch (Exception e) {
			log.error("There was an error with your request: " + e);
		}
		return result;
	}

	public Collection getValidProjects(String region, boolean showAll, String gender, String projectPref1Choice, String projectPref2Choice, String projectPref3Choice, String projectPref4Choice, String projectPref5Choice, boolean forceShowPrefs) {
		String query = "";
		try {
			String today = (new SimpleDateFormat("MM/dd/yyyy")).format(new Date());

			String projectPrefChoices = " (WSNProjectID in (\'" + projectPref1Choice + "\', \'" + projectPref2Choice + "\', \'" + projectPref3Choice + "\', \'" + projectPref4Choice + "\',  \'" + projectPref5Choice + "\')) OR ";

			String dateCheck = " ( (studentStartDate > \'" + today + "\') AND (studentStartDate is not null)";

			String holdCheck = " AND (onHold <> \'1\')";

			String yearCheck = " AND (wsnYear = '" + CURRENT_WSN_YEAR + "')";

			String typeCheck = " AND ((projectType = 'u') OR (projectType = 's') OR (projectType = 'i') OR (projectType = 'p')";
			if ((region != null) && (!(region.trim()).equals(""))) {
				// have a region, so include regional projects too
				typeCheck += " OR (";
				typeCheck += "((projectType = 'r') OR (projectType = 'w')) AND";
				if (showAll)
					// don't show partnershipRegionOnly projects outside this region, but be sure to show those in this region
					typeCheck += " (partnershipRegionOnly <> \'1\'  OR  partnershipRegion = '" + region + "')";
				else
					typeCheck += " (partnershipRegion = '" + region + "')";
				typeCheck += ") ) )";
			} else {
				// don't have a region
				typeCheck += ") )";
			}

			String table = "";

			WsnProjectLight project = new WsnProjectLight();
			Collection result = new Vector();

			if (gender != null) {
				if (gender.equals("1")) { // male
					table = "wsn_sp_viewcurrentprojects_maxsmcheck";
				} else if (gender.equals("0")) { // female
					table = "wsn_sp_viewcurrentprojects_maxsfcheck";
				}
			}
			
			if (!table.equals("")) {
				project.changeTargetTable(table);
				String queryString= (forceShowPrefs?projectPrefChoices:"") + dateCheck + holdCheck + yearCheck + typeCheck + " ORDER BY name";
				result = ObjectHashUtil.list(project.selectList(queryString));
			}

			return result;
		} catch (Exception e) {
			log.error(e);
			log.debug("Offending query: " + query);
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
	
	private WsnEvaluation getWsnEvaluationObject(String id) {
		if ((id != null) && (!id.equals("new"))) {
			return new WsnEvaluation(id);
		} else
			return null;
	}
	private Hashtable getWsnEvaluationObjectHash(String objectID) {
		return ObjectHashUtil.obj2hash(new WsnEvaluation(objectID));
	}

	// Added 1/19/03 by DMB
	//	Retrieves WsnEvaluation object given a WsnApplicationID
	//  and returns it as a WsnReference object.
	public WsnEvaluation getWsnEvaluationWithWsnApplication(String WsnApplicationID) {
		try {
			WsnEvaluation wsnEvaluation = new WsnEvaluation();
			wsnEvaluation.setFk_WsnApplicationIDStr(WsnApplicationID);
			wsnEvaluation.select();
			return wsnEvaluation;
		} catch (Exception e) {
			log.error(e);
			return null;
		}
	}
	public Hashtable getWsnApplicationHash(String objectID) {
		Hashtable objHash = null;
		try {
			WsnApplication obj = getWsnApplicationObject(objectID);
			objHash = ObjectHashUtil.obj2hash(obj);
/*			if ((objectID != null) && (!objectID.equals("new")) && !objectID.equals("") && !objectID.equals("0")) {
				WsnApplication obj = new WsnApplication(objectID);
				objHash = ObjectHashUtil.obj2hash(obj);
			} else
				objHash = null;
*/		} catch (Exception e) {
			log.error(e);
			objHash = null;
		}
		return objHash;
	}

	private WsnApplication getWsnApplicationObject(String id) {
		if ((id != null) && (!id.equals("new")) && !id.equals("") && !id.equals("0")) {
			return new WsnApplication(id);
		} else
			return null;
	}
/*	private Hashtable getWsnApplicationObjectHash(String objectID) {
		return ObjectHashUtil.obj2hash(new WsnApplication(objectID));
	}
*/
	/* Added 12 September 2002 by RDH. Returns a Hashtable representation of the WsnApplication assosciated with
	   the specified email address, or returns null if no WsnApplication exists with that email address.
	   This method assumes that email addresses are unique in the WsnApplication object. If they're not, it just returns
	   information for whichever WsnApplication happens to be the first returned by the query in the broker. */
	public Hashtable getWsnApplicationWithEmailAddress(String emailAddress) {
		return getWsnApplicationWithEmailAddress(emailAddress, CURRENT_WSN_YEAR);
	}
	
	public Hashtable getWsnApplicationWithEmailAddress(String emailAddress, String wsnYear) {
		log.debug("getWsnApplicationWithEmailAddress:" + emailAddress);
		try {
			WsnApplication WsnApplication = new WsnApplication();
			WsnApplication.setCurrentEmail(emailAddress);
			WsnApplication.setWsnYear(wsnYear);
			WsnApplication.select();
			if (WsnApplication != null) {
				log.debug("Found WsnApplication: " + WsnApplication.getWsnApplicationID());
				return ObjectHashUtil.obj2hash(WsnApplication);
			} else {
				log.debug("Did NOT find WsnApplication");
				return null;
			}
		} catch (Exception e) {
			log.error(e);
			return null;
		}
	}
	
	public Hashtable getWsnPersonInfoFromSSM(String ssmUserID) {
		WsnPerson p = new WsnPerson();
		p.setSsmUserID(ssmUserID);
		p.select();
		
		WsnApplication a = new WsnApplication();
		a.setPerson(p);
		
		return ObjectHashUtil.obj2hash(a);
	}

	// Added 9 October 2002 by RDH. Much like the above, but based on SSM account instead of email address
	public Hashtable getWsnApplicationWithSsmUserID(String ssmUserID) {
		return getWsnApplicationWithSsmUserID(ssmUserID, CURRENT_WSN_YEAR);
	}
	
	public Hashtable getWsnApplicationWithSsmUserID(String ssmUserID, String wsnYear) {
		log.debug("getWsnApplicationWithSsmUserID:" + ssmUserID);
		try {
			WsnApplication WsnApplication = new WsnApplication();
			WsnApplication.setSsmUserID(Integer.parseInt(ssmUserID));
			WsnApplication.setWsnYear(wsnYear);
			WsnApplication.select();
			if (!WsnApplication.isPKEmpty()) {
				log.debug("Found WsnApplication: " + WsnApplication.getWsnApplicationID());
				return ObjectHashUtil.obj2hash(WsnApplication);
			} else {
				log.debug("Did NOT find WsnApplication");
				return null;
			}
		} catch (Exception e) {
			log.error(e);
			return null;
		}
	}
	private WsnProject getWsnProjectObject(String id) {
		if ((id != null) && (!id.equals("new"))) {
			return new WsnProject(id);
		} else
			return null;
	}
	private Hashtable getWsnProjectObjectHash(String objectID) {
		return ObjectHashUtil.obj2hash(new WsnProject(objectID));
	}
	
	
//	 Added 18 Nov 2004 by Scott Paulis
	// returns a collection of the project specific questions for a specific project
	public Collection listProjectQuestions(String projectID, String orderField, String orderDirection)
			throws Exception {
		boolean DESC = orderDirection.equals("DESC");
		Question q = new Question();
		Collection qs = q.selectList("fk_WsnProjectID = '" + projectID
				+ "' ORDER BY "
				+ fixOrderBy(orderField, (DESC ? "DESC" : "ASC")));
		return qs;
	}
	
	public String fixOrderBy(String orderBy, String direction) {
		return orderBy.replaceFirst("([\\w|\\.]*)", "$1 " + direction);
	}
	
	
	
	// added 18 Nov 2004 by Scott Paulis
	// returns a collection of the answer to all project specific questions for a person
	public Collection listWsnApplicationAnswers(int personID) {
		try {
			Answer a = new Answer();
			a.setfk_WsnApplicationID(personID);
			return a.selectList();
		} catch (Exception e) {
			return null;
		}
	}
	
	public Collection listWsnApplicationAnswers(String personID) {
		return listWsnApplicationAnswers(Integer.parseInt(personID));
	}
	
	
	public boolean saveAnswer(Hashtable values) {
		try {
			if (values.containsKey("QuestionID")
					&& values.containsKey("WsnApplicationID")) {
				Answer a = new Answer();
				a.setQuestionID(Integer.parseInt((String) values.get("QuestionID")));
				a.setfk_WsnApplicationID(Integer.parseInt((String) values.get("WsnApplicationID")));
				a.select();
				a.setBody((String) values.get("Body"));
				return a.persist();
			} else
				return false;
		} catch (Exception e) {
			log.error(e);
			return false;
		}
	}
	
	// Added 17 October 2002 by DKC.
	//	Retrieves WsnReference object given WsnApplicationID and a referenceType (P, S1, S2)
	//  and returns it as a hashtable
	public Hashtable getWsnReferenceHashWithWsnApplication(String WsnApplicationID, String refType) {
		try {
			WsnReference wsnReference = new WsnReference();
			if (!"new".equals(WsnApplicationID)) {
				wsnReference.setWsnApplicationIdStr(WsnApplicationID);
				wsnReference.setReferenceType(refType);
				wsnReference.select();
			}
			if (wsnReference != null)
				return ObjectHashUtil.obj2hash(wsnReference);
			else
				return null;
		} catch (Exception e) {
			log.error(e);
			return null;
		}
	}
	private WsnReference getWsnReferenceObject(String id) {
		if ((id != null) && (!id.equals("new"))) {
			return new WsnReference(id);
		} else
			return null;
	}
	private Hashtable getWsnReferenceObjectHash(String objectID) {
		return ObjectHashUtil.obj2hash(new WsnReference(objectID));
	}

	//	Retrieves WsnReference object given WsnApplicationID and a referenceType (P, S1, S2)
	//  and returns it as a WsnReference object.
	public WsnReference getWsnReferenceWithWsnApplication(String WsnApplicationID, String refType) {
		try {
			WsnReference wsnReference = new WsnReference();
			wsnReference.setWsnApplicationIdStr(WsnApplicationID);
			wsnReference.setReferenceType(refType);
			if (wsnReference.select()){		
				return wsnReference;
			}
			else {
				return null;
			}
		} catch (Exception e) {
			log.error(e);
			return null;
		}
	}

	// Created:  28 October 2002 by RDH. Shamelessly rippedfrom the CRS, original code by David Bowdoin.
	// Note: this function actualy modifies the hashtable, rather than copying it
	public Hashtable hashToWeb(Hashtable hash) throws Exception {
		for (Enumeration enumer = hash.keys(); enumer.hasMoreElements();) {
			String key = (String) enumer.nextElement();
			if (hash.get(key) instanceof Float) {
				String moneyString = hash.get(key).toString();
				if (moneyString.charAt(moneyString.length() - 2) == '.')
					moneyString += "0";
				hash.put(key, moneyString);
			} else if (hash.get(key) instanceof Date) {
				hash.put(key, new SimpleDateFormat("MM/dd/yyyy").format((Date) hash.get(key)));
			}
		}
		return hash;
	}

	//if is null or empty string, isempty=true
	//kb 10/28/02
	private boolean isEmpty(Object obj) {
		return (obj == null || "".equals(obj.toString()));
	}

	/*
	* marks a person as paid.  kb 10/16/02
	*/
	private void markPersonPaid(String WsnApplicationid) throws Exception {
		WsnApplication p = new WsnApplication(WsnApplicationid);
		p.setIsPaid(true);
		p.persist();
	}

	//checks for the required fields to be present in ccard post 
	// kb 10/28/02
	//   ccNum,ccExpM,ccExpY,ccAmt,FirstName,LastName,
	//   Address,City,State,Zip,Country,Phone,Email
	public String paymentCheckCreditCardValues(Hashtable formData) {
		StringBuffer m = new StringBuffer(); //m=missing
		StringBuffer f = new StringBuffer(); //f=field flag, KL: added 10/28/03
		String sText = "The following required value was missing: "; //sText=singular
		String pText = "The following required values were missing: "; //pText=plural

		if (isEmpty(formData.get("FirstName"))) {
			m.append("First Name, ");
			f.append("1");
		}
		if (isEmpty(formData.get("LastName"))) {
			m.append("Last Name, ");
			f.append("1");
		}
		if (isEmpty(formData.get("Address1"))) {
			m.append("Address 1, ");
			f.append("1");
		}
		if (isEmpty(formData.get("City"))) {
			m.append("City, ");
			f.append("1");
		}
		if (isEmpty(formData.get("State"))) {
			m.append("State, ");
			f.append("1");
		}
		if (isEmpty(formData.get("Zip"))) {
			m.append("Zip, ");
			f.append("1");
		}
		//if(isEmpty(formData.get("Country")))       m.append("Country ");
		//if(isEmpty(formData.get("Email")))         m.append("Email ");
		if (isEmpty(formData.get("CCardType"))) {
			m.append("Credit Card Type, ");
			f.append("1");
		}
		if (isEmpty(formData.get("CCNum"))) {
			m.append("Credit Card #, ");
			f.append("1");
		}
		if (isEmpty(formData.get("CCExpM")) || isEmpty(formData.get("CCExpY"))) {
			m.append("Expiration Date ");
			f.append("1");
		}
		//if(isEmpty(formData.get("CCExpY")))        m.append("CCExpY ");

		//log.debug("BEFOREPREPEND="+m.toString());

		//determine if text string is plural or not
		if (f.length() > 1) {
			m = new StringBuffer(pText.toString() + m.toString());
		} else if (f.length() > 0) {
			m = new StringBuffer(sText.toString() + m.toString());
		}

		//log.debug("AFTERPREPEND="+m.toString());

		return m.toString();
	}

	//The following method shamelessly copied from CRSInfo - kb 10/14
	//********************************************************************************//
	//  payment Info Code
	//  Mostly by David Bowdoin, starting 7/15/2002
	//********************************************************************************//

	//Created:  7/17/02, DMB
	//  Hashtable paymentInfo expects (ccNum,ccExpM,ccExpY,ccAmt,FirstName,LastName,Address,City,State,Zip,Country,Phone,Email )
	public Hashtable paymentCreditCard(String registrationID, Hashtable ccPaymentInfo) throws Exception {
		ccPaymentInfo.put("InvoiceNum", registrationID);
		ccPaymentInfo.put("Description", "Mobilization System Payment");
		ccPaymentInfo.put("CustID", registrationID);

		OnlinePayment onlinePay = new OnlinePayment();

		// if PAYMENTTESTMODE==true then uses Visa Test Card # 4007000000027
		onlinePay.setTestMode(PAYMENTTESTMODE);
		onlinePay.setMerchantInfo(MERCHANTACCTNUM, AUTHNETPASSWORD);

		Hashtable results = onlinePay.processCreditCard(ccPaymentInfo);

		Hashtable paymentHash = new Hashtable();

		//check for testmode
		if (PAYMENTTESTMODE) {
			log.debug("TESTMODE=TRUE: Setting results to true no matter what they really were.");
			results.put("Status", "Success");
		}

		if (results.get("Status").equals("Success")) {
			MSPayment payment = new MSPayment();

			payment.setCredit(Float.parseFloat(this.getApplicationFee()));
			payment.setAuthCode((String) results.get("AuthCode"));
			payment.setType("Credit card payment");
			payment.setPosted(true);
			payment.setPaymentDate(new Date());
			payment.setPostedDate(new Date());
			payment.setPaymentFor("Mobilization System");
			payment.setFk_WsnApplicationIDStr(registrationID);
			payment.persist();

			paymentHash = ObjectHashUtil.obj2hash(payment);

			//TODO:
			//org.alt60m.hr.ms.util.EmailConfirm email = new org.alt60m.hr.ms.util.EmailConfirm();
			//email.createCreditCardReceipt(payment, (String)ccPaymentInfo.get("CCNum"), (String)ccPaymentInfo.get("CCExpM"), (String)ccPaymentInfo.get("CCExpY"), ccPaymentInfo.get("PaymentAmt"));
			//email.send();

		} else {
			//Results: {Status=Could not connect to payment system. Please try again later.}
			paymentHash.put("ErrorMessage", results.get("Response"));
		}
		paymentHash.put("Status", results.get("Status"));

		return paymentHash;
	}

	//pay by mail intentions.  record the intention 
	private Hashtable paymentMail(String WsnApplicationid) throws Exception {
		MSPayment payment = new MSPayment();

		payment.setType("Mail Intent");
		payment.setPosted(false);
		payment.setPaymentDate(new Date());
		payment.setPostedDate(new Date());
		payment.setPaymentFor("Mobilization System");
		payment.setFk_WsnApplicationIDStr(WsnApplicationid);

		payment.persist();

		return new Hashtable();
	}

	//kb 10/28/02 - post staff account transfer
	//  NOTE: this will send an email to the summer project coordinator,
	//  but does not initate any actual funds transfer.  That must be
	//  done manually by the coordinator type person. 
	//  ALSO WIK: the person is marked paid.
	public Hashtable paymentPostStaffXfer(Hashtable formData) {
		Hashtable retval = new Hashtable();
		String PaymentType = (String) formData.get("ChoosePayment");
		String AccountNumber = "";
		String WsnApplicationid = (String) formData.get("WsnApplicationID");
		String StaffAccountNumber = (String) formData.get("staffAccountNo");
		String amount = (String) formData.get("Amount");

		if (PaymentType == null) {
			retval.put("ErrorMessage", "Payment Type was null.  Internal Error of some type (page was malformed).");
			return retval;
		} else if ("No".equals(PaymentType)) {
			try {
				//note it in our db
				MSPayment payment = new MSPayment();

				payment.setType("Not Accepted");
				payment.setPosted(true);
				payment.setPaymentDate(new Date());
				payment.setPostedDate(new Date());
				payment.setPaymentFor("Mobilization System");
				payment.setFk_WsnApplicationIDStr(WsnApplicationid);
				payment.setAccountNo(AccountNumber);
				payment.setAuthCode(StaffAccountNumber);
				payment.setComment("Payment refused by " + StaffAccountNumber + ".");
				payment.setCredit(0f);

				payment.persist();

				//build a msg back to the staff member
				StringBuffer s = new StringBuffer();
				s.append("We have noted your refusal to pay for this application fee.  ");
				s.append("The system has generated an email to the applicant, but it might");
				s.append(" be a good idea for you to let them know, too.  Thanks!");
				retval.put("ErrorMessage", s.toString());

			} catch (Exception e) {
				log.error(e);
				retval.put("ErrorMessage", e.getMessage());
				return retval;
			}

			if (!emailPaymentStaffRefusal(WsnApplicationid))
				retval.put("ErrorMessage", "Failure sending email message.  Contact System Administrator.");
			return retval;
		}
		//following options do not return, but flow onward.
		else if ("MyAccount".equals(PaymentType)) {
			log.debug("Staff chose to pay via their account.");
			AccountNumber = (String) formData.get("staffAccountNo");
		} else if ("AnotherAccount".equals(PaymentType)) {
			log.debug("Staff chose to pay via another account.");
			AccountNumber = (String) formData.get("OtherAccount");
		} else {
			log.warn("Payment Type was not recognized.  Internal Error of some type (page was malformed).");
			retval.put("ErrorMessage", "Payment Type was not recognized.  Internal Error of some type (page was malformed).");
			return retval;
		}

		//create staff payment
		try {
			log.debug("Creating Staff Payment.");
			MSPayment payment = new MSPayment();

			payment.setType("Staff Payment");
			payment.setPosted(true);
			payment.setPaymentDate(new Date());
			payment.setPostedDate(new Date());
			payment.setPaymentFor("Mobilization System");
			payment.setFk_WsnApplicationIDStr(WsnApplicationid);
			payment.setAccountNo(AccountNumber);
			payment.setAuthCode(StaffAccountNumber);
			payment.setComment("Payment authorized by " + StaffAccountNumber + ".");
			try {
				payment.setCredit(Float.valueOf(amount).floatValue());
			} catch (NumberFormatException nfe) {
				payment.setCredit(25.00f);
			}

			payment.persist();

			//mark person as paid.
			markPersonPaid(WsnApplicationid);

			//tell them about it
			if (!emailPaymentStaffAcceptance(WsnApplicationid)) {
				retval.put("ErrorMessage", "Failure sending email message to the applicant advising them of your payment, however your payment has been processed.");
				return retval;
			}

			retval.put("ErrorMessage", "We have noted your payment of this applicant's application fee and emailed the applicant.  Thank you!");

		} catch (Exception e) {
			log.error(e);
			retval.put("ErrorMessage", e.getMessage());
			return retval;
		}

		return retval;
	}

	//payment via a staff member (request account transfer from them)
	private Hashtable paymentStaff(String WsnApplicationid, Hashtable formData) throws Exception {
		String amount = (String) formData.get("Amount");
		String accountno = (String) formData.get("AccountNo");

		Hashtable h = new Hashtable();
		log.info("Creating Staff Payment");
		MSPayment payment = new MSPayment();

		payment.setType("Staff Intent");
		payment.setPosted(false);
		payment.setPaymentDate(new Date());
		payment.setPostedDate(new Date());
		payment.setPaymentFor("Mobilization System");
		payment.setFk_WsnApplicationIDStr(WsnApplicationid);
		try {
			payment.setCredit(Float.valueOf(amount).floatValue());
		} catch (NumberFormatException nfe) {
			payment.setCredit(25.00f);
		}
		payment.setAccountNo(accountno);

		payment.persist();
		log.debug("done. ");

		return h;
	}

	//added kb 9/24/02
	// processes the payment using Authorize.net, etc.
	// also returns actual id (if it is found)
	//  beginning point... from here paymentCreditCard, etc is called.
	public Hashtable processPayment(Hashtable formData) {
		Hashtable ht = new Hashtable(1);
		/*	 
		        //debug stuff: just yaccs out the contents of formData for verbosity
			    try
			    {
		  	      for (Iterator i = formData.keySet().iterator(); i.hasNext();)
			      {
			        String key = (String) i.next();
			        String val = (String) formData.get(key);
			        log.debug("paymentinfo: " + key + "     -    " + val);
			      }
			    }
			      catch(Exception e){
			      log.error(e);
			    }
		*/
		String WsnApplicationid = (String) formData.get("Fk_WsnApplicationID");
		String paymenttype = (String) formData.get("PaymentType");

		//formdata should have: 
		//   ccNum,ccExpM,ccExpY,ccAmt,FirstName,LastName,
		//   Address,City,State,Zip,Country,Phone,Email

		//*************CCARD
		if ("CCard".equals(paymenttype)) {
			log.info("Paying by credit card");
			try {
				String ErrorMessage = "";

				//check to make sure all required fields are valid
				//  future: also check expiration date in future/ccnum is valid
				ErrorMessage = paymentCheckCreditCardValues(formData);
				if (!"".equals(ErrorMessage)) //anything but blank
					{
					log.error("Error processing credit card payment: " + ErrorMessage);
					ht.put("page", "payccard");
					ht.put("ErrorMessage", ErrorMessage);
					return ht;
				}

				//have values we need, post.
				ht.putAll(paymentCreditCard(WsnApplicationid, formData));
				String status = (String) ht.get("Status");
				String response = (String) ht.get("ErrorMessage");

				//is successful?
				if ("Success".equals(status)) {
					log.info("Credit Card Payment was successful");
					//mark WsnApplication.isPaid=true
					markPersonPaid(WsnApplicationid);
					ht.put("page", "payment");
				} else {
					log.error("Error processing credit card payment: " + response);
					ht.put("page", "payccard");
					ht.put("ErrorMessage", "Error processing CCard payment:" + response);
				}

			} catch (Exception e) {
//				ht.put("ErrorMessage", "Exception processing CCard payment: " + e.getMessage());
				ht.put("ErrorMessage", "Invalid Payment Information.  Please re-enter Information." + e.getMessage());
				ht.put("page", "payccard");
				log.error(e);
			}
		}

		//*************MAIL
		else if ("Mail".equals(paymenttype)) {
			try {
				log.info("Paying by Mail");
				ht.putAll(paymentMail(WsnApplicationid));
				ht.put("page", "payment");
			} catch (Exception e) {
				ht.put("ErrorMessage", "Error processing Mail payment: " + e.getMessage());
				log.error(e);
			}
		}

		//*************STAFF
		else if ("Staff".equals(paymenttype)) {
			try {
				log.info("Paying by Staff");
				ht.put("page", "payment");
				ht.putAll(paymentStaff(WsnApplicationid, formData));
				if (!sendStaffPaymentEmail(WsnApplicationid, formData)) {
					log.error("unable to send email");
					ht.put("ErrorMessage", "There was a problem sending the email.  Please contact the system administrator.  There may have been a problem with that Staff Member's email address.");
					return ht;
				}
			} catch (Exception e) {
				ht.put("ErrorMessage", "Error processing Mail payment: " + e.getMessage());
				log.error("Unable to email", e);
				log.error(e);
			}
		} else {
			log.error("Payment type not recognized: " + paymenttype);
			ht.put("page", "error");
			ht.put("ErrorMessage", "Payment type not recognized.  Please contact the System Administrator.");
		}

		return ht;
	}

	//kb 10/22/02 - used by the Summer Project Coordinator to note when
	//  mail or staff transfer payments are received and processed.
	public Hashtable receivePayments(Hashtable formData) {
		Hashtable response = new Hashtable();
		String WsnApplicationid = (String) formData.get("WsnApplicationID"); //person who got the payment
		log.info("posting Received payment for application: " + WsnApplicationid);
		if (WsnApplicationid != null) {
			try {
				MSPayment payment = new MSPayment();

				String type = "ReceivePayment";

				payment.setType(type);
				payment.setPosted(true);
				payment.setPaymentDate(new Date());
				payment.setPostedDate(new Date());
				payment.setPaymentFor("Mobilization System");
				payment.setFk_WsnApplicationIDStr(WsnApplicationid);

				payment.persist();

				markPersonPaid(WsnApplicationid);

				response.put("page", "receivepayment");
			} catch (Exception e) {
				log.error(e);
				response.put("ErrorMessage", "There was a problem with your request: " + e.getMessage());
				response.put("page", "receivepayment");
			}
		}
		return response;
	}
	private Hashtable saveMSPaymentHash(Hashtable formData, String id, String idName) {
		Hashtable objHash = new Hashtable();
		try {
			MSPayment obj = new MSPayment();
			if (id.equalsIgnoreCase("new") || id.trim().equals("") || id.trim().equals("0")) {
				formData.remove(idName); // to avoid database issues new IDs must be null
			} else if (id != null) {
				obj.setPaymentID(id);
				obj.select();
			}
			ObjectHashUtil.hash2obj(formData, obj);
			obj.persist();
			objHash = ObjectHashUtil.obj2hash(obj);
		} catch (Exception e) {
			log.error(e);
			objHash = null;
		}
		return objHash;
	}
	//note above line is year dependent.  sorta needs to be to make sure we're in the right year. kb 11/04

	/***** Storage Functions *****/

	/* Generalized save function that can save any of the forms, like staff application or STINT or whatever, not just the WSN application.
	Created: 15 August 2002 RDH
	Modified: 5 September 2002 RDH: I made it functional */
	// returns null on failure
	// 10-11-02 dc Renamed from saveObject to saveObjectHash
	public Hashtable saveObjectHash(Hashtable formData, String id, String idName, String className) {
		if (className.equals("org.alt60m.wsn.sp.model.dbio.WsnApplication")) {
			return saveWsnApplicationHash(formData, id, idName);
		} else if (className.equals("org.alt60m.wsn.sp.model.dbio.WsnProject")) {
			return saveWsnProjectHash(formData, id, idName);
		} else if (className.equals("org.alt60m.wsn.sp.model.dbio.WsnReference")) {
			return saveWsnReferenceHash(formData, id, idName);
		} else if (className.equals("org.alt60m.wsn.sp.model.dbio.WsnEvaluation")) {
			return saveWsnEvaluationHash(formData, id, idName);
		} else if (className.equals("org.alt60m.hr.ms.model.dbio.MSPayment")) {
			return saveMSPaymentHash(formData, id, idName);
		} else
			return null;
	}
	private synchronized Hashtable saveWsnEvaluationHash(Hashtable formData, String id, String idName) {
		Hashtable objHash = new Hashtable();
		try {
			WsnEvaluation obj = new WsnEvaluation();
			if (id.equalsIgnoreCase("new") || id.trim().equals("") || id.trim().equals("0")) {
				// make sure another thread hasn't already come through and added the record
				String appID = (String)formData.get("Fk_WsnApplicationID");
				if(appID != null && !appID.equals("") && !appID.equals("0")) {
					WsnEvaluation oldEval = getWsnEvaluationWithWsnApplication(appID);
					if(oldEval != null&&!oldEval.getEvalID().equals("") && !oldEval.getEvalID().equals("0")) {
							id = oldEval.getEvalID();
							formData.put(idName, id);
							obj.setEvalID(id);
							obj.select();
					}else{
						formData.remove(idName); // to avoid database issues new IDs must be null
					}
				}else{
					formData.remove(idName); // to avoid database issues new IDs must be null
				}
			}else if (id != null) {
				obj.setEvalID(id);
				obj.select();
			}
			ObjectHashUtil.hash2obj(formData, obj);
			obj.persist();
			objHash = ObjectHashUtil.obj2hash(obj);
		} catch (Exception e) {
			log.error(e);
			objHash = null;
		}
		return objHash;
	}
	private synchronized Hashtable saveWsnApplicationHash(Hashtable formData, String id, String idName) {
		Hashtable objHash = new Hashtable();
		try {
			WsnApplication obj = new WsnApplication();
			if (id.equalsIgnoreCase("new") || id.trim().equals("") || id.trim().equals("0")) {
				// make sure another thread hasn't already come through and added the record
				String SsmUserID = (String)formData.get("SsmUserID");
				if(SsmUserID != null && !SsmUserID.equals("") && !SsmUserID.equals("0")) {
					Hashtable oldPers = getWsnApplicationWithSsmUserID(SsmUserID);
					if(oldPers != null) {
						String oldId = (String)oldPers.get(idName);
						id = oldId;
						formData.put(idName, id);
						obj.setWsnApplicationIDStr(id);
						obj.select();
					}
					else {
						// Check for person record
						WsnPerson pers = new WsnPerson();
						pers.setSsmUserID(SsmUserID);
						if (pers.select()) {
							obj.setPerson(pers);
						}
						formData.remove(idName); // to avoid database issues new IDs must be null
					}
				}
				else {
					formData.remove(idName); // to avoid database issues new IDs must be null
				}
			} else if (id != null) {
				obj.setWsnApplicationIDStr(id);
				obj.select();
			}
			ObjectHashUtil.hash2obj(formData, obj);
			obj.persist();
			objHash = ObjectHashUtil.obj2hash(obj);
		} catch (Exception e) {
			log.error(e);
			objHash = null;
		}
		return objHash;
	}
	private Hashtable saveWsnProjectHash(Hashtable formData, String id, String idName) {
		Hashtable objHash = new Hashtable();
		try {
			WsnProject obj = new WsnProject();
			if (id.equalsIgnoreCase("new") || id.trim().equals("") || id.trim().equals("0")) {
				formData.remove(idName); // to avoid database issues new IDs must be null
			} else if (id != null) {
				obj.setWsnProjectID(id);
				obj.select();
			}
			ObjectHashUtil.hash2obj(formData, obj);
			obj.persist();
			objHash = ObjectHashUtil.obj2hash(obj);
		} catch (Exception e) {
			log.error(e);
			objHash = null;
		}
		return objHash;
	}
	private synchronized Hashtable saveWsnReferenceHash(Hashtable formData, String id, String idName) {
		Hashtable objHash = new Hashtable();
		try {
			WsnReference obj = new WsnReference();
			if (id.equalsIgnoreCase("new") || id.trim().equals("") || id.trim().equals("0")) {
				// make sure another thread hasn't already come through and added the record
				String WsnApplicationId = (String)formData.get("WsnApplicationId");
				String refType = (String)formData.get("ReferenceType");
				if(WsnApplicationId != null && !WsnApplicationId.equals("") && !WsnApplicationId.equals("0")) {
					Hashtable oldPers = getWsnReferenceHashWithWsnApplication(WsnApplicationId, refType);
					String oldId = ((Integer)oldPers.get(idName)).toString();
					if(oldId != null && !oldId.equals("0")) {
						id = oldId;
						formData.put(idName, id);
						obj.setReferenceID(id);
						obj.select();
					}
					else {
						formData.remove(idName); // to avoid database issues new IDs must be null
					}
				}
				else {
					formData.remove(idName); // to avoid database issues new IDs must be null
				}
			} else if (id != null) {
				obj.setReferenceID((new Integer(id)).intValue());
				obj.select();
			}
			ObjectHashUtil.hash2obj(formData, obj);
			obj.persist();
			objHash = ObjectHashUtil.obj2hash(obj);
		} catch (Exception e) {
			log.error(e);
			objHash = null;
		}
		return objHash;
	}

	public boolean sendStaffPaymentEmail(String WsnApplicationid, Hashtable formData) {
		try {
			WsnApplication person = new WsnApplication(WsnApplicationid);

			String refFullName = formData.get("FirstName") + " " + formData.get("LastName");
			String referenceLink = "http://" + formData.get("ServerName") + "/servlet/MSController?action=actionPaymentFromStaff&encodedPersID=" + WsnApplicationid;
			String applicantFullName = person.getLegalFirstName() + " " + person.getLegalLastName();
			String applicantEmailAddress = person.getCurrentEmail();
			String applicantHomePhone = person.getCurrentPhone();
			String staffEmail = (String) formData.get("Email");

			StringBuffer text = new StringBuffer("Dear ");
			text.append(refFullName);
			text.append(":\n\n");
			text.append(applicantFullName);
			text.append(" has just applied for an exciting missions opportunity this summer with Campus Crusade for Christ and has indicated you have agreed to pay the application fee.  If you could take some time and indicate the account to use, we can continue with the application process.  The application materials will then be reviewed and a decision will be given as soon as possible.\n\n");
			text.append(" The payment form is on our secure web site.  Just click on the link below to go directly to the payment form for ");
			text.append(applicantFullName);
			text.append(".  The applicant's application will not processed until payment is made.  Thank you for your help in sending this applicant into the harvest!\n\n");
			text.append("You may contact the applicant by email at ");
			text.append(applicantEmailAddress);
			text.append(" or by phone at ");
			text.append(applicantHomePhone);
			text.append(".\n\n");
			text.append("From the link below, you can either indicate the account number to use for payment or indicate your unwillingness to pay for this application.  Either way, please follow the link and make a determination.\n");
			text.append("Thank you very much.\n\n");
			text.append("Sincerely,\n");
			text.append("Campus Crusade for Christ\n\n\n");
			text.append("Click here to access payment form for ");
			text.append(applicantFullName);
			text.append(": ");
			text.append(referenceLink);
			text.append(".\n\n");

			log.debug("ref.sendemailinvite TEXT=" + text.toString() + "=");
			log.debug("person.getCurrentEmail()=" + person.getCurrentEmail());
			log.debug("staffEmailAddress=" + staffEmail);

			SendMessage msg = new SendMessage();
			msg.setTo(staffEmail);
			//msg.setCc(applicantEmailAddress); don't want to copy the student on this email so they can't initiate payment creatively on their own.
			msg.setFrom(EMAILFROM);
			msg.setSubject("Application Payment request for " + applicantFullName);
			msg.setBody(text.toString());

			msg.send();

			return true;
		} catch (Exception e) {
			log.error("sendStaffPaymentEmail(): send email failed.", e);
			return false;
		}
	}

	// added 01/21/03 DMB
	public void setProjectAssignment(String WsnApplicationID, String isMemberID) throws Exception {
		WsnApplication person = new WsnApplication(WsnApplicationID);
		person.setIsMemberId(isMemberID);
		person.persist();
	}
}
