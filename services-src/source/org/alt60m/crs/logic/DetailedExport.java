package org.alt60m.crs.logic;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.Collection;
import java.util.Vector;

import org.alt60m.crs.logic.Export.Table;
import org.alt60m.crs.model.RegistrationType;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Exports a database with more information than the SimpleExport gives. It
 * splits up custom questions into different tables. These can be joined by the
 * user (for AccessExports), if necessary.
 * 
 * @author matthew.drees
 * 
 */
public class DetailedExport {

	private static Log log = LogFactory.getLog(DetailedExport.class);

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
	public DetailedExport(int conferenceId, Connection connection,
			ExportWriter exportWriter, String filename) throws IOException,
			SQLException {
		this.conferenceID = conferenceId;
		this.exportWriter = exportWriter;
		exportWriter.init(filename);
		this.connection = connection;

	}

	@SuppressWarnings("unchecked")
	public void export(String region) throws SQLException, IOException {

		try {
			/* export the conference Table */

			String tableName;

			// build answer tables for each registrationType

			RegistrationType regTypeTemplate = new RegistrationType();
			regTypeTemplate.setConferenceID(conferenceID);
			Vector<RegistrationType> regTypes = (Vector<RegistrationType>) regTypeTemplate
					.selectList();
			for (RegistrationType regType : regTypes) {

				tableName = "CustomAnswers_" + regType.getLabel();
				log.debug("Getting data for table: " + tableName);
				exportTable(tableName, buildCustomAnswersQuery(regType));
			}

			tableName = "Conference";
			log.debug("Getting data for table: " + tableName);
			exportTable(
					tableName,
					"SELECT conferenceID, createDate, name, theme, region, contactName, contactEmail, contactPhone, contactAddress1, contactAddress2, contactCity, contactState, contactZip, splashPageURL, confImageId, fontFace, backgroundColor, foregroundColor, highlightColor, acceptCreditCards, acceptEChecks, acceptScholarships, preRegStart, preRegEnd, defaultDateStaffArrive, defaultDateStaffLeave, onsiteCost, commuterCost, preRegDeposit, discountFullPayment, discountEarlyReg, discountEarlyRegDate, checkPayableTo FROM crs_conference WHERE conferenceID="
							+ conferenceID);

			/* export the RegistrationType Table */

			tableName = "RegistrationTypes";
			log.debug("Getting data for table: " + tableName);
			exportTable(
					tableName,
					"SELECT registrationTypeID, label, description, defaultDateArrive, defaultDateLeave, preRegStart, preRegEnd, singlePreRegDeposit, singleOnsiteCost, singleCommuteCost, singleDiscountFullPayment, singleDiscountEarlyReg, singleDiscountEarlyRegDate, marriedPreRegDeposit, marriedOnsiteCost, marriedCommuteCost, marriedDiscountFullPayment, marriedDiscountEarlyReg, marriedDiscountEarlyRegDate, acceptEChecks, acceptScholarships, acceptStaffAcctTransfer, acceptMinistryAcctTransfer, acceptCreditCards, askChildren, askSpouse, allowCommute, displayOrder, profileNumber, profileReqNumber, registrationType, fk_ConferenceID, acceptChecks from crs_registrationtype WHERE fk_ConferenceID = "
							+ conferenceID);

			tableName = "Registrants";
			log.debug("Getting data for table: " + tableName);
			String query = 					"SELECT crs_registration.registrationID, ministry_person.personID, crs_registration.registrationDate, crs_registrationtype.label AS registrationType,"
				+ " crs_registration.preRegistered, curr.email, ministry_person.dateCreated,"
				+ " ministry_person.firstName, ministry_person.lastName, ministry_person.middleName, ministry_person.birth_date as birthDate, ministry_person.graduation_date as graduationDate,"
				+ " ministry_person.greekAffiliation, ministry_person.yearInSchool,  ministry_person.campus, ministry_person.gender, curr.address1,"
				+ " curr.address2, curr.city,  curr.state, curr.zip, curr.homePhone, curr.country,"
				+ " ministry_person.maritalStatus, perm.country AS permanentCountry, perm.zip AS permanentZip,"
				+ "  perm.city AS permanentCity, perm.address2 AS permanentAddress2, perm.address1 AS permanentAddress1,  perm.state AS permanentState,"
				+ " perm.homePhone AS permanentPhone, ministry_person.accountNo, crs_registration.additionalRooms, crs_registration.leaveDate,"
				+ " crs_registration.arriveDate, ministry_person.fk_spouseID AS spouseID, crs_registration.spouseComing,"
				+ " crs_registration.spouseRegistrationID, crs_registration.registeredFirst, crs_registration.isOnsite,"
				+ " DERIVEDTBL.numberOfKids, 0 as AttendanceFlag, true as NameTagNeedsPrinting, " 
				+ " 0 as RoomNumber, false as `Walk-In`, " 
				+ " if(crs_answer.body = 'N', 'No', 'Yes') as `Will you be staying at the hotel_`"
				+ " FROM crs_registration INNER JOIN ministry_person ON crs_registration.fk_PersonID = ministry_person.personID"
				+ " INNER JOIN ministry_newaddress curr ON ministry_person.personID = curr.fk_PersonID"
				+ " INNER JOIN ministry_newaddress perm ON ministry_person.personID = perm.fk_PersonID"
				+ " INNER JOIN crs_registrationtype ON crs_registration.fk_RegistrationTypeID = crs_registrationtype.registrationTypeID"
				+ " LEFT OUTER JOIN (SELECT COUNT(*) AS numberOfKids, crs_registration.registrationID FROM crs_childregistration"
				+ " INNER JOIN crs_registration ON crs_childregistration.fk_RegistrationID = crs_registration.registrationID"
				+ " GROUP BY crs_childregistration.fk_RegistrationID, crs_registration.registrationID) DERIVEDTBL"
				+ " ON  crs_registration.registrationID = DERIVEDTBL.registrationID"
				+ " LEFT OUTER JOIN crs_question on (crs_question.fk_registrationTypeID = crs_registration.fk_registrationTypeID and crs_question.fk_questionTextId = 2) " 
				+ " LEFT OUTER JOIN crs_answer on (crs_answer.fk_registrationID = crs_registration.registrationID  and crs_answer.fk_questionID = crs_question.questionID) "
				+ " WHERE curr.addressType = 'current' AND perm.addressType = 'permanent'"
				+ " AND crs_registration.fk_ConferenceID = "
				+ conferenceID;
			Collection<String> booleanColumns = Arrays.asList(
					new String[]{"NameTagNeedsPrinting", "Walk-In"});
			exportTable(
					tableName, query, booleanColumns);

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

			tableName = "Schools";
			log.debug("Getting data for table: " + tableName);
			if (!region.equals("NC")) {
				exportTable(
						tableName,
						"SELECT DISTINCT ta.name AS schoolName, ta.state, ml.lane, ml.name AS teamName FROM ministry_locallevel ml INNER JOIN ministry_activity ma ON ml.teamID = ma.fk_teamID RIGHT OUTER JOIN ministry_targetarea ta ON ma.fk_targetAreaID = ta.TargetAreaID WHERE ta.region = '"
								+ region
								+ "' GROUP BY ta.name, ta.state, ml.lane, ml.name");
			} else {
				exportTable(
						tableName,
						"SELECT DISTINCT ta.name AS schoolName, ta.state, ml.lane, ml.name AS teamName FROM ministry_locallevel ml INNER JOIN ministry_activity ma ON ml.teamID = ma.fk_teamID RIGHT OUTER JOIN ministry_targetarea ta ON ma.fk_targetAreaID = ta.TargetAreaID WHERE ta.region in ('GL','GP','MA','MS','NE','NW','RR','SE','SW','UM') GROUP BY ta.name, ta.state, ml.lane, ml.name");
			}

			exportWriter.setExport(export);

			log.debug("Writing export");
			exportWriter.write();

			for (Table table : export.getTables()) {
				table.getData().close();
			}
		} finally {
			connection.close();
		}

	}

	private void exportTable(String tableName, String query,
			Collection<String> booleanColumns) throws SQLException {
		log.debug("exporting data from query: " + query);
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery(query);

		Table table = export.new Table(tableName, rs);
		if (booleanColumns != null) {
			table.setColumnsAsBoolean(booleanColumns);
		}
		export.add(table);
	}

	private void exportTable(String name, String sourceQuery)
			throws SQLException {
		exportTable(name, sourceQuery, null);
	}

	private String buildCustomAnswersQuery(RegistrationType regType)
			throws SQLException {

		String registrantsSelectClause = "select reg.registrationID";

		String registrantsFromClause = " FROM crs_registration reg where reg.fk_conferenceID = "
				+ conferenceID
				+ " AND reg.fk_registrationTypeID = "
				+ regType.getRegistrationTypeID();

		String customQuestionsQuery = "SELECT DISTINCT crs_questiontext.body AS question, crs_question.fk_QuestionTextID AS questionTextId, crs_questiontext.answerType, crs_questiontext.status, crs_question.questionId FROM crs_registrationtype, crs_question INNER JOIN crs_questiontext ON crs_question.fk_QuestionTextID = crs_questiontext.questionTextID WHERE (crs_question.fk_RegistrationTypeID = crs_registrationtype.registrationTypeID) AND (crs_question.fk_ConferenceID = "
				+ conferenceID
				+ ") AND (crs_registrationtype.label = '"
				+ regType.getLabel()
				+ "') AND (crs_questiontext.answerType NOT LIKE 'Divider') AND (crs_questiontext.answerType NOT LIKE 'Info')  AND (crs_questiontext.answerType NOT LIKE 'hide')";

		log.debug("customQuestionsQuery: " + customQuestionsQuery);
		StringBuffer customQuestionAnswersSelectClause = new StringBuffer();
		Statement statement = null;
		ResultSet rs = null;
		try {
			statement = connection.createStatement();
			rs = statement.executeQuery(customQuestionsQuery);
			customQuestionAnswersSelectClause = helper
					.buildCustomAnswersSelectClause(rs);
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (statement != null) {
				statement.close();
			}
		}

		if (customQuestionAnswersSelectClause.length() > 1) {
			return registrantsSelectClause + ", "
					+ customQuestionAnswersSelectClause + registrantsFromClause;
		} else {
			return registrantsSelectClause + registrantsFromClause;
		}
	}

}
