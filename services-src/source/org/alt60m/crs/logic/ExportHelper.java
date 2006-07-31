package org.alt60m.crs.logic;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ExportHelper {
	private static Log log = LogFactory.getLog(ExportHelper.class);

	private static final int MAX_COLUMN_LENGTH = 62;

	public class Question {

		public String name;

		public String type;

		public Question(String name, String type) {
			this.name = name;
			this.type = type;
		}
	}

	public StringBuffer buildCustomAnswersSelectClause(ResultSet rs)
			throws SQLException {

		Map<Integer, Question> fieldMapping = buildFieldMapping(rs);
		StringBuffer customQuestionAnswersSelectClause = buildCustomQuestionAnswersSelectClause(fieldMapping);
		return customQuestionAnswersSelectClause;
	}

	public Map<Integer, Question> buildFieldMapping(ResultSet rs)
			throws SQLException {
		// map questionIds to new column names & types
		Map<Integer, Question> fieldMapping = new LinkedHashMap<Integer, Question>();

		int extension = 0;
		while (rs.next()) {
			String fieldName = toLegalSyntax(rs.getString("question").trim());
			Integer qNumber = rs.getInt("questionId");
			String answerType = rs.getString("answerType");

			if (fieldName.length() > 0) {
				if (fieldName.length() > MAX_COLUMN_LENGTH - 1)
					fieldName = fieldName.substring(0, MAX_COLUMN_LENGTH - 2);
				// simple catch; fails for some (unusual) input
				if (containsName(fieldMapping.values(), fieldName)) {
					fieldName += ++extension;
				}
				if (!fieldMapping.containsKey(qNumber)) {

					Question question = new Question(fieldName, answerType);
					fieldMapping.put(qNumber, question);
				} else {
					log
							.warn("custom questions query returned multiple questions "
									+ "with the same questionID!");
				}
			}
		}
		return fieldMapping;
	}

	public StringBuffer buildCustomQuestionAnswersSelectClause(
			Map<Integer, Question> fieldMapping) {
		StringBuffer customQuestionAnswersSelectClause = new StringBuffer();

		for (Map.Entry<Integer, Question> entry : fieldMapping.entrySet()) {
			customQuestionAnswersSelectClause
					.append(
							"(select "
									+ convertType(entry.getValue().type,
											"answer.body")
									+ " from crs_answer answer where answer.fk_questionId = ")
					.append(entry.getKey())
					.append(
							" and answer.fk_registrationId = reg.registrationId) as `")
					.append(entry.getValue().name).append("`, ");
		}
		if (customQuestionAnswersSelectClause.length() > 1) {
			// kill trailing ", "
			customQuestionAnswersSelectClause
					.setLength(customQuestionAnswersSelectClause.length() - 2);
		}
		return customQuestionAnswersSelectClause;
	}

	public boolean containsName(Collection<Question> questions, String fieldName) {
		for (Question question : questions) {
			if (question.name.equals(fieldName)) {
				return true;
			}
		}
		return false;
	}

	// could do some more exotic things like dates and shorter varchars for Y/N
	// etc,
	// but probably more hassle than it's worth.
	// The reason for shortening fields where possible is the hxtt driver can't
	// handle a large number of LONGVARCHAR fields.
	private String convertType(String questionType, String value) {
		if (questionType.equals("textL")) {
			return value;
		} else
			return "LEFT(" + value + ", 255)";
	}

	/**
	 * This is somewhat MySql dependent; remove characters that can't (or
	 * shouldn't) be in an escaped column name
	 * 
	 * @param columnName
	 * @return
	 */
	public String toLegalSyntax(String columnName) {
		columnName = columnName.replace('\n', ' ').replace('\r', ' ').replace(
				'`', '\'');
		return columnName;
	}
}
