package org.alt60m.wsn.sp.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class Answer extends DBIOEntity {
	// IDENTITY
	private int answerID;

	private int fk_WsnApplicationID = 0;

	private int fk_QuestionID;

	private String body = "";

	public Answer() {
	}

	public void localinit() throws DBIOEntityException {
		String table = "wsn_sp_Answer";
		setMetadata("AnswerID", "answerID", "IDENTITY");

		setMetadata("QuestionID", "fk_QuestionID", "KEY");
		
		// TODO: modify for project
		setMetadata("fk_WsnApplicationID", "fk_WsnApplicationID", "KEY");
		
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

	public int getfk_WsnApplicationID() {
		return fk_WsnApplicationID;
	}

	public void setfk_WsnApplicationID(int personID) {
		this.fk_WsnApplicationID = personID;
	}

	public WsnApplication getWsnApplication() {
		WsnApplication p = new WsnApplication();
		p.setWsnApplicationID(fk_WsnApplicationID);
		p.select();
		return p;
	}

	public void setWsnApplication(WsnApplication p) {
		fk_WsnApplicationID = p.getWsnApplicationIdInt();
	}
}