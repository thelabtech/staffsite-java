package org.alt60m.ministry.servlet;

import java.util.*;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.*;
import org.alt60m.servlet.*;
import org.alt60m.util.*;
import org.alt60m.ministry.servlet.MinistryLocatorInfo;
import org.alt60m.ministry.model.dbio.*;
import javax.servlet.http.*;
import java.io.*;

/**
 * Web controller for Ministry Locator
 * 
 * History:
 *		11/13/01	MDP	Initial Coding
 * 
 * Completeness (0 - 5): 
 *		3
 *
 * Known Issues:
 *
 * @author  Mike Brinkley
 * @version 1.0
 */
public class MinistryLocatorController extends Controller {	

	// *************************************************************************
	// Expectatations:
	//		
	//	Returns:
	//		
	// History:
	//		3/19/01		MDP		Initial coding
	// *************************************************************************
   public void init() {
		try	{
			log.debug("MinistryLocatorController.init()");
		} catch (Exception e) {
			log.error("Exception in ministryLocatorController init()", e);
		}
   }
	
   private StaffInfo info = new StaffInfo();
   

	public void outputCampusList (HttpServletResponse res, String searchBy, String searchText, String searchState, boolean showAllCampuses) throws Exception {
		MinistryLocatorInfo mlInfo = new MinistryLocatorInfo();

		Collection campuses;

		if (searchBy.equalsIgnoreCase("state"))
		{	
			if("CA1".equalsIgnoreCase(searchText)) {
				searchText = "CA1".substring(0,2);
				String number = "CA1".substring(2);
				int _number = Integer.parseInt(number);
				campuses = mlInfo.getTargetAreasByStateAndZip(searchText, _number);
			}
			
			else if("CA2".equalsIgnoreCase(searchText)) {
				searchText = "CA2".substring(0,2);
				String number = "CA2".substring(2);
				int _number = Integer.parseInt(number);
				campuses = mlInfo.getTargetAreasByStateAndZip(searchText, _number);
			}
			
			else if("CA3".equalsIgnoreCase(searchText)) {
				searchText = "CA3".substring(0,2);
				String number = "CA3".substring(2);
				int _number = Integer.parseInt(number);
				campuses = mlInfo.getTargetAreasByStateAndZip(searchText, _number);
			}
			
			else if("NY1".equalsIgnoreCase(searchText)) {
				searchText = "NY1".substring(0,2);
				String number = "NY1".substring(2);
				int _number = Integer.parseInt(number);
				campuses = mlInfo.getTargetAreasByStateAndZip(searchText, _number);
			}
			
			else if("NY2".equalsIgnoreCase(searchText)) {
				searchText = "NY2".substring(0,2);
				String number = "NY2".substring(2);
				int _number = Integer.parseInt(number);
				campuses = mlInfo.getTargetAreasByStateAndZip(searchText, _number);
			}
			
			else {
				campuses = mlInfo.getTargetAreasByState(searchText);
			}
			
		} else if(searchBy.equalsIgnoreCase("country"))  {
			campuses = mlInfo.getTargetAreasByCountry(searchText);
		} else if(searchBy.equalsIgnoreCase("strategy"))  {
			campuses = mlInfo.getTargetAreasByStrategy(searchText, searchState);
		} else {
			throw new RuntimeException("Invalid searchby: " + searchBy);
		}

		Iterator campusList = campuses.iterator();

		res.setContentType( "text/xml" );
		PrintWriter out = res.getWriter();
		
		out.println("<campusList>");

		while(campusList.hasNext()) {
			TargetArea campus = (TargetArea) campusList.next();
			boolean active = false;
			
			if (!campus.getActivities().isEmpty() || showAllCampuses) {
				
				// find out if there are any active activities on that campus
				if(!campus.getActivities().isEmpty()){
					Vector activities = campus.getActivities();
					Iterator activitiesList = activities.iterator();
					// check if each activity is active
					while(activitiesList.hasNext()){
						Activity activity = (Activity) activitiesList.next();
						if(activity.isActive()){
							active = true;
							break;
						}
					}
				}

				out.println("<campus id=\"" + ((campus.getTargetAreaId() != null) ? Escape.textToXML(campus.getTargetAreaId()) : "") + "\"" + ((active&!campus.getIsSecure())?" active=\"true\"" : "") + ">");
				out.println("<name>");
				out.println( (campus.getName() != null) ? Escape.textToXML(campus.getName()) : "" );
				out.println("</name>");
				out.println("<city>");
				out.println( (campus.getCity() != null) ? Escape.textToXML(campus.getCity()) : "" );
				out.println("</city>");
				out.println("<state>");
				out.println( (campus.getState() != null) ? Escape.textToXML(campus.getState()) : "" );
				out.println("</state>");
				out.println("<zip>");
				out.println( (campus.getZip() != null) ? Escape.textToXML(campus.getZip()) : "" );
				out.println("</zip>");
				out.println("</campus>");				
			}
		}
		out.println("</campusList>");

		out.flush();
	}

	/**
	 * @param ctx ActionContext object
	 * Request parameters:
	 *		<none>
	 */
	public void campusLocate (ActionContext ctx) {
		ministryLocate(ctx);
	}
	
	
	/**
	 * @param ctx ActionContext object
	 * Request parameters:
	 *		<none>
	 */
	public void ministryLocate (ActionContext ctx) {
        try {
			String searchBy = ctx.getInputString("searchby", new String[] {"state", "country", "strategy"});
       		String searchText = ctx.getInputString("searchtext", true);
       		String searchState = ctx.getInputString("state", false);
       		
       		if (searchText.equals("")) {
       			log.warn("searchText parameter is empty");
       			return;
       		}

			outputCampusList(ctx.getResponse(), searchBy, searchText, searchState, true);						
			
        } catch (Exception e) {
			log.error("Failed to perform ministryLocate().", e);
		}
	}

	public void ministryInfo (ActionContext ctx) {

        try {
			String campusid = ctx.getInputString("campusid", true);
       		if (campusid.equals("")) {
       			log.warn("campusid parameter is empty");
       			return;
       		}
  			HttpServletResponse res = ctx.getResponse();

			MinistryLocatorInfo mlInfo = new MinistryLocatorInfo();

			TargetArea campus = mlInfo.getTargetAreaObject(campusid);
			Iterator c = campus.getActivities().iterator();

			res.setContentType( "text/xml" );
			PrintWriter out = res.getWriter();
			
			out.println("<ministryList>");
			out.println("<campus>");
			out.println( (campus.getName() != null) ? Escape.textToXML(campus.getName()) : "" );
			out.println("</campus>");
			if(!campus.getIsSecure())
			{
				out.println("<url>");
				out.println( (campus.getUrl() != null) ? Escape.textToXML(campus.getUrl()) : "" );
				out.println("</url>");
			}
			
			while (c.hasNext())		{
				Activity activity = (Activity)c.next();
				if (!activity.getStatus().equals("IN")) {
					LocalLevel localLevel = new LocalLevel(activity.getLocalLevelId());
					
					// if campus is secure, print ministry id = null
					if(campus.getIsSecure())
					{
						out.println("<ministry id=\"none\">");
						out.println("</ministry>");
						break;	// no further iterations of the activity while loop
					}
					
					else
					{
						out.println("<ministry id=\"" + ((activity.getActivityId() != null) ? Escape.textToXML(activity.getActivityId()) : "") + "\">");
						out.println("<strategy>");
					
						out.println( (activity.getStrategy() != null) ? Escape.textToXML(activity.getStrategy()) : "" );
						out.println("</strategy>");
	/*					out.println("<url>");
						out.println( (localLevel.getUrl() != null) ? Escape.textToXML(localLevel.getUrl()) : "" );
						out.println("</url>");
	*/	
						Iterator contacts = activity.getActivityContacts().iterator();
						while (contacts.hasNext())		{
							Staff contact = (Staff)contacts.next();
							out.println("<contact id=\"" + ((contact.getAccountNo() != null) ? Escape.textToXML(contact.getAccountNo()) : "") + "\">");
							out.println("<firstName>");
							out.println( (contact.getFirstName() != null) ? Escape.textToXML(contact.getFirstName()) : "" );
							out.println("</firstName>");
							out.println("<preferredName>");
							out.println( (contact.getPreferredName() != null) ? Escape.textToXML(contact.getPreferredName()) : "" );
							out.println("</preferredName>");
							out.println("<lastName>");
							out.println( (contact.getLastName() != null) ? Escape.textToXML(contact.getLastName()) : "" );
							out.println("</lastName>");
							out.println("<phone>");
							out.println( (contact.getWorkPhone() != null) ? Escape.textToXML(contact.getWorkPhone()) : "" );
							out.println("</phone>");
							out.println("<email>");
							out.println( (contact.getEmail() != null) ? Escape.textToXML(contact.getEmail()) : "" );
							out.println("</email>");
							out.println("</contact>");
						}

						out.println("</ministry>");
					}
				}
			}

			out.println("</ministryList>");

			out.flush();

        } catch (Exception e) {
			log.error("Failed to perform ministryInfo().", e);
		}
	}
	

	/*
	 * Added 2003-01-27 DC
	 * Used to look up a list of matching staff from the staffList.JSP file for the stint
	 * app tool.
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
			String sErr = "Exception encountered in MinistryLocatorController.getStaffList(): "+e;
			log.error(sErr, e);
			ctx.goToErrorView();
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
}