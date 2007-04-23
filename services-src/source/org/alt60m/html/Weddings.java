package org.alt60m.html;

import java.util.*;
import java.io.*;
import org.alt60m.ministry.model.dbio.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class Weddings implements java.io.Serializable {
	private static Log log = LogFactory.getLog(Weddings.class);
	
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

	
	private String _pathToFile = "";//"webapps/staffsite/occasions.properties";
	private final String PROPERTIES_FILE = "occasions.properties";
	public Weddings() { /*getFileLocs();*/ }

	public void initWeddings(String dir) {
		_pathToFile = dir;
		getFileLocs();
	}

    private void getFileLocs() {
		try {
			File f = new File(_pathToFile, PROPERTIES_FILE);
			log.debug(f.getAbsolutePath());
			FileInputStream fis = new FileInputStream(f);
			p.load(fis);
			//String pathToFile	= p.getProperty("_pathToFile");
			pathToViewStaff		= p.getProperty("_pathToViewStaff");
			theFullFile			= new File(_pathToFile, p.getProperty("_weddings")).getAbsolutePath();
			theFullWeekFile		= new File(_pathToFile, p.getProperty("_weddings_w")).getAbsolutePath();
			theCampusFile		= new File(_pathToFile, p.getProperty("_weddings_c")).getAbsolutePath();
			theCampusWeekFile	= new File(_pathToFile, p.getProperty("_weddings_c_w")).getAbsolutePath();
		} catch (Exception e) {	    
			log.error(e.getMessage() ,e);
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

	public void writeWeddings(){
		boolean needNewFile = false;
		String WeddingsString = "";
		try {
			File file = new File (theFile);
			if (file.exists()){
				String dayOfYear = parseDateToDayNumber.format(today.getTime());
				String fileModificationDayOfYear = parseDateToDayNumber.format(new Date(file.lastModified()));
				if (!fileModificationDayOfYear.equals(dayOfYear)){
					needNewFile = true;		//Weddingss are out of sync
				}
			}
			else{
				needNewFile = true;
			}
			if (needNewFile){
				FileWriter fw = new FileWriter (theFile);
				String bdQuery ="";

				if (justCampus){
					bdQuery = "region<>'' and maritalStatus='M' and MONTH(marriageDate)= "+(today.get(Calendar.MONTH)+1)+" and DAY(marriageDate)="+today.get(Calendar.DATE)+" AND (removedFromPeopleSoft='N') order by lastName";
				}
				else{
					bdQuery = "maritalStatus='M' and MONTH(marriageDate)= "+(today.get(Calendar.MONTH)+1)+" and DAY(marriageDate)="+today.get(Calendar.DATE)+" AND (removedFromPeopleSoft='N') order by lastName";
				}
					
				log.debug(bdQuery);
			
				Collection stafflist = new Staff().selectList(bdQuery);// staffAdaptor.list(bdQuery, new String[]{"PreferredName","LastName","AccountNo","SpouseFirstName","MarriageDate"});
				if (stafflist.isEmpty()){
					WeddingsString = "<center><i>None today.</i></center>";
				}
				for (Iterator i = stafflist.iterator(); i.hasNext(); )	{
					Staff thisStaff = (Staff) i.next();
					java.text.SimpleDateFormat getYear = new java.text.SimpleDateFormat ("yyyy");
					if (thisStaff.getMarriageDate()!=null){
						int marriedFor = (Integer.parseInt(getYear.format(today.getTime()))-Integer.parseInt(getYear.format((Date)thisStaff.getMarriageDate())));
						String AccountNo = (String) thisStaff.getAccountNo();
						String SpouseName = (String) thisStaff.getSpouseFirstName();
						if (!AccountNo.endsWith("S")) {
							WeddingsString = WeddingsString + "<a href='"+ pathToViewStaff +"&staffid="+AccountNo+"'>"+ bodyFont + thisStaff.getPreferredName()+" ";
							if (!SpouseName.equals("")) {
								WeddingsString = WeddingsString + " & " + SpouseName +"<br>&nbsp;";
							}
							WeddingsString = WeddingsString + thisStaff.getLastName()+"</a>("+marriedFor+")</font><br>";
						}
					}
				}
				fw.write(WeddingsString);
				fw.close();
			}
		}
		catch (IOException e){
			log.error("IO:WeddingsError:",e);
		}
		catch (Exception e){
			log.error("WeddingsError:",e);
		}
	}

	public void writeWeekWeddings(){
		boolean needNewFile = false;
		String WeddingsString = "";
		try {
			File file = new File (theWeekFile);
			if (file.exists()){
				String dayOfYear = parseDateToDayNumber.format(today.getTime());
				String fileModificationDayOfYear = parseDateToDayNumber.format(new Date(file.lastModified()));
				if (!fileModificationDayOfYear.equals(dayOfYear)){
					needNewFile = true;		//Weddingss are out of sync
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
					bdQuery ="region<>'' and maritalStatus='M' and ( (MONTH(marriageDate)="+(today.get(Calendar.MONTH)+1)+" and DAY(marriageDate)>="+today.get(Calendar.DATE)+" and DAY(marriageDate)<=("+today.get(Calendar.DATE)+" + 7 )) or ("+today.get(Calendar.MONTH)+"!="+weekfromnow.get(Calendar.MONTH)+" and MONTH(marriageDate)="+(weekfromnow.get(Calendar.MONTH)+1)+" and "+weekfromnow.get(Calendar.DATE)+">=DAY(marriageDate))) AND (removedFromPeopleSoft='N') order by lastName";
				}
				else{
					bdQuery ="maritalStatus='M' and ( (MONTH(marriageDate)="+(today.get(Calendar.MONTH)+1)+" and DAY(marriageDate)>="+today.get(Calendar.DATE)+" and DAY(marriageDate)<=("+today.get(Calendar.DATE)+" + 7 )) or ("+today.get(Calendar.MONTH)+"!="+weekfromnow.get(Calendar.MONTH)+" and MONTH(marriageDate)="+(weekfromnow.get(Calendar.MONTH)+1)+" and "+weekfromnow.get(Calendar.DATE)+">=DAY(marriageDate))) AND (removedFromPeopleSoft='N') order by lastName";
				}

				Collection stafflist = new Staff().selectList(bdQuery);// staffAdaptor.list(bdQuery, new String[]{"PreferredName","LastName","AccountNo","SpouseFirstName","MarriageDate"});
				if (stafflist.isEmpty()){
					WeddingsString = "<center><i>There are no anniversaries in the next 7 days.</i></center>";
				}
				else{
					WeddingsString = "<table width='100%' border=0><tr><td valign=top>";
					int cnt = stafflist.size()/2; //assume couples and only show one of them
					int thiscnt = 0;
					for (Iterator i = stafflist.iterator(); i.hasNext(); )	{
						Staff thisStaff = (Staff) i.next();
						java.text.SimpleDateFormat getYear = new java.text.SimpleDateFormat ("yyyy");
						java.text.SimpleDateFormat getDate = new java.text.SimpleDateFormat ("M'/'dd");
						if (thisStaff.getMarriageDate()!=null){
							int marriedFor = (Integer.parseInt(getYear.format(today.getTime()))-Integer.parseInt(getYear.format((Date)thisStaff.getMarriageDate())));
							String AccountNo = (String) thisStaff.getAccountNo();
							String SpouseName = (String) thisStaff.getSpouseFirstName();
							if (!AccountNo.endsWith("S")) {
								WeddingsString = WeddingsString + "<a href='"+ pathToViewStaff +"&staffid="+AccountNo+"'>"+ bodyFont + thisStaff.getPreferredName()+" ";
								if (!SpouseName.equals("")) {
									WeddingsString = WeddingsString + " & " + SpouseName +"&nbsp;"+ thisStaff.getLastName()+"</a> ("+getDate.format((Date)thisStaff.getMarriageDate());;
								}
								WeddingsString = WeddingsString + ": "+marriedFor+" year";
								if (marriedFor>1){
									WeddingsString = WeddingsString + "s";
								}
								WeddingsString = WeddingsString + ")</font><br>";
							}
							else{
								thiscnt--;	//ran into a spouse so make sure we ignore them on the counter!
							}
						}
						if (thiscnt==(cnt/2)){
							WeddingsString = WeddingsString + "</td><td valign=top>";
						}
						thiscnt++;
					}
					WeddingsString = WeddingsString + "</td></tr></table>";
				}
				fw.write(WeddingsString);
				fw.close();
			}
		}
		catch (IOException e){
			log.error("IO:WeddingsError:",e);
		}
		catch (Exception e){
			log.error("WeddingsError:",e);
		}
	}
	
	public String getWeddingsFile(){
		try{
			FileInputStream dataStream = new FileInputStream(theFile);
			byte[] data = new byte[dataStream.available()];
			dataStream.read(data);
			dataStream.close();
			String strData = new String(data);
			return strData;
		}
		catch (Exception e){
			return "Weddings is currently unavailable! Sorry!";
		}
	}
/* return the file containing this week's birthdays */
	public String getWeekWeddingsFile(){
		try{
			FileInputStream dataStream = new FileInputStream(theWeekFile);
			byte[] data = new byte[dataStream.available()];
			dataStream.read(data);
			dataStream.close();
			String strData = new String(data);
			return strData;
		}
		catch (Exception e){
			return "Weddings is currently unavailable! Sorry!";
		}
	}

/* print out a weeks worth of birthdays */
	public String printWeek() {
			String stringBuffer = "";
			writeWeekWeddings();
			stringBuffer = stringBuffer + getWeekWeddingsFile();
		return stringBuffer;
	}

	public String print() {
			String stringBuffer = "<!--  --------------------Weddings MODULE ------------------- --> ";
			writeWeddings();
			stringBuffer = stringBuffer + getWeddingsFile();
			stringBuffer = stringBuffer + bodyFont +"<CENTER><A HREF='http://www.hallmark.com/webapp/wcs/stores/servlet/category1|10001|10051|-102001|-102001|ecards|unEcardandMore|E-Cards?lid=unEcardandMore' TARGET='_blank'><B>[Send an E-card]</B></A><br><A HREF='/servlet/StaffController?action=showOccasions'><B>[Special Occasions]</B></A></CENTER></font>";
		return stringBuffer;
	}

}
