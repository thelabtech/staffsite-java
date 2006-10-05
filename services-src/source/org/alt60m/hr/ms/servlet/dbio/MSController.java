package org.alt60m.hr.ms.servlet.dbio;

import java.util.*;
import java.text.SimpleDateFormat;
import javax.servlet.http.*;
import org.alt60m.wsn.sp.model.dbio.WsnApplication; // added dc 10-14-02
import org.alt60m.wsn.sp.model.dbio.WsnProject; // added dc 10-14-02
import org.alt60m.wsn.sp.model.dbio.WsnReference; // added dc 10-8-02
import org.alt60m.wsn.sp.model.dbio.WsnEvaluation;
import org.alt60m.wsn.sp.model.dbio.Question; // added sp 11-19-04
import org.alt60m.wsn.sp.model.dbio.QuestionText; // added sp 11-19-0
import org.alt60m.wsn.sp.model.dbio.Answer;// added sp 11-19-0
import org.alt60m.servlet.*;
import org.alt60m.util.ObjectHashUtil;

public class MSController extends org.alt60m.servlet.Controller {

	private final MSInfo info					= new MSInfo();
	private final String VIEWS_FILE				= "/WEB-INF/msviews.xml";
	private final String DEFAULT_ACTION			= "goToHome";
	private final String WsnApplicationClassName		= "org.alt60m.wsn.sp.model.dbio.WsnApplication";
	private final String WsnApplicationIDName	    = "WsnApplicationID"; // added dc 10/23/02
	private final String WsnProjectClassName	= "org.alt60m.wsn.sp.model.dbio.WsnProject";
	private final String WsnReferenceClassName	= "org.alt60m.wsn.sp.model.dbio.WsnReference"; // added dc 9/27/02
	private final String WsnReferenceIDName		= "ReferenceID"; // added dc 10/17/02
    private final String WsnEvaluationClassName = "org.alt60m.wsn.sp.model.dbio.WsnEvaluation"; // added DMB 1/19/03
    private final String WsnEvaluationIDName    = "EvalID"; // added DMB 1/19/03
	private final String MSPaymentClassName		= "org.alt60m.hr.ms.model.dbio.MSPayment"; // 1/30/2003 brought back AS
	private final String MSPaymentIDName		= "PaymentID"; // 1/30/2003 brought back AS

	//constructor
	public void Manager() {}


	/****************************************************************************************
		Navigation functions: Functions in this section will be used to control the flow that
		the user sees. This section is for things like calling ActionContext.goToView or
		telling the ActionContext to redirect to an error page.
	****************************************************************************************/

	/*
		goes to whatever page is called according to views file
		ex - MSController?action=goToPage&page=appHome
		would goto appHome in views file
	*/
	public void goToPage(ActionContext ctx) {
		ActionResults ar = new ActionResults();
		String page = ctx.getInputString("page");

		Hashtable formData = ctx.getHashedRequest(); //kb 11/1/02
		String WsnApplicationid=(String)ctx.getSession().getAttribute("WsnApplicationID");
		if(WsnApplicationid==null) WsnApplicationid="";
		formData.put("Fk_WsnApplicationID", WsnApplicationid); //kb 11/1/02

		try	{
			//kb 11/1/02 - need to have the payments available to this page.
			if("payment".equals(page))
			{
    			Hashtable existingpayments = info.getExistingPayments(formData);
	    		ar.addHashtable("existingpayments", existingpayments);
	    		ar.putValue("AppFee", info.getApplicationFee());
			}
			ar.putValue("page", page);
			ctx.setReturnValue(ar);
			ctx.goToView(page);
		}
		catch (Exception e) {
			log.error(e);
		}
	}

	/**
	 * afterLogin - this is the destination action after a person logs in.
	 * make sure that all session variable are clear, etc.  return apphome
	 * @param ctx
	 * @author kb - 2/20/2003
	 */
	public void afterLogin(ActionContext ctx)
	{
		try
		{
			log.debug("AfterLogin firing - clearing session values: "+ctx.getSessionValue("userID"));
			//ctx.setSessionValue("SIPersonID","");
			//ctx.setSessionValue("ApplicationID","");
			
			//continue on
			appFormEdit(ctx);
		}catch(Exception e)
		{
			log.error(e, e);	
		}
	}


	// goes to the homepage according to the views file and resets the visited tabs
	public void goToHome(ActionContext ctx) {
			ctx.goToView("login");
	}

	// goes to the error page
	public void goToErrorPage(ActionContext ctx, String errorString) {
		try	{
			ctx.setSessionValue("ErrorString", errorString);
			ctx.goToView("error");
		}
		catch (Exception e) {
			log.error(EXCEPTION_DURING_GO_TO_ERROR_PAGE, e);
		}
	}

	/* added dc 10/16/02
		Applicant logout.
	*/
	public void ssmUserLogout(ActionContext ctx) {
		try {
			ctx.setSessionValue("userLoggedIn", "");
			ctx.setSessionValue("userEmail", "");
			ctx.setSessionValue("userID", "");
			goToHome(ctx);
		} catch(Exception e) {
			String sErr = "Exception encountered in MSController.ssmUserLogout(): "+e;
			log.error(sErr);
			goToErrorPage(ctx, sErr);
		}
	}

	/************************  End of navigation functions section  ************************/

	/****************************************************************************************
		Storage and Retrieval methods: Methods in this section will be used to get
		hashtable representations of objects in the model from the database and to save
		(or update) objects in the database. This should all be done via the info object
		(and, therefore, via the broker).
	****************************************************************************************/

	// handles all the persisting to the database of info
	// Created 5 August 2002 by RDH. Modified 6 September 2002 by RDH.
	// 10-23-02: dc Refactored so that Application Forms now use appFormSave() instead of save().
	//			    Not sure if save() is called by another in MS any more?
	public void save(ActionContext ctx) {
		if(!isLoggedIn(ctx)){getNotAuthorizedPage(ctx);return;} //Added kb-12/18/02 - checks security
		try {
			ActionResults ar = new ActionResults();
			Hashtable formData = ctx.getHashedRequest();
			String page = ctx.getInputString("page");
			String id = ctx.getInputString("id");
			String idName = ctx.getInputString("idName");
			String className = ctx.getInputString("className");

            HttpSession session = ctx.getSession();
            session.setAttribute(idName, id);

			if (formData != null && id != null && idName != null && className != null) {
				log.debug("Form data contained an id=" + id + ", and idName=" + idName + ", and a className=" + className + ".");
				// we've got all the info we need, so we can save the object.
				// but before we do, some objects need additional processing
				if (className.equals(WsnApplicationClassName)){
					// Do any extra person stuff

                    //kb 10/8/02
					//if they posted the last page and are now going to the payment page
					//  check and see if the payment is done.  if so, return paymentdone
					//  if not, go ahead with the payment page.
					if(page.equals("payment"))
					{
						//Hashtable h = info.getObjectHash(WsnApplicationClassName,id);
						Hashtable h = info.getWsnApplicationHash(id);
					    if(h!=null)
					    {
					        log.debug("isPaid: " + h.get("IsPaid"));
					        Boolean paymentdone = (Boolean) h.get("IsPaid");
					        if(paymentdone.booleanValue()==true)
					            page="paymentdone";
					    }
					    else
					        log.error("Error getting WsnApplication w/id: " + id);
					}
				} else if (className.equals(WsnReferenceClassName)) {
					// Do any extra reference stuff
				}
				Hashtable objectHash = info.saveObjectHash(formData, id, idName, className);
				ar.addHashtable("objectHash", objectHash);
			}
			// Any necessary processing has already been done, so just send the user on to the next page.
			ar.putValue("page", page);
			ctx.setReturnValue(ar);
			ctx.goToView(page);
		} catch(Exception e) {
			log.error("Exception encountered in MSController.save():", e);
			goToErrorPage(ctx, EXCEPTION_DURING_SAVE);
		}
	}

	/******************  End of storage and retireval functions section  *******************/



	/****************************************************************************************
		Utility functions: Functions in this section will be used to do general jobs and
		tedious manual labor. We're still working on a function that will keep the caffeine
		flowing to us.
	****************************************************************************************/

	//	basic initialization stuff
	public void init() {
		super.setViewsFile(getServletContext().getRealPath(VIEWS_FILE));
		super.setDefaultAction(DEFAULT_ACTION);
	}

	public void reload() {
		super.setViewsFile(getServletContext().getRealPath(VIEWS_FILE));
		super.setDefaultAction(DEFAULT_ACTION);
	}

	/******************  End of utility methods section  *******************/



	/****************************************************************************************
	/****************************************************************************************
		Applicant Form Methods:												added dc 10/16/02
		Methods in this section will be used to run the Applicant pages.
	****************************************************************************************/
	/****************************************************************************************

	/* added dc 10/16/02
		Displays an applicant's application.  This is the entry point to edit/view the application form.
		Right now, it assumes the person coming into the application form is the applicant.
	*/
	public void appFormEdit(ActionContext ctx) {
		if(!isLoggedIn(ctx)){getNotAuthorizedPage(ctx);return;} //Added kb-12/18/02 - checks security
		try {
			ActionResults ar = new ActionResults();
			String page = "";

			// get the Simple Security Manager user id
			String userID = (String) ctx.getSessionValue("userID");
			log.debug("appFormEdit: userID=" + userID);
			if (userID == null) {
				String s = "MSController.appFormEdit(): userID not specified!";
				log.debug(s);
				goToErrorPage(ctx, s);
				return;
			}

			// Note: JSP reads the desired objects (like WsnApplication), so we don't have to read it here and pass it to JSP.
			// Display first page of application
			page = "apphome";
			ar.putValue("page", page);
			ctx.setReturnValue(ar);
			ctx.goToView(page);
		} catch(Exception e) {
			String sErr = "Exception encountered in MSController.appFormEdit(): "+e;
			log.error(sErr);
			goToErrorPage(ctx, sErr);
		}
	}


	/* added dc 03/03/03
		Displays an applicant's application from the SP Tool (link "Login to Application as Student" on showappinfo.jsp.
		Allows This is the entry point to edit/view the application form.
		Right now, it assumes the person coming into the application form is the applicant.
	*/
	public void appFormEditOverride(ActionContext ctx) {
		try {
			// find the ssmUserID for this WsnApplicationID
			String WsnApplicationID = ctx.getInputString("WsnApplicationID");
			WsnApplication person = (WsnApplication) info.getObject(WsnApplicationClassName, WsnApplicationID);
			// load session variables required to show that person is logged in
			String userEmail = ctx.getInputString("UserEmail");
			String userID = String.valueOf(person.getSsmUserID());
			String userLoggedIn = "override";
			ctx.setSessionValue("userEmail", userEmail);
			ctx.setSessionValue("userID", userID);
			ctx.setSessionValue("userLoggedIn", userLoggedIn);
			
			// 3-28-03 kl: check for valid Simple Security Manager userID value
			int userIDval = Integer.parseInt(userID);
			if (userIDval < 1) {
				log.debug("userIDval="+ userIDval); // trace
				String s = "A Simple Security Manager userID does not exist!"; // 4-22/03 kl: simplify wording
				log.debug(s);
				goToErrorPage(ctx, s);
			}
			else {
				appFormEdit(ctx);
			}
		} catch(Exception e) {
			String sErr = "Exception encountered in MSController.appFormEditOverride(): "+e;
			log.error(sErr);
			goToErrorPage(ctx, sErr);
		}
	}

	/* added dc 10/17/02
		Call this when exiting any page on the Application Form.
		Saves any data sent to it (WsnApplication, WsnReferences, etc),
		then does the nextAction as specified.
	*/
	public void appFormSave(ActionContext ctx) {
		
		
		log.trace("calling appFormSave()!");
		
		if(!isLoggedIn(ctx)){getNotAuthorizedPage(ctx);return;} //Added kb-12/18/02 - checks security
		try {
			ActionResults ar = new ActionResults();
			String WsnApplicationID = ctx.getInputString("WsnApplicationID");
			String nextAction = ctx.getInputString("nextAction");
			String nextParm = ctx.getInputString("nextParm");
			String userID = ctx.getInputString("userID");

            //added kb 10/24 - I need the WsnApplicationid in the session.  Is it elsewhere?
            if(WsnApplicationID != null)
            {
                HttpSession session = ctx.getSession();
                session.setAttribute("WsnApplicationID", WsnApplicationID);
            }

			// todo: this should never be null, but is right now 10-21-02
			if (userID == null)
				userID = "unknown";

			// formData will contain all of the data from the input fields to be saved.  It includes data
			// for up to 3 different references.
			//	Data names for Peer reference are prefixed with "Refp"
			//	Data names for Spiritual Leader #1 reference are prefixed with "Refs1"
			//	Data names for Spiritual Leader #2 reference are prefixed with "Refs2"
			//  Date names for the WsnApplication object are not specially prefixed.
			Hashtable formData = ctx.getHashedRequest();
            formData.put("Fk_WsnApplicationID", ctx.getSession().getAttribute("WsnApplicationID")); //kb 11/1/02

			// separate the formData fields into correct hashtables by data type
			Hashtable personHash = new Hashtable();
			Hashtable refpHash = new Hashtable();
			Hashtable refs1Hash = new Hashtable();
			Hashtable refs2Hash = new Hashtable();
			

			Hashtable projQHash = new Hashtable();
			/*
			Hashtable projQ1Hash = new Hashtable();
			Hashtable projQ2Hash = new Hashtable();
			Hashtable projQ3Hash = new Hashtable();
			Hashtable projQ4Hash = new Hashtable();
			Hashtable projQ5Hash = new Hashtable();
			*/
			
			String refpNewStaffNumber = "";
			String refs1NewStaffNumber = "";
			String refs2NewStaffNumber = "";

			Enumeration e = formData.keys();
			while (e.hasMoreElements()) {
				String key = (String)e.nextElement();

				// first, see if any special "NewStaffNumber" fields
				if (key.equals("RefpNewStaffNumber")) {
					refpNewStaffNumber = (String)formData.get(key);
				} else if (key.equals("Refs1NewStaffNumber")) {
					refs1NewStaffNumber = (String)formData.get(key);
				} else if (key.equals("Refs2NewStaffNumber")) {
					refs2NewStaffNumber = (String)formData.get(key);
				// now, find fields for each reference type
				} else if (key.length() >= 4 && key.substring(0, 4).equals("Refp")) {
					String newKey = key.substring(4);	// strip prefix
					refpHash.put(newKey, formData.get(key));
				} else if (key.length() >= 5 && key.substring(0, 5).equals("Refs1")) {
					String newKey = key.substring(5);	// strip prefix
					refs1Hash.put(newKey, formData.get(key));
				} else if (key.length() >= 5 && key.substring(0, 5).equals("Refs2")) {
					String newKey = key.substring(5);	// strip prefix
					refs2Hash.put(newKey, formData.get(key));
				// now, store answers to project specific questions in Answer records
				} else if (key.length() >= 5 && key.substring(0, 5).equals("ProjQ")) {
					String newKey = key.substring(6);	// strip prefix
					projQHash.put(newKey, formData.get(key));
				}
				/*} else if (key.length() >= 6 && key.substring(0, 6).equals("ProjQ1")) {
					String newKey = key.substring(6);	// strip prefix
					projQ1Hash.put(newKey, formData.get(key));
				} else if (key.length() >= 6 && key.substring(0, 6).equals("ProjQ2")) {
					String newKey = key.substring(6);	// strip prefix
					projQ2Hash.put(newKey, formData.get(key));
				} else if (key.length() >= 6 && key.substring(0, 6).equals("ProjQ3")) {
					String newKey = key.substring(6);	// strip prefix
					projQ3Hash.put(newKey, formData.get(key));
				} else if (key.length() >= 6 && key.substring(0, 6).equals("ProjQ4")) {
					String newKey = key.substring(6);	// strip prefix
					projQ4Hash.put(newKey, formData.get(key));
				} else if (key.length() >= 6 && key.substring(0, 6).equals("ProjQ5")) {
					String newKey = key.substring(6);	// strip prefix
					projQ5Hash.put(newKey, formData.get(key));
				}*/
				else {
					// assume all other keys belong to the WsnApplication record
					personHash.put(key, formData.get(key));
				}
			}

			// save each of the reference records
			saveReferenceRecord(refpHash, userID);
			saveReferenceRecord(refs1Hash, userID);
			saveReferenceRecord(refs2Hash, userID);
			
			//creates the reference records if they are staff memebers.
			createNewStaffReferenceRecord(WsnApplicationID, "P", refpNewStaffNumber, userID);
			createNewStaffReferenceRecord(WsnApplicationID, "S1", refs1NewStaffNumber, userID);
			createNewStaffReferenceRecord(WsnApplicationID, "S2", refs2NewStaffNumber, userID);

			if (personHash.size() > 0) {
				// note: current design has all non-reference fields (except additional conference-specific questions - Scott Paulis) in the personHash, including page stuff that is not in the WsnApplication table.

				//kb 3/5/03 - if someone unchecks IsApplyingForStaffIntership make sure to delete reference type S2 if exists
				//since all things flow through this method, there isn't a separate place 
				// to check this...  Could do it in reference.jsp instead, but then if the person unchecked
				// the box and then went directly to submit, their S2 reference might still exist.  So it
				// has to be done here in the 'model' (such that it is.  ;) )
				if(personHash.get("CheckboxIsApplyingForStaffInternship")!=null)
				{
					if(personHash.get("IsApplyingForStaffInternship")==null && !"new".equals(WsnApplicationID))
					{
						//field exists and is false.  make sure S2 doesn't exist.
						info.deleteS2IfExists(WsnApplicationID);
					}	
				}

				
				
				// Look to see if any Checkbox fields on this page.
				appFormProcessCheckbox(personHash, "CampusHasStaffTeam");
				appFormProcessCheckbox(personHash, "CampusHasStaffCoach");
				appFormProcessCheckbox(personHash, "CampusHasMetroTeam");
				appFormProcessCheckbox(personHash, "CampusHasOther");
				appFormProcessCheckbox(personHash, "ParticipateImpact");
				appFormProcessCheckbox(personHash, "ParticipateDestino");
				appFormProcessCheckbox(personHash, "ParticipateEpic");
				appFormProcessCheckbox(personHash, "ParticipateCCC");
				appFormProcessCheckbox(personHash, "ParticipateNone");
				appFormProcessCheckbox(personHash, "_1a");
				appFormProcessCheckbox(personHash, "_1b");
				appFormProcessCheckbox(personHash, "_1c");
				appFormProcessCheckbox(personHash, "_1d");
				appFormProcessCheckbox(personHash, "IsApplyingForStaffInternship");
				appFormProcessCheckbox(personHash, "_3a");
				appFormProcessCheckbox(personHash, "_3b");
				appFormProcessCheckbox(personHash, "_3c");
				appFormProcessCheckbox(personHash, "_3d");
				appFormProcessCheckbox(personHash, "_3e");
				appFormProcessCheckbox(personHash, "_3f");
				appFormProcessCheckbox(personHash, "_3g");
				appFormProcessCheckbox(personHash, "_4a");
				appFormProcessCheckbox(personHash, "_4b");
				appFormProcessCheckbox(personHash, "_4c");
				appFormProcessCheckbox(personHash, "_4d");
				appFormProcessCheckbox(personHash, "_4e");
				appFormProcessCheckbox(personHash, "_4f");
				appFormProcessCheckbox(personHash, "_4g");
				appFormProcessCheckbox(personHash, "_4h");
				appFormProcessCheckbox(personHash, "_5a");
				appFormProcessCheckbox(personHash, "_5b");
				appFormProcessCheckbox(personHash, "_5c");
				appFormProcessCheckbox(personHash, "_5d");
				appFormProcessCheckbox(personHash, "_5f");
				appFormProcessCheckbox(personHash, "_19a");
				appFormProcessCheckbox(personHash, "_19b");
				appFormProcessCheckbox(personHash, "_19c");
				appFormProcessCheckbox(personHash, "_19d");
				appFormProcessCheckbox(personHash, "_19e");
				appFormProcessCheckbox(personHash, "_21a");
				appFormProcessCheckbox(personHash, "_21b");
				appFormProcessCheckbox(personHash, "_21c");
				appFormProcessCheckbox(personHash, "_21d");
				appFormProcessCheckbox(personHash, "_21e");
				appFormProcessCheckbox(personHash, "_21f");
				appFormProcessCheckbox(personHash, "_21g");
				appFormProcessCheckbox(personHash, "_21h");

				// dc 2003-01-06: special processing.  Since we can no longer have GENDER field on any screen,
				// anytime the TITLE field is modified, also persist the GENDER field using a value corresponding
				// to the TITLE field value.  We added this logic here since all MS Application forms come
				// thru this action.
				String personTitle = (String) personHash.get("Title");
				if (personTitle != null) {
					// TITLE field was on this page.  So, add the GENDER field to the hash table and persist a value corresponding to Title
					String newGenderKey = "0";	// default to female
					if ("Mr.".equals(personTitle))
						newGenderKey = "1";		// male
					personHash.put("Gender", newGenderKey);
				}

				// dc 2003-01-16: special processing.  Need to update the REGION field based on the student's universityState.
				// Anytime the universityState is modified, also persist the REGION field using the correct value.
				// Region comes from ______.
				String universityState = (String) personHash.get("UniversityState");
				if (!(universityState == null || "".equals(universityState))) {
					// universityState field was on this page.  So, add the REGION field to the hash table
					// todo! lookup region: from a table or hard-coded?  Would be great if from ministry_targetareas
					String newRegion = info.getRegionForState(universityState);
					log.trace("calling info.getRegionForState(" + universityState + ") region=" + newRegion + "=");
					personHash.put("Region", newRegion);
				}

				// 2003-01-13: need to always update "LastChanged" fields
				personHash.put("LastChangedBy", userID);
				personHash.put("LastChangedDate", (new SimpleDateFormat("MM/dd/yyyy")).format( new Date() ));

				// Need to add the ssmUserID field, so that it persists correctly
				personHash.put("SsmUserID", userID);

				log.trace("calling info.saveObjectHash from personHash.WsnApplicationID=" + WsnApplicationID + " hashsize=" + personHash.size());
				personHash = info.saveObjectHash(personHash, WsnApplicationID, WsnApplicationIDName, WsnApplicationClassName);
								// dc 2-11-2003: added check for personHash=null.  This is a "should never happen" error.  If it does, display error page instead of continuing.
				if (personHash == null) {
					String sErr = "saveObjectHash returned NULL in MSController.appFormSave()  WsnApplicationID="+WsnApplicationID;
					log.error(sErr);
					goToErrorPage(ctx, sErr);
					return;
				} else {
				}
				
				// save project specific question records into Answer records
				// repeat for each of the 5 preferred projects
						
				for(int projectprefno=1;projectprefno<6;projectprefno++)
				{
					String projectprefid= (String)personHash.get("ProjectPref"+Integer.toString(projectprefno));
					
					if(!projectprefid.equals(""))
					{
						Collection questions = info.listProjectQuestions(projectprefid,"displayOrder", "ASC");
						
						Iterator qi = questions.iterator();
			
						if(!questions.isEmpty())
						{
							while (qi.hasNext()) 
							{
								Question q = (Question) qi.next();
								
								// if question was not asked on the previous page, don't worry about saving the answer
								try {
								
									if (!q.getAnswerType().equals("divider")
											&& !q.getAnswerType().equals("info")
											&& !q.getAnswerType().equals("hide")) 
									{
										Hashtable values = new Hashtable();
										String answer="";
										if (q.getAnswerType().equals("textL")){	//paragraphs have a "t" preface
											answer = ctx.getInputString("t"+String.valueOf(q.getQuestionID()), true);
										} else {
											answer = ctx.getInputString(String.valueOf(q.getQuestionID()), true);
										}
										values.put("QuestionID", String.valueOf(q.getQuestionID()));
										answer = answer == null ? "" : answer;
										if (q.getAnswerType().equals("checkbox"))
											answer = "Yes".equals(answer) ? "Yes" : "No";
										values.put("Body", answer);
										
										values.put("WsnApplicationID",
												ctx.getSession().getAttribute("WsnApplicationID"));
										info.saveAnswer(values);
									}
								} catch (MissingRequestParameterException mrpe) {
									log.warn("question not asked in submitted form, not saving answer");
								} catch (Exception ex){
									throw ex;
								}
							}
						}
					}
				}

				
			}
			
			

			// Save processing is done.
			// Decide what to do next.
			if (nextAction.equals("goToView")) {
				// blank means just to go to the specified page.  Assumes page is part of the reference form family.

                //kb 11/1/02 - need existing payments available to payment page.
				if("payment".equals(nextParm))
				{
        			Hashtable existingpayments = info.getExistingPayments(formData);
	        		ar.addHashtable("existingpayments", existingpayments);
	        		ar.putValue("AppFee", info.getApplicationFee());
				}//end kb

				ar.putValue("page", nextParm);
				ctx.setReturnValue(ar);
				ctx.goToView(nextParm);
			} else if (nextAction.equals("appFormRefDelCreateBlnk")) {
				// 3-5-03 kl: new method corrects behavior of Staff List Ref Yes button
				appFormRefDelCreateBlnk(ctx);
			} else if (nextAction.equals("appFormRefDelete")) {
				appFormRefDelete(ctx);
			} else if (nextAction.equals("appFormRefResendEmailInvite")) {
				appFormRefResendEmailInvite(ctx);
			} else if (nextAction.equals("appFormRefStaffAdd")) {
				appFormRefStaffAdd(ctx);
			} else if (nextAction.equals("appFormRefStaffLookup")) {
				appFormRefStaffLookup(ctx);
			} else if (nextAction.equals("appFormSubmit")) {
				appFormSubmit(ctx);
			}
		} catch(Exception e) {
			String sErr = "Exception encountered in MSController.appFormSave(): "+e;
			log.error(sErr, e);
			goToErrorPage(ctx, sErr);
		}
	}

	// 3-6-03 kl: appFormRefDelCreateBlnk new method corrects behavior of Yes button on reference.jsp staff member reference
	public void appFormRefDelCreateBlnk(ActionContext ctx) {
		WsnReference oldRef;
		String strOldRef = null;
		
		log.trace("Running appFormRefDelCreateBlnk()...");
		if(!isLoggedIn(ctx)){getNotAuthorizedPage(ctx);return;}
		
		try {
			ActionResults ar = new ActionResults();
			String WsnApplicationID = ctx.getInputString("WsnApplicationID");
			String nextParm = ctx.getInputString("nextParm");
			String userID = ctx.getInputString("userID");
			// nextParm should be of the format: "A&B" where A is the refpRefID, B is the refpType
			int i = nextParm.indexOf("&");
			String refpRefID = nextParm.substring(0, i);  // get refpRefID
			String refpType = nextParm.substring(i+1);  // get refpType

			// if nextParm is not new, record exists so delete the record from the database
			if (!(refpRefID.equals("new") || refpRefID.equals("0"))) {
			info.deleteObject(WsnReferenceClassName, refpRefID);
			}
			// delete any existing reference record (rec possibly just created by saveReferenceRecord)
			//check to see if oldRef is not null
			oldRef = info.getWsnReferenceWithWsnApplication(WsnApplicationID, refpType);
			if(oldRef != null) {
				strOldRef = String.valueOf(oldRef.getReferenceID());	
			}
			
			if (!(strOldRef == null || strOldRef.equals("0"))) {
				info.deleteObject(WsnReferenceClassName, String.valueOf(oldRef.getReferenceID()));
			}
			String page = "";
			String wsnReferenceID = "";
			// load Reference object
			WsnReference ref = new WsnReference();
			ref.setWsnApplicationIdStr(WsnApplicationID);
			ref.setReferenceType(refpType);
			ref.setLastChangedBy(userID);
			// persist the reference object, create a blank record with IsStaff true, displays Staff Search button
			Hashtable refSave = new Hashtable();
		    refSave = ObjectHashUtil.obj2hash(ref);
			Boolean pIsStaff = new Boolean(true);
			refSave.put("IsStaff", pIsStaff);

			info.saveObjectHash(refSave, wsnReferenceID, WsnReferenceIDName, WsnReferenceClassName);

			// returns to the application's reference page
			page = "reference";
			ar.putValue("page", page);
			ar.putValue("message", "Reference has been deleted.");
			ctx.setReturnValue(ar);
			ctx.goToView(page);
		} catch(Exception e) {
			String sErr = "Exception encountered in MSController.appFormRefDelCreateBlnk(): "+e;
			log.error(sErr, e);
			goToErrorPage(ctx, sErr);
		}
	}


	private void saveReferenceRecord(Hashtable hash, String userID) throws Exception {
		try {
			if (hash.size() > 0) {
				String refID = (String)hash.get(WsnReferenceIDName);
				// See if email address was modified:
				String oldEmail = (String)hash.get("OldCurrentEmail");
				String newEmail = (String)hash.get("CurrentEmail");
				if (oldEmail != null && oldEmail.length() != 0 &&  newEmail != null && newEmail.length() != 0) {
					// see if user modified the email address field
					if (!oldEmail.equals(newEmail)) {
						// user changed the email.  Need to delete the old reference record and create a new one.
						log.info("Because email address changed, deleting old Reference record refID=" + refID);
						info.deleteObject(WsnReferenceClassName, refID);
						refID = "new"; // this will force the saveObjectHash to create a new record
					}
				}
				hash.remove("OldCurrentEmail");
				hash.put("LastChangedDate", (new SimpleDateFormat("MM/dd/yyyy")).format( new Date() ));
				hash.put("LastChangedBy", userID);
				hash = info.saveObjectHash(hash, refID, WsnReferenceIDName, WsnReferenceClassName);
			}
		} catch(Exception e) {
			throw e;
		}
	}
	

	/* added dc 01/31/03
	 * For the given staff number, create a new reference record if a staff number i provided
	 */
	private synchronized void createNewStaffReferenceRecord(String WsnApplicationID, String refType, String staffNumber, String userID) {
		log.debug("createNewStaffReferenceRecord: pid="+WsnApplicationID+" type="+refType+" staffNumber="+staffNumber);
		if (staffNumber.equals("")) {
			// no new reference specified, so just return
			return;
		}

		// first, delete any existing reference record
		WsnReference oldRef = info.getWsnReferenceWithWsnApplication(WsnApplicationID, refType);
		if (oldRef != null) {
			log.debug("createNewStaffReferenceRecord: deleting old reference");
			info.deleteObject(WsnReferenceClassName, String.valueOf(oldRef.getReferenceID()));
		}

		// second, create the reference record
		WsnReference ref = new WsnReference();

		// 1. Get staff information
		Hashtable s = info.getReferenceStaffMember(staffNumber);
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
		ref.setWsnApplicationIdStr(WsnApplicationID);
		ref.setReferenceType(refType);

		// 3. persist the new reference record
		Hashtable refSave = new Hashtable();
		refSave = ObjectHashUtil.obj2hash(ref);
		refSave.put("IsStaff", "true"); // boolean values do not convert from obj to hash tables in info.obj2hash!!!
		refSave.put("LastChangedDate", (new SimpleDateFormat("MM/dd/yyyy")).format( new Date() ));
		refSave.put("LastChangedBy", userID);
		String refID = "new"; // this will force the saveObjectHash to create a new record
		log.trace("info.saveObjectHash refID="+refID);
		info.saveObjectHash(refSave, refID, WsnReferenceIDName, WsnReferenceClassName);
	}


	/* added dc 11/5/02
		Checkboxes on an HTML page do not return if they are unchecked upon submitting the form.
		So, each checkbox field has another hidden field that is "Checkbox" + <field-name>.
		The presence of this hidden field helps us know the value of the real field.
	*/
	private void appFormProcessCheckbox(Hashtable h, String s) {
		String c = "Checkbox" + s;	// create key prefixed with "Checkbox"
		// see if this key in hashtable (and thus the CheckBox field existed on the page being saved)
		if (h.get(c) != null) {
			// key exists, so this field was on the screen
			// 1. remove the checkbox field
			h.remove(c);
			// 2. add the correct "real" field
			if (h.get(s) == null)
				// checkbox was unchecked, so add this
				h.put(s, "false");
			else
				// replace the field with TRUE, instead of ON that the checkbox returns
				h.put(s, "true");
		}
	}


	/* added dc 10/18/02
		nextAction = "appFormRefDelete" - called from appFormSave()
		Executes when an applicant clicks on "Delete" on the application reference page.
	*/
	public void appFormRefDelete(ActionContext ctx) {
		if(!isLoggedIn(ctx)){getNotAuthorizedPage(ctx);return;} //Added kb-12/18/02 - checks security
		try {
			ActionResults ar = new ActionResults();
			String nextParm = ctx.getInputString("nextParm");
			String page = "";

			// just deletes the record from the database
			info.deleteObject(WsnReferenceClassName, nextParm);

			// returns to the application's reference page
			page = "reference";
			ar.putValue("page", page);
			ar.putValue("message", "Reference has been deleted.");
			ctx.setReturnValue(ar);
			ctx.goToView(page);
		} catch(Exception e) {
			String sErr = "Exception encountered in MSController.appFormRefDelete(): "+e;
			log.error(sErr);
			goToErrorPage(ctx, sErr);
		}
	}


	/* added dc 10/18/02
		nextAction = "appFormRefResendEmailInvite" - called from appFormSave()
		Executes when an applicant clicks on "Resend Email Invitation" on the application reference page.
	*/
	public void appFormRefResendEmailInvite(ActionContext ctx) {

		if(!isLoggedIn(ctx)){getNotAuthorizedPage(ctx);return;} //Added kb-12/18/02 - checks security

		ActionResults ar = new ActionResults();
		try {
			String message = "Email could not be sent!  Please recheck validity of email address.";
			// nextParm will be "Refp", "Refs1", or "Refs2" indicating which reference to send the email to
			String refPrefix= ctx.getInputString("nextParm");
			Hashtable formData = ctx.getHashedRequest();
			String pID = (String) formData.get(refPrefix + "WsnApplicationId");
			String refType = refPrefix.substring(3);
			String page = "";
			// load Reference object
			WsnReference ref = new WsnReference();
			MSInfo info = new MSInfo();
			ref = info.getWsnReferenceWithWsnApplication(pID, refType);
			// 12-18-03 kl: set up check for valid reference name and email
			String refFirstName = ref.getFirstName();
			String refLastName = ref.getLastName();
			String refCurrentEmail = ref.getCurrentEmail();
            if (ref == null) {
				message = "INTERNAL ERROR: Cannot find reference to send email to.  (PersonID="+pID+" refType="+refType+")";
			} else if (refFirstName.trim().equals("") || refLastName.trim().equals("") || refCurrentEmail.trim().equals("")) {
				// checks for valid reference name and email
				message = "Email could not be sent!  Please recheck validity of Reference First Name, Last Name and/or Email Address.";
			} else {
				WsnApplication person = (WsnApplication) info.getObject(WsnApplicationClassName, String.valueOf(ref.getWsnApplicationId()));
                ref.setWsnApplication(person);
				// 12-18-03 kl: set up check if app email equals reference email
				String personCurrentEmail = person.getCurrentEmail();
                // send email invitation
				if (refCurrentEmail.equals(personCurrentEmail)) {
					message = "Email could not be sent!  Reference Email and Personal Address cannot match.";
				} else if (ref.sendEmailInvite(ctx.getRequest().getServerName())) {
					message = "An email invitation has been sent to " + ref.getFirstName() + " " + ref.getLastName() + ".";
				}
            }

			// returns to the application's reference page
			page = "reference";
			ar.putValue("page", page);
			ar.putValue("message", message);
			ctx.setReturnValue(ar);
			ctx.goToView(page);
		} catch(Exception e) {
			String sErr = "Exception encountered in MSController.appFormRefResendEmailInvite(): "+e;
			log.error(sErr, e);
			goToErrorPage(ctx, sErr);
		}
	}


	/* added dc 10/29/02
		nextAction = "appFormRefStaffAdd" - called from appFormSave()
		Executes when an applicant clicks on a staff member on the application reference page.
    Copies this staff's information into the reference.
	*/
	public void appFormRefStaffAdd(ActionContext ctx) {
		if(!isLoggedIn(ctx)){getNotAuthorizedPage(ctx);return;} //Added kb-12/18/02 - checks security
		try {
			ActionResults ar = new ActionResults();
			String nextParm = ctx.getInputString("nextParm");
			// nextParm should be of the format: "9&AccountNo=8" where 9 is the RefID to plug this staff into, 8 if the staff's account number
			int i = nextParm.indexOf("&");
			String wsnReferenceID = nextParm.substring(0, i);  // get ref id
			int j = nextParm.indexOf("=");
			String staffNo = nextParm.substring(j+1);  // get staff number
		log.debug("appFormRefStaffAdd: refid=" + wsnReferenceID + " staffno=" + staffNo);

			// load Reference object
			WsnReference ref = new WsnReference();
			ref = (WsnReference) info.getObject(WsnReferenceClassName, wsnReferenceID);


			// read the staff object, and set all the reference fields
			String t;	// temp string
			Hashtable s = info.getReferenceStaffMember(staffNo);
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
			refSave.put("IsStaff", "true"); // boolean values do not convert from obj to hash tables in info.obj2hash!!!
//            Hashtable wsnReferenceHash = info.saveObjectHash(refSave, wsnReferenceID, WsnReferenceIDName, WsnReferenceClassName);
            info.saveObjectHash(refSave, wsnReferenceID, WsnReferenceIDName, WsnReferenceClassName);


			// redisplay reference page
			String page = "reference";
			ar.putValue("page", page);
			ctx.setReturnValue(ar);
			ctx.goToView(page);
		} catch(Exception e) {
			String sErr = "Exception encountered in MSController.appFormRefStaffAdd(): "+e;
			log.error(sErr);
			goToErrorPage(ctx, sErr);
		}
	}


	/* added dc 10/29/02
		nextAction = "appFormRefStaffLookup" - called from appFormSave()
		Executes when an applicant clicks on "Staff Lookup" on the application reference page.
	*/
	public void appFormRefStaffLookup(ActionContext ctx) {
		if(!isLoggedIn(ctx)){getNotAuthorizedPage(ctx);return;} //Added kb-12/18/02 - checks security
		log.trace("Running appFormRefStaffLookup()...");
		ActionResults ar = new ActionResults();
		try {
			// return to this same page and display search results
			String page = "reference";
			// nextParm will be "Refp", "Refs1", or "Refs2" indicating which reference to get the names out of and return the results to
			String refPrefix = ctx.getInputString("nextParm");
		log.debug("refPrefix=" + refPrefix);

			// get the name to search on:
			Hashtable formData = ctx.getHashedRequest();
			String firstName = ((String) formData.get(refPrefix + "FirstName")).trim();
			String lastName = ((String) formData.get(refPrefix + "LastName")).trim();
		log.debug("FirstName=" + firstName + "  LastName=" + lastName);

			// search for the name
			Hashtable staffInfo = info.getReferenceFindStaff(firstName, lastName);
			// hashtable of names (or with "ErrorMessage") that is returned is prefixed with "Refp", "Refs1" or "Refs2"
			ar.addHashtable(refPrefix + "StaffInfo", staffInfo);

			ar.putValue("page", page);
			ctx.setReturnValue(ar);
			ctx.goToView(page);
		} catch(Exception e) {
			String sErr = "Exception encountered in MSController.appFormRefStaffLookup(): "+e;
			log.error(sErr);
			goToErrorPage(ctx, sErr);
		}
	}


	/* added dc 11/07/02
		nextAction = "appFormSubmit" - called from appFormSave()
		Executes when an applicant clicks on "Submit Application" on the application form.
	*/
	public void appFormSubmit(ActionContext ctx) {
		if(!isLoggedIn(ctx)){getNotAuthorizedPage(ctx);return;} //Added kb-12/18/02 - checks security
		try {
			ActionResults ar = new ActionResults();
			String page = "";
			String ID = ctx.getInputString("nextParm");
			WsnProject memberProject = new WsnProject();

			// 2003-01-20: dc Changed this code to be able to retrieve a person object and persist it directly, without using a hash table!

			// get the person object
			WsnApplication person = new WsnApplication();
			try {
				person = new WsnApplication(ID);
			}
			catch (Exception e) {
				String sErr = EXCEPTION_REF_FORM_SUBMIT + "appFormEdit: broker.getGenericObject() failed. WsnApplication ID=" + ID + " not found.";
				log.error(sErr);
				goToErrorPage(ctx, sErr);
				return;
			}

			String submitErrors = person.submitApplication();
			if (submitErrors == ""){
				// no errors, check 1 more thing. Get valid project to become a member of:
				memberProject = new WsnProject(person.getAssignedToProject());
				if (memberProject == null) {
					submitErrors = "Internal error: info.getObject(WsnProjectClassName, " + person.getAssignedToProject() + ") is null.";
				} else {
					person.setIsMember(memberProject);
				}
			}

			// Now, either display error page, or submit the application.
			if (submitErrors != ""){
				log.info("Application submission unsuccessful");
				// SUBMIT DID NOT WORK! So, redisplay appsubmit page with errors.
				page = "appsubmit";
				ar.putValue("page", page);
				ar.putValue("MissingFields", submitErrors);
				// convert person object to hash table that JSP is expecting
				ctx.setReturnValue(ar);
				ctx.goToView(page);
				return;
			}

			// SUBMIT WORKED!
			// write the object back to the database and keep processing...
			person.persist();
			memberProject.persist();

			// send emails
			// need to send a Reference Invitation email to each Reference that exists and is not yet submitted.
			WsnReference ref = new WsnReference();
			// Send to the PEER Reference
			ref = info.getWsnReferenceWithWsnApplication(ID, "P");
			if (ref != null  &&  !ref.getIsFormSubmitted())
				ref.sendEmailInvite(ctx.getRequest().getServerName());
			// Send to the SPIRITUAL LEADER #1 Reference
			ref = info.getWsnReferenceWithWsnApplication(ID, "S1");
			if (ref != null  &&  !ref.getIsFormSubmitted())
				ref.sendEmailInvite(ctx.getRequest().getServerName());
			// Send to the SPIRITUAL LEADER #2 Reference
			ref = info.getWsnReferenceWithWsnApplication(ID, "S2");
			if (ref != null  &&  !ref.getIsFormSubmitted())
				ref.sendEmailInvite(ctx.getRequest().getServerName());

			log.info("Application submission successful");
			// tell user submission worked
			page = "appsubmitted";
			ar.putValue("page", page);
			ctx.goToView(page);
			return;

		} catch(Exception e) {
			String sErr = "Exception encountered in MSController.appFormSubmit(): "+e;
			log.error(sErr);
			goToErrorPage(ctx, sErr);
		}
	}

	/****************************************************************************************
	/****************************************************************************************
		Reference Form Methods:												added dc 9/27/02
		Methods in this section are used to run the Reference Forms.
	****************************************************************************************/
	/****************************************************************************************

	/* added dc 9/27/02
		Displays an application's reference form to be edited.  This is the entry point for
		a reference person to access their reference form.  The person does NOT have to be
		logged in.  They can access the reference form, and that's it!
		- To get here, the user clicks on the direct link contained in an invitation email like:
		http://www....com/.../servlet/MSController?action=refFormEncEdit&encRefID=1Pd84j3782kds8.
		- Requires an input string of "encRefID" which is the encoded reference id.
	*/
	public void refFormEncEdit(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			Hashtable hs = new Hashtable();
			String page = "";
			WsnReference ref = new WsnReference();

			// get the encrypted reference form ID
			String encryptedRefID = ctx.getInputString("encRefID");
			log.debug("refFormEncEdit: encryptedRefID=" + encryptedRefID);
			if (encryptedRefID == null)	{
				log.warn("refFormEncEdit: encRefID not specified");
				page = "refNotFound";
				ctx.goToView(page);
				return;
			}

			// decrypt the encrypted referenceID
			String refID = ref.decodeReferenceID(encryptedRefID);
			ref.setReferenceID(refID);
			if (refID == null || refID.equals("") || refID.equals("0") || !ref.select()) {
				ref = null;
			}
			//ref = (WsnReference) info.getObject(WsnReferenceClassName, refID);
			if (ref == null) {
				log.error("refFormEncEdit: ref is null: WsnReference id=" + refID + " not found.");
				page = "refNotFound";
				ctx.goToView(page);
				return;
			}

			// get the optional 'eval' parameter.  If it exists and is 'y', then allow edit EVEN IF ref form already submitted
			// 2003-01-27 dc: added to submit view/edit from MS Evaluation pages.
			String evalparm = ctx.getInputString("eval");
			if (ref.getIsFormSubmitted()  &&  (evalparm == null  ||  !evalparm.equals("y")) ) {
				log.debug("refFormEncEdit: Form already submitted");
				page = "refAlreadySubmitted";
				ctx.goToView(page);
				return;
			}

			// Display an edit page, send object info to it.
			page = "ref1";
			ar.putValue("page", page);

			// convert ref object to hash table that JSP is expecting
			hs = ObjectHashUtil.obj2hash(ref);
			ar.addHashtable("wsnReferenceHash", hs);

			// reference form pages expect WsnApplication hashtable too.
			Hashtable WsnApplicationHash = info.getObjectHash(WsnApplicationClassName, (String)hs.get("WsnApplicationId"));
			ar.addHashtable("WsnApplicationHash", WsnApplicationHash);

			ctx.setReturnValue(ar);
			ctx.goToView(page);
		} catch(Exception e) {
			String sErr = "Exception encountered in MSController.refFormEncEdit(): "+e;
			log.error(sErr, e);
			goToErrorPage(ctx, sErr);
		}
	}

	/* added dc 2003-01-027
		Creates a new application form to be edited.  This is used instead of refFormEncEdit()
		when no reference record exists yet.
	*/
	public void refFormAdd(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			Hashtable hs = new Hashtable();
			String page = "";
			WsnReference ref = new WsnReference();

			// get the WsnApplication ID
			String personID = ctx.getInputString("personID");
			if (personID == null)	{
				String sErr = "refFormAdd: personID not specified";
				log.error(sErr);
				goToErrorPage(ctx, sErr);
				return;
			}
			// get the referenceType:
			String refType = ctx.getInputString("refType");
			if (personID == null)	{
				String sErr = "refFormAdd: refType not specified";
				log.error(sErr);
				goToErrorPage(ctx, sErr);
				return;
			}


			// create the reference object that we are expecting.
			Hashtable h = new Hashtable();
			h.put("WsnApplicationId", personID);
			h.put("ReferenceType", refType);
			h.put("FirstName", "_First Name"); // why is this here?
			hs = info.saveObjectHash(h, "new", WsnReferenceIDName, WsnReferenceClassName);
			

			// Display an edit page, send object info to it.
			page = "ref1";
			ar.putValue("page", page);

			// convert ref object to hash table that JSP is expecting
			ar.addHashtable("wsnReferenceHash", hs);

			// reference form pages expect WsnApplication hashtable too.
			Hashtable WsnApplicationHash = info.getObjectHash(WsnApplicationClassName, (String)hs.get("WsnApplicationId"));
			ar.addHashtable("WsnApplicationHash", WsnApplicationHash);

			ctx.setReturnValue(ar);
			ctx.goToView(page);
		} catch(Exception e) {
			String sErr = "Exception encountered in MSController.refFormAdd(): "+e;
			log.error(sErr);
			goToErrorPage(ctx, sErr);
		}
	}



//**deprecated 12/04/02 by dc
	/* added dc 10/17/02
		Displays an application's reference form to be viewed or edited.
		This is the entry point for logged in users of the system to access a reference form.
	*/
/***
	public void refFormEdit(ActionContext ctx) {
		try {

			// TODO! Write this method, once we figure out:
			//	- from where this can be called
			//	- what "modes" it needs to run in (edit for ref person, edit for superuser, view only, others?)
			//	- how to handle the difference between an ssmUser and a staff user logged in.
			String sErr = "MSController.refFormEdit() is not yet coded.";
			log.error(sErr);
			goToErrorPage(ctx, sErr);
		} catch (Exception e) {
			String sErr = ("Exception encountered in MSController.refFormEdit(): "+e);
			log.error(sErr);
			goToErrorPage(ctx, sErr);
		}
	}

***/


	/* added dc 10/14/02
		Executes when the person clicks on ANY and ALL navigation link while a person is editing a reference form.
		This will save the data from the screen, and then execute the desired nextAction.
	*/
	public void refFormSave(ActionContext ctx) {

		try {
			log.trace("Executing MSController.refFormSave()");
			ActionResults ar = new ActionResults();
			Hashtable formData = ctx.getHashedRequest();
			String nextAction = ctx.getInputString("nextAction");
			String nextPage = ctx.getInputString("page");			//todo: change to nextPage everywhere in editrefform
			String refID = ctx.getInputString("refID");
			String userID = ctx.getInputString("userID");
			if (userID == null)
				userID = "0";	// meaning the actual reference person edited it

			if (formData != null && refID != null) {
				log.debug("MSController.refFormSave(): Form data contained an id=" + refID + ".  userid="+userID);

				// 02-19-03: dc need to get the current WorkFlowStatus so that it is set correctly.
				// 1st, get the 
				WsnReference ref = new WsnReference();
				ref = (WsnReference) info.getObject(WsnReferenceClassName, refID);

				// we've got all the info we need, so we can save the object.
				if (!ref.getFormWorkflowStatus().equals("D")) {
					// only set the workflow status to I if it is N or I, not D
					formData.put("FormWorkflowStatus", "I");
				}
				formData.put("LastChangedDate", (new SimpleDateFormat("MM/dd/yyyy")).format( new Date() ));
				formData.put("LastChangedBy", userID);
				Hashtable wsnReferenceHash = info.saveObjectHash(formData, refID, WsnReferenceIDName, WsnReferenceClassName);
				// we have the saved reference object back, so give it to next page.
				ar.addHashtable("wsnReferenceHash", wsnReferenceHash);

				// reference form pages expect WsnApplication hashtable too.
				Hashtable WsnApplicationHash = info.getObjectHash(WsnApplicationClassName, (String)wsnReferenceHash.get("WsnApplicationId"));
				ar.addHashtable("WsnApplicationHash", WsnApplicationHash);
			}

			// Save processing is done.
			// Decide what to do next.
			if (nextAction.equals("goToView")) {
				// blank means just to go to the specified page.  Assumes page is part of the reference form family.
				ar.putValue("page", nextPage);
				ctx.setReturnValue(ar);
				ctx.goToView(nextPage);
			} else if (nextAction.equals("refFormFinishLater")) {
				refFormFinishLater(ctx);
			} else if (nextAction.equals("refFormSubmit")) {
				refFormSubmit(ctx);
			}
		}

		catch(Exception e) {
			log.error("Exception encountered in MSController.refFormSave()", e);
			goToErrorPage(ctx, EXCEPTION_DURING_SAVE);
		}
	}


	/* added dc 9/27/02
		nextAction = "refFormSubmit" - called from refFormSave()
		Executes when a reference person attempts to submit a completed reference form.
		Checks to ensure reference form is ready to be submitted (eg: required fields are completed).
		If not, redisplays ref9 page with reasons why can't finish.
	*/
	public void refFormSubmit(ActionContext ctx) {

		try {
			ActionResults ar = new ActionResults();
			String page = "";
			Hashtable hs = new Hashtable();
			String refID = ctx.getInputString("refID");
//			int ec = 0; // error counter


			// get the reference object
			WsnReference ref = new WsnReference();
			try {
				log.trace("refFormSubmit: trying info.getObject(WsnReferenceClassName)");
				ref = (WsnReference) info.getObject(WsnReferenceClassName, refID);
			}
			catch (Exception e) {
				String sErr = EXCEPTION_REF_FORM_SUBMIT + "refFormEdit: info.getObject failed. WsnReference refID=" + refID + " not found.";
				log.error(sErr, e);
				goToErrorPage(ctx, sErr);
				return;
			}

			String submitErrors = ref.submitReference();
			if (submitErrors != ""){
				// errors in the submit, so redisplay ref9 with errors
				page = "ref9";
				ar.putValue("page", page);
				ar.putValue("MissingFields", submitErrors);
				// convert ref object to hash table that JSP is expecting
				hs = ObjectHashUtil.obj2hash(ref);
				ar.addHashtable("wsnReferenceHash", hs);
				ctx.setReturnValue(ar);
				ctx.goToView(page);
				return;
			}


			// Submit worked!
			// I must update the submission fields, and persist the object
			log.debug("refFormSubmit: submitReference=TRUE!");
			ref.setFormWorkflowStatus("D");		// mark reference form as "DONE"
			ref.setIsFormSubmitted(true);	// mark reference form as "SUBMITTED"
			ref.setFormSubmittedDate(new Date());	// record date of submission

			/*
			 10-11-02 NOTE! I wanted to be able to just persist the ref object which already exists and, but we could NOT get it working. So instead, we resorted to created an empty new hash table, loading the fields we know we want to persist, and calling go old "saveObjectHash"

			 Here is the code we attempted:

						log.debug("calling info.saveObject id=" + id + " idName=" + idName + " className=" + className);
						if (info.saveObject(ref, id, idName, className) == null) {
							String sErr = EXCEPTION_REF_FORM_SUBMIT + "refFormEdit: info.saveObject failed.";
							log.error(sErr);
							goToErrorPage(ctx, sErr);
							return;
						}
			*/

			// dumb, but create a temp hashtable with fields that need persisting, and then persist the hashtable to the db
			log.debug("calling info.saveObjectHash refID=" + refID);
			Hashtable hsSave = new Hashtable();
			hsSave.put("FormWorkflowStatus", ref.getFormWorkflowStatus());
			hsSave.put("IsFormSubmitted", (ref.getIsFormSubmitted() ? "true" : "false"));
			hsSave.put("FormSubmittedDate", (new SimpleDateFormat("MM/dd/yyyy")).format( ref.getFormSubmittedDate() ));
			Hashtable wsnReferenceHash = info.saveObjectHash(hsSave, refID, WsnReferenceIDName, WsnReferenceClassName);
			if (wsnReferenceHash == null) {
				String sErr = EXCEPTION_REF_FORM_SUBMIT + "refFormEdit: info.saveObjectHash failed.";
				log.error(sErr);
				goToErrorPage(ctx, sErr);
				return;
			}

			// load Applicant person into ref object
			WsnApplication person = (WsnApplication) info.getObject(WsnApplicationClassName, String.valueOf(ref.getWsnApplicationId()));
			ref.setWsnApplication(person);

			// send reference person an email thank-you
			ref.sendEmailThankYou();
			// send applicant, and others, an email saying reference is done
			ref.sendEmailRefComplete();

			// tell user submission worked
			page = "refFormSubmitted";
			ctx.goToView(page);

		} catch(Exception e) {
			String sErr = EXCEPTION_REF_FORM_SUBMIT;
			log.error(sErr, e);
			goToErrorPage(ctx, sErr);
		}
	}


	/* added dc 10/11/02
		nextAction = "refFormFinishLater" - called from refFormSave()
		Executes when a reference person clicks on "Finish Later".
		Just displays the "please come again and finish" page.
	*/
	public void refFormFinishLater(ActionContext ctx) {

		String refID = ctx.getInputString("refID");
		String page = "";
		WsnReference ref = new WsnReference();
		try {
			ref = (WsnReference) info.getObject(WsnReferenceClassName, refID);
			// load Applicant person into ref object
			WsnApplication person = (WsnApplication) info.getObject(WsnApplicationClassName, String.valueOf(ref.getWsnApplicationId()));
			ref.setWsnApplication(person);
			ref.sendEmailReminder(ctx.getRequest().getServerName());
			page = "refFinishLater";
			ctx.goToView(page);
		} catch(Exception e) {
			String sErr = "Exception encountered in MSController.refFormFinishLater()";
			log.error(sErr, e);
			goToErrorPage(ctx, sErr);
		}
	}



	/****************************************************************************************/
	/****************************************************************************************/


        //refactored out.  kb 10/16/02
        //returns the correct page for the type of payment the user wishes to make
    	public void actionChoosePayment(ActionContext ctx)
    	{
		if(!isLoggedIn(ctx)){getNotAuthorizedPage(ctx);return;} //Added kb-12/18/02 - checks security
            ActionResults ar = new ActionResults();
			Hashtable formData = ctx.getHashedRequest();
			String page = ctx.getInputString("page");

            //choose the next page (payccard, paymail, paystaff)
			page = info.getNextPaymentPage(formData);

			log.debug("Returning page: " + page);

			ar.putValue("AppFee", info.getApplicationFee());

			ar.putValue("page", page);
			ctx.setReturnValue(ar);
			ctx.goToView(page);
		}


		//refactored out.  kb 10/16/02
		// processes the payment action.
		public void actionProcessPayment(ActionContext ctx)
		{
		if(!isLoggedIn(ctx)){getNotAuthorizedPage(ctx);return;} //Added kb-12/18/02 - checks security
            ActionResults ar = new ActionResults();
			Hashtable formData = ctx.getHashedRequest();
			String page = ctx.getInputString("page");
			HttpSession session = ctx.getSession();

            formData.put("Fk_WsnApplicationID", session.getAttribute("WsnApplicationID"));
            Hashtable returnvals = null;

            formData.put("ServerName",ctx.getRequest().getServerName());

            //choose the next page (payccard, paymail, paystaff)
			returnvals = info.processPayment(formData);

			page = (String) returnvals.get("page");
			log.debug("Returning page: " + page);

			if(returnvals.get("ErrorMessage")!=null)
			    ar.putValue("ErrorMessage",(String)returnvals.get("ErrorMessage"));

			ar.putValue("AppFee", info.getApplicationFee());

			ar.putValue("page", page);
			ar.putValue("PaymentType",(String)formData.get("PaymentType"));

			//KL: 11/3/03 - need existing payments available to payment page.
			Hashtable existingpayments = info.getExistingPayments(formData);
			ar.addHashtable("existingpayments", existingpayments);
			ar.putValue("AppFee", info.getApplicationFee());

			ctx.setReturnValue(ar);
			ctx.goToView(page);

		}

		//user enters firstname/lastname of staff who will pay.
		//kb 10/21
		public void actionPaymentFindStaff(ActionContext ctx)
		{
		if(!isLoggedIn(ctx)){getNotAuthorizedPage(ctx);return;} //Added kb-12/18/02 - checks security
            ActionResults ar = new ActionResults();
			Hashtable formData = ctx.getHashedRequest();
			String page = ctx.getInputString("page");

            page = "paystaff"; //displays the result of the search

			Hashtable staffInfo = info.getPaymentFindStaff(formData);

			ar.addHashtable("staffInfo", staffInfo);

			if(staffInfo.containsKey("ErrorMessage"))
			    ar.putValue("ErrorMessage",(String)staffInfo.get("ErrorMessage"));

			ar.putValue("AppFee", info.getApplicationFee());

			ar.putValue("page", page);
			ctx.setReturnValue(ar);
			ctx.goToView(page);
		}


		//kb 10/22/02 - used by the SummerProjectCoordinator to
		//  receive and post payments into the system.
	    //to start this process, use: .../action=goToPage&page=receivepayment
	    //that page posts to here.
		public void actionPostReceivePayments(ActionContext ctx)
		{

            ActionResults ar = new ActionResults();
			Hashtable formData = ctx.getHashedRequest();

			Hashtable results = info.receivePayments(formData);

			ar.addHashtable("people", results);

			if(!results.containsKey("ErrorMessage"))
			    results.put("ErrorMessage","That application was marked as paid.");

			String page = (String) results.get("page");

			ar.putValue("AppFee", info.getApplicationFee());

			ar.putValue("page", page);
			ctx.setReturnValue(ar);
			ctx.goToView(page);

		}

		//kb 10/22/02 - look for people who haven't paid.
		public void actionReceivePaymentFind(ActionContext ctx)
		{

            ActionResults ar = new ActionResults();
			Hashtable formData = ctx.getHashedRequest();

            String page = "receivepayment"; //displays the result of the search

			Hashtable people = info.getReceivePaymentFind(formData);

			log.debug("number of people found: " + people.size());
			ar.addHashtable("people", people);

			if(people.containsKey("ErrorMessage"))
			    ar.putValue("ErrorMessage",(String)people.get("ErrorMessage"));
			else if (people.size()==0) people.put("ErrorMessage", "There were no matches to your query.");

			ar.putValue("AppFee", info.getApplicationFee());

			ar.putValue("page", page);
			ctx.setReturnValue(ar);
			ctx.goToView(page);
		}

		//kb 10/28/02 - staff to pay via staff acct xfer
		public void actionPaymentFromStaff(ActionContext ctx)
		{

            ActionResults ar = new ActionResults();
            String page = "paymentfromstaff";
            Hashtable formData = ctx.getHashedRequest();

			Hashtable htinfo = info.getPaymentFromStaffInfo(formData);

			ar.addHashtable("info", htinfo);

			ar.putValue("page", page);
			ctx.setReturnValue(ar);
			ctx.goToView(page);
		}

		//kb 10/28/02 - post of payment via staff acct xfer
		public void actionPostPaymentFromStaff(ActionContext ctx)
		{

            ActionResults ar = new ActionResults();
            Hashtable formData = ctx.getHashedRequest();
            String page = "paymentfromstaffthanks";
            ar.putValue("page", page);

            Hashtable results = info.paymentPostStaffXfer(formData);

            if(results.get("ErrorMessage")!=null)
                ar.putValue("ErrorMessage", (String)results.get("ErrorMessage"));

			ctx.setReturnValue(ar);
			ctx.goToView(page);
		}

	public void getProject(ActionContext ctx) {
		// 2003-01-06: dc: Do NOT make sure the person is logged in to permit this action.  It is done before they login.
		//	if(!isLoggedIn(ctx)){getNotAuthorizedPage(ctx);return;} //Added kb-12/18/02 - checks security
		//
		ActionResults ar = new ActionResults();
		String projectID = ctx.getInputString("projectID");
		log.info("Looking up project: " + projectID);
		String url = ctx.getInputString("url");
		Hashtable project = null;
		if (projectID != null && projectID.length() < 8) {  //Don't accept old Castor IDs
			project = info.getProject(projectID);
		}
		log.debug("project info: " + project);
		if (project != null) ar.addHashtable("project",project);
		ctx.setReturnValue(ar);
		ctx.goToURL(url);
	}


	/*
	 * Added 2003-01-27 DC
	 * Used to look up a list of matching staff from the staffList.JSP file.
	 */
	public void getStaffList(ActionContext ctx) {
		log.trace("In getStaffList()");
        try {
       		String firstName = ctx.getInputString("firstName");
			String preferredName = ctx.getInputString("preferredName");
      		String lastName = ctx.getInputString("lastName");
       		String city = ctx.getInputString("city");
       		String state = ctx.getInputString("state");
       		String reftype = ctx.getInputString("reftype");
			log.debug("first=" + firstName + "pref=" + preferredName + ", last=" + lastName +", city=" + city + ", state=" +state+")");
			outputStaffList(ctx.getResponse(), firstName, preferredName, lastName, city, state, reftype);
        }
        catch (Exception e) {
			String sErr = "Exception encountered in MSController.getStaffList(): "+e;
			log.error(sErr, e);
			goToErrorPage(ctx, sErr);
		}

	}

	public void outputStaffList (javax.servlet.http.HttpServletResponse res, String firstName, String preferredName, String lastName, String city, String state, String reftype) throws Exception
	{
		Collection staffs = info.getReferenceFindStaff(firstName, preferredName, lastName, city, state);
		if (staffs == null) {
			// nothing found, or not enough criteria specified
			return;
		}
		Iterator staffList = staffs.iterator();
		res.setContentType( "text/xml" );
		java.io.PrintWriter out = res.getWriter();
		out.println("<staffList>");

		while(staffList.hasNext()) {
			Hashtable h = (Hashtable)staffList.next();
			String newAccountNo = (String)h.get("AccountNo");
			String newFirst = (String)h.get("FirstName");
			String newPref = (String)h.get("PreferredName");
			String newLast = (String)h.get("LastName");
			String newCity = (String)h.get("City");
			String newState = (String)h.get("State");
			log.debug("name="+ newFirst+"account="+newAccountNo);
			out.println("<staff " +
				"account=\"" + ((newAccountNo != null) ? org.alt60m.util.Escape.textToXML(newAccountNo) : "") + 
				"\" first=\"" +	((newFirst != null) ? org.alt60m.util.Escape.textToXML(newFirst) : "") + 
				"\" pref=\"" +	((newPref != null) ? org.alt60m.util.Escape.textToXML(newPref) : "") + 
				"\" last=\"" + ((newLast != null) ? org.alt60m.util.Escape.textToXML(newLast) : "") +
				"\" city=\"" + ((newCity != null) ? org.alt60m.util.Escape.textToXML(newCity) : "") +
				"\" state=\"" + ((newState != null) ? org.alt60m.util.Escape.textToXML(newState) : "") +
				"\" reftype=\"" + reftype +
				"\" />");
		}
		out.println("</staffList>");
		out.flush();
	}




	/****************************************************************************************
	/****************************************************************************************
		Evaluation Methods:												added dc 01/10/03
		Methods in this section will be used to run the evaluation pages of an applicant.
	****************************************************************************************/
	/****************************************************************************************

	/* added dc 01/10/03
		Displays a page within the applicant's evaluation form.
		The person coming to this form is probably a staff coming from the staff site.
     modified 1/20/2003 DMB
	*/
	public void evalFormEdit(ActionContext ctx) {
// This is actually called from a Wsn JSP page.  Login security is handled by the Wsn tool.  Don't check against MS login!!
// This leaves a hole where someone could send the exact link without any login verification.  todo: close this hole.
//	if(!isLoggedIn(ctx)){getNotAuthorizedPage(ctx);return;} //Added kb-12/18/02 - checks security
		try {
			ActionResults ar = new ActionResults();
			String page = ctx.getInputString("page");
			String WsnApplicationID = ctx.getInputString("WsnApplicationID");
			String nextAction = ctx.getInputString("nextAction");
			String nextParm = ctx.getInputString("nextParm");
			String userID = ctx.getInputString("userID");
			log.debug("evalFormEdit: WsnApplicationID=" + WsnApplicationID);
			if (WsnApplicationID == null) {
				String s = "MSController.evalFormEdit(): WsnApplicationID not specified!";
				log.error(s);
				goToErrorPage(ctx, s);
				return;
			}

			// Note: JSP reads the desired objects (like WsnApplication), so we don't have to read it here and pass it to JSP.
			// Display first page of application
			ar.putValue("page", nextParm);
			ar.putValue("nextParm", nextParm);
//				ctx.setReturnValue(ar);
//				ctx.goToView(nextParm);
//			ar.putValue("page", page);
//			ar.putValue("sendingpage", ctx.getInputString("sendingpage")!=null?ctx.getInputString("sendingpage"):page);// "evalpersonschool");
			ar.putValue("sendingpage", ctx.getInputString("sendingpage"));// "evalpersonschool");
			ar.putValue("toframe", ctx.getInputString("toframe")!=null?ctx.getInputString("toframe"):"no");
			ar.putValue("WsnApplicationID", WsnApplicationID);
			ctx.setReturnValue(ar);
			ctx.goToView(nextParm);
		} catch(Exception e) {
			String sErr = "Exception encountered in MSController.evalFormEdit(): "+e;
			log.error(sErr, e);
			goToErrorPage(ctx, sErr);
		}
	}

// 2-26-03 kl: added method functionality for bottom frame to defect 817, currently on hold
public void evalFormEditBottom(ActionContext ctx) {
		try {			
			ActionResults ar = new ActionResults();
			String page = ctx.getInputString("page");
			ar.putValue("page", page);
			ctx.goToView(page);
		} catch(Exception e) {
			String sErr = "Exception encountered in MSController.evalFormEditBottom(): "+e;
			log.error(sErr, e);
			goToErrorPage(ctx, sErr);
		}
	}


// added DMB 1/19/03
// Executes when a staff member saves the eval form.
    public void evalFormSave(ActionContext ctx) {
        try {
            log.trace("Executing MSController.evalFormSave()");
            Hashtable formData = ctx.getHashedRequest();
            String WsnApplicationID = ctx.getInputString("WsnApplicationID");
			//String EvalID = ctx.getInputString("EvalID");
			WsnEvaluation we = new WsnEvaluation();
			we.setFk_WsnApplicationIDStr(WsnApplicationID);
			we.select();
			String EvalID = we.getEvalID();
            formData.put("Fk_WsnApplicationID",WsnApplicationID);

			if(ctx.getInputString("savePayment") != null && ctx.getInputString("savePayment").equals("T")){
				if(ctx.getInputString("IsPaid") != null){
					Hashtable person = new Hashtable();
					person.put("WsnApplicationID", WsnApplicationID);
					person.put("IsPaid", ctx.getInputString("IsPaid"));
					info.saveObjectHash(person, WsnApplicationID, WsnApplicationIDName, WsnApplicationClassName);
				}
				if (ctx.getInputString("paymentQty") != null) {
					// update any existing payment records
					int paymentQty = Integer.parseInt(ctx.getInputString("paymentQty"));
					for(int i = 0; i < paymentQty; i++){
						String paymentID = ctx.getInputString("id" + i);
						Hashtable payment = new Hashtable();
						payment.put("PaymentID", paymentID);
						payment.put("Credit", ctx.getInputString(paymentID + ".Credit"));
						// payment.put("Debit", ctx.getInputString(paymentID + ".Debit"));
						payment.put("AuthCode", ctx.getInputString(paymentID + ".AuthCode"));
						payment.put("AccountNo", ctx.getInputString(paymentID + ".AccountNo"));
						payment.put("Type", ctx.getInputString(paymentID + ".Type"));
						payment.put("Comment", ctx.getInputString(paymentID + ".Comment"));
						info.saveObjectHash(payment, paymentID, MSPaymentIDName, MSPaymentClassName);
					}
				}
				if(ctx.getInputString("addPayment") != null && ctx.getInputString("addPayment").equals("T")){
					Hashtable payment = new Hashtable();
					payment.put("Fk_WsnApplicationID", WsnApplicationID);
					payment.put("PaymentFor", "Mobilization System");
					payment.put("PaymentDate", (new SimpleDateFormat("MM/dd/yyyy")).format( new Date() ));
					payment.put("Credit", ctx.getInputString("new.Credit"));
					// payment.put("Debit", ctx.getInputString("new.Debit"));
					payment.put("AuthCode", ctx.getInputString("new.AuthCode"));
					payment.put("AccountNo", ctx.getInputString("new.AccountNo"));
					payment.put("Type", ctx.getInputString("new.Type"));
					payment.put("Comment", ctx.getInputString("new.Comment"));
					info.saveObjectHash(payment, "new", MSPaymentIDName, MSPaymentClassName);
				}
			}else if (formData != null && EvalID != null) {
                Hashtable eval = info.saveObjectHash(formData, EvalID, WsnEvaluationIDName, WsnEvaluationClassName);
                int score = 10 * ((Integer)eval.get("_Qual1")).intValue() +
                        10 * ((Integer)eval.get("_Qual2")).intValue() +
                        8 * ((Integer)eval.get("_Qual3")).intValue() +
                        7 * ((Integer)eval.get("_Qual4")).intValue() +
                        7 * ((Integer)eval.get("_Qual5")).intValue() +
                        6 * ((Integer)eval.get("_Qual6")).intValue() +
                        6 * ((Integer)eval.get("_Qual7")).intValue() +
                        6 * ((Integer)eval.get("_Qual8")).intValue();
                if(score != ((Integer)eval.get("Score")).intValue()) {
                    eval.put("Score", ""+score);
					// 2-20-03 kl: added key eval string to saveObjectHash. repairs defect #833, muliple records on save
                    info.saveObjectHash(eval, (String)eval.get(WsnEvaluationIDName), WsnEvaluationIDName, WsnEvaluationClassName);
                }
//				4-6-04 kl: persist to the database here, instead of using hashtables & calling seperate info methods for each set item
				WsnApplication WsnApplication = (WsnApplication) info.getObject(WsnApplicationClassName, WsnApplicationID);
				if (formData.get("IsMember") != null) {
					if (formData.get("IsMember").toString().equals("")){
						WsnApplication.setIsMemberId(null);
					}
					else {
						WsnApplication.setIsMemberId(formData.get("IsMember").toString());
					}
				}
				if (formData.get("Status") != null) {
					if (formData.get("Status").toString().equals("")){
						WsnApplication.setStatus(null);
					}
					else {
						WsnApplication.setStatus(formData.get("Status").toString());
					}
					if (formData.get("Status").equals("Accepted")) {
						// check for existing acceptedDate, set date if empty
						if ((WsnApplication.getAcceptedDate() == null) || (WsnApplication.getAcceptedDate().equals(""))) {
							SimpleDateFormat sdfDate = new SimpleDateFormat("MM/dd/yyyy");
							Date today = sdfDate.parse(sdfDate.format(new Date()));
							WsnApplication.setAcceptedDate(today);
						}
					}
					else {
						//status not accepted, reset acceptedDate accordingly
						WsnApplication.setAcceptedDate(null);
					}
				}
				WsnApplication.persist();
			}
            evalFormEdit(ctx); //pass off controll to evalFormEdit
        }
        catch(Exception e) {
            log.error("Exception encountered in MSController.evalFormSave(): "+e, e);
            goToErrorPage(ctx, EXCEPTION_DURING_SAVE);
        }
    }

	/****************************************************************************************
		Login functions: Functions in this section will be used to control the login.
	****************************************************************************************/

	public void login(ActionContext ctx) {
		ctx.goToView("login");
	}

	/**
	 * should be called by all action methods that require user to be logged in
	 * (and then appropriate action taken)
	 * simply checks if the userId is in the session (which it will be if the user is in fact logged in).
	 * @param ctx
	 * @return boolean
	 * @author ken burcham 12/18/2002
	 */
	private boolean isLoggedIn(ActionContext ctx)
	{
		String u = (String) ctx.getSessionValue("userID");
		if(u==null || "".equals(u))
		{
			log.debug("User not logged in--isLoggedIn returning false");
			return false;
		}
		else
		{
			log.debug("User logged in--isLoggedIn returning true");
			return true;
		}

	}


	/**
	 * sets up the ctx for returning the login page.
	 * @param ctx
	 */
	private void getNotAuthorizedPage(ActionContext ctx)
	{
        log.debug("in GetNotAuthorized Page--The user must not be authorized or logged in.");
		ctx.goToView("login");
        log.debug("returning login page");
	}


	public final static String EXCEPTION_DURING_GET_WSN_PROJECT = "We're sorry, but an error occured while attempting to retrieve information about the WSN Summer Projects from the database.";
	public final static String EXCEPTION_DURING_GET_OPPORTUNITIES = "We're sorry, but an error occured while attempting to retrieve information about the WSN Summer Projects from the database.";
	public final static String EXCEPTION_DURING_GO_TO_ERROR_PAGE = "An additional error occured while trying to handle an error that occured somewhere in the Mobilization System.";
	public final static String EXCEPTION_DURING_SAVE = "We're sorry, but an error occured while attempting to save information to the database.";
	public final static String EXCEPTION_REF_FORM_SUBMIT = "We're sorry, but an error occurred while attempting to submit your  Reference Form.";
}