package org.alt60m.html;

import java.util.*;
import java.io.*;
import org.alt60m.ministry.model.dbio.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class Birthdays implements java.io.Serializable {
	private static Log log = LogFactory.getLog(Birthdays.class);
	
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


	public Birthdays() { }

	public void initBirthdays(String dir) {
		_pathToFile = dir;
		getFileLocs();
	}

    private void getFileLocs() {

		try {
			File f = new File(_pathToFile, PROPERTIES_FILE);
			log.debug((f.getAbsolutePath()));
			FileInputStream fis = new FileInputStream(f);
			p.load(fis);
			pathToViewStaff		= p.getProperty("_pathToViewStaff");
			theFullFile			= new File(_pathToFile, p.getProperty("_birthdays")).getAbsolutePath();
			theFullWeekFile		= new File(_pathToFile, p.getProperty("_birthdays_w")).getAbsolutePath();
			theCampusFile		= new File(_pathToFile, p.getProperty("_birthdays_c")).getAbsolutePath();
			theCampusWeekFile	= new File(_pathToFile, p.getProperty("_birthdays_c_w")).getAbsolutePath();
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

	public void writeBirthdays(){
		boolean needNewFile = false;
		String birthdayString = "";
		try {
			File file = new File (theFile);
			if (file.exists()){
				String dayOfYear = parseDateToDayNumber.format(today.getTime());
				String fileModificationDayOfYear = parseDateToDayNumber.format(new Date(file.lastModified()));
				if (!fileModificationDayOfYear.equals(dayOfYear)){
					needNewFile = true;		//birthdays are out of sync
				}
			}
			else{
				needNewFile = true;
			}
			if (needNewFile){
				FileWriter fw = new FileWriter (theFile);
				String bdQuery ="";
				
				int month = (new Integer(today.get(Calendar.MONTH)+1)).intValue();
				int day = (new Integer(today.get(Calendar.DATE))).intValue();

				if (justCampus){
					bdQuery = "region<>'' and MONTH(birthDate) = "+month+" and DAY(birthDate)="+day+" AND (removedFromPeopleSoft='N') order by lastName";
				}
				else{
					bdQuery = "MONTH(birthDate) = "+month+" and DAY(birthDate)="+day+" AND (removedFromPeopleSoft='N') order by lastName";
				}
				
				log.debug(bdQuery);

				Collection stafflist = new Staff().selectList(bdQuery); // _ministryStaffAdaptor.list(bdQuery);
				if (stafflist.isEmpty()){
					birthdayString = "<center><i>None today.</i></center>";
				}
				for (Iterator i = stafflist.iterator(); i.hasNext(); )	{
					Staff thisStaff = (Staff) i.next();
					birthdayString = birthdayString + "<a href='"+ pathToViewStaff +"&staffid="+thisStaff.getAccountNo()+"'>"+ bodyFont + thisStaff.getPreferredName()+" "+thisStaff.getLastName()+"</font></a><br>";
				}
				fw.write(birthdayString);
				fw.close();
			}
		}
		catch (IOException e){
			log.error("IO:BirthdayError:",e);
		}
		catch (Exception e){
			log.error("BirthdayError:",e);
		}
	}

	public void writeWeekBirthdays(){
		boolean needNewFile = false;
		String birthdayString = "";
		try {
			File file = new File (theWeekFile);
			if (file.exists()){
				String dayOfYear = parseDateToDayNumber.format(today.getTime());
				String fileModificationDayOfYear = parseDateToDayNumber.format(new Date(file.lastModified()));
				if (!fileModificationDayOfYear.equals(dayOfYear)){
					needNewFile = true;		//birthdays are out of sync
				}
			}
			else{
				needNewFile = true;
			}
			if (needNewFile){
				FileWriter fw = new FileWriter (theWeekFile);
				Calendar weekfromnow = Calendar.getInstance();
				weekfromnow.add(Calendar.DATE,7);
				String bdQuery ="";

				Object[] params = new Object[] {
                    new Integer(today.get(Calendar.MONTH)+1),
					new Integer(today.get(Calendar.DATE)),
                    new Integer(today.get(Calendar.DATE)),
                    new Integer(today.get(Calendar.MONTH)),
                    new Integer(weekfromnow.get(Calendar.MONTH)),
                    new Integer(weekfromnow.get(Calendar.MONTH)+1),
                    new Integer(weekfromnow.get(Calendar.DATE))
                };

				if (justCampus){
					bdQuery = "region IN('GL','GP','MA','MS','NC','NE','NW','RR','SE','SW','UM') and ( (MONTH(birthDate)="+params[0]+" and DAY(birthDate)>="+params[1]+" and DAY(birthDate)<=("+params[2]+" + 7 )) or ("+params[3]+"!="+params[6]+" and MONTH(birthDate)="+params[5]+" and "+params[6]+">=DAY(birthDate)))  AND (removedFromPeopleSoft='N')  order by region, lastName";
				}
				else{
					bdQuery = "( (MONTH(birthDate)="+params[0]+" and DAY(birthDate)>="+params[1]+" and DAY(birthDate)<=("+params[2]+" + 7 )) or ("+params[3]+"!="+params[4]+" and MONTH(birthDate)="+params[5]+" and "+params[6]+">=DAY(birthDate))) AND (removedFromPeopleSoft='N')  order by region, lastName";
				}

				Collection stafflist = new Staff().selectList(bdQuery);// _ministryStaffAdaptor.list(bdQuery);
				if (stafflist.isEmpty()){
					birthdayString = "<center><i>None this week!</i></center>";
				}
				else{
					birthdayString = "<table width='100%' border='0'>";
					java.text.SimpleDateFormat getBirthdate = new java.text.SimpleDateFormat ("M'/'dd");
					String reg = "temp";
//					int numcols = 3;
					int thiscol = 0;
					for (Iterator i = stafflist.iterator(); i.hasNext(); )	{
						Staff thisStaff = (Staff) i.next();
						String Region = (String)thisStaff.getRegion();
						if(Region.equals("NW")) {
							Region = "GNW";
						}
						if(Region.equals("SW")) {
							Region = "PSW";
						}
						if (!Region.equals(reg)) {
							if (Region.equals("")){
								reg="";
								Region = "Unspecified";
							}
							else{
								reg = Region;
							}

							birthdayString = birthdayString + "<tr><td colspan=4><b>"+bodyFont+"<font size='+1'>"+Region+" Region</i><br></font></font></b></td></tr>";
							thiscol=0;
						}
						if (thiscol==0){
							birthdayString = birthdayString + "<tr><td>";
						}
						else if (thiscol==1){
							birthdayString = birthdayString + "</td><td>";
						}
						else if (thiscol==2){
							birthdayString = birthdayString + "</td><td>";
						}
						if (thiscol!=3){
							birthdayString = birthdayString + "<a href='"+ pathToViewStaff +"&staffid="+thisStaff.getAccountNo()+"'>"+ bodyFont + thisStaff.getPreferredName()+" "+thisStaff.getLastName()+"</a>("+ getBirthdate.format((Date)thisStaff.getBirthDate()) +")</font><br>";
						}
						if (thiscol==3){
							birthdayString = birthdayString + "</td><td>";
							birthdayString = birthdayString + "<a href='"+ pathToViewStaff +"&staffid="+thisStaff.getAccountNo()+"'>"+ bodyFont + thisStaff.getPreferredName()+" "+thisStaff.getLastName()+"</a>("+ getBirthdate.format((Date)thisStaff.getBirthDate()) +")</font><br>";
							birthdayString = birthdayString + "</td></tr>";
							thiscol=0;
						}
						else {
							thiscol++;
						}
						
					}
					birthdayString = birthdayString + "</table>";
				}
				fw.write(birthdayString);
				fw.close();
			}
		}
		catch (IOException e){
			log.error("IO:BirthdayError:",e);
		}
		catch (Exception e){
			log.error("BirthdayError:",e);
		}
	}

/* return the file containing today's birthdays */	
	public String getBirthdayFile(){
		try{
			FileInputStream dataStream = new FileInputStream(theFile);
			byte[] data = new byte[dataStream.available()];
			dataStream.read(data);
			dataStream.close();
			String strData = new String(data);
			return strData;
		}
		catch (Exception e){
			return "Error opening birthdays file! Sorry!";
		}
	}

/* return the file containing this week's birthdays */
	public String getWeekBirthdayFile(){
		try{
			FileInputStream dataStream = new FileInputStream(theWeekFile);
			byte[] data = new byte[dataStream.available()];
			dataStream.read(data);
			dataStream.close();
			String strData = new String(data);
			return strData;
		}
		catch (Exception e){
			return "Error opening birthdays file! Sorry!";
		}
	}

/* print out a weeks worth of birthdays */
	public String printWeek() {
			String stringBuffer = "";
			writeWeekBirthdays();
			stringBuffer = stringBuffer + getWeekBirthdayFile();
		return stringBuffer;
	}

	public String print() {
			String stringBuffer = "<!--  --------------------Birthdays MODULE ------------------- --> ";
			writeBirthdays();
			stringBuffer = stringBuffer + getBirthdayFile();
			stringBuffer = stringBuffer + bodyFont +"<CENTER><A HREF='http://www.hallmark.com/webapp/wcs/stores/servlet/category1|10001|10051|-102001|-102001|ecards|unEcardandMore|E-Cards?lid=unEcardandMore' TARGET='_blank'><B>[Send an E-card]</B></A><br><A HREF='/servlet/StaffController?action=showOccasions'><B>[Special Occasions]</B></A></CENTER></font>";
		return stringBuffer;
	}

}












