package org.alt60m.hr.si.servlet.dbio;

import org.alt60m.servlet.*;
import org.alt60m.util.ObjectHashUtil;
import org.alt60m.crs.model.Person;
import org.alt60m.hr.si.model.dbio.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.util.*;

//This class handles all of the Stint Application related actions

public class SIAppHandler {

	private static Log log = LogFactory.getLog(SIAppHandler.class);

    public static final String PERSONCLASS = "org.alt60m.hr.si.model.dbio.SIPerson";
    public static final String APPLICATIONCLASS = "org.alt60m.hr.si.model.dbio.SIApplication";

    private static final boolean debug = false;

    /* begin action handlers

      NOTES:

      All actionhandler methods should return an ActionResults object after
      having set the view using setView("viewname")

      for example:

      protected ActionResults processSomething(Action action)
      {
        ActionResults ar = new ActionResults();
         //do something ...
        ar.setView("home");
        return ar;
      }

    */

    protected ActionResults testSIController(Action action)
    {
        ActionResults ar = new ActionResults();
        log.debug("in " + action.getName() + " handler method!");
        ar.setView("home");
        return ar;
    }

    protected ActionResults postContactInfo(Action action)
    {
        ActionResults ar = new ActionResults();
        log.debug("in " + action.getName() + " handler method!");

        String result = updatePersonInfo(action.getValues());
        if (result!=null) ar.putValue("ErrorMessage", result);

        ar.setView((String)action.getValue("page"));

        if(debug) outputparms(action.getValues());

        log.debug("postContactInfo returning error: " + ar.getValue("ErrorMessage"));
        return ar;
    }

    protected ActionResults postAppHome(Action action)
    {
        ActionResults ar = new ActionResults();
        log.debug("in " + action.getName() + " handler method!");
        ar.setView((String)action.getValue("page"));
		if(debug) outputparms(action.getValues());

        return ar;
    }

    protected ActionResults postMinistryExperience(Action action)
    {
        return processUpdateAppInfo(action);
    }

    protected ActionResults postStintInfo(Action action)
    {
        return processUpdateAppInfo(action);
    }

    protected ActionResults postMinistryInterests(Action action)
    {
        return processUpdateAppInfo(action);
    }

    protected ActionResults postChurchBackground(Action action)
    {
        return processUpdateAppInfo(action);
    }

    protected ActionResults postPersonalInfo(Action action)
    {
        return processUpdateAppInfo(action);
    }

    protected ActionResults postAlchoholUse(Action action)
    {
        return processUpdateAppInfo(action);
    }

    protected ActionResults postDrugUse(Action action)
    {
        return processUpdateAppInfo(action);
    }

    protected ActionResults postTobaccoUse(Action action)
    {
        return processUpdateAppInfo(action);
    }

    protected ActionResults postMoralConvictions(Action action)
    {
        return processUpdateAppInfo(action);
    }

    protected ActionResults postFinancialInfo(Action action)
    {
        return processUpdateAppInfo(action);
    }

    protected ActionResults postMPDInfo(Action action)
    {
        return processUpdateAppInfo(action);
    }

    protected ActionResults postBiographicalInfo(Action action)
    {
        return processUpdateAppInfo(action);
    }

    protected ActionResults postSubmitApp(Action action)
    {

        //make sure they intended to go to submit and not some other page.
        String page = (String) action.getValues().get("page");

		if(!"submitapp".equals(page))
		{
			//redirect them if not.
			ActionResults ar = new ActionResults();
			ar.setView(page);
			return ar; //early return
		}

    	//perform validation rules before allowing submit application to occur.

		//RULE: application must have more than 0 payments in order to submit.
    	String appid = (String) action.getValues().get("ApplicationID");

    	Hashtable payments = SIUtil.getPaymentsForApplication(appid);
    	if(payments.size()==0)
    	{
    		ActionResults ar = new ActionResults();
            ar.putValue("ErrorMessage", "RULE VIOLATION: Application cannot be submitted until a payment type as been selected.");
            ar.setView("submit");
            ar.putValue("page","submit");
            return ar; //early return
    	}

    	//RULE: they have to have entered something into the electronic signature and ssn boxes
    	String esig = (String) action.getValue("ElectronicSignature");
    	String ssn = (String) action.getValue("Ssn");
    	if(esig==null || "".equals(esig) ||
    	    ssn==null || "".equals(ssn))
    	    {
	    		ActionResults ar = new ActionResults();
	            ar.putValue("ErrorMessage", "RULE VIOLATION: You must sign this form using your Name and SSN.");
	            ar.setView("submit");
	            ar.putValue("page","submit");
	            return ar; //early return
    	    }

    	//RULE: application must have at least 4 references in order to submit.
    	if(SIUtil.getNumberOfReferences(appid)<4)
    	{
	    		ActionResults ar = new ActionResults();
	            ar.putValue("ErrorMessage", "RULE VIOLATION: You must request at least 4 people to provide you with a reference before you can submit your application. .");
	            ar.setView("submit");
	            ar.putValue("page","submit");
	            return ar; //early return
    	}

    	//RULE: application must have at least one emergency contact.
    	SIPerson applicant = SIUtil.getSIPerson(SIUtil.getSIApplication(appid).getFk_PersonIDString());
    	if (applicant.getEmerContactName() == null || "".equals(applicant.getEmerContactName()) || 
    			applicant.getEmerAddress1() == null || "".equals(applicant.getEmerAddress1()) || 
    			applicant.getEmerCity() == null || "".equals(applicant.getEmerCity()) || 
    			applicant.getEmerState() == null || "".equals(applicant.getEmerState()) || 
    			applicant.getEmerZip() == null || "".equals(applicant.getEmerZip()) || (
    					(applicant.getEmerHomePhone() == null || "".equals(applicant.getEmerHomePhone())) &&
    					(applicant.getEmerWorkPhone() == null || "".equals(applicant.getEmerWorkPhone())) &&
    					(applicant.getEmerCellPhone() == null || "".equals(applicant.getEmerCellPhone())) )    					
    			)
    	{
	    		ActionResults ar = new ActionResults();
	            ar.putValue("ErrorMessage", "RULE VIOLATION: You must provide at least a primary emergency contact.");
	            ar.setView("submit");
	            ar.putValue("page","submit");
	            return ar; //early return
    	}

    	//RULE: application must have permanent contact info.
    	if (applicant.getPermAddress1() == null || "".equals(applicant.getPermAddress1()) || 
    			applicant.getPermCity() == null || "".equals(applicant.getPermCity()) || 
    			applicant.getPermState() == null || "".equals(applicant.getPermState()) || 
    			applicant.getPermZip() == null || "".equals(applicant.getPermZip()) || (
    					(applicant.getPermHomePhone() == null || "".equals(applicant.getPermHomePhone())) &&
    					(applicant.getPermWorkPhone() == null || "".equals(applicant.getPermWorkPhone())) &&
    					(applicant.getPermCellPhone() == null || "".equals(applicant.getPermCellPhone())) )    					
    			)
    	{
	    		ActionResults ar = new ActionResults();
	            ar.putValue("ErrorMessage", "RULE VIOLATION: You must provide permanent contact information.");
	            ar.setView("submit");
	            ar.putValue("page","submit");
	            return ar; //early return
    	}

		// load the stuff that needs to be persisted back to the application object
		action.putValue("DateSubmitted", org.alt60m.html.Util.formatDate(new Date()));
    	action.putValue("IsSubmitted","True");
    	action.putValue("AppStatus",SIApplication.STATUS_COMPLETE);

		// 2003-01-24: dc: added AssignedToProject, FinalProject, status
		SIApplication a = new SIApplication();
		try	{
			a = (SIApplication) SIUtil.getObject(appid, "ApplicationID", APPLICATIONCLASS);
		} catch(Exception e) {
            log.error(e.getMessage(), e);
		}
		action.putValue("AssignedToProject",""+a.getLocationA());
		action.putValue("FinalProject",""+a.getLocationA());
		action.putValue("Status", "Pending");

        return processUpdateAppInfo(action);
    }






    //***********  end of the action handling *************/

    /**
        since many of the above actions simply paste the
        posted values into the person's corresponding application
        object, the following method provides a single method
        that accomplishes the updating of the application object
        with the posted parm values in the action object.
    */
    private ActionResults processUpdateAppInfo(Action action)
    {
        ActionResults ar = new ActionResults();
        log.debug("processing action: " + action.getName());

        //add date last changed to action values.
        action.putValue("DateAppLastChanged", org.alt60m.html.Util.formatDateTime(new Date()));

        String result = updateAppInfo(action.getValues());
        if (result!=null) ar.putValue("ErrorMessage", result);

        ar.setView((String)action.getValue("page"));
        return ar;
    }

    /**
     updates the person object with the values in the parms
     returns an error string or null
    */
    private String updatePersonInfo(Hashtable parms)
    {
        String errormessage = null;

        String personid = (String) parms.get("SIPersonID");
        log.debug("UpdatePersonInfo using personid: " + personid);


		// dc 2003-01-06: special processing.  Since we can no longer have GENDER field on any screen,
		// anytime the TITLE field is modified, also persist the GENDER field using a value corresponding
		// to the TITLE field value.  We added this logic here since the postContactInfo action uses
		// this method.
		String personTitle = (String) parms.get("Title");
		if (personTitle != null) {
			// TITLE field was on this page.  So, add the GENDER field to the hash table and persist a value corresponding to Title
			String newGenderKey = "0";	// default to female
			if ("Mr.".equals(personTitle))
				newGenderKey = "1";		// male
			parms.put("Gender", newGenderKey);
		}


		// dc 2003-01-23: special processing.  Need to update the REGION field based on the student's universityState.
		// Anytime the universityState is modified, also persist the REGION field using the correct value.
		String universityState = (String) parms.get("UniversityState");
		String university = (String) parms.get("RecentSchools");
		if (universityState != null && !universityState.equals("")) {

			// universityState field was on this page.  So, add the REGION field to the hash table
			String newRegion = SIUtil.getCampusRegion(university, universityState);
			log.debug("info.getRegionForState(" + universityState + ") = " + newRegion);
			parms.put("Region", newRegion);
		}

        try
        {
            SIPerson person = new SIPerson(personid);
            ObjectHashUtil.hash2obj(parms, person);
            person.persist();

        }
        catch (Exception e)
        {
            log.error(e.getMessage(), e);
            errormessage = "Internal Error saving Person Info: " + e.getMessage();
        }

		if(debug) outputparms(parms);

		log.debug("Returning error message: " + errormessage);

        return errormessage;
    }


	/**
	 * just yacks out the parms for testing
	 * @param parms
	 */
	private void outputparms(Hashtable parms)
	{
        //--output for testing
        log.debug("---------Values in Parms----------");
        for(Iterator i = parms.keySet().iterator(); i.hasNext(); )
        {
            String key = (String) i.next();
            String val = (String) parms.get(key);
            log.debug(key + "    --    " + val);
        }
	}

    /**
    * Updates the application object with the values in the parms
    * returns an error string or null
    */
    private String updateAppInfo(Hashtable parms)
    {
        String errormessage = null;

        String personid = (String) parms.get("SIPersonID");
        String appid =    (String) parms.get("ApplicationID");

        log.debug("UpdateAppInfo using personid: " + personid);
        log.debug("UpdateAppInfo using appid   : " + appid);

        try
        {

        	SIApplication application = new SIApplication(appid);
        	ObjectHashUtil.hash2obj(parms, application);
			application.persist();

            outputparms(parms);
            //thats it.
        }
        catch (Exception e)
        {
        	if(e.getMessage().indexOf("8060")>0)
        	{
        		//specific error message when we try to post too much data
        		// and run into microsoft SQLServer row limit of 8060 characters
        		log.warn("Too many characters in submission: " + e.getMessage());
        		errormessage = "Error: The last page of information you just posted was NOT saved.  You have exceeded the total number of characters allowed per application.  Please review your answers and trim them down a bit.  Thank you.";
        	}
        	else
        	{
        		log.error(e.getMessage(), e);
            	errormessage = "Internal Error saving Application Info: " + e.getMessage();
        	}
        }

        return errormessage;
    }

}