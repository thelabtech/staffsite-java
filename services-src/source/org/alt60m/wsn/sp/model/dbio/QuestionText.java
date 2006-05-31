package org.alt60m.wsn.sp.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.log.*;
import com.kenburcham.framework.system.*;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;

public class QuestionText extends DBIOEntity {

	//public static SystemLog log = (SystemLog) SystemManager
	//		.getLog(Merchandise.class.getName());

	// IDENTITY
	private int questionTextID;

	private String body = "";

	private String answerType = "";

	static public String[] answerTypes = { "divider", "info", "YN", "checkbox",
			"radio10", "date", "shirt", "textXS", "textS", "textM", "textL",
			"customD" };

	static public String[] answerTypeNames = { "Section Divider",
			"Section Info", "Yes or No", "Check Box", "1-10", "Date",
			"T-shirt Size", "Single Character", " Small Text", "Medium Text",
			"Paragraph","Custom Dropdown" };

	private String status = "";

	static public String[] statuss = { "common", "custom" };

	static public String[] statusNames = { "Common", "Custom" };

	public QuestionText() {
	}

	public void localinit() throws DBIOEntityException {
		String table = "wsn_sp_questiontext";
		setMetadata("QuestionTextID", "questionTextID", "IDENTITY");

		//For QuestionText
		setMetadata("Body", "body", table);
		setMetadata("AnswerType", "answerType", table);
		setMetadata("Status", "status", table);

		setAutodetectProperties(false);
	}

	public boolean isPKEmpty() {
		return questionTextID == 0;
	}

	public int getQuestionTextID() {
		return questionTextID;
	}

	public void setQuestionTextID(int questionTextID) {
		this.questionTextID = questionTextID;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getAnswerType() {
		return answerType;
	}

	public void setAnswerType(String answerType) {
		this.answerType = answerType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Vector getQuestions() {
		Question q = new Question();
		q.setQuestionTextID(questionTextID);
		return q.selectList();
	}

	public Vector getQuestions(String orderField, boolean DESC) {
		Question q = new Question();
		return q.selectList("fk_QuestionTextID = '" + questionTextID
				+ "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}

	public void assocQuestion(Question q) {
		q.setQuestionTextID(questionTextID);
		q.update();
	}

	public void dissocQuestion(Question q) {
		q.setQuestionTextID(0);
		q.update();
	}
}