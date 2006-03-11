package org.alt60m.ministry.servlet;

import java.util.*;
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
			log(Priority.DEBUG, "MinistryLocatorController.init()");
		} catch (Exception e) {
			log(Priority.ERROR, "Exception in ministryLocatorController init()");
			log(Priority.ERROR, e.toString());
		}
   }
	

	public void outputCampusList (HttpServletResponse res, String searchBy, String searchText, boolean showAllCampuses) throws Exception {
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
			
		} else {
			campuses = mlInfo.getTargetAreasByCountry(searchText);
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
        try {
			String searchBy = ctx.getInputString("searchby", new String[] {"state", "country"});
       		String searchText = ctx.getInputString("searchtext", true);

			outputCampusList(ctx.getResponse(), searchBy, searchText, true);						

        } catch (Exception e) {
			log(Priority.ERROR, "Failed to perform ministryLocate().", e);
		}
	}
	
	
	/**
	 * @param ctx ActionContext object
	 * Request parameters:
	 *		<none>
	 */
	public void ministryLocate (ActionContext ctx) {
        try {
			String searchBy = ctx.getInputString("searchby", new String[] {"state", "country"});
       		String searchText = ctx.getInputString("searchtext", true);

			outputCampusList(ctx.getResponse(), searchBy, searchText, true);						
			
        } catch (Exception e) {
			log(Priority.ERROR, "Failed to perform ministryLocate().", e);
		}
	}

	public void ministryInfo (ActionContext ctx) {

        try {
			String campusid = ctx.getInputString("campusid", true);
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
			log(Priority.ERROR, "Failed to perform ministryInfo().", e);
		}
	}
}