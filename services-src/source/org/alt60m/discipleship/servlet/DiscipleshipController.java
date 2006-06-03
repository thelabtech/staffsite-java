package org.alt60m.discipleship.servlet;

import java.util.*;
import java.text.*;
import org.apache.log4j.*;
import org.alt60m.servlet.*;
import org.alt60m.util.*;
import org.alt60m.discipleship.model.*;
import org.alt60m.ministry.model.dbio.*;
import org.alt60m.ministry.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

public class DiscipleshipController extends Controller {

    class StaffByRegionCache {
        Date lastUpdated;
		Hashtable staffByRegion = new Hashtable();
    }
    private final String[] _abbrevRegion = new String[] { "NE", "MA", "MS", "SE", "GL", "UM", "GP", "RR", "NW", "SW" };

    private final String[] _abbrevStrategy = new String[] { "CA", "SC", "IE", "ID", "II", "WI", "WS", "BR" };

    private final String[] _expandRegion = new String[] { "Northeast", "Mid-Atlantic", "MidSouth", "Southeast", "Great Lakes", "Upper Midwest", "Great Plains Int'l", "Red River", "Greater Northwest", "Pacific Southwest" };
    private final String[] _expandStrategy = new String[] { "Catalytic", "Staffed Campus", "ESM-Epic", "ESM-Destino", "ESM-Impact", "WSN ICS", "WSN STInt", "Bridges" };

    final String[] _reportTypes = new String[] { "locallevel", "targetarea", "regional", "national" };
    private final String LOCAL_LEVEL_ID_TOKEN = "locallevelid";
    private final String TARGET_AREA_ID_TOKEN = "targetareaid";

    public DiscipleshipController() {
        log.debug("DiscipleshipController constructor");
    }

    public void init() {
        log.debug("DiscipleshipController.init()");
        try {
            initState();
        } catch (Exception e) {
            log.fatal("Failed to init class!", e);
        }
    }

    private void initState() throws Exception {
        setDefaultAction("showIndex");
    }

    /** Called by Controller on reload request */
    public void reload() throws Exception {
        initState();
    }
   
	/** outputs an xml list of contacts and all the contact attributes.<br>
	 * <br>
	 * @param the response object for the current ActionContext
	 * @param an iterator of contact objects 
	 */
	public void outputContact(HttpServletResponse res, Contact contact) throws Exception {
		res.setContentType("text/xml");
		PrintWriter out = res.getWriter();
		
		out.println("<contact>");

		out.print("<id>");
		out.print(Escape.textToXML(contact.getContactIdString()));
		out.println("</id>");
		out.print("<firstname>");
		out.print( (contact.getFirstName() != null) ? Escape.textToXML(contact.getFirstName()) : "" );
		out.println("</firstname>");
		out.print("<lastname>");
		out.print( (contact.getLastName() != null) ? Escape.textToXML(contact.getLastName()) : "" );
		out.println("</lastname>");
		out.print("<phonenumber>");
		out.print( (contact.getPhoneNumber() != null) ? Escape.textToXML(contact.getPhoneNumber()) : "" );
		out.println("</phonenumber>");
		out.print("<emailaddress>");
		out.print( (contact.getEmailAddress() != null) ? Escape.textToXML(contact.getEmailAddress()) : "" );
		out.println("</emailaddress>");
		out.print("<address1>");
		out.print( (contact.getAddress1() != null) ? Escape.textToXML(contact.getAddress1()) : "" );
		out.println("</address1>");
		out.print("<address2>");
		out.print( (contact.getAddress2() != null) ? Escape.textToXML(contact.getAddress2()) : "" );
		out.println("</address2>");
		out.print("<residence>");
		out.print( (contact.getResidence() != null) ? Escape.textToXML(contact.getResidence()) : "" );
		out.println("</residence>");
		out.print("<city>");
		out.print( (contact.getCity() != null) ? Escape.textToXML(contact.getCity()) : "" );
		out.println("</city>");
		out.print("<state>");
		out.print( (contact.getState() != null) ? Escape.textToXML(contact.getState()) : "" );
		out.println("</state>");
		out.print("<zip>");
		out.print( (contact.getZip() != null) ? Escape.textToXML(contact.getZip()) : "" );
		out.println("</zip>");
		out.print("<gender>");
		out.print( (contact.getGender() != null) ? Escape.textToXML(contact.getGender()) : "" );
		out.println("</gender>");
		out.print("<maritalstatus>");
		out.print( (contact.getMaritalStatus() != null) ? Escape.textToXML(contact.getMaritalStatus()) : "" );
		out.println("</maritalstatus>");
		out.print("<campus>");
		out.print( (contact.getCampus() != null) ? Escape.textToXML(contact.getCampus()) : "" );
		out.println("</campus>");
		out.print("<levelofdiscipleship>");
		out.print( (contact.getLevelOfDiscipleship() != null) ? Escape.textToXML(contact.getLevelOfDiscipleship()) : "" );
		out.println("</levelofdiscipleship>");
		out.print("<yearinschool>");
		out.print( (contact.getYearInSchool() != null) ? Escape.textToXML(contact.getYearInSchool()) : "" );
		out.println("</yearinschool>");
		out.print("<birthdate>");
		out.print( (contact.getBirthDate() != null) ? Escape.textToXML(contact.getBirthDateString()) : "" );
		out.println("</birthdate>");
		out.print("<datebecamebeliever>");
		out.print( (contact.getDateBecameBeliever() != null) ? Escape.textToXML(contact.getDateBecameBeliever()) : "" );
		out.println("</datebecamebeliever>");
		out.print("<primaryspiritualgift>");
		out.print( (contact.getPrimarySpiritualGift() != null) ? Escape.textToXML(contact.getPrimarySpiritualGift()) : "" );
		out.println("</primaryspiritualgift>");
		out.print("<secondaryspiritualgift>");
		out.print( (contact.getSecondarySpiritualGift() != null) ? Escape.textToXML(contact.getSecondarySpiritualGift()) : "" );
		out.println("</secondaryspiritualgift>");
		out.print("<tertiaryspiritualgift>");
		out.print( (contact.getTertiarySpiritualGift() != null) ? Escape.textToXML(contact.getTertiarySpiritualGift()) : "" );
		out.println("</tertiaryspiritualgift>");
		out.print("<typeofcontact>");
		out.print( (contact.getTypeOfContact() != null) ? Escape.textToXML(contact.getTypeOfContact()) : "" );
		out.println("</typeofcontact>");
		out.print("<dateadded>");
		out.print( (contact.getDateAdded() != null) ? Escape.textToXML(contact.getDateAddedString()) : "" );
		out.println("</dateadded>");
		out.print("<note>");
		out.print( (contact.getNote() != null) ? Escape.textToXML(contact.getNote()) : "" );
		out.println("</note>");
		out.print("<discipledby>");
		out.print( (contact.getDiscipledById() != null) ? Escape.textToXML(contact.getDiscipledById()) : "" );
		out.println("</discipledby>");

		Iterator i = contact.getCalls().iterator();
		while (i.hasNext()) {
			Call call = (Call)i.next();
			out.println("<call id=\""+Escape.textToXML(call.getCallIdString())+"\">");
			out.print("<dateofcall>");
			out.print((call.getDateOfCall() != null) ? Escape.textToXML(call.getDateOfCall().toString()) : "");
			out.println("</dateofcall>");
			out.print("<note>");
			out.print((call.getNote() != null) ? Escape.textToXML(call.getNote()) : "");
			out.println("</note>");
			out.println("</call>");
		}

		i = contact.getSchedules().iterator();
		while (i.hasNext()) {
			Schedule schedule = (Schedule)i.next();
			out.println("<schedule id=\""+Escape.textToXML(schedule.getScheduleIdString())+"\">");
			out.print("<dayofweek>");
			out.print((schedule.getDayOfWeek() != null) ? Escape.textToXML(schedule.getDayOfWeek()) : "");
			out.println("</dayofweek>");
			out.print("<hoursavailable>");
			out.print((schedule.getHoursAvailableString() != "0") ? Escape.textToXML(schedule.getHoursAvailableString()) : "");
			out.println("</hoursavailable>");
			out.print("<note>");
			out.print((schedule.getNote() != null) ? Escape.textToXML(schedule.getNote()) : "");
			out.println("</note>");
			out.println("</schedule>");
		}
		
		i = contact.getLessons().iterator();
		while (i.hasNext()) {
			Lesson lesson = (Lesson)i.next();
			out.println("<lesson id=\""+Escape.textToXML(lesson.getLessonIdString())+"\">");
			out.print("<date>");
			out.print((lesson.getDate() != null) ? Escape.textToXML(lesson.getDate().toString()) : "");
			out.println("</date>");
			out.print("<scripture>");
			out.print((lesson.getScripture() != null) ? Escape.textToXML(lesson.getScripture()) : "");
			out.println("</scripture>");
			out.print("<topic>");
			out.print((lesson.getTopic() != null) ? Escape.textToXML(lesson.getTopic()) : "");
			out.println("</topic>");
			out.print("<depthofunderstanding>");
			out.print((lesson.getDepthOfUnderstanding() != null) ? Escape.textToXML(lesson.getDepthOfUnderstanding()) : "");
			out.println("</depthofunderstanding>");
			out.print("<note>");
			out.print((lesson.getNote() != null) ? Escape.textToXML(lesson.getNote()) : "");
			out.println("</note>");
			out.println("</lesson>");
		}
		
		out.println("</contact>");		
		out.flush();    	
	}
	
	public void outputCall(HttpServletResponse res, Call call) throws Exception {
		res.setContentType( "text/xml" );
		PrintWriter out = res.getWriter();
		
		out.println("<call>");
		
		out.print("<id>");
		out.print(Escape.textToXML(call.getCallIdString()));
		out.println("</id>");
		out.print("<dateofcall>");
		out.print((call.getDateOfCall() != null) ? Escape.textToXML(call.getDateOfCall().toString()) : "");
		out.println("</dateofcall>");
		out.print("<note>");
		out.print((call.getNote() != null) ? Escape.textToXML(call.getNote()) : "");
		out.println("</note>");
		out.print("<contactid>");
		out.print((call.getContactIdString() != null) ? Escape.textToXML(call.getContactIdString()) : "");
		out.println("</contactid>");

		out.println("</call>");
		
	}
	
	public void outputSchedule(HttpServletResponse res, Schedule schedule) throws Exception {
		res.setContentType( "text/xml" );
		PrintWriter out = res.getWriter();
		
		out.println("<schedule>");
		
		out.print("<id>");
		out.print(Escape.textToXML(schedule.getScheduleIdString()));
		out.println("</id>");
		out.print("<dayofweek>");
		out.print((schedule.getDayOfWeek() != null) ? Escape.textToXML(schedule.getDayOfWeek()) : "");
		out.println("</dayofweek>");
		out.print("<hoursavailable>");
		out.print((schedule.getHoursAvailableString() != "0") ? Escape.textToXML(schedule.getHoursAvailableString()) : "");
		out.println("</hoursavailable>");
		out.print("<note>");
		out.print((schedule.getNote() != null) ? Escape.textToXML(schedule.getNote()) : "");
		out.println("</note>");
		out.print("<contactid>");
		out.print((schedule.getContactIdString() != null) ? Escape.textToXML(schedule.getContactIdString()) : "");
		out.println("</contactid>");

		out.println("</schedule>");
		
	}
	
	public void outputLesson(HttpServletResponse res, Lesson lesson) throws Exception {
		res.setContentType( "text/xml" );
		PrintWriter out = res.getWriter();
		
		out.println("<lesson>");
		
		out.print("<id>");
		out.print(Escape.textToXML(lesson.getLessonIdString()));
		out.println("</id>");
		out.print("<date>");
		out.print((lesson.getDate() != null) ? Escape.textToXML(lesson.getDate().toString()) : "");
		out.println("</date>");
		out.print("<scripture>");
		out.print((lesson.getScripture() != null) ? Escape.textToXML(lesson.getScripture()) : "");
		out.println("</scripture>");
		out.print("<topic>");
		out.print((lesson.getTopic() != null) ? Escape.textToXML(lesson.getTopic()) : "");
		out.println("</topic>");
		out.print("<depthofunderstanding>");
		out.print((lesson.getDepthOfUnderstanding() != null) ? Escape.textToXML(lesson.getDepthOfUnderstanding()) : "");
		out.println("</depthofunderstanding>");
		out.print("<note>");
		out.print((lesson.getNote() != null) ? Escape.textToXML(lesson.getNote()) : "");
		out.println("</note>");
		out.print("<contactid>");
		out.print((lesson.getContactIdString() != null) ? Escape.textToXML(lesson.getContactIdString()) : "");
		out.println("</contactid>");

		out.println("</lesson>");
		
	}
	
	/** outputs an xml list of contacts and all the contact attributes.<br>
	 * <br>
	 * @param the response object for the current ActionContext
	 * @param an iterator of contact objects 
	 */
	public void outputContactList(HttpServletResponse res, Iterator contactList, String staffAccountNo) throws Exception {
		res.setContentType( "text/xml" );
		PrintWriter out = res.getWriter();
		
		out.println("<contactList>");

		while(contactList.hasNext()) {
			Contact contact = (Contact)contactList.next();
			out.println("<contact id=\"" + Escape.textToXML(contact.getContactIdString()) + "\">");
			out.print("<firstname>");
			out.print( (contact.getFirstName() != null) ? Escape.textToXML(contact.getFirstName()) : "" );
			out.println("</firstname>");
			out.print("<lastname>");
			out.print( (contact.getLastName() != null) ? Escape.textToXML(contact.getLastName()) : "" );
			out.println("</lastname>");
			out.print("<phonenumber>");
			out.print( (contact.getPhoneNumber() != null) ? Escape.textToXML(contact.getPhoneNumber()) : "" );
			out.println("</phonenumber>");
			out.print("<emailaddress>");
			out.print( (contact.getEmailAddress() != null) ? Escape.textToXML(contact.getEmailAddress()) : "" );
			out.println("</emailaddress>");
			out.print("<address1>");
			out.print( (contact.getAddress1() != null) ? Escape.textToXML(contact.getAddress1()) : "" );
			out.println("</address1>");
			out.print("<address2>");
			out.print( (contact.getAddress2() != null) ? Escape.textToXML(contact.getAddress2()) : "" );
			out.println("</address2>");
			out.print("<residence>");
			out.print( (contact.getResidence() != null) ? Escape.textToXML(contact.getResidence()) : "" );
			out.println("</residence>");
			out.print("<city>");
			out.print( (contact.getCity() != null) ? Escape.textToXML(contact.getCity()) : "" );
			out.println("</city>");
			out.print("<state>");
			out.print( (contact.getState() != null) ? Escape.textToXML(contact.getState()) : "" );
			out.println("</state>");
			out.print("<zip>");
			out.print( (contact.getZip() != null) ? Escape.textToXML(contact.getZip()) : "" );
			out.println("</zip>");
			out.print("<gender>");
			out.print( (contact.getGender() != null) ? Escape.textToXML(contact.getGender()) : "" );
			out.println("</gender>");
			out.print("<maritalstatus>");
			out.print( (contact.getMaritalStatus() != null) ? Escape.textToXML(contact.getMaritalStatus()) : "" );
			out.println("</maritalstatus>");
			out.print("<campus>");
			out.print( (contact.getCampus() != null) ? Escape.textToXML(contact.getCampus()) : "" );
			out.println("</campus>");
			out.print("<levelofdiscipleship>");
			out.print( (contact.getLevelOfDiscipleship() != null) ? Escape.textToXML(contact.getLevelOfDiscipleship()) : "" );
			out.println("</levelofdiscipleship>");
			out.print("<yearinschool>");
			out.print( (contact.getYearInSchool() != null) ? Escape.textToXML(contact.getYearInSchool()) : "" );
			out.println("</yearinschool>");
			out.print("<birthdate>");
			out.print( (contact.getBirthDate() != null) ? Escape.textToXML(contact.getBirthDateString()) : "" );
			out.println("</birthdate>");
			out.print("<datebecamebeliever>");
			out.print( (contact.getDateBecameBeliever() != null) ? Escape.textToXML(contact.getDateBecameBeliever()) : "" );
			out.println("</datebecamebeliever>");
			out.print("<primaryspiritualgift>");
			out.print( (contact.getPrimarySpiritualGift() != null) ? Escape.textToXML(contact.getPrimarySpiritualGift()) : "" );
			out.println("</primaryspiritualgift>");
			out.print("<secondaryspiritualgift>");
			out.print( (contact.getSecondarySpiritualGift() != null) ? Escape.textToXML(contact.getSecondarySpiritualGift()) : "" );
			out.println("</secondaryspiritualgift>");
			out.print("<tertiaryspiritualgift>");
			out.print( (contact.getTertiarySpiritualGift() != null) ? Escape.textToXML(contact.getTertiarySpiritualGift()) : "" );
			out.println("</tertiaryspiritualgift>");
			out.print("<typeofcontact>");
			out.print( (contact.getTypeOfContact() != null) ? Escape.textToXML(contact.getTypeOfContact()) : "" );
			out.println("</typeofcontact>");
			out.print("<dateadded>");
			out.print( (contact.getDateAdded() != null) ? Escape.textToXML(contact.getDateAddedString()) : "" );
			out.println("</dateadded>");
			out.print("<note>");
			out.print( (contact.getNote() != null) ? Escape.textToXML(contact.getNote()) : "" );
			out.println("</note>");
			out.print("<discipledby>");
			out.print( (contact.getDiscipledById() != null) ? Escape.textToXML(contact.getDiscipledById()) : "" );
			out.println("</discipledby>");
			out.print("<surferaccountno>");
			out.print( (staffAccountNo != null) ? Escape.textToXML(staffAccountNo) : "" );
			out.println("</surferaccountno>");
			out.println("</contact>");				
		}
		out.println("</contactList>");

		out.flush();    	
	}
   
	/** outputs an xml list of contacts and all the contact attributes.<br>
	 * <br>
	 * @param the response object for the current ActionContext
	 * @param an iterator of contact objects 
	 */
	public void outputRolodexList(HttpServletResponse res, Iterator rolodexList, String staffAccountNo) throws Exception {
		res.setContentType( "text/xml" );
		PrintWriter out = res.getWriter();
		
		out.println("<rolodexList>");

		while(rolodexList.hasNext()) {
			Rolodex rolodex = (Rolodex)rolodexList.next();
			out.println("<rolodex id=\"" + Escape.textToXML(rolodex.getRolodexIdString()) + "\">");
			out.print("<firstname>");
			out.print( (rolodex.getFirstName() != null) ? Escape.textToXML(rolodex.getFirstName()) : "" );
			out.println("</firstname>");
			out.print("<middleinitial>");
			out.print( (rolodex.getMiddleInitial() != null) ? Escape.textToXML(rolodex.getMiddleInitial()) : "" );
			out.println("</middleinitial>");
			out.print("<lastname>");
			out.print( (rolodex.getLastName() != null) ? Escape.textToXML(rolodex.getLastName()) : "" );
			out.println("</lastname>");
			out.print("<address>");
			out.print( (rolodex.getAddress() != null) ? Escape.textToXML(rolodex.getAddress()) : "" );
			out.println("</address>");
			out.print("<address2>");
			out.print( (rolodex.getAddress2() != null) ? Escape.textToXML(rolodex.getAddress2()) : "" );
			out.println("</address2>");
			out.print("<city>");
			out.print( (rolodex.getCity() != null) ? Escape.textToXML(rolodex.getCity()) : "" );
			out.println("</city>");
			out.print("<state>");
			out.print( (rolodex.getState() != null) ? Escape.textToXML(rolodex.getState()) : "" );
			out.println("</state>");
			out.print("<zip>");
			out.print( (rolodex.getZip() != null) ? Escape.textToXML(rolodex.getZip()) : "" );
			out.println("</zip>");
			out.print("<gender>");
			out.print( (rolodex.getGender() != null) ? Escape.textToXML(rolodex.getGender()) : "" );
			out.println("</gender>");
			out.print("<phone>");
			out.print( (rolodex.getPhone() != null) ? Escape.textToXML(rolodex.getPhone()) : "" );
			out.println("</phone>");
			out.print("<email>");
			out.print( (rolodex.getEmail() != null) ? Escape.textToXML(rolodex.getEmail()) : "" );
			out.println("</email>");
			out.print("<maritalstatus>");
			out.print( (rolodex.getMaritalStatus() != null) ? Escape.textToXML(rolodex.getMaritalStatus()) : "" );
			out.println("</maritalstatus>");
			out.print("<birthdate>");
			out.print( (rolodex.getBirthDate() != null) ? Escape.textToXML(rolodex.getBirthDateStringMMDDYYYY()) : "" );
			out.println("</birthdate>");
			out.print("<campus>");
			out.print( (rolodex.getCampus() != null) ? Escape.textToXML(rolodex.getCampus()) : "" );
			out.println("</campus>");
			out.print("<sourcetable>");
			out.print( (rolodex.getTable() != null) ? Escape.textToXML(rolodex.getTable()) : "" );
			out.println("</sourcetable>");
			out.print("<note>");
			out.print( (rolodex.getNote() != null) ? Escape.textToXML(rolodex.getNote()) : "" );
			out.println("</note>");
			out.print("<surferaccountno>");
			out.print( (staffAccountNo != null) ? Escape.textToXML(staffAccountNo) : "" );
			out.println("</surferaccountno>");
			out.print("</rolodex>");				
		}
		out.println("</rolodexList>");

		out.flush();    	
	}
	
	/** parameters expected in request:<br>
	 * staffaccountno = account number of the person using the tool.  this can be gotten directly from the session, but I want to rely on the web form to give me any necessary info<br>
	 */
	public void listMyContacts(ActionContext ctx) throws Exception {
		String staffAccountNo = (String)ctx.getInputString("staffaccountno");
		Contact contact = new Contact();
		contact.setDiscipledById(staffAccountNo);
		contact.setDateAdded(null);
		Iterator contactList = contact.selectList().iterator();
		
		outputContactList(ctx.getResponse(), contactList, staffAccountNo);
	}
	/** parameters expected in request:<br>
	 * staffaccountno = account number of the person using the tool.  this can be gotten directly from the session, but I want to rely on the web form to give me any necessary info<br>
	 */
	public void listSchoolContacts(ActionContext ctx) throws Exception {
		String staffAccountNo = (String)ctx.getInputString("staffaccountno");
		Staff staff = new Staff(staffAccountNo);
		
		if (staff.getMembership()!=null) {
			String campusList = InfoBaseQueries.getCampusesForStaffTeam(staffAccountNo);
			if (campusList.length()>0) {
				Contact contact = new Contact();
				Iterator contactList = contact.selectList("campus in ("+campusList+")").iterator();
					
				outputContactList(ctx.getResponse(), contactList, staffAccountNo);
			} else {
				outputContactList(ctx.getResponse(), (new Vector()).iterator(), staffAccountNo);							
			}
		} else {
			outputContactList(ctx.getResponse(), (new Vector()).iterator(), staffAccountNo);			
		}
	}
	/** parameters expected in request:<br>
	 * staffaccountno = account number of the person using the tool.  this can be gotten directly from the session, but I want to rely on the web form to give me any necessary info<br>
	 */
	public void listSchoolRolodex(ActionContext ctx) throws Exception {
		String staffAccountNo = (String)ctx.getInputString("staffaccountno");
		Staff staff = new Staff(staffAccountNo);
		
		if (staff.getMembership()!=null) {
			String campusList = InfoBaseQueries.getCampusesForStaffTeam(staffAccountNo);
			if (campusList.length()>0) {
				Rolodex rolodex = new Rolodex();
				Iterator rolodexList = rolodex.selectList("campus in ("+campusList+")").iterator();
					
				outputRolodexList(ctx.getResponse(), rolodexList, staffAccountNo);
			} else {
				outputRolodexList(ctx.getResponse(), (new Vector()).iterator(), staffAccountNo);			
			}
		} else {
			outputRolodexList(ctx.getResponse(), (new Vector()).iterator(), staffAccountNo);			
		}
		
	}
	/** parameters expected in request:<br>
	 */
	public void addContactToMe(ActionContext ctx) throws Exception {
		String contactId = (String)ctx.getInputString("ContactId");
		Contact contact = new Contact(contactId);
		contact.setDiscipledById((String)ctx.getSessionValue("accountNo"));
		contact.persist();
		
		showIndex(ctx);		
	}

	/** parameters expected in request:<br>
	 * ContactId = the id of the contact to be saved.  if null, will create new contact.  if provided, will save the given info to the contact with that id.<br>
	 */
	public void saveContact(ActionContext ctx) throws Exception {
		Contact contact = new Contact();
		String id = ctx.getInputString("ContactId");
		if (id != null) {
			contact = new Contact(id);
		}
		ObjectHashUtil.hash2obj(ctx.getHashedRequest(), contact);
		contact.persist();
		
		ctx.goToURL(ctx.getInputString("url"));
	}

	/** parameters expected in request:<br>
	 * ContactId = the id of the contact to be saved.  if null, will create new contact.  if provided, will save the given info to the contact with that id.<br>
	 */
	public void editContact(ActionContext ctx) throws Exception {
		Contact contact = new Contact();
		String id = ctx.getInputString("ContactId");
		if (id != null) {
			contact = new Contact(id);
		}
		//ObjectHashUtil.hash2obj(ctx.getHashedRequest(), contact);
		//contact.persist();
		
		outputContact(ctx.getResponse(), contact);
	}

	/** parameters expected in request:<br>
	 * CallId = the id of the call to be saved.  if null, will create new call.  if provided, will save the given info to the call with that id.<br>
	 */
	public void saveCall(ActionContext ctx) throws Exception {
		Call call = new Call();
		String id = ctx.getInputString("CallId");
		if (id != null) {
			call = new Call(id);
		}
		ObjectHashUtil.hash2obj(ctx.getHashedRequest(), call);
		call.persist();
		
		String view = (String)ctx.getInputString("view");
		String action = (String)ctx.getInputString("viewaction");
		String contactid = (String)ctx.getInputString("ContactId");
		
		String url = (String)ctx.getInputString("url") + "?view=" + view + "&action=" + action + "&ContactId=" + contactid;
		ctx.goToURL(url);
	}
    

	/** parameters expected in request:<br>
	 * CallId = the id of the call to be saved.  if null, will create new call.  if provided, will save the given info to the call with that id.<br>
	 */
	public void editCall(ActionContext ctx) throws Exception {
		Call call = new Call();
		String id = ctx.getInputString("CallId");
		if (id != null) {
			call = new Call(id);
		}
		
		String contactid = (String)ctx.getInputString("ContactId");
		if ((contactid != null) && (!contactid.equals("null"))) {
			call.setContactIdString(ctx.getInputString("ContactId"));			
		}
		
		outputCall(ctx.getResponse(), call);
	}

	/** parameters expected in request:<br>
	 * CallId = the id of the call to be saved.  if null, will create new call.  if provided, will save the given info to the call with that id.<br>
	 */
	public void saveSchedule(ActionContext ctx) throws Exception {
		Schedule schedule = new Schedule();
		String id = ctx.getInputString("ScheduleId");
		if (id != null) {
			schedule = new Schedule(id);
		}
		ObjectHashUtil.hash2obj(ctx.getHashedRequest(), schedule);
		schedule.persist();
		
		String view = (String)ctx.getInputString("view");
		String action = (String)ctx.getInputString("viewaction");
		String contactid = (String)ctx.getInputString("ContactId");
		
		String url = (String)ctx.getInputString("url") + "?view=" + view + "&action=" + action + "&ContactId=" + contactid;
		ctx.goToURL(url);
	}
	/** parameters expected in request:<br>
	 * CallId = the id of the call to be saved.  if null, will create new call.  if provided, will save the given info to the call with that id.<br>
	 */
	public void editSchedule(ActionContext ctx) throws Exception {
		Schedule schedule = new Schedule();
		String id = ctx.getInputString("ScheduleId");
		if (id != null) {
			schedule = new Schedule(id);
		}
		
		String contactid = (String)ctx.getInputString("ContactId");
		if ((contactid != null) && (!contactid.equals("null"))) {
			schedule.setContactIdString(ctx.getInputString("ContactId"));			
		}
		
		outputSchedule(ctx.getResponse(), schedule);
	}

	/** parameters expected in request:<br>
	 * CallId = the id of the call to be saved.  if null, will create new call.  if provided, will save the given info to the call with that id.<br>
	 */
	public void saveLesson(ActionContext ctx) throws Exception {
		Lesson lesson = new Lesson();
		String id = ctx.getInputString("LessonId");
		if (id != null) {
			lesson = new Lesson(id);
		}
		ObjectHashUtil.hash2obj(ctx.getHashedRequest(), lesson);
		lesson.persist();
		
		String view = (String)ctx.getInputString("view");
		String action = (String)ctx.getInputString("viewaction");
		String contactid = (String)ctx.getInputString("ContactId");
		
		String url = (String)ctx.getInputString("url") + "?view=" + view + "&action=" + action + "&ContactId=" + contactid;
		ctx.goToURL(url);
	}
	/** parameters expected in request:<br>
	 * CallId = the id of the call to be saved.  if null, will create new call.  if provided, will save the given info to the call with that id.<br>
	 */
	public void editLesson(ActionContext ctx) throws Exception {
		Lesson lesson = new Lesson();
		String id = ctx.getInputString("LessonId");
		if (id != null) {
			lesson = new Lesson(id);
		}
		String contactid = (String)ctx.getInputString("ContactId");
		if ((contactid != null) && (!contactid.equals("null"))) {
			lesson.setContactIdString(ctx.getInputString("ContactId"));			
		}
		
		outputLesson(ctx.getResponse(), lesson);
	}
    
    /** @param ctx ActionContext object Request parameters: <none> */
    public void showIndex(ActionContext ctx) {
        try {
            ctx.goToView("index");
        }
        catch (Exception e) {
            ctx.goToErrorView();
            log.error("Failed to perform showIndex().", e);
        }
    }
}