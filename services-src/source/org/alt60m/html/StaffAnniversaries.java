package org.alt60m.html;

import java.util.*;
import java.io.*;
import org.alt60m.ministry.model.dbio.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class StaffAnniversaries implements java.io.Serializable {

	private static Log log = LogFactory.getLog(StaffAnniversaries.class);
	
	String bodyFont = "<FONT FACE=\"Arial\" SIZE=\"1\" COLOR=\"#336699\">";
	java.util.GregorianCalendar today = new java.util.GregorianCalendar();
	java.text.SimpleDateFormat parseDateToDayNumber = new java.text.SimpleDateFormat ("D");
	String theFile = new String();
	String theWeekFile = new String();
	String pathToViewStaff = new String();
    String theCampusFile = new String();
    String theCampusWeekFile = new String();
    String theFullFile = new String();
    String theFullWeekFile = new String();
	boolean justCampus = false;
    Properties p = new Properties();

	private String _pathToFile = "";
	private final String PROPERTIES_FILE = "occasions.properties";

	public StaffAnniversaries() { }

	public void initStaffAnniversaries(String dir) {
		_pathToFile = dir;
		getFileLocs();
	}

    private void getFileLocs() {

		try {
			File f = new File(_pathToFile, PROPERTIES_FILE);
			log.debug(f.getAbsolutePath());
			FileInputStream fis = new FileInputStream(f);
			p.load(fis);
			pathToViewStaff		= p.getProperty("_pathToViewStaff");
			theFullFile			= new File(_pathToFile, p.getProperty("_anniv")).getAbsolutePath();
			theFullWeekFile		= new File(_pathToFile, p.getProperty("_anniv_w")).getAbsolutePath();
			theCampusFile		= new File(_pathToFile, p.getProperty("_anniv_c")).getAbsolutePath();
			theCampusWeekFile	= new File(_pathToFile, p.getProperty("_anniv_c_w")).getAbsolutePath();
		} catch (Exception e) {	    
			log.error(e, e);
		}
    }

	public void setBodyFont(String aValue) { bodyFont = aValue; }

	public void setJustCampus(String aValue) {			//only display people who have their region set (ie campus staff)
		if (aValue!=null){
			justCampus = aValue.equalsIgnoreCase("true");
		}
		if (justCampus)	{
		    theFile = theCampusFile;
		    theWeekFile = theCampusWeekFile;
		}
		else{
		    theFile = theFullFile;
		    theWeekFile = theFullWeekFile;
		}
	}

	public void writeStaffAnniversaries(){
		boolean needNewFile = false;
		String StaffAnniversariesString = "";
		try {
			File file = new File (theFile);
			if (file.exists()){
				String dayOfYear = parseDateToDayNumber.format(today.getTime());
				String fileModificationDayOfYear = parseDateToDayNumber.format(new Date(file.lastModified()));
				if (!fileModificationDayOfYear.equals(dayOfYear)){
					needNewFile = true;		//StaffAnniversaries are out of sync
				}
			}
			else{
				needNewFile = true;
			}
			if (needNewFile){
				FileWriter fw = new FileWriter (theFile);
				String bdQuery ="";

				Object[] params = new Object[] {
                    new Integer(today.get(Calendar.MONTH)+1),
                    new Integer(today.get(Calendar.DATE))
                };

				if (justCampus){
					bdQuery = "region<>'' and MONTH(hireDate) = "+params[0]+" and DAY(hireDate)="+params[1]+" AND (removedFromPeopleSoft='N') order by lastName";
				}
				else{
					bdQuery = "MONTH(hireDate) = "+params[0]+" and DAY(hireDate)="+params[1]+" AND (removedFromPeopleSoft='N') order by lastName";
				}

				Collection stafflist = new Staff().selectList(bdQuery);
				if (stafflist.isEmpty()){
					StaffAnniversariesString = "<center><i>None today.</i></center>";
				}
				for (Iterator i = stafflist.iterator(); i.hasNext(); )	{
					Staff thisStaff = (Staff) i.next();
					java.text.SimpleDateFormat getYear = new java.text.SimpleDateFormat ("yyyy");
					if (thisStaff.getHireDate()!=null){
						int onStaffFor = (Integer.parseInt(getYear.format(today.getTime()))-Integer.parseInt(getYear.format((Date)thisStaff.getHireDate())));
						String AccountNo = (String) thisStaff.getAccountNo();
						StaffAnniversariesString = StaffAnniversariesString + "<a href='"+ pathToViewStaff +"&staffid="+AccountNo+"'>"+ bodyFont + thisStaff.getFirstName()+" ";
						StaffAnniversariesString = StaffAnniversariesString + thisStaff.getLastName()+"</a>("+onStaffFor+")</font><br>";
					}
				}
				fw.write(StaffAnniversariesString);
				fw.close();
			}
		}
		catch (IOException e){
			log.error("IO:StaffAnniversariesError:",e);
		}
		catch (Exception e){
			log.error("StaffAnniversariesError:",e);
		}
	}

	public void writeWeekStaffAnniversaries(){
		boolean needNewFile = false;
		String StaffAnniversariesString = "";
		try {
			File file = new File (theWeekFile);
			if (file.exists()){
				String dayOfYear = parseDateToDayNumber.format(today.getTime());
				String fileModificationDayOfYear = parseDateToDayNumber.format(new Date(file.lastModified()));
				if (!fileModificationDayOfYear.equals(dayOfYear)){
					needNewFile = true;		//StaffAnniversariess are out of sync
				}
			}
			else{
				needNewFile = true;
			}
			if (needNewFile){
				Calendar weekfromnow = Calendar.getInstance();
				weekfromnow.add(Calendar.DATE,7);
				FileWriter fw = new FileWriter (theWeekFile);
				String bdQuery ="";

				if (justCampus){
					bdQuery ="region<>'' and ( (MONTH(hireDate)="+(today.get(Calendar.MONTH)+1)+" and DAY(hireDate)>="+today.get(Calendar.DATE)+" and DAY(hireDate)<=("+today.get(Calendar.DATE)+" + 7 )) or ("+today.get(Calendar.MONTH)+"!="+weekfromnow.get(Calendar.MONTH)+" and MONTH(hireDate)="+(weekfromnow.get(Calendar.MONTH)+1)+" and "+weekfromnow.get(Calendar.DATE)+">=DAY(hireDate))) AND (removedFromPeopleSoft='N') order by lastName";
				}
				else{
					bdQuery ="( (MONTH(hireDate)="+(today.get(Calendar.MONTH)+1)+" and DAY(hireDate)>="+today.get(Calendar.DATE)+" and DAY(hireDate)<=("+today.get(Calendar.DATE)+" + 7 )) or ("+today.get(Calendar.MONTH)+"!="+weekfromnow.get(Calendar.MONTH)+" and MONTH(hireDate)="+(weekfromnow.get(Calendar.MONTH)+1)+" and "+weekfromnow.get(Calendar.DATE)+">=DAY(hireDate))) AND (removedFromPeopleSoft='N') order by lastName";
				}

				Collection stafflist = new Staff().selectList(bdQuery);// _ministryAdaptor.list(bdQuery, new String[]{"FirstName","LastName","AccountNo","SpouseName","HireDate"});
				if (stafflist.isEmpty()){
					StaffAnniversariesString = "<center><i>There are no anniversaries in the next 7 days.</i></center>";
				}
				else{
					StaffAnniversariesString = "<table width='100%' border=0><tr><td valign=top>";
					int cnt = stafflist.size(); //assume couples and only show one of them
					int thiscnt = 0;
					for (Iterator i = stafflist.iterator(); i.hasNext(); )	{
						Staff thisStaff = (Staff) i.next();
						java.text.SimpleDateFormat getYear = new java.text.SimpleDateFormat ("yyyy");
//						java.text.SimpleDateFormat getDate = new java.text.SimpleDateFormat ("M'/'dd");
						if (thisStaff.getHireDate()!=null){
							int onStaffFor = (Integer.parseInt(getYear.format(today.getTime()))-Integer.parseInt(getYear.format((Date)thisStaff.getHireDate())));
							String AccountNo = (String) thisStaff.getAccountNo();
//							String SpouseName = (String) thisStaff.getSpouseFirstName();
								StaffAnniversariesString = StaffAnniversariesString + "<a href='"+ pathToViewStaff +"&staffid="+AccountNo+"'>"+ bodyFont + thisStaff.getFirstName()+" "+thisStaff.getLastName()+" (";
								StaffAnniversariesString = StaffAnniversariesString + onStaffFor+" year";
								if (onStaffFor>1){
									StaffAnniversariesString = StaffAnniversariesString + "s";
								}
								StaffAnniversariesString = StaffAnniversariesString + ")</font><br>";
						}
						if (thiscnt==(cnt/3)){
							StaffAnniversariesString = StaffAnniversariesString + "</td><td valign=top>";
						}
						if (thiscnt==(2*cnt/3)){
							StaffAnniversariesString = StaffAnniversariesString + "</td><td valign=top>";
						}
						thiscnt++;
					}
					StaffAnniversariesString = StaffAnniversariesString + "</td></tr></table>";
				}
				fw.write(StaffAnniversariesString);
				fw.close();
			}
		}
		catch (IOException e){
			log.error("IO:StaffAnniversariesError:",e);
		}
		catch (Exception e){
			log.error("StaffAnniversariesError:",e);
		}
	}
	
	public String getStaffAnniversariesFile(){
		try{
			FileInputStream dataStream = new FileInputStream(theFile);
			byte[] data = new byte[dataStream.available()];
			dataStream.read(data);
			dataStream.close();
			String strData = new String(data);
			return strData;
		}
		catch (Exception e){
			return "Staff Anniversaries is currently unavailable! Sorry!";
		}
	}
/* return the file containing this week's birthdays */
	public String getWeekStaffAnniversariesFile(){
		try{
			FileInputStream dataStream = new FileInputStream(theWeekFile);
			byte[] data = new byte[dataStream.available()];
			dataStream.read(data);
			dataStream.close();
			String strData = new String(data);
			return strData;
		}
		catch (Exception e){
			return "Staff Anniversaries is currently unavailable! Sorry!";
		}
	}

/* print out a weeks worth of birthdays */
	public String printWeek() {
			String stringBuffer = "";
			writeWeekStaffAnniversaries();
			stringBuffer = stringBuffer + getWeekStaffAnniversariesFile();
		return stringBuffer;
	}

	public String print() {
			String stringBuffer = "<!--  --------------------StaffAnniversaries MODULE ------------------- --> ";
			writeStaffAnniversaries();
			stringBuffer = stringBuffer + getStaffAnniversariesFile();
			stringBuffer = stringBuffer + bodyFont +"<CENTER><A HREF='http://americangreetings.com' TARGET='_blank'><B>[Send an E-card]</B></A><br><A HREF='/servlet/StaffController?action=showOccasions'><B>[Special Occasions]</B></A></CENTER></font>";
		return stringBuffer;
	}

}
