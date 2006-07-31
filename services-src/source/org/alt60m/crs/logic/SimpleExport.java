package org.alt60m.crs.logic;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.alt60m.crs.logic.Export.Table;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Exports a simplified database structure.  It doesn't export all the information,
 * and it puts all of the registrant info into one giant table instead of splitting it up
 * into more manageable chunks.  This is helpful for smaller conferences, but not
 * so helpful for large ones.
 * 
 * @author matthew.drees
 *
 */
public class SimpleExport {

	private static Log log = LogFactory.getLog(SimpleExport.class);

	private ExportWriter exportWriter;
	private Connection connection;
	private int conferenceID;
	
	private Export export = new Export();


	private ExportHelper helper = new ExportHelper();
	
	
	/**
	 * This class is responsible for closing the db connection it is given
	 * 
	 * @param conferenceId
	 * @param connection
	 * @param exportWriter
	 * @param file
	 * @throws IOException
	 */
	public SimpleExport(int conferenceId, Connection connection, ExportWriter exportWriter, String filename) throws IOException, SQLException
	{
		this.conferenceID = conferenceId;
		this.exportWriter = exportWriter;
		exportWriter.init(filename);
		this.connection = connection;
		
	}
	
	public void export() throws SQLException, IOException
	{
		
		try {
			/* export the conference Table */
			
			String tableName;
			
			tableName = "Conference";
			log.debug("Getting data for table: " + tableName);
			exportTable(
					tableName,
					"SELECT name, conferenceID, createDate, theme, region, contactName, contactEmail, contactPhone,"
					+" contactAddress1, contactAddress2, contactCity, contactState, contactZip, splashPageURL, confImageId,"
					+" fontFace, backgroundColor, foregroundColor, highlightColor,"
					+" acceptVisa, acceptMasterCard, acceptDiscover, acceptAmericanExpress, checkPayableTo, "
					+" preRegStart, preRegEnd, masterDefaultDateArrive, masterDefaultDateLeave FROM crs_conference WHERE conferenceID="
							+ conferenceID);
			
			tableName = "RegistrationTypes";
			log.debug("Getting data for table: " + tableName);
			exportTable(
					tableName,
					"SELECT label, description,defaultDateArrive, defaultDateLeave,preRegStart, preRegEnd,"+
					"acceptCreditCards, acceptChecks, acceptEChecks, acceptMinistryAcctTransfer, acceptStaffAcctTransfer, acceptScholarships,"+
					"singlePreRegDeposit, singleOnsiteCost, singleCommuteCost, singleDiscountFullPayment,singleDiscountEarlyReg, singleDiscountEarlyRegDate," +
					"marriedPreRegDeposit, marriedOnsiteCost, marriedCommuteCost, marriedDiscountFullPayment,marriedDiscountEarlyReg, marriedDiscountEarlyRegDate,"+ 	
					"askChildren, askSpouse registrationTypeID FROM crs_registrationtype WHERE fk_conferenceID="
							+ conferenceID);
			

			tableName = "registrants";
			log.debug("Getting data for table: " + tableName);
			exportTable(tableName, buildRegistrantsQuery());


			tableName = "Payments";
			log.debug("Getting data for table: " + tableName);
			exportTable(
					tableName,
					"SELECT paymentID, '' AS bagID, paymentDate, debit, credit, type, authCode, businessUnit, operatingUnit, dept AS departmentID, project AS projectID, accountNo, crs_payment.comment, posted, postedDate, fk_RegistrationID, fk_PersonID FROM crs_payment, crs_registration WHERE registrationID=fk_RegistrationID AND fk_ConferenceID="
							+ conferenceID);
			
			
			tableName = "ChildRegistration";
			log.debug("Getting data for table: " + tableName);
			exportTable(
					tableName,
					"SELECT childRegistrationID, FLOOR(DATEDIFF(NOW(), birthDate)/365) AS age, firstName, lastName, gender, crs_registration.arriveDate, birthDate, crs_registration.leaveDate, inChildCare, fk_RegistrationID FROM crs_childregistration, crs_registration WHERE registrationID=fk_RegistrationID AND fk_ConferenceID="
							+ conferenceID);

			exportWriter.setExport(export);
			
			log.debug("Writing export"); 
			exportWriter.write();
			
			for (Table table : export.getTables())
			{
				table.getData().close();
			}
		} 
		finally {
			connection.close();
		}
		
	}
	

	private void exportTable(String name, String sourceQuery) throws SQLException
	{
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery(sourceQuery);
		
		export.add(export.new Table(name, rs));
	}

	private String buildRegistrantsQuery() throws SQLException {
		String registrantsSelectClause =
				"SELECT person.personID, curr.email, person.firstName, person.lastName, person.middleName, person.accountNo," +
				" IF(SUM(pmt.debit),SUM(pmt.debit),0) AS TotalCharge, IF(SUM(pmt.credit),SUM(pmt.credit),0) AS TotalPaid," +
				" IF(SUM(pmt.debit),SUM(pmt.debit),0) - IF(SUM(pmt.credit),SUM(pmt.credit), 0) AS AmtDue, person.campus, curr.homePhone," +
				" reg.registrationDate," +
				" regType.label," +
				" reg.preRegistered," +
				" person.birth_date, person.yearInSchool, person.graduation_date, person.greekAffiliation, person.gender," +
				" curr.address1, curr.address2, curr.city, curr.state, curr.zip, curr.country," +
				" perm.address1 AS permanentAddress1, perm.address2 AS permanentAddress2," +
				" perm.city AS permanentCity, perm.state AS permanentState, perm.zip AS permanentZip," +
				" perm.homePhone AS permanentPhone, perm.country AS permanentCountry," +
				" IF(DERIVEDTBL.numberOfKids,DERIVEDTBL.numberOfKids, 0) AS numberOfkids, IF(person.maritalStatus,person.maritalStatus, '') AS mStatus, reg.registrationID";
				
		String registrantsFromClause = " FROM  crs_registrationtype regType, crs_registration reg" +
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
						" GROUP BY person.maritalStatus, person.personID, curr.email, person.firstName, person.lastName, person.middleName, person.accountNo, person.birth_date, person.campus, person.yearInSchool, person.graduation_date, person.greekAffiliation, person.gender, curr.address1, curr.address2, curr.city, curr.state, curr.zip, curr.homePhone, curr.country, perm.address1, perm.address2, perm.city, perm.state, perm.zip, perm.homePhone, perm.country, DERIVEDTBL.numberOfKids, reg.registrationID, reg.registrationDate," +
				" regType.label," +
				" reg.preRegistered";
		
		
		//build columns for custom questions
		
		StringBuffer customQuestionAnswersSelectClause = buildCustomAnswersSelectClause();
		
		if (customQuestionAnswersSelectClause.length() > 1) {
			return registrantsSelectClause + ", "
					+ customQuestionAnswersSelectClause + registrantsFromClause;
		} else {
			return registrantsSelectClause + registrantsFromClause;
		}
	}

	private StringBuffer buildCustomAnswersSelectClause() throws SQLException {
		String customQuestionsQuery = "SELECT DISTINCT crs_questiontext.body AS question, crs_question.fk_QuestionTextID AS questionTextId, crs_questiontext.answerType, crs_registrationtype.label as RegistrationType, crs_questiontext.status, crs_question.questionId FROM crs_registrationtype, crs_question INNER JOIN crs_questiontext ON crs_question.fk_QuestionTextID = crs_questiontext.questionTextID WHERE (crs_question.fk_RegistrationTypeID=registrationTypeID) AND (crs_question.fk_ConferenceID = "
				+ conferenceID
				+ ") AND (crs_questiontext.answerType NOT LIKE 'Divider') AND (crs_questiontext.answerType NOT LIKE 'Info')  AND (crs_questiontext.answerType NOT LIKE 'hide')";

		log.debug("customQuestionsQuery: " + customQuestionsQuery);
		StringBuffer customQuestionAnswersSelectClause = new StringBuffer();
		Statement statement = null;
		ResultSet rs = null; 
		try {
			statement = connection.createStatement();
			rs = statement.executeQuery(customQuestionsQuery);
			customQuestionAnswersSelectClause = 
				helper.buildCustomAnswersSelectClause(rs);
		} finally {
			if (rs != null) {
				rs.close();	
			}
			if (statement != null) {
				statement.close();
			}
		}
		return customQuestionAnswersSelectClause;
	}

	
}
