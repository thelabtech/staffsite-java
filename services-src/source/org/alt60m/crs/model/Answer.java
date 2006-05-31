package org.alt60m.crs.model;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class Answer extends DBIOEntity {
	// IDENTITY
	private int answerID;

	private int fk_RegistrationID;

	private int fk_QuestionID;

	private String body = "";

	public Answer() {
	}

	public void localinit() throws DBIOEntityException {
		String table = "crs_answer";
		setMetadata("AnswerID", "answerID", "IDENTITY");

		setMetadata("QuestionID", "fk_QuestionID", "KEY");
		setMetadata("RegistrationID", "fk_RegistrationID", "KEY");
		setMetadata("Body", "body", table);

		setAutodetectProperties(false);
	}

	public boolean isPKEmpty() {
		return answerID == 0;
	}

	public int getAnswerID() {
		return answerID;
	}

	public void setAnswerID(int answerID) {
		this.answerID = answerID;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public int getQuestionID() {
		return fk_QuestionID;
	}

	public void setQuestionID(int questionID) {
		this.fk_QuestionID = questionID;
	}

	public Question getQuestion() {
		Question q = new Question();
		q.setQuestionID(fk_QuestionID);
		q.select();
		return q;
	}

	public void setQuestion(Question q) {
		fk_QuestionID = q.getQuestionID();
	}

	public int getRegistrationID() {
		return fk_RegistrationID;
	}

	public void setRegistrationID(int registrationID) {
		this.fk_RegistrationID = registrationID;
	}

	public Registration getRegistration() {
		Registration r = new Registration();
		r.setRegistrationID(fk_RegistrationID);
		r.select();
		return r;
	}

	public void setRegistration(Registration r) {
		fk_RegistrationID = r.getRegistrationID();
	}
}