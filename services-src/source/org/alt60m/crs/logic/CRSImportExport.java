package org.alt60m.crs.logic;

import java.sql.*;
import java.io.*;
import java.util.Hashtable;
import java.util.Date;
import java.util.ArrayList;
import java.text.SimpleDateFormat;
import java.util.*;

import org.alt60m.cms.util.CatPathMaker;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/*******************************************************************************
 * This code was written by David Bowdoin, 7/2002
 * 
 * On table export, a table is created in access to hold the results of the
 * desired query. On person import, only fields in the SQL crs_Person table get
 * imported back in, all other get ignored.
 ******************************************************************************/

public class CRSImportExport {
	private static Log log = LogFactory.getLog(CRSImportExport.class); 

	private static Map<String, CRSImportExport> instances = new HashMap<String, CRSImportExport>();
	
	private int verboseLevel = 1; //1 notification and sever error only, 2

	// includes errors, 3 , 4 , 5 everything

	String output = "";

	Hashtable<String, String> returnVal;

	//Be sure to include the final closing / in the path
	char separatorChar = File.separatorChar;
	private final String templatePath = separatorChar + "database" + separatorChar + "template" + separatorChar;

	private final String downloadPath = separatorChar + "database" + separatorChar + "download" + separatorChar;

	private final String uploadPath = separatorChar + "database" + separatorChar + "upload" + separatorChar;

	//private final int baseNewId = 5000000;

	private String basePath = "";


	//private final String accessUrl = "jdbc:odbc:DRIVER=Microsoft Access Driver (*.mdb); DBQ="; //Append
	private final String accessUrl = "jdbc:access:///"; 
	
	private Connection primaryConn;

	private Connection accessConn;

	// Be careful when using these global statments, as a statement can only
	// handle one resultSet at a time.
	private Statement sqlStatement;

	private Statement accessStatement;

	//********************************************************************************//
	//Test Code - How to run this test code, while in c:\ade3, after running
	// setenv
	//    javac -d C:\ade3\classes
	// C:\ade3\controlled-src\services-src\source\org\alt60m\crs\logic\CRSImportExport.java
	//    java org.alt60m.crs.logic.CRSImportExport
	public static void main(String[] args) throws Exception {
		log.debug("----Start of Import/Export Text----");
		CRSImportExport test = new CRSImportExport(
				"Replace me with a real path for me to work");

		//        test.exportToAccess("18","SW","Blank.mdb");
		//log.debug(test.importFromAccess("Conference18.mdb", "18"));

		log.debug("----End of of Import/Export Text----");
	}

	//********************************************************************************//
	// Public functions
	//********************************************************************************//
	private CRSImportExport(String basePath) {
		this.basePath = basePath;
	}

	public static CRSImportExport getInstance(String basePath) {
		CRSImportExport instance = (CRSImportExport)instances.get(basePath);
		if ( instance == null ) {
			instance = new CRSImportExport(basePath);
			instances.put(basePath, instance);
		}
		//return instance; //don't really need
		return new CRSImportExport(basePath);
	}

	public String getImportDirectory() {
		return basePath + uploadPath;
	}

	public void setVerboseLevel(int newValue) {
		verboseLevel = newValue;
	}

	public void initFolders() {
		new File(basePath + downloadPath).mkdir();
		new File(basePath + uploadPath).mkdir();
	}
	
	public synchronized Hashtable exportToCSV(String conferenceID) throws Exception {
		returnVal = new Hashtable<String, String>();
		String fileName = "Conference" + conferenceID + ".csv";
		String tempDatabaseName = basePath + downloadPath + "temp"
				+ conferenceID + ".mdb";
		FileWriter file = null;
		try {
			file = new FileWriter(basePath + downloadPath + fileName);
			copyFile(basePath + templatePath + "blank.mdb", tempDatabaseName);

			openDatabases(tempDatabaseName);
			/* export the conference Table */
			exportTable(
					"Conference",
					"SELECT name, conferenceID, createDate, theme, region, contactName, contactEmail, contactPhone,"
					+" contactAddress1, contactAddress2, contactCity, contactState, contactZip, splashPageURL, confImageId,"
					+" fontFace, backgroundColor, foregroundColor, highlightColor,"
					+" acceptVisa, acceptMasterCard, acceptDiscover, acceptAmericanExpress, checkPayableTo, "
					+" preRegStart, preRegEnd, masterDefaultDateArrive, masterDefaultDateLeave FROM crs_conference WHERE conferenceID="
							+ conferenceID);
			/* export the RegistrationType Table */
			exportTable(
					"RegistrationTypes",
					"SELECT label, description,defaultDateArrive, defaultDateLeave,preRegStart, preRegEnd,"+
					"acceptCreditCards, acceptChecks, acceptEChecks, acceptMinistryAcctTransfer, acceptStaffAcctTransfer, acceptScholarships,"+
					"singlePreRegDeposit, singleOnsiteCost, singleCommuteCost, singleDiscountFullPayment,singleDiscountEarlyReg, singleDiscountEarlyRegDate," +
					"marriedPreRegDeposit, marriedOnsiteCost, marriedCommuteCost, marriedDiscountFullPayment,marriedDiscountEarlyReg, marriedDiscountEarlyRegDate,"+ 	
					"askChildren, askSpouse registrationTypeID FROM crs_registrationtype WHERE fk_conferenceID="
							+ conferenceID);
			/* export all registrants */
			exportRegistrantsCSV(conferenceID);

			exportTable(
					"Payments",
					"SELECT paymentID, '' AS bagID, paymentDate, debit, credit, type, authCode, businessUnit, operatingUnit, dept AS departmentID, project AS projectID, accountNo, crs_payment.comment, posted, postedDate, fk_RegistrationID, fk_PersonID FROM crs_payment, crs_registration WHERE registrationID=fk_RegistrationID AND fk_ConferenceID="
							+ conferenceID);
			exportTable(
					"ChildRegistration",
					"SELECT childRegistrationID, FLOOR(DATEDIFF(NOW(), birthDate)/365) AS age, firstName, lastName, gender, crs_registration.arriveDate, birthDate, crs_registration.leaveDate, inChildCare, fk_RegistrationID FROM crs_childregistration, crs_registration WHERE registrationID=fk_RegistrationID AND fk_ConferenceID="
							+ conferenceID);

			file.write("Conference Info\n");
			writeTableToFile("Conference", file);

			file.write("\n\nRegistration Types\n");
			writeTableToFile("RegistrationTypes", file);

			file.write("\n\nRegistrants\n");
			writeTableToFile("Registrants", file);

			file.write("\n\nPayments\n");
			writeTableToFile("Payments", file);

			file.write("\n\nChild Registrations\n");
			writeTableToFile("ChildRegistration", file);

			closeDatabases();
			file.close();
			new File(tempDatabaseName).delete();
			returnVal.put("Status", "Success");
		} catch (Exception e) {
			writeOutput(2, e.toString());
			e.printStackTrace();
			file.close();
			new File(basePath + downloadPath + fileName).delete();
			new File(tempDatabaseName).delete();
			returnVal.put("Status", "Error");
		}
		returnVal.put("FileName", fileName);
		returnVal.put("Output", output);
		return returnVal;
	}

	private void exportRegistrantsCSV(String conferenceID) throws Exception {
		String query = "CREATE TABLE " + "Registrants" + " (";
		String sourceQuery=
				"SELECT person.personID, curr.email, person.firstName, person.lastName, person.middleName, person.accountNo," +
				" IF(SUM(pmt.debit),SUM(pmt.debit),0) AS TotalCharge, IF(SUM(pmt.credit),SUM(pmt.credit),0) AS TotalPaid," +
				" IF(SUM(pmt.debit),SUM(pmt.debit),0) - IF(SUM(pmt.credit),SUM(pmt.credit), 0) AS AmtDue, person.campus, curr.homePhone," +
				" reg.registrationDate," +
				" regType.label," +
				" reg.preRegistered," +
				" person.birthDate, person.yearInSchool, person.graduationDate, person.greekAffiliation, person.gender," +
				" curr.address1, curr.address2, curr.city, curr.state, curr.zip, curr.country," +
				" perm.address1 AS permanentAddress1, perm.address2 AS permanentAddress2," +
				" perm.city AS permanentCity, perm.state AS permanentState, perm.zip AS permanentZip," +
				" perm.homePhone AS permanentPhone, perm.country AS permanentCountry," +
				" IF(DERIVEDTBL.numberOfKids,DERIVEDTBL.numberOfKids, 0) AS numberOfkids, IF(person.maritalStatus,person.maritalStatus, '') AS mStatus, reg.registrationID" +
				" FROM  crs_registrationtype regType, crs_registration reg" +
				" INNER JOIN ministry_person person ON reg.fk_PersonID = person.personID" +
				" INNER JOIN ministry_newaddress curr ON person.personID = curr.fk_PersonID" +
				" INNER JOIN ministry_newaddress perm ON person.personID = perm.fk_PersonID" +
				" LEFT OUTER JOIN crs_payment pmt ON reg.registrationID = pmt.fk_RegistrationID" +
				" LEFT OUTER JOIN" +
					" (SELECT COUNT(*) AS numberOfKids, reg.registrationID FROM crs_childregistration creg" +
					" INNER JOIN crs_registration reg ON creg.fk_RegistrationID = reg.registrationID" +
					" GROUP BY creg.fk_RegistrationID, reg.registrationID)" +
				" DERIVEDTBL ON reg.registrationID = DERIVEDTBL.registrationID WHERE (reg.fk_ConferenceID = '"
				+ conferenceID
				+ "') and reg.fk_RegistrationTypeID = regType.registrationTypeID AND curr.addressType = 'current' AND perm.addressType = 'permanent'" +
						" GROUP BY person.maritalStatus, person.personID, curr.email, person.firstName, person.lastName, person.middleName, person.accountNo, person.birthDate, person.campus, person.yearInSchool, person.graduationDate, person.greekAffiliation, person.gender, curr.address1, curr.address2, curr.city, curr.state, curr.zip, curr.homePhone, curr.country, perm.address1, perm.address2, perm.city, perm.state, perm.zip, perm.homePhone, perm.country, DERIVEDTBL.numberOfKids, reg.registrationID, reg.registrationDate," +
				//" reg.registrationType," +
				" regType.label," +
				" reg.preRegistered";
		/* export all questions WRONG!!! */
		//FIXME what does this report?
		
		
		query = appendRegistrantsStandardDDL(query, sourceQuery);
		

		log.debug("Exporting Custom Question Answers");
		Hashtable<Integer, String> fieldMapping = new Hashtable<Integer, String>();

		//Alter Registrants to include customAnswers
		query = appendCustomQuestionDDL(conferenceID, query, fieldMapping);
		
		//kill trailing ", ", and finish
		query = query.substring(0, query.length() - 2);
		query += ")";
		try {
			accessStatement.execute("DROP TABLE " + "Registrants");
			log.debug("Dropped table Registrants");
		} catch (Exception e1) { 
			log.debug("Table Registrants does not already exist");
			/*
			 * We don't care if this query throws an
			 * exception, it will most of the time... when
			 * the table does not exist
			 */
		}

		log.debug("Registrants table ddl: " + query);
		accessStatement.execute(query);
		
		
		copyTable(sourceQuery, "Registrants");

		insertCustomAnswers(conferenceID, fieldMapping);
	}

	private String appendRegistrantsStandardDDL(String query, String sourceQuery) throws SQLException {
		writeOutput(1, "Exporting: " + "Registrants");
		log.debug(sourceQuery);
		ResultSet rs = sqlStatement.executeQuery("SELECT * FROM ("
				+ sourceQuery + ") A WHERE 1=2"); // WHERE 1=2 is always false,
		// so no records are actualy
		// loaded
		ResultSetMetaData rsmd = rs.getMetaData();
		query = appendAccessDDL(rsmd, query, true);
		return query;
	}

	private String appendCustomQuestionDDL(String conferenceID, String query, Hashtable<Integer, String> fieldMapping) throws SQLException {
		ResultSet rs;
		rs = sqlStatement
				.executeQuery("SELECT DISTINCT crs_questiontext.body AS question, crs_question.fk_QuestionTextID AS questionNumber, crs_registrationtype.label as RegistrationType, crs_questiontext.status "
						+ "FROM crs_registrationtype, crs_question INNER JOIN crs_questiontext ON "
						+ "crs_question.fk_QuestionTextID = crs_questiontext.questionTextID "
						+ "WHERE (crs_question.fk_RegistrationTypeID=registrationTypeID) AND (crs_question.fk_ConferenceID = "
						+ conferenceID
						+ ") AND (crs_questiontext.answerType NOT LIKE 'Divider') AND (crs_questiontext.answerType NOT LIKE 'Info')  "
						+ " AND (crs_questiontext.answerType NOT LIKE 'hide')");
		query = appendAccessDDLFromResultSet(query, fieldMapping, rs);
		rs.close();
		return query;
	}

	public synchronized Hashtable exportToAccess(String conferenceID, String region,
			String template) throws Exception {
		try {
			returnVal = new Hashtable<String, String>();
			String fileName = "Conference" + conferenceID + ".mdb";
			returnVal.put("FileName", fileName);
			copyFile(basePath + templatePath + template, basePath
					+ downloadPath + fileName);
			openDatabases(basePath + downloadPath + fileName);

			exportTable(
					"Conference",
					"SELECT conferenceID, createDate, name, theme, region, contactName, contactEmail, contactPhone, contactAddress1, contactAddress2, contactCity, contactState, contactZip, splashPageURL, confImageId, fontFace, backgroundColor, foregroundColor, highlightColor, acceptCreditCards, acceptEChecks, acceptScholarships, preRegStart, preRegEnd, defaultDateStaffArrive, defaultDateStaffLeave, onsiteCost, commuterCost, preRegDeposit, discountFullPayment, discountEarlyReg, discountEarlyRegDate, checkPayableTo FROM crs_conference WHERE conferenceID="
							+ conferenceID);

			exportTable(
					"ChildRegistration",
					"SELECT childRegistrationID, FLOOR(DATEDIFF(NOW(), birthDate)/365) AS age, firstName, lastName, gender, crs_registration.arriveDate, birthDate, crs_registration.leaveDate, inChildCare, fk_RegistrationID FROM crs_childregistration, crs_registration WHERE registrationID=fk_RegistrationID AND fk_ConferenceID="
							+ conferenceID);
			
			exportRegistrants(conferenceID);
			
			exportTable(
					"RegistrationTypes",
					"SELECT registrationTypeID, label, description, defaultDateArrive, defaultDateLeave, preRegStart, preRegEnd, singlePreRegDeposit, singleOnsiteCost, singleCommuteCost, singleDiscountFullPayment, singleDiscountEarlyReg, singleDiscountEarlyRegDate, marriedPreRegDeposit, marriedOnsiteCost, marriedCommuteCost, marriedDiscountFullPayment, marriedDiscountEarlyReg, marriedDiscountEarlyRegDate, acceptEChecks, acceptScholarships, acceptStaffAcctTransfer, acceptMinistryAcctTransfer, acceptCreditCards, askChildren, askSpouse, allowCommute, displayOrder, profileNumber, profileReqNumber, registrationType, fk_ConferenceID, acceptChecks from crs_registrationtype WHERE fk_ConferenceID = "
							+ conferenceID);
			
			exportTable(
					"Payments",
					"SELECT paymentID, '' AS bagID, paymentDate, debit, credit, type, authCode, businessUnit, operatingUnit, dept AS departmentID, project AS projectID, accountNo, crs_payment.comment, posted, postedDate, fk_RegistrationID, fk_PersonID FROM crs_payment, crs_registration WHERE registrationID=fk_RegistrationID AND fk_ConferenceID="
							+ conferenceID);
			if (!region.equals("NC")) {
				exportTable(
						"Schools",
						"SELECT DISTINCT ta.name AS schoolName, ta.state, ml.lane, ml.name AS teamName FROM ministry_locallevel ml INNER JOIN ministry_activity ma ON ml.teamID = ma.fk_teamID RIGHT OUTER JOIN ministry_targetarea ta ON ma.fk_targetAreaID = ta.TargetAreaID WHERE ta.region = '"  
								+ region
								+ "' GROUP BY ta.name, ta.state, ml.lane, ml.name");
			} else {
				exportTable(
						"Schools",
						"SELECT DISTINCT ta.name AS schoolName, ta.state, ml.lane, ml.name AS teamName FROM ministry_locallevel ml INNER JOIN ministry_activity ma ON ml.teamID = ma.fk_teamID RIGHT OUTER JOIN ministry_targetarea ta ON ma.fk_targetAreaID = ta.TargetAreaID WHERE ta.region in ('GL','GP','MA','MS','NE','NW','RR','SE','SW','UM') GROUP BY ta.name, ta.state, ml.lane, ml.name");
			}

			returnVal.put("Status", "Success");
		}
		catch (SQLException e)
		{
			log.error(e, e);
			if (e.getNextException() != null)
				log.error("Caused by:", e.getNextException());
			returnVal.put("Status", "Error");
		}
		catch (Exception e) {
			
			writeOutput(2, e.toString());
			e.printStackTrace();
			returnVal.put("Status", "Error");
		}
		finally 
		{
			closeDatabases();
		}
		returnVal.put("Output", output);
		return returnVal; //Filename of created database
	}

	private void exportRegistrants(String conferenceID) throws Exception {
		String query = "CREATE TABLE " + "Registrants" + " (";
		
		String sourceQuery = "SELECT ministry_person.personID, crs_registration.registrationID, crs_registration.registrationDate, crs_registrationtype.label AS registrationType," +
		" crs_registration.preRegistered, curr.email, ministry_person.dateCreated," +
		" ministry_person.firstName, ministry_person.lastName, ministry_person.middleName, ministry_person.birthDate, ministry_person.graduationDate," +
		" ministry_person.greekAffiliation, ministry_person.yearInSchool,  ministry_person.campus, ministry_person.gender, curr.address1," +
		" curr.address2, curr.city,  curr.state, curr.zip, curr.homePhone, curr.country," +
		" ministry_person.maritalStatus, perm.country AS permanentCountry, perm.zip AS permanentZip," +
		"  perm.city AS permanentCity, perm.address2 AS permanentAddress2, perm.address1 AS permanentAddress1,  perm.state AS permanentState," +
		" perm.homePhone AS permanentPhone, ministry_person.accountNo, crs_registration.additionalRooms, crs_registration.leaveDate," +
		" crs_registration.arriveDate, ministry_person.fk_spouseID AS spouseID, crs_registration.spouseComing," +
		" crs_registration.spouseRegistrationID, crs_registration.registeredFirst, crs_registration.isOnsite," +
		" DERIVEDTBL.numberOfKids" +
		" FROM crs_registration INNER JOIN ministry_person ON crs_registration.fk_PersonID = ministry_person.personID" +
		" INNER JOIN ministry_newaddress curr ON ministry_person.personID = curr.fk_PersonID" +
		" INNER JOIN ministry_newaddress perm ON ministry_person.personID = perm.fk_PersonID" +
		" INNER JOIN crs_registrationtype ON crs_registration.fk_RegistrationTypeID = crs_registrationtype.registrationTypeID" +
		" LEFT OUTER JOIN (SELECT COUNT(*) AS numberOfKids, crs_registration.registrationID FROM crs_childregistration" +
		" INNER JOIN crs_registration ON crs_childregistration.fk_RegistrationID = crs_registration.registrationID" +
		" GROUP BY crs_childregistration.fk_RegistrationID, crs_registration.registrationID) DERIVEDTBL" +
		" ON  crs_registration.registrationID = DERIVEDTBL.registrationID" +
		" WHERE curr.addressType = 'current' AND perm.addressType = 'permanent'" +
		" AND crs_registration.fk_ConferenceID = "
				+ conferenceID;
		

		query = appendRegistrantsStandardDDL(query, sourceQuery);
		
		query = appendRegistrantsCustomDDL(query);

		
		//Flattened custom question answers
		log.debug("Exporting Custom Question Answers");
		
		Hashtable<Integer, String> fieldMapping = new Hashtable<Integer, String>();

		query = appendCustomQuestionDDL(conferenceID, query, fieldMapping);
		
		//kill trailing ", ", and finish
		query = query.substring(0, query.length() - 2);
		query += ")";
		try {
			accessStatement.execute("DROP TABLE " + "Registrants");
			log.debug("Dropped table Registrants");
		} catch (Exception e1) { 
			log.debug("Table Registrants does not already exist");
			/*
			 * We don't care if this query throws an
			 * exception, it will most of the time... when
			 * the table does not exist
			 */
		}

		//query1 = "CREATE TABLE Registrants (personID INTEGER PRIMARY KEY, registrationID INT, registrationDate TIMESTAMP, registrationType VARCHAR(64), preRegistered VARCHAR(1), email VARCHAR(200), dateCreated TIMESTAMP, firstName VARCHAR(50), lastName VARCHAR(50), middleName VARCHAR(50), birthDate VARCHAR(25), graduationDate VARCHAR(25), greekAffiliation VARCHAR(50), yearInSchool VARCHAR(20), campus VARCHAR(128), gender VARCHAR(1), address1 VARCHAR(55), address2 VARCHAR(55), city VARCHAR(50), state VARCHAR(50), zip VARCHAR(10), homePhone VARCHAR(25), country VARCHAR(64), maritalStatus VARCHAR(20), permanentCountry VARCHAR(64), permanentZip VARCHAR(10), permanentCity VARCHAR(50), permanentAddress2 VARCHAR(55), permanentAddress1 VARCHAR(55), permanentState VARCHAR(50), permanentPhone VARCHAR(25), accountNo VARCHAR(11), additionalRooms INT, leaveDate TIMESTAMP, arriveDate TIMESTAMP, spouseID INT, spouseComing INT, spouseRegistrationID INT, registeredFirst VARCHAR(1), isOnsite VARCHAR(1), numberOfKids INT, Roommate_Preference LONGVARCHAR, Will_you_be_staying_at_the_hotel_ LONGVARCHAR, Office_Phone_U_S__Canadian_Faculty_or_Staff LONGVARCHAR, University_or_Organization_Tit_U_S__Canadian_Faculty_or_Staff LONGVARCHAR, University_or_Organization_Nam_U_S__Canadian_Faculty_or_Staff LONGVARCHAR, University_Department__Spouses_U_S__Canadian_Faculty_or_Staff LONGVARCHAR, Academic_Discipline__Spouses_a_U_S__Canadian_Faculty_or_Staff LONGVARCHAR, Do_we_have_your_permission_to__U_S__Canadian_Faculty_or_Staff LONGVARCHAR, Office_Phone_Grad_Student LONGVARCHAR, University_or_Organization_Title__e_g__Professor_Grad_Student LONGVARCHAR, University_or_Organization_Name__Spouses_and_non_Grad_Student LONGVARCHAR, University_Department__Spouses_and_non_faculty_c_Grad_Student LONGVARCHAR, Academic_Discipline__Spouses_and_non_faculty_can_Grad_Student LONGVARCHAR, Do_we_have_your_permission_to_publish_your_name__Grad_Student LONGVARCHAR, Office_Phone_Non_U_S__Canadian_Attendee LONGVARCHAR, University_or_Organization_Title___Non_U_S__Canadian_Attendee LONGVARCHAR, University_or_Organization_Name__S_Non_U_S__Canadian_Attendee LONGVARCHAR, University_Department__Spouses_and_Non_U_S__Canadian_Attendee LONGVARCHAR, Academic_Discipline__Spouses_and_n_Non_U_S__Canadian_Attendee LONGVARCHAR, Do_we_have_your_permission_to_publ_Non_U_S__Canadian_Attendee LONGVARCHAR, Office_Phone_Guest_or_Other_Attendee LONGVARCHAR, University_or_Organization_Title__e_g_Guest_or_Other_Attendee LONGVARCHAR, University_or_Organization_Name__Spou_Guest_or_Other_Attendee LONGVARCHAR, University_Department__Spouses_and_no_Guest_or_Other_Attendee LONGVARCHAR, Academic_Discipline__Spouses_and_non__Guest_or_Other_Attendee LONGVARCHAR, Do_we_have_your_permission_to_publish_Guest_or_Other_Attendee LONGVARCHAR, ConferenceID VARCHAR(10))"; //, AttendanceFlag INTEGER, NameTagNeedsPrinting BOOLEAN, Staff BOOLEAN, SpecialCase BOOLEAN, SpecialCaseInfo VARCHAR, GivenKey BOOLEAN, RoomNumber INTEGER, WSNGive BOOLEAN, WSNAmount INTEGER, WSNCode VARCHAR)";
		log.debug("Registrants table ddl: " + query);
		accessStatement.execute(query);
		
		
		copyTable(sourceQuery, "Registrants");

		insertCustomAnswers(conferenceID, fieldMapping);
	}

	private String appendRegistrantsCustomDDL(String query) {
		ResultSet rs;
		ResultSetMetaData rsmd;
		
		//Alter registrants to include Registrants_Custom fields
		try {
			rs = accessStatement
					.executeQuery("SELECT * FROM Registrants_Custom");
			rsmd = rs.getMetaData();
			query = appendAccessDDL(rsmd, query, false);
			rs.close();
			//query = query.substring(0, query.length() - 2);
			//writeOutput(5, query);
			//accessStatement.execute(query);
			writeOutput(1,
					"Appended the table Registrants_Custom to Registrants");
			//TODO: drop Registrants_Custom?
		} catch (Exception e) {
			log.info(e);
			writeOutput(
					1,
					"Registrants_Custom table not found, continuing with database creation.");
		}
		return query;
	}

	private String appendAccessDDL(ResultSetMetaData rsmd, String query1, boolean searchForIdentity) throws SQLException {
		int count = rsmd.getColumnCount();
		boolean identityFound = false;
		
		for (int i = 1; i <= count; i++) {
			String columnName = toLegalSyntax(rsmd.getColumnName(i));
			int type = rsmd.getColumnType(i);
			switch (type) {
			case -7: // boolean
				query1 += columnName + " BOOLEAN";
				break;
			case -5: // bigint???
			case 5: //smallint
			case 4: //int, the first integer found becomes the primary key
				//log.debug(rsmd.getTableName(i));
				//log.debug(rsmd.getColumnTypeName(i) + " " + rsmd.getColumnType(i));
				// tables primary key
				if (searchForIdentity && !identityFound) { //identity
					identityFound = true;
					query1 += columnName + " INTEGER PRIMARY KEY"; //Note: with hxtt driver, we can't do autoincrementing PKs
				} else
					query1 += columnName + " INTEGER";
				break;
			case 1: //char
			case 12: //varchar
				//log.debug(rsmd.getColumnTypeName(i) + " " + rsmd.getColumnType(i));
				if (rsmd.getColumnDisplaySize(i) < 256)
					query1 += columnName + " VARCHAR("
							+ rsmd.getColumnDisplaySize(i) + ")";
				else
					query1 += columnName + " LONGVARCHAR";
				break;
			case 6: //float
			case 8: //float
				query1 += columnName + " " 
				+ rsmd.getColumnTypeName(i);;
				break;
			case 93: //datetime
				//log.debug(rsmd.getColumnTypeName(i) + " " + rsmd.getColumnType(i));
				query1 += columnName + " "
						+ "TIMESTAMP";
				break;
			default:
				System.err.println("--- ERROR in SQL -->" + columnName
						+ " " + rsmd.getColumnTypeName(i) + " " + rsmd.getColumnType(i)
						+ " --> NOT HANDLED YET!");
			}
//			if (i1 != count)
			query1 += ", ";
		}
		return query1;
	}

	private String appendAccessDDLFromResultSet(String query1, Hashtable<Integer, String> fieldMapping, ResultSet rs) throws SQLException {
		int i = 0;
		while (rs.next()) {
			String fieldName = rs.getString(1).trim();
			Integer qNumber = new Integer(rs.getInt(2));
			String regType = rs.getString(3);
			String qType = rs.getString(4);

			if (fieldName.length() > 0) {
				if (fieldName.length() > 62)
					fieldName = fieldName.substring(0, 61);
				fieldName = toLegalSyntax(fieldName);
				if ("custom".equals(qType)) {
					if ((fieldName + "_" + regType).length() > 61) {
						fieldName = fieldName.substring(0, (60 - regType.length()));
					}
					regType = toLegalSyntax(regType);
					fieldName += "_" + regType;
				}
				if (query1.indexOf(fieldName) > 0) {
					fieldName += String.valueOf(++i);
				}
				if (!fieldMapping.containsKey(qNumber)) {
					fieldMapping.put(qNumber, fieldName); // Store
					// the
					// mapping
					// of
					// ID's
					// to
					// names
					query1 += fieldName + " LONGVARCHAR, ";
				}
			}
		}
		return query1;
	}
	private void insertCustomAnswers(String conferenceID, Hashtable fieldMapping) throws SQLException, Exception {
		ResultSet rs;
		//Insert customAnswers into Registrants
		// don't include "info","divider","hide" question types (if answers exist for some reason) 
		rs = sqlStatement
				.executeQuery("SELECT crs_registration.fk_PersonID, crs_question.fk_QuestionTextID, crs_answer.body FROM crs_answer INNER JOIN crs_registration ON crs_answer.fk_RegistrationID = crs_registration.registrationID INNER JOIN crs_question ON crs_answer.fk_QuestionID = crs_question.questionID INNER JOIN crs_questiontext ON crs_question.fk_QuestionTextID = crs_questiontext.questionTextID WHERE crs_registration.fk_ConferenceID = "
						+ conferenceID 
						+" AND (crs_questiontext.answerType NOT LIKE 'Divider') AND (crs_questiontext.answerType NOT LIKE 'Info') AND (crs_questiontext.answerType NOT LIKE 'hide')");
		while (rs.next()) {
			int personID = rs.getInt(1);
			Integer questionTextID= new Integer(rs.getInt(2));
			String value = rs.getString(3);
			
			String query;
			if (value.matches("Y|N|T|F")) {
				if (value.matches("Y|N"))
					value = "Y".equals(value) ? "Yes" : "No";
				if (value.matches("T|F"))
					value = "T".equals(value) ? "Yes" : "No";
			}
			if (value != null) {
				query = "UPDATE Registrants SET "
						+ fieldMapping.get(questionTextID)
						+ " = '" + escapeString(value)
						+ "' WHERE personID=" + personID;
				writeOutput(5, query);
				try {
					accessStatement.executeUpdate(query);
		        } catch (SQLException e) { 
		        	log.error(" --- ERROR inSQL -->" + query + "\n\tQuestionTextID:" + questionTextID, e);
		        	throw e;
		        }
			}
		}
		rs.close();
	}
	
	private String toLegalSyntax(String columnName) {
		columnName = columnName.replace('\n', '_').replace('[', '|')
			.replace(']', '|').replace('(', '_').replace(')', '_')
			.replace('!', ' ').replace('.', '_').replace('-', '_')
			.replace('`', '_').replace('"', '_').replace('\'', '_')
			.replace('?', '_').replace(',', '_').replace(' ', '_')
			.replace('/', '_').replace(";", "").replace(':', '_')
			.replace('#', '_').replace('&', '_').replace('\r', '_');
		return columnName;
	}

	//********************************************************************************//
	// Private functions
	//********************************************************************************//

	// Pass this function any query, and it will dump it into a new table in the
	// access database
	private void exportTable(String destinationTable, String sourceQuery)
			throws Exception {
		writeOutput(1, "Exporting: " + destinationTable);
		createTable(sourceQuery, destinationTable);
		copyTable(sourceQuery, destinationTable);
	}

	//Given a query, createTable creates a new table to accommodate the data
	private void createTable(String sourceQuery, String destinationTable)
			throws Exception {
		log.debug(sourceQuery);
		ResultSet rs = sqlStatement.executeQuery("SELECT * FROM ("
				+ sourceQuery + ") A WHERE 1=2"); // WHERE 1=2 is always false,
		// so no records are actualy
		// loaded
		String query = "CREATE TABLE " + destinationTable + " (";


		ResultSetMetaData rsmd = rs.getMetaData();
		query = appendAccessDDL(rsmd, query, true);
		//query = appendAccessDDL2(query, rsmd);
		query = query.substring(0, query.length() - 2);
		query += ")";
		try {
			accessStatement.execute("DROP TABLE " + destinationTable);
			log.debug("Dropped table " + destinationTable);
		} catch (Exception e) {
			log.debug(e);
			/*
								 * We don't care if this query throws an
								 * exception, it will most of the time... when
								 * the table does not exsist
								 */
		}
		log.debug(query);
		accessStatement.execute(query);
	}


	//Given a query, copyTable copies the data from the query to the table.
	private void copyTable(String sourceQuery, String destinationTable)
			throws Exception {
		ResultSet rsSQL = sqlStatement.executeQuery(sourceQuery);
		ResultSetMetaData rsmd = rsSQL.getMetaData();
		int colCount = rsmd.getColumnCount();

		while (rsSQL.next()) {
			String baseQuery = "INSERT INTO " + destinationTable + " (";
			String valuesQuery = ") VALUES (";

			for (int i = 1; i <= colCount; i++) {
				switch (rsmd.getColumnType(i)) {
				case -5: // bigint
				case 5: //smallint
				case 4: //int
					baseQuery += rsmd.getColumnName(i) + ", ";
					valuesQuery += rsSQL.getInt(rsmd.getColumnName(i)) + ", ";
					break;
				case 1: //char
				case 12: //varchar
					if (rsSQL.getString(i) != null) {
						baseQuery += rsmd.getColumnName(i) + ", ";
						valuesQuery += "'" + escapeString(rsSQL.getString(i))
								+ "', ";
					}
					break;
				case 6: //float
				case 8: //float
					baseQuery += rsmd.getColumnName(i) + ", ";
					valuesQuery += rsSQL.getFloat(rsmd.getColumnName(i)) + ", ";
					break;
				case 93: //datetime
					if (rsSQL.getDate(rsmd.getColumnName(i)) != null) {
						baseQuery += rsmd.getColumnName(i) + ", ";
						valuesQuery += "'"
								+ new SimpleDateFormat("MM/dd/yyyy")
										.format(rsSQL.getDate(rsmd
												.getColumnName(i))) + "', ";
					}
					break;
				default:
					System.err.println("--- ERROR -->" + rsmd.getColumnName(i)
							+ " " + rsmd.getColumnTypeName(i)
							+ " --> NOT HANDLED YET!");
				}
			}
			try {
				baseQuery = baseQuery.substring(0, baseQuery.length() - 2);
				valuesQuery = valuesQuery
						.substring(0, valuesQuery.length() - 2)
						+ ")";
				//                writeOutput(5,baseQuery + valuesQuery);
				accessStatement.executeUpdate(baseQuery + valuesQuery);
			} catch (Exception e) {
				writeOutput(2, "Exception below --- ERROR in SQL -->"
						+ baseQuery + valuesQuery);
				writeOutput(2, e.toString());
				e.printStackTrace();
			}
		}
	}



	//********************************************************************************//
	private void writeTableToFile(String sourceTable, FileWriter outputFile)
			throws Exception {
		writeOutput(1, "Writing CSV File");
		ResultSet rsSQL = accessStatement.executeQuery("Select * FROM "
				+ sourceTable);
		ResultSetMetaData rsmd = rsSQL.getMetaData();
		int colCount = rsmd.getColumnCount();
		String lineBuffer = "";
		String tempString;
		Date tempDate;

		//Write Out Header Line
		for (int i = 1; i <= colCount; i++)
			lineBuffer += rsmd.getColumnName(i) + "\",\"";
		outputFile.write("\"" + lineBuffer + "\"\n");

		//Write out Data
		while (rsSQL.next()) {
			lineBuffer = "";
			for (int i = 1; i <= colCount; i++) {
				switch (rsmd.getColumnType(i)) {
				case 93: //datetime
					tempDate = rsSQL.getDate(rsmd.getColumnName(i));
					if (tempDate != null)
						lineBuffer += new SimpleDateFormat("MM/dd/yyyy")
								.format(tempDate);
					break;
				default:
					tempString = rsSQL.getString(i);
					if (tempString != null)
						lineBuffer += escapeString(tempString);
				}
				lineBuffer += "\",\"";
			}
			outputFile.write("\"" + lineBuffer + "\"\n");
		}
	}

	
	//********************************************************************************//
	private void openDatabases(String accessFileName) throws Exception {
		writeOutput(5, "Opening up the access Database: " + accessFileName);

		//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Class.forName("com.hxtt.sql.access.AccessDriver");
		log.debug("Url: " + accessUrl + accessFileName);
		accessConn = DriverManager.getConnection(accessUrl + accessFileName);
		
		accessStatement = accessConn.createStatement();

		primaryConn = org.alt60m.util.DBConnectionFactory.getDatabaseConn();
		sqlStatement = primaryConn.createStatement();
	}

	private void closeDatabases() throws Exception {
		
		
		if (!primaryConn.isClosed()) {
			log.debug("Closing primary conneciton");
			primaryConn.close();
		}
		if (!accessConn.isClosed()) {
			log.debug("Closing access connection");
			accessConn.close();
		}

		//You would think something like this is unnecessary, but
		//it isn't.  Without it, repeated requests (for the same
		//conference) cause failures.
        com.hxtt.sql.access.AccessDriver.releaseAll();
	}

	//********************************************************************************//
	private void writeOutput(int priority, String sourceString) {
		if (priority <= verboseLevel) {
			output += sourceString + "\n";
			log.debug(sourceString);
		}
		if (priority > 4)
			log.trace(sourceString);
		
	}

	//********************************************************************************//
	private void copyFile(String sourceFile, String destinationFile)
			throws Exception {
		BufferedInputStream in = new BufferedInputStream(new FileInputStream(
				sourceFile));
		BufferedOutputStream out = new BufferedOutputStream(
				new FileOutputStream(destinationFile));
		byte[] buf = new byte[1024];
		int len;
		while ((len = in.read(buf)) >= 0) {
			out.write(buf, 0, len);
		}
		in.close();
		out.close();
	}

	private String escapeString(String inputString) throws Exception {
		int len = inputString.length();
		char sourceChar[] = inputString.toCharArray();
		char destChar[] = new char[len + 100];
		int s = 0, d = 0;
		while (s < len) {
			if (sourceChar[s] == 10 || sourceChar[s] == 13)
				sourceChar[s] = ' ';
			if (sourceChar[s] == '\'')
				destChar[d++] = '\''; 
			if (sourceChar[s] == '#')
				sourceChar[s] = ' ';
			destChar[d++] = sourceChar[s++];
		}
		return new String(destChar, 0, d);
	}

}
