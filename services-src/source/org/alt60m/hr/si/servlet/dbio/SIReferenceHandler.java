package org.alt60m.hr.si.servlet.dbio;

import org.alt60m.servlet.*;
import org.alt60m.hr.si.model.dbio.SIPerson;
import org.alt60m.hr.si.model.dbio.SIReference;
import org.alt60m.hr.si.bean.dbio.*;	// just to call getReferenceByType - should move it to SIUtil instead!
import java.text.SimpleDateFormat;
import java.util.*;
import org.alt60m.util.ObjectHashUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

//This class handles all of the Stint Reference related actions

public class SIReferenceHandler {
	private static Log log = LogFactory.getLog(SIReferenceHandler.class);

    public static final String APPLICATIONCLASS = "org.alt60m.hr.si.model.dbio.SIApplication";
	public static final String PERSONCLASS = "org.alt60m.hr.si.model.dbio.SIPerson";
	public static final String REFERENCECLASS = "org.alt60m.hr.si.model.dbio.SIReference";

    /*
      All actionhandler methods should return an ActionResults object after
      having set the view using setView("viewname")

      for example:

      protected ActionResults processSomething(ActionContext ctx)
      {
        ActionResults ar = new ActionResults();
         //do something ...
        ar.setView("home");
        return ar;
      }

    */

	protected ActionResults postReferenceInfo(Action action)
    {
		// used when a go-to-other-page is clicked on the reference page of the application.
		// Default action for all links provided by header and footer include files.
		log.debug("Running postReferenceInfo()...");
		ActionResults ar = new ActionResults();
		try {
			String appID = (String) action.getValue("SIApplicationID");
			String nextAction = (String) action.getValue("nextAction");
			String nextParm = (String) action.getValue("nextParm");
			String userID = (String) action.getValue("userID");

			// todo: this should never be null, but is right now 10-21-02
			if (userID == null)
				userID = "unknown";

			// formData will contain all of the data from the input fields to be saved.  It includes data
			// for up to 4 different references.
			Hashtable formData = action.getValues();
			// separate the formData fields into correct hashtables by data type
			Hashtable refs9Hash = new Hashtable();	// s9 = staff reference
			Hashtable refd9Hash = new Hashtable();	// d9 = discipler reference
			Hashtable refr9Hash = new Hashtable();	// r9 = roommate reference
			Hashtable reff9Hash = new Hashtable();	// f9 = friend reference

			String Refs9NewStaffNumber = "";
			String Refd9NewStaffNumber = "";
			String Refr9NewStaffNumber = "";
			String Reff9NewStaffNumber = "";

			Enumeration e = formData.keys();
			while (e.hasMoreElements()) {
				String key = (String)e.nextElement();

				// first, see if any special "NewStaffNumber" fields
				if (key.equals("Refs9NewStaffNumber")) {
					Refs9NewStaffNumber = (String)formData.get(key);
				} else if (key.equals("Refd9NewStaffNumber")) {
					Refd9NewStaffNumber = (String)formData.get(key);
				} else if (key.equals("Refr9NewStaffNumber")) {
					Refr9NewStaffNumber = (String)formData.get(key);
				} else if (key.equals("Reff9NewStaffNumber")) {
					Reff9NewStaffNumber = (String)formData.get(key);
				// now, see find fields for each reference type
				} else if (key.length() >= 5 && key.substring(0, 5).equals("Refs9")) {
					String newKey = key.substring(5);	// strip prefix
					refs9Hash.put(newKey, formData.get(key));
				} else if (key.length() >= 5 && key.substring(0, 5).equals("Refd9")) {
					String newKey = key.substring(5);	// strip prefix
					refd9Hash.put(newKey, formData.get(key));
				} else if (key.length() >= 5 && key.substring(0, 5).equals("Refr9")) {
					String newKey = key.substring(5);	// strip prefix
					refr9Hash.put(newKey, formData.get(key));
				} else if (key.length() >= 5 && key.substring(0, 5).equals("Reff9")) {
					String newKey = key.substring(5);	// strip prefix
					reff9Hash.put(newKey, formData.get(key));
				// ignore all other keys
				}
			}

			// save each of the reference records
			saveReferenceRecord(refs9Hash, userID);
			saveReferenceRecord(refd9Hash, userID);
			saveReferenceRecord(refr9Hash, userID);
			saveReferenceRecord(reff9Hash, userID);

			createNewStaffReferenceRecord(appID, "S", Refs9NewStaffNumber, userID);
			createNewStaffReferenceRecord(appID, "D", Refd9NewStaffNumber, userID);
			createNewStaffReferenceRecord(appID, "R", Refr9NewStaffNumber, userID);
			createNewStaffReferenceRecord(appID, "F", Reff9NewStaffNumber, userID);
			// Save processing is done.

			// Decide what to do next.
			if (nextAction.equals("appFormRefDelete")) {
				return appFormRefDelete(action);
			} else if (nextAction.equals("appFormRefDelCreateBlnk")) { // 3-5-03 kl: new method corrects behavior of Staff List Ref Yes button
				return appFormRefDelCreateBlnk(nextParm, appID, userID);
			} else if (nextAction.equals("appFormRefResendEmailInvite")) {
				return appFormRefResendEmailInvite(action);
			} else if (nextAction.equals("appFormRefStaffAdd")) {
				return appFormRefStaffAdd(action);
			} else if (nextAction.equals("appFormRefStaffLookup")) {
				return appFormRefStaffLookup(action);
			} else {
				// user exited page with one of the menu options to go to a specific page
		        ar.setView((String)action.getValue("page"));
		        return ar;
			}
		} catch(Exception e) {
			String sErr = "Exception encountered in SIController.postReferenceInfo(): "+e;
			log.error(sErr, e);
			ar.putValue("ErrorString", sErr);
			ar.setView("error");
			return ar;
		}
    }

	// 3-4-03 kl: createNewStaffReferenceRecord for new refs.jsp stafflist popup process
	private synchronized void createNewStaffReferenceRecord(String applicantID, String refType, String staffNumber, String userID) {
		try {
			log.debug("createNewStaffReferenceRecord: appid="+applicantID+" type="+refType+" staffNumber="+staffNumber);
			if (staffNumber.equals("")) {
				// no new reference specified, so just return
				return;
			}

			// first, delete any existing reference record
			SIReference oldRef = SIUtil.getReferenceIDByType(applicantID, refType);
			if (oldRef != null) {
					log.debug("createNewStaffReferenceRecord: deleting old reference");
					SIUtil.deleteObject(REFERENCECLASS, String.valueOf(oldRef.getReferenceID()));
			}

			// second, create the reference record
			SIReference ref = new SIReference();

			// 1. Get staff information
			Hashtable s = SIUtil.getReferenceStaffMember(staffNumber);
			// note: if not there, then the jsp page did not give us the right staffNumber
			log.debug("createNewStaffReferenceRecord: GETTING STAFF = "+ s.get("FirstName"));

			// 2. Fill new hashtable with info
			String t;	// temp string
			t = (s.get("NamePrefix") == null ? "" : (String) s.get("NamePrefix"));
			ref.setTitle(t.trim());
			t = (s.get("FirstName") == null ? "" : (String) s.get("FirstName"));
			ref.setFirstName(t.trim());
			t = (s.get("LastName") == null ? "" : (String) s.get("LastName"));
			ref.setLastName(t.trim());
			t = (s.get("HomePhone") == null ? "" : (String) s.get("HomePhone"));
			ref.setHomePhone(t.trim());
			t = (s.get("WorkPhone") == null ? "" : (String) s.get("WorkPhone"));
			ref.setWorkPhone(t.trim());
			t = (s.get("MobilePhone") == null ? "" : (String) s.get("MobilePhone"));
			ref.setCellPhone(t.trim());
			t = (s.get("Email") == null ? "" : (String) s.get("Email"));
			ref.setCurrentEmail(t.trim());

			t = (s.get("Address1") == null ? "" : (String) s.get("Address1"));
			ref.setCurrentAddress1(t.trim());
			t = (s.get("Address2") == null ? "" : (String) s.get("Address2"));
			ref.setCurrentAddress2(t.trim());
			t = (s.get("City") == null ? "" : (String) s.get("City"));
			ref.setCurrentCity(t.trim());
			t = (s.get("State") == null ? "" : (String) s.get("State"));
			ref.setCurrentState(t.trim());
			t = (s.get("Zip") == null ? "" : (String) s.get("Zip"));
			ref.setCurrentZip(t.trim());

			// load values sent from page:
			ref.setStaffNumber(staffNumber);
			ref.setFk_SIApplicationID(applicantID);
			ref.setReferenceType(refType);

			// 3. persist the new reference record
			Hashtable refSave = new Hashtable();
			refSave = ObjectHashUtil.obj2hash(ref);
			refSave.put("IsStaff", "true"); // boolean values do not convert from obj to hash tables in info.obj2hash!!!
			refSave.put("LastChangedDate", (new SimpleDateFormat("MM/dd/yyyy")).format( new Date() ));
			refSave.put("LastChangedBy", userID);
			String refID = ""; // this will force the saveObjectHash to create a new record
			log.debug("SIUtil.saveObjectHash refID="+refID);
			SIUtil.saveObjectHash(refSave, refID, "ReferenceID", REFERENCECLASS);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}

	// 3-5-03 kl: appFormRefDelCreateBlnk new method corrects behavior of Yes button on refs.jsp staff member reference
	public ActionResults appFormRefDelCreateBlnk(String nextParm, String applicantID, String userID) {
		log.debug("Running SIRef appFormRefDelCreateBlnk()...");

		ActionResults ar = new ActionResults();
		try {
			// nextParm should be of the format: "A&B" where A is the refpRefID, B is the refpType
			int i = nextParm.indexOf("&");
			String refpRefID = nextParm.substring(0, i);  // get refpRefID
			String refpType = nextParm.substring(i+1);  // get refpType

			// if nextParm is not new, record exists so delete the record from the database
			if (!(refpRefID.equals("new") || refpRefID.equals("0"))) {
				SIUtil.deleteObject(REFERENCECLASS, refpRefID);
				ar.putValue("message", "Reference has been deleted.");
			}
			// delete any existing reference record (rec just created by saveReferenceRecord)
			SIReference oldRef = SIUtil.getReferenceIDByType(applicantID, refpType);
			String strOldRef = String.valueOf(oldRef.getReferenceID());
			if (!(strOldRef == null || strOldRef.equals("0"))) {
				SIUtil.deleteObject(REFERENCECLASS, String.valueOf(oldRef.getReferenceID()));
			}
			String page = "";
			// load Reference object
			SIReference ref = new SIReference();
			ref.setFk_SIApplicationID(applicantID);
			ref.setReferenceType(refpType);
			ref.setLastChangedBy(userID);
			ref.setIsStaff(true);
			ref.persist();

			// returns to the application's reference page
			page = "refs";
	        ar.setView(page);
	        return ar;
		} catch(Exception e) {
			String sErr = "Exception encountered in SIController.appFormRefDelCreateBlnk(): "+e+"";
			log.error(sErr, e);
			ar.putValue("ErrorString", sErr);
			ar.setView("error");
	        return ar;
		}
	}

	/*
	 * Need the exact same code for saving each of the 4 reference records, so make it a function
	 */
	private synchronized void saveReferenceRecord(Hashtable hash, String userID) throws Exception {
		try {
			if (hash.size() > 0) {
				//String refID = (String)hash.get("ReferenceID");
				//if (refID.equals("new")) {
					// this will tell saveObjectHash to create a new object in the database
				String refID = new SIInfoBean().getReferenceIDByType((String)hash.get("Fk_SIApplicationID"), (String)hash.get("ReferenceType"));
				hash.put("ReferenceID", refID );
				//}
				// See if email address was modified:
				String oldEmail = new SIReference(refID).getCurrentEmail();
				//String oldEmail = (String)hash.get("OldCurrentEmail");
				String newEmail = (String)hash.get("CurrentEmail");
				log.debug("------->oldEmail=" + oldEmail + "=  newEmail=" + newEmail + "=");
				if (!refID.equals("") && oldEmail != null && newEmail != null) {
					// see if user modified the email address field
					if (!oldEmail.equals(newEmail)) {
						// user changed the email.  Need to delete the old reference record and create a new one.
						log.info("Because email address changed, deleting old Reference record refID=" + refID);
						SIUtil.deleteObject(REFERENCECLASS, refID);
						// force the saveObjectHash to create a new record
						refID = "";
						hash.put("ReferenceID", refID );
					}
				}
				hash.remove("OldCurrentEmail");
				// log record modification history
				hash.put("LastChangedDate", (new SimpleDateFormat("MM/dd/yyyy")).format( new Date() ));
				hash.put("LastChangedBy", userID);

				log.debug("calling SIUtil.saveObjectHash to refID=" + refID + "hashsize=" + hash.size());
				SIUtil.saveObjectHash(hash, refID, "referenceID", REFERENCECLASS);
			}
		} catch(Exception e) {
			throw e;
		}
	}


	/* added dc 12/03/02
		nextAction = "appFormRefDelete" - called from appFormSave()
		Executes when an applicant clicks on "Delete" on the application reference page.
	*/
	public ActionResults appFormRefDelete(Action action) {
		log.debug("Running appFormRefDelete()...");
		ActionResults ar = new ActionResults();
		try {
			String nextParm = (String) action.getValue("nextParm");
			String page = "";

			// just deletes the record from the database
			// 3-3-03 kl: delete if nextParm is not new, if new we have no RefID to delete (even though saveReferenceRecord just created one)
			if (!nextParm.equals("new")) {
			SIUtil.deleteObject(REFERENCECLASS, nextParm);
			ar.putValue("message", "Reference has been deleted.");
			}

			// returns to the application's reference page
			page = "refs";
	        ar.setView(page);
	        return ar;
		} catch(Exception e) {
			String sErr = "Exception encountered in SIController.appFormRefDelete(): "+e+"";
			log.error(sErr, e);
			ar.putValue("ErrorString", sErr);
			ar.setView("error");
	        return ar;
		}
	}


	/* added dc 12/03/02
		nextAction = "appFormRefResendEmailInvite" - called from appFormSave()
		Executes when an applicant clicks on "Resend Email Invitation" on the application reference page.
	*/
	public ActionResults appFormRefResendEmailInvite(Action action) {
		ActionResults ar = new ActionResults();
		try {
			String message = "Email could not be sent!  Please recheck validity of email address.";
			// nextParm will be "refs9", "refd9", "refr9", or "reff9" indicating which reference to send the email to
			String refType = (String) action.getValue("nextParm");
			String SIPersonID = (String) action.getValue("SIPersonID");
			Hashtable formData = action.getValues();
			String appID = (String) formData.get("SIApplicationID");

			// load Reference object
			SIReference ref = new SIReference();
			SIInfoBean bean = new SIInfoBean();
			ref = (SIReference) bean.getSIReferenceByType(appID, refType);
			// 12-18-03 kl: set up check for valid reference name and email
			String refFirstName = ref.getFirstName();
			String refLastName = ref.getLastName();
			String refCurrentEmail = ref.getCurrentEmail();
            if (ref == null) {
				message = "INTERNAL ERROR: Cannot find reference to send email to.  (appID="+appID+" refType="+refType+")";
			} else if (refFirstName.trim().equals("") || refLastName.trim().equals("") || refCurrentEmail.trim().equals("")) {
				// checks for valid reference name and email
				message = "Email could not be sent!  Please recheck validity of Reference First Name, Last Name and/or Email Address.";
			} else {
                // 12-18-03 kl: set up & check if applicant email equals reference email
				SIPerson person = (SIPerson) SIUtil.getObject(SIPersonID, "SIPersonID", PERSONCLASS);
				String personCurrentEmail = person.getCurrentEmail();
				if (refCurrentEmail.equals(personCurrentEmail)) {
					message = "Email could not be sent!  Reference Email and Personal Address cannot match.";
					// send email invitation, 12-23-03 kl: also pass person object
				} else if (ref.sendEmailInvite(action.getServerName(), person)) {
					message = "An email invitation has been sent to " + ref.getFirstName() + " " + ref.getLastName() + ".";
				}
            }

			// returns to the application's reference page
			String page = "refs";
			ar.putValue("ErrorMessage", message);
	        ar.setView(page);
	        return ar;
		} catch(Exception e) {
			String sErr = "Exception encountered in SIController.appFormRefResendEmailInvite(): "+e;
			log.error(sErr, e);
			ar.putValue("ErrorString", sErr);
			ar.setView("error");
	        return ar;
		}
	}


	/* added dc 12/03/02
		nextAction = "appFormRefStaffAdd" - called from appFormSave()
		Executes when an applicant clicks on a staff member on the application reference page.
    Copies this staff's information into the reference.
	*/
	public ActionResults appFormRefStaffAdd(Action action) {
		log.debug("Running appFormRefStaffAdd()...");
		ActionResults ar = new ActionResults();
		try {
			String nextParm = (String) action.getValue("nextParm");
			// nextParm should be of the format: "9&AccountNo=8" where 9 is the RefID to plug this staff into, 8 if the staff's account number
			int i = nextParm.indexOf("&");
			String referenceID = nextParm.substring(0, i);  // get ref id
			int j = nextParm.indexOf("=");
			String staffNo = nextParm.substring(j+1);  // get staff number

			log.debug("------> appFormRefStaffAdd: refid=" + referenceID + " staffno=" + staffNo);

			// load Reference object
			SIReference ref = new SIReference();
			ref = (SIReference) SIUtil.getObject(referenceID, "ReferenceID", REFERENCECLASS);


			// read the staff object, and set all the reference fields
			String t;	// temp string
			Hashtable s = SIUtil.getReferenceStaffMember(staffNo);
			t = (s.get("NamePrefix") == null ? "" : (String) s.get("NamePrefix"));
			ref.setTitle(t.trim());
			t = (s.get("FirstName") == null ? "" : (String) s.get("FirstName"));
			ref.setFirstName(t.trim());
			t = (s.get("LastName") == null ? "" : (String) s.get("LastName"));
			ref.setLastName(t.trim());
			t = (s.get("HomePhone") == null ? "" : (String) s.get("HomePhone"));
			ref.setHomePhone(t.trim());
			t = (s.get("WorkPhone") == null ? "" : (String) s.get("WorkPhone"));
			ref.setWorkPhone(t.trim());
			t = (s.get("MobilePhone") == null ? "" : (String) s.get("MobilePhone"));
			ref.setCellPhone(t.trim());
			t = (s.get("Email") == null ? "" : (String) s.get("Email"));
			ref.setCurrentEmail(t.trim());

			t = (s.get("Address1") == null ? "" : (String) s.get("Address1"));
			ref.setCurrentAddress1(t.trim());
			t = (s.get("Address2") == null ? "" : (String) s.get("Address2"));
			ref.setCurrentAddress2(t.trim());
			t = (s.get("City") == null ? "" : (String) s.get("City"));
			ref.setCurrentCity(t.trim());
			t = (s.get("State") == null ? "" : (String) s.get("State"));
			ref.setCurrentState(t.trim());
			t = (s.get("Zip") == null ? "" : (String) s.get("Zip"));
			ref.setCurrentZip(t.trim());

			ref.setStaffNumber(staffNo);

			// persist the reference object back (don't have a ref.save, so convert to hash, then save)
			Hashtable refSave = new Hashtable();
		    refSave = ObjectHashUtil.obj2hash(ref);


			refSave.put("IsStaff", "true"); // boolean values do not convert from obj to hash tables in SIUtil.obj2hash!!!
			SIUtil.saveObjectHash(refSave, referenceID, "ReferenceID", REFERENCECLASS);



			// redisplay reference page
			String page = "refs";
	        ar.setView(page);
	        return ar;
		} catch(Exception e) {
			String sErr = "Exception encountered in SIController.appFormRefSearchForStaff(): "+e;
			log.error(sErr, e);
			ar.putValue("ErrorString", sErr);
			ar.setView("error");
	        return ar;
		}
	}


	/* added dc 12/03/02
		nextAction = "appFormRefStaffLookup" - called from appFormSave()
		Executes when an applicant clicks on "Staff Lookup" on the application reference page.
	*/
	public ActionResults appFormRefStaffLookup(Action action) {
		log.debug("Running appFormRefStaffLookup()...");
		ActionResults ar = new ActionResults();
		try {
			// return to this same page and display search results
			String page = "refs";
			// nextParm will be "refs9", "refd9", "refr9", or "reff9" indicating which reference to get the names out of and return the results to
			String refPrefix = (String) action.getValue("nextParm");
		log.debug("refPrefix=" + refPrefix);

			// get the name to search on:
			Hashtable formData = action.getValues();
			String firstName = ((String) formData.get(refPrefix + "FirstName")).trim();
			String lastName = ((String) formData.get(refPrefix + "LastName")).trim();
		log.debug("FirstName=" + firstName + "  LastName=" + lastName);

			// search for the name
			Hashtable staffInfo = SIUtil.getReferenceFindStaff(firstName, lastName);
			// hashtable of names (or with "ErrorMessage") that is returned is prefixed with "refs9", "refd9", "refr9", or "reff9"
			ar.addHashtable(refPrefix + "StaffInfo", staffInfo);
	        ar.setView(page);
	        return ar;
		} catch(Exception e) {
			String sErr = "Exception encountered in SIController.appFormRefSearchForStaff(): "+e;
			log.error(sErr, e);
			ar.putValue("ErrorString", sErr);
			ar.setView("error");
	        return ar;
		}
	}





	/****************************************************************************************
	/****************************************************************************************
		Reference Form Methods:												added dc 12/05/02
		Methods in this section are used to run the Reference Forms.
	****************************************************************************************/
	/****************************************************************************************

	/*
		Displays an application's reference form to be edited.  This is the entry point for
		a reference person to access their reference form.  The person does NOT have to be
		logged in.  They can access the reference form, and that's it!
		- To get here, the user clicks on the direct link contained in an invitation email like:
		http://www....com/.../servlet/SIController?action=postRefFormEncEdit&encRefID=1Pd84j3782kds8.
		- Requires an input string of "encRefID" which is the encoded reference id.
	*/

	public ActionResults postRefFormEncEdit(Action action) {
		log.debug("Running postRefFormEncEdit()...");
		ActionResults ar = new ActionResults();
		try {
			Hashtable hs = new Hashtable();
			String page = "";
			SIReference ref = new SIReference();

			// get the encrypted reference form ID
			String encryptedRefID = (String) action.getValue("encRefID");
			log.debug("postRefFormEncEdit: encryptedRefID=" + encryptedRefID);
			if (encryptedRefID == null)	{
				log.warn("posRefFormEncEdit: encRefID not specified");
				page = "refNotFound";
				ar.putValue("page", page);
				ar.setView(page);
				return ar;
			}

			// decrypt the encrypted referenceID
			String refID = ref.decodeReferenceID(encryptedRefID);
			log.debug("postRefFormEncEdit: decoded refID=" + refID);
			ref.setReferenceID(refID);
			if (!ref.select()) {
				log.warn("postRefFormEncEdit: ref is null: SIReference id=" + refID + " not found.");
				page = "refNotFound";
				ar.putValue("page", page);
				ar.setView(page);
				return ar;
			}

			if (ref.getIsFormSubmitted()) {
				log.debug("postRefFormEncEdit: Form already submitted");
				page = "refAlreadySubmitted";
				ar.putValue("page", page);
				ar.setView(page);
				return ar;
			}

			// Display an edit page, send object info to it.
			ar.putValue("SIReferenceID", refID);
			page = "ref1";
			ar.putValue("page", page);
			ar.setView(page);
			return ar;
		} catch(Exception e) {
			String sErr = "Exception encountered in SIController.postRefFormEncEdit(): "+e;
			log.error(sErr, e);
			ar.putValue("ErrorString", sErr);
			ar.setView("error");
			return ar;
		}
	}



	/* added dc 10/14/02
		Executes when the person clicks on ANY and ALL navigation link while a person is editing a reference form.
		This will save the data from the screen, and then execute the desired nextAction.
	*/
	public ActionResults postRefFormSave(Action action) {
		log.debug("Running postRefFormSave()...");
		ActionResults ar = new ActionResults();
		try {
			Hashtable formData = action.getValues();
			String nextAction = (String) action.getValue("nextAction");
			String nextPage = (String) action.getValue("page");			//todo: change to nextPage everywhere in editrefform
			String refID = (String) action.getValue("refID");
			String userID = (String) action.getValue("userID");
			if (userID == null)
				userID = "0";	// meaning the actual reference person edited it

			if (formData != null && refID != null) {
				// we've got all the info we need, so we can save the object.
				log.debug("SIController.postRefFormSave(): Form data contained an id=" + refID + ".  userid="+userID);
				formData.put("FormWorkflowStatus", "I");
				formData.put("LastChangedDate", (new SimpleDateFormat("MM/dd/yyyy")).format( new Date() ));
				formData.put("LastChangedBy", userID);
				SIUtil.saveObjectHash(formData, refID, "referenceID", REFERENCECLASS);
			}

			// Save processing is done.
			ar.putValue("SIReferenceID", refID);	// tell next page what ref to continue editing
			// Decide what to do next.
			if (nextAction.equals("refFormFinishLater"))
				return refFormFinishLater(action);
			else if (nextAction.equals("refFormSubmit"))
				return refFormSubmit(action);
			// if reach here, just to go to the specified page.  Assumes page is part of the reference form family.
			ar.putValue("page", nextPage);
			ar.setView(nextPage);
			return ar;
		}

		catch(Exception e) {
			String sErr = "Exception encountered in SIController.postRefFormSave(): "+e;
			log.error(sErr, e);
			ar.putValue("ErrorString", sErr);
			ar.setView("error");
			return ar;
		}
	}


	/* added dc 9/27/02
		nextAction = "refFormSubmit" - called from refFormSave()
		Executes when a reference person attempts to submit a completed reference form.
		Checks to ensure reference form is ready to be submitted (eg: required fields are completed).
		If not, redisplays ref9 page with reasons why can't finish.
	*/
	private ActionResults refFormSubmit(Action action) {
		log.debug("Running refFormSubmit()...");
		ActionResults ar = new ActionResults();
		try {
			String page = "";
			Hashtable hs = new Hashtable();
			String refID = (String) action.getValue("refID");
			int ec = 0; // error counter

			// get the reference object
			SIReference ref = new SIReference();
			log.debug("refFormSubmit: trying info.getObject(SIReferenceClassName)");
			ref = (SIReference) SIUtil.getObject(refID, "ReferenceID", REFERENCECLASS);
			String submitErrors = ref.submitReference();
			if (submitErrors != ""){
				// errors in the submit, so redisplay ref12 with errors
				ar.putValue("MissingFields", submitErrors);
				ar.putValue("SIReferenceID", refID);
				page = "ref12";
				ar.putValue("page", page);
				ar.setView(page);
				return ar;
			}

			// Submit worked!
			// I must update the submission fields, and persist the object
			log.debug("refFormSubmit: submitReference=TRUE!");
			ref.setFormWorkflowStatus("D");		// mark reference form as "DONE"
			ref.setIsFormSubmitted(true);	// mark reference form as "SUBMITTED"
			ref.setFormSubmittedDate(new Date());	// record date of submission

			// dumb, but create a temp hashtable with fields that need persisting, and then persist the hashtable to the db
			log.debug("calling info.saveObjectHash refID=" + refID);
			Hashtable hsSave = new Hashtable();
			hsSave.put("FormWorkflowStatus", (String)(ref.getFormWorkflowStatus()));
			hsSave.put("IsFormSubmitted", (String)(ref.getIsFormSubmitted() ? "true" : "false"));
			hsSave.put("FormSubmittedDate", (new SimpleDateFormat("MM/dd/yyyy")).format( ref.getFormSubmittedDate() ));
			SIUtil.saveObjectHash(hsSave, refID, "referenceID", REFERENCECLASS);

			// load Applicant person into ref object
			ref.loadRelated();
			// send reference person an email thank-you
			ref.sendEmailThankYou();
			// send applicant, and others, an email saying reference is done
			ref.sendEmailRefComplete();
			// tell user submission worked
			page = "refFormSubmitted";
			ar.putValue("page", page);
			ar.setView(page);
			return ar;
		} catch(Exception e) {
			String sErr = "Exception encountered in SIController.refFormSubmit(): "+e;
			log.error(sErr, e);
			ar.putValue("ErrorString", sErr);
			ar.setView("error");
			return ar;
		}
	}


	/* added dc 10/11/02
		nextAction = "refFormFinishLater" - called from refFormSave()
		Executes when a reference person clicks on "Finish Later".
		Just displays the "please come again and finish" page.
	*/
	private ActionResults refFormFinishLater(Action action) {
		log.debug("Running refFormFinishLater()...");
		ActionResults ar = new ActionResults();
		try {
			String refID = (String) action.getValue("refID");
			SIReference ref = new SIReference();
			ref = (SIReference) SIUtil.getObject(refID, "ReferenceID", REFERENCECLASS);
			// load person into ref object
			ref.loadRelated();
			ref.sendEmailReminder(action.getServerName());
			String page = "refFinishLater";
			ar.putValue("page", page);
			ar.setView(page);
			return ar;
		} catch(Exception e) {
			String sErr = "Exception encountered in SIController.refFormFinishLater(): "+e;
			log.error(sErr, e);
			ar.putValue("ErrorString", sErr);
			ar.setView("error");
			return ar;
		}
	}
}