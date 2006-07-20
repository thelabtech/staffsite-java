package org.alt60m.html;

import java.util.*;
import java.io.*;
import org.alt60m.ministry.model.dbio.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class Occasions implements java.io.Serializable {
	private static Log log = LogFactory.getLog(Occasions.class);
	
	String bodyFont = "<FONT FACE=\"Arial\" SIZE=\"1\" COLOR=\"#336699\">";
	java.util.GregorianCalendar today = new java.util.GregorianCalendar();
	java.text.SimpleDateFormat parseDateToDayNumber = new java.text.SimpleDateFormat ("D");
	String theFile = new String();
	String theWeekFile = new String();
	String pathToViewStaff = new String();
    String theFullBdayFile = new String();
    String theFullBdayWeekFile = new String();
    String theCampusBdayFile = new String();
    String theCampusBdayWeekFile = new String();
    String theFullWedFile = new String();
    String theFullWedWeekFile = new String();
    String theCampusWedFile = new String();
    String theCampusWedWeekFile = new String();
    String theFullAnnivWeekFile = new String();
    String theCampusAnnivWeekFile = new String();
    Properties p = new Properties();

	private String _pathToFile = "";
	private final String PROPERTIES_FILE = "occasions.properties";


	public Occasions() { }

	public void initOccasions(String dir) {
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
			theFullBdayFile			= new File(_pathToFile, p.getProperty("_birthdays")).getAbsolutePath();
			theFullBdayWeekFile		= new File(_pathToFile, p.getProperty("_birthdays_w")).getAbsolutePath();
			theCampusBdayFile		= new File(_pathToFile, p.getProperty("_birthdays_c")).getAbsolutePath();
			theCampusBdayWeekFile	= new File(_pathToFile, p.getProperty("_birthdays_c_w")).getAbsolutePath();
			theFullWedFile			= new File(_pathToFile, p.getProperty("_weddings")).getAbsolutePath();
			theFullWedWeekFile		= new File(_pathToFile, p.getProperty("_weddings_w")).getAbsolutePath();
			theCampusWedFile		= new File(_pathToFile, p.getProperty("_weddings_c")).getAbsolutePath();
			theCampusWedWeekFile	= new File(_pathToFile, p.getProperty("_weddings_c_w")).getAbsolutePath();
			theFullAnnivWeekFile	= new File(_pathToFile, p.getProperty("_anniv_w")).getAbsolutePath();
			theCampusAnnivWeekFile	= new File(_pathToFile, p.getProperty("_anniv_c_w")).getAbsolutePath();
		} catch (Exception e) {	    
			e.printStackTrace();
		}
    }

	public void setBodyFont(String aValue) { bodyFont = aValue; }

	public void writeCampusBirthdaysToday(){
		String birthdayString = "";
		try {
			FileWriter fw = new FileWriter (theCampusBdayFile);
			String bdQuery ="";

			int month = (new Integer(today.get(Calendar.MONTH)+1)).intValue();
			int day = (new Integer(today.get(Calendar.DATE))).intValue();

			bdQuery = "region!=\"\" and MONTH(birthDate) = "+month+" and DAY(birthDate)="+day+" AND (removedFromPeopleSoft='N') order by lastName";
			log.debug(bdQuery);

			Collection stafflist = new Staff().selectList(bdQuery);
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
		catch (IOException e){
			log.error("IO:BirthdayError:",e);
		}
		catch (Exception e){
			log.error("BirthdayError:",e);
		}
	}

	public void writeAllBirthdaysToday(){
		String birthdayString = "";
		try {
			FileWriter fw = new FileWriter (theFullBdayFile);
			String bdQuery ="";

			int month = (new Integer(today.get(Calendar.MONTH)+1)).intValue();
			int day = (new Integer(today.get(Calendar.DATE))).intValue();

			bdQuery = "MONTH(birthDate) = "+month+" and DAY(birthDate)="+day+" AND (removedFromPeopleSoft='N') order by lastName";
			log.debug(bdQuery);

			Collection stafflist = new Staff().selectList(bdQuery);
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
		catch (IOException e){
			log.error("IO:BirthdayError:",e);
		}
		catch (Exception e){
			log.error("BirthdayError:",e);
		}
	}

	public void writeCampusWeekBirthdays(){
		String birthdayString = "";
		try {
			FileWriter fw = new FileWriter (theCampusBdayWeekFile);
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

			bdQuery = "region IN('GL','GP','MA','MS','NC','NE','NW','RR','SE','SW','UM') and ( (MONTH(birthDate)="+params[0]+" and DAY(birthDate)>="+params[1]+" and DAY(birthDate)<=("+params[2]+" + 7 )) or ("+params[3]+"!="+params[6]+" and MONTH(birthDate)="+params[5]+" and "+params[6]+">=DAY(birthDate))) AND (removedFromPeopleSoft='N')  order by region, lastName";

			Collection stafflist = new Staff().selectList(bdQuery);
			if (stafflist.isEmpty()){
				birthdayString = "<center><i>None this week!</i></center>";
			}
			else{
				birthdayString = "<table width='100%' border='0'>";
				java.text.SimpleDateFormat getBirthdate = new java.text.SimpleDateFormat ("M'/'dd");
				String reg = "temp";
//				int numcols = 3;
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
		catch (IOException e){
			log.error("IO:BirthdayError:",e);
		}
		catch (Exception e){
			log.error("BirthdayError:",e);
		}
	}

	public void writeAllWeekBirthdays(){
		String birthdayString = "";
		try {
			FileWriter fw = new FileWriter (theFullBdayWeekFile);
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

			bdQuery = "( (MONTH(birthDate)="+params[0]+" and DAY(birthDate)>="+params[1]+" and DAY(birthDate)<=("+params[2]+" + 7 )) or ("+params[3]+"!="+params[4]+" and MONTH(birthDate)="+params[5]+" and "+params[6]+">=DAY(birthDate))) AND (removedFromPeopleSoft='N')  order by region, lastName";

			Collection stafflist = new Staff().selectList(bdQuery);
			if (stafflist.isEmpty()){
				birthdayString = "<center><i>None this week!</i></center>";
			}
			else{
				birthdayString = "<table width='100%' border='0'>";
				java.text.SimpleDateFormat getBirthdate = new java.text.SimpleDateFormat ("M'/'dd");
				String reg = "temp";
//				int numcols = 3;
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
		catch (IOException e){
			log.error("IO:BirthdayError:",e);
		}
		catch (Exception e){
			log.error("BirthdayError:",e);
		}
	}

	public void writeCampusWeddingsToday(){
		String WeddingsString = "";
		try {
			FileWriter fw = new FileWriter (theCampusWedFile);
			String bdQuery ="";
			bdQuery = "region<>'' and maritalStatus='M' and MONTH(marriageDate)= "+(today.get(Calendar.MONTH)+1)+" and DAY(s.marriageDate)="+today.get(Calendar.DATE)+" AND (removedFromPeopleSoft='N') order by lastName";
				
			log.debug(bdQuery);
		
			Collection stafflist = new Staff().selectList(bdQuery); //staffAdaptor.list(bdQuery, new String[]{"PreferredName","LastName","AccountNo","SpouseFirstName","MarriageDate"});
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
		catch (IOException e){
			log.error("IO:WeddingsError:",e);
		}
		catch (Exception e){
			log.error("WeddingsError:",e);
		}
	}

	public void writeWeddingsToday(){
		String WeddingsString = "";
		try {
			FileWriter fw = new FileWriter (theFullWedFile);
			String bdQuery ="";
			bdQuery = "maritalStatus='M' and MONTH(marriageDate)= "+(today.get(Calendar.MONTH)+1)+" and DAY(marriageDate)="+today.get(Calendar.DATE)+" AND (removedFromPeopleSoft='N') order by lastName";
				
			log.debug(bdQuery);
		
			Collection stafflist = new Staff().selectList(bdQuery);//staffAdaptor.list(bdQuery, new String[]{"PreferredName","LastName","AccountNo","SpouseFirstName","MarriageDate"});
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
		catch (IOException e){
			log.error("IO:WeddingsError:",e);
		}
		catch (Exception e){
			log.error("WeddingsError:",e);
		}
	}

	public void writeCampusWeekWeddings(){
		String WeddingsString = "";
		try {
			Calendar weekfromnow = Calendar.getInstance();
			weekfromnow.add(Calendar.DATE,7);
			FileWriter fw = new FileWriter (theCampusWedWeekFile);
			String bdQuery ="";
			bdQuery ="region<>'' and maritalStatus='M' and ( (MONTH(marriageDate)="+(today.get(Calendar.MONTH)+1)+" and DAY(marriageDate)>="+today.get(Calendar.DATE)+" and DAY(marriageDate)<=("+today.get(Calendar.DATE)+" + 7 )) or ("+today.get(Calendar.MONTH)+"!="+weekfromnow.get(Calendar.MONTH)+" and MONTH(marriageDate)="+(weekfromnow.get(Calendar.MONTH)+1)+" and "+weekfromnow.get(Calendar.DATE)+">=DAY(marriageDate))) AND (removedFromPeopleSoft='N') order by lastName";

			Collection stafflist = new Staff().selectList(bdQuery); //staffAdaptor.list(bdQuery, new String[]{"PreferredName","LastName","AccountNo","SpouseFirstName","MarriageDate"});
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
								WeddingsString = WeddingsString + " & " + SpouseName +"&nbsp;"+ thisStaff.getLastName()+"</a> ("+getDate.format((Date)thisStaff.getMarriageDate());
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
		catch (IOException e){
			log.error("IO:WeddingsError:",e);
		}
		catch (Exception e){
			log.error("WeddingsError:",e);
		}
	}
	
	public void writeWeekWeddings(){
		String WeddingsString = "";
		try {
			Calendar weekfromnow = Calendar.getInstance();
			weekfromnow.add(Calendar.DATE,7);
			FileWriter fw = new FileWriter (theFullWedWeekFile);
			String bdQuery ="";
			bdQuery ="maritalStatus='M' and ( (MONTH(marriageDate)="+(today.get(Calendar.MONTH)+1)+" and DAY(marriageDate)>="+today.get(Calendar.DATE)+" and DAY(marriageDate)<=("+today.get(Calendar.DATE)+" + 7 )) or ("+today.get(Calendar.MONTH)+"!="+weekfromnow.get(Calendar.MONTH)+" and MONTH(marriageDate)="+(weekfromnow.get(Calendar.MONTH)+1)+" and "+weekfromnow.get(Calendar.DATE)+">=DAY(marriageDate))) AND (removedFromPeopleSoft='N') order by lastName";

			Collection stafflist = new Staff().selectList(bdQuery); //staffAdaptor.list(bdQuery, new String[]{"PreferredName","LastName","AccountNo","SpouseFirstName","MarriageDate"});
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
								WeddingsString = WeddingsString + " & " + SpouseName +"&nbsp;"+ thisStaff.getLastName()+"</a> ("+getDate.format((Date)thisStaff.getMarriageDate());
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
		catch (IOException e){
			log.error("IO:WeddingsError:",e);
		}
		catch (Exception e){
			log.error("WeddingsError:",e);
		}
	}
		
	public void writeCampusWeekStaffAnniversaries(){
		String StaffAnniversariesString = "";
		try {
			Calendar weekfromnow = Calendar.getInstance();
			weekfromnow.add(Calendar.DATE,7);
			FileWriter fw = new FileWriter (theCampusAnnivWeekFile);
			String bdQuery ="";

			bdQuery ="region<>'' and ( (MONTH(hireDate)="+(today.get(Calendar.MONTH)+1)+" and DAY(hireDate)>="+today.get(Calendar.DATE)+" and DAY(hireDate)<=("+today.get(Calendar.DATE)+" + 7 )) or ("+today.get(Calendar.MONTH)+"!="+weekfromnow.get(Calendar.MONTH)+" and MONTH(hireDate)="+(weekfromnow.get(Calendar.MONTH)+1)+" and "+weekfromnow.get(Calendar.DATE)+">=DAY(hireDate))) AND (removedFromPeopleSoft='N') order by lastName";

			Collection stafflist = new Staff().selectList(bdQuery); //_ministryAdaptor.list(bdQuery, new String[]{"FirstName","LastName","AccountNo","SpouseFirstName","HireDate"});
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
					if (thisStaff.getHireDate()!=null){
						int onStaffFor = (Integer.parseInt(getYear.format(today.getTime()))-Integer.parseInt(getYear.format((Date)thisStaff.getHireDate())));
						String AccountNo = (String) thisStaff.getAccountNo();
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
		catch (IOException e){
			log.error("IO:StaffAnniversariesError:",e);
			
		}
		catch (Exception e){
			log.error("StaffAnniversariesError:",e);
			
		}
	}
	
	public void writeWeekStaffAnniversaries(){
		String StaffAnniversariesString = "";
		try {
			Calendar weekfromnow = Calendar.getInstance();
			weekfromnow.add(Calendar.DATE,7);
			FileWriter fw = new FileWriter (theFullAnnivWeekFile);
			String bdQuery ="";

			bdQuery ="( (MONTH(hireDate)="+(today.get(Calendar.MONTH)+1)+" and DAY(hireDate)>="+today.get(Calendar.DATE)+" and DAY(hireDate)<=("+today.get(Calendar.DATE)+" + 7 )) or ("+today.get(Calendar.MONTH)+"!="+weekfromnow.get(Calendar.MONTH)+" and MONTH(hireDate)="+(weekfromnow.get(Calendar.MONTH)+1)+" and "+weekfromnow.get(Calendar.DATE)+">=DAY(hireDate))) AND (removedFromPeopleSoft='N') order by lastName";

			Collection stafflist = new Staff().selectList(bdQuery); //_ministryAdaptor.list(bdQuery, new String[]{"FirstName","LastName","AccountNo","SpouseFirstName","HireDate"});
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
//					java.text.SimpleDateFormat getDate = new java.text.SimpleDateFormat ("M'/'dd");
					if (thisStaff.getHireDate()!=null){
						int onStaffFor = (Integer.parseInt(getYear.format(today.getTime()))-Integer.parseInt(getYear.format((Date)thisStaff.getHireDate())));
						String AccountNo = (String) thisStaff.getAccountNo();
//						String SpouseName = (String) thisStaff.getSpouseFirstName();
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
		catch (IOException e){
			log.error("IO:StaffAnniversariesError:",e);
			
		}
		catch (Exception e){
			log.error("StaffAnniversariesError:",e);
			
		}
	}
	
	static public void main(String[] args) {
		try	{
		    //org.alt60m.persistence.castor.ObjectMapping.setConfigPath("/ade3/tomcat/mapping");
			Occasions o = new Occasions();
			o.initOccasions("c:/ade3/tomcat/webapps/staffsite");
//ToDo: Re-add this before using.  I commented it out, so it would compile.
//			log.debug("writing campus's day's birthdays ...");
//			o.writeCampusBirthdaysToday();
//			log.debug("writing all day's birthdays ...");
//			o.writeAllBirthdaysToday();
//			log.debug("writing campus's week's birthdays ...");
//			o.writeCampusWeekBirthdays();
//			log.debug("writing all week's birthdays ...");
//			o.writeAllWeekBirthdays();
//			log.debug("writing campus's day's weddings ...");
//			o.writeCampusWeddingsToday();
//			log.debug("writing all day's weddings ...");
//			o.writeWeddingsToday();
//			log.debug("writing campus week's weddings ...");
//			o.writeCampusWeekWeddings();
//			log.debug("writing all week's weddings ...");
//			o.writeWeekWeddings();
//			log.debug("writing campus week's staff anniversaries ...");
//			o.writeCampusWeekStaffAnniversaries();
//			log.debug("writing all week's staff anniversaries ...");
//			o.writeWeekStaffAnniversaries();
		}
		catch (Exception e)	{
//			log.error("Failed to write occassions files: ",e);
			
		}
	}
}