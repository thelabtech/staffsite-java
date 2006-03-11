package org.alt60m.crs.model;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.log.*;
import com.kenburcham.framework.system.*;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class CustomQuestion extends DBIOEntity {

	public static SystemLog log = (SystemLog) SystemManager
			.getLog(CustomQuestion.class.getName());

	// IDENTITY
	private int customQuestionID;

	// KEY
	private int fk_ConferenceID;

	private String required = "";

	private String editable = "";

	private String question = "";

	private String answerType = "";

	private int questionNumber = 0;

	public CustomQuestion() {
	}

	public void localinit() throws DBIOEntityException {
		String table = "crs_CRSCustomQuestion";
		setMetadata("CustomQuestionID", "customQuestionID", "IDENTITY");

		setMetadata("ConferenceID", "fk_ConferenceID", "KEY");

		setMetadata("QuestionNumber", "questionNumber", table);
		setMetadata("Question", "question", table);
		setMetadata("AnswerType", "answerType", table);
		setMetadata("RequiredString", "required", table);
		setMetadata("EditableString", "editable", table);

		setAutodetectProperties(false);
	}

	public boolean isPKEmpty() {
		return getCustomQuestionID() == 0;
	}

	public int getCustomQuestionID() {
		return customQuestionID;
	}

	public void setCustomQuestionID(int customQuestionID) {
		this.customQuestionID = customQuestionID;
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

	public boolean getEditable() {
		return editable != null && editable.equals("T");
	}

	public void setEditable(boolean editable) {
		this.editable = editable ? "T" : "F";
	}

	public String getEditableString() {
		return editable;
	}

	public void setEditableString(String editable) {
		this.editable = editable;
	}

	public String getQuestion() {
		return this.question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswerType() {
		return this.answerType;
	}

	public void setAnswerType(String answerType) {
		this.answerType = answerType;
	}

	public int getQuestionNumber() {
		return questionNumber;
	}

	public void setQuestionNumber(int questionNumber) {
		this.questionNumber = questionNumber;
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
}