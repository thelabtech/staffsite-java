package org.alt60m.crs.model;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.log.*;
import com.kenburcham.framework.system.*;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;

public class Question extends DBIOEntity {

	public static SystemLog log = (SystemLog) SystemManager
			.getLog(Merchandise.class.getName());

	// IDENTITY
	private int questionID;

	// KEY
	private int fk_ConferenceID = 0;

	private int fk_QuestionTextID = 0;

	private int fk_RegistrationTypeID = 0;

	private String required = "";

	private String registrationType = "";		/* to be deprecated gdw 20040918 */

	private int displayOrder = 0;

	private QuestionText questionText = new QuestionText();

	public Question() {
	}

	public void localinit() throws DBIOEntityException {
		String table = "crs_viewQuestion";
		setMetadata("QuestionID", "questionID", "IDENTITY");

		setMetadata("ConferenceID", "fk_ConferenceID", "KEY");
		setMetadata("QuestionTextID", "fk_QuestionTextID", "KEY");
		setMetadata("RegistrationTypeID", "fk_RegistrationTypeID", "KEY");

		setMetadata("RequiredString", "required", table);
//		setMetadata("RegistrationType", "registrationType", table);	/* to be deprecated gdw 20040918 */
		setMetadata("DisplayOrder", "displayOrder", table);

		//For QuestionText
		setMetadata("Body", "body", table);
		setMetadata("AnswerType", "answerType", table);
		setMetadata("Status", "status", table);

		setAutodetectProperties(false);
	}

	public boolean isPKEmpty() {
		return questionID == 0;
	}

	public int getQuestionID() {
		return questionID;
	}

	public void setQuestionID(int questionID) {
		this.questionID = questionID;
	}

	public boolean getRequired() {
		return required != null && required.equals("T");
	}

	public void setRequired(boolean required) {
		this.required = required ? "T" : "F";
	}

	public String getRequiredString() {
		return required;
	}

	public void setRequiredString(String required) {
		this.required = required;
	}

	public int getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}

	public String getBody() {
		return questionText.getBody();
	}

	public void setBody(String body) {
		questionText.setBody(body);
	}

	public String getAnswerType() {
		return questionText.getAnswerType();
	}

	public void setAnswerType(String answerType) {
		questionText.setAnswerType(answerType);
	}

	public String getStatus() {
		return questionText.getStatus();
	}

	public void setStatus(String status) {
		questionText.setStatus(status);
	}

	public int getQuestionTextID() {
		return fk_QuestionTextID;
	}

	public void setQuestionTextID(int questionTextID) {
		this.fk_QuestionTextID = questionTextID;
		questionText.setQuestionTextID(questionTextID);
	}

	public QuestionText getQuestionText() {
		return questionText;
	}

	public void setQuestionText(QuestionText qt) {
		fk_QuestionTextID = qt.getQuestionTextID();
		questionText = qt;
	}

	public int getConferenceID() {
		return fk_ConferenceID;
	}

	public void setConferenceID(int conferenceID) {
		this.fk_ConferenceID = conferenceID;
	}

	public Conference getConference() {
		Conference c = new Conference();
		c.setConferenceID(fk_ConferenceID);
		c.select();
		return c;
	}

	public void setConference(Conference c) {
		fk_ConferenceID = c.getConferenceID();
	}

	//RegistrationType
	public int getRegistrationTypeID() {
		return fk_RegistrationTypeID;
	}

	public void setRegistrationTypeID(int registrationTypeID) {
		this.fk_RegistrationTypeID = registrationTypeID;
	}

	public void setRegistrationTypeID(String registrationTypeID) {
		if (registrationTypeID != null && !"".equals(registrationTypeID)) {
			this.fk_RegistrationTypeID = Integer.parseInt(registrationTypeID);
		}
	}

	public RegistrationType getRegistrationType() {
		RegistrationType r = new RegistrationType();
		r.setRegistrationTypeID(fk_RegistrationTypeID);
		r.select();
		return r;
	}

	public void setRegistrationType(RegistrationType r) {
		fk_RegistrationTypeID = r.getRegistrationTypeID();
	}

/*
	public String getRegistrationType() {
		return registrationType;
	}

	public void setRegistrationType(String rt) {
		this.registrationType = rt;
	}
*/
	public Vector getAnswers() {
		Answer a = new Answer();
		a.setQuestionID(questionID);
		return a.selectList();
	}

	public Vector getAnswers(String orderField, boolean DESC) {
		Answer a = new Answer();
		return a.selectList("fk_QuestionID = '" + questionID + "' ORDER BY "
				+ orderField + " " + (DESC ? "DESC" : "ASC"));
	}

	public void assocAnswer(Answer a) {
		a.setQuestionID(questionID);
		a.update();
	}

	public void dissocAnswer(Answer a) {
		a.setQuestionID(0);
		a.update();
	}

	public boolean persist() {
		return isPKEmpty() ? insert() : update();
	}

	public boolean insert() {
		try {
			clearMetadata();
			String table = "crs_Question";

			setMetadata("QuestionID", "questionID", "IDENTITY");

			setMetadata("ConferenceID", "fk_ConferenceID", table);
			setMetadata("QuestionTextID", "fk_QuestionTextID", table);
			setMetadata("RegistrationTypeID", "fk_RegistrationTypeID", table);

			setMetadata("RequiredString", "required", table);
//			setMetadata("RegistrationType", "registrationType", table);
			setMetadata("DisplayOrder", "displayOrder", table);

			boolean retval = super.insert();

			clearMetadata();

			localinit();

			return retval;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean update() {
		try {
			clearMetadata();
			String table = "crs_Question";

			setMetadata("QuestionID", "questionID", "IDENTITY");

			setMetadata("ConferenceID", "fk_ConferenceID", table);
			setMetadata("QuestionTextID", "fk_QuestionTextID", table);
			setMetadata("RegistrationTypeID", "fk_RegistrationTypeID", table);
			
			setMetadata("RequiredString", "required", table);
//			setMetadata("RegistrationType", "registrationType", table);
			setMetadata("DisplayOrder", "displayOrder", table);

			boolean retval = super.update();

			clearMetadata();

			localinit();

			return retval;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean delete() {
		try {
			clearMetadata();
			String table = "crs_Question";

			setMetadata("QuestionID", "questionID", "IDENTITY");

			setMetadata("ConferenceID", "fk_ConferenceID", table);
			setMetadata("QuestionTextID", "fk_QuestionTextID", table);
			setMetadata("RegistrationTypeID", "fk_RegistrationTypeID", table);
			
			setMetadata("RequiredString", "required", table);
//			setMetadata("RegistrationType", "registrationType", table);
			setMetadata("DisplayOrder", "displayOrder", table);

			boolean retval = super.delete();

			clearMetadata();

			localinit();

			return retval;
		} catch (Exception e) {
			return false;
		}
	}
}
