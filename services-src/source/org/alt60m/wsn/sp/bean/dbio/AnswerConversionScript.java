package org.alt60m.wsn.sp.bean.dbio;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.BatchUpdateException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.BasicConfigurator;

import com.mysql.jdbc.Driver;
public class AnswerConversionScript {

	/**
	 * @param args
	 *   0 - "application" "spiritualReference" "peerReference" or "checkAppRows"
	 *   1 - mapping directory
	 *   
	 *   mapping info in controlled-src/utilities-src/migrateOldSpAnswers/
	 */
	
	private Connection connection;
	
	static {
		BasicConfigurator.configure();
	}
	private static Log log = LogFactory.getLog(AnswerConversionScript.class);
	
	
	
	private String task;
	private String mappingDir;
	
	public static void main(String[] args) {
		AnswerConversionScript acs = new AnswerConversionScript();
		if (args.length < 2) {
			throw new IllegalArgumentException("Must have 2 arguments: task, and mappingDir");
		}
		acs.task = args[0];
		acs.mappingDir = args[1];
		acs.runScript();
	}

	private void runScript() {
		log.debug("Starting script at " + new Date());
		try {
			connection = getConnection("jdbc:mysql://Hart-a051:3306/prod", "istprod", "w5u#AGa");
			if (task.equals("application")) {
				importApplicationAnswers();
			} else if (task.equals("references")) {
				importReferences();
			} else if (task.equals("spiritualReference")){
				importSpiritualReferenceAnswers();
			} else if (task.equals("peerReference")) {
				importPeerReferenceAnswers();
			} else if (task.equals("checkAppRows"))	{
				checkAppRows();
			} else {
				throw new IllegalArgumentException("First argument must be application, leaderReference, or peerReference");
			}
		}
		catch (Exception e) {
			log.error(e,e);
		}
		finally {
			if (connection != null) {
				try {
					connection.close();
					connection = null;
				} catch (SQLException e) {
					log.error("Exception closing connection! ", e);
				}
			}
		}
		log.debug("Finishing script");
	}
	
	private Connection getConnection(String url, String username, String password) throws SQLException {
		log.debug("getting connection...");
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			log.error("exception loading driver", e);
			throw new RuntimeException("exception loading driver", e);
		}
		Connection con = DriverManager.getConnection(url, username, password);
		log.debug("Done");
		return con;
	}

	
	private void checkAppRows() throws IOException, SQLException {
		log.debug("checking application rows");
		Set<Integer> oldAppIds = new HashSet<Integer>();
		Set<Integer> newAppIds = new HashSet<Integer>();
		
		log.debug("executing old app query");
		ResultSet oldApp = connection.createStatement().executeQuery("select * from wsn_sp_wsnapplication");
		log.debug("iterating..."); 
		while (oldApp.next()){
			oldAppIds.add(oldApp.getInt("wsnapplicationid"));
		}

		log.debug("executing new app query");
		ResultSet newApp = connection.createStatement().executeQuery("select * from sp_applications where old_id is not null");
		log.debug("iterating..."); 
		while (newApp.next()){
			newAppIds.add(newApp.getInt("old_id"));
		}
		log.debug("computing differences");
		Set<Integer> notInOld = new HashSet<Integer>(newAppIds);
		notInOld.removeAll(oldAppIds);

		Set<Integer> notInNew = new HashSet<Integer>(oldAppIds);
		notInNew.removeAll(newAppIds);
		
		log.info("Not in old: " + notInOld);
		log.info("Not in new: " + notInNew);
		
	}
	
	private void importReferences() throws IOException, SQLException {
		log.debug("Importing references");
		
		
		Map<String, String> typeMap = new HashMap<String, String>();
		typeMap.put("P", "SpPeerReference");
		typeMap.put("S1", "SpSpiritualReference1");
		typeMap.put("S2", "SpSpiritualReference2");
		
		Map<String, String> statusMap = new HashMap<String, String>();
		statusMap.put("N", "created");
		statusMap.put("I", "started");
		statusMap.put("D", "completed");
		
		Map<String, String> columnMap = new TreeMap<String, String>();
		columnMap.put("application_id", "id");
		columnMap.put("type", "referenceType");
		columnMap.put("title", "title");
		columnMap.put("is_staff", "isStaff");
		columnMap.put("first_name", "firstName");
		columnMap.put("last_name", "lastName");
		columnMap.put("accountNo", "staffNumber");
		columnMap.put("home_phone", "homePhone");
		columnMap.put("email", "currentEmail");
		columnMap.put("status", "formWorkflowStatus");
		columnMap.put("submitted_at", "formSubmittedDate");
		columnMap.put("created_at", "createDate");
		columnMap.put("updated_at", "lastChangedDate");
		
		Map<String, Map<String, String>> columnToValueMapMapping = new HashMap<String, Map<String, String>>();
		columnToValueMapMapping.put("type", typeMap);
		columnToValueMapMapping.put("status", statusMap);
		
		StringBuffer insertCommandSql = new StringBuffer("insert into sp_references (");
		StringBuffer placeHolders = new StringBuffer();
		for (String key : columnMap.keySet()) {
			insertCommandSql.append(key + ", ");
			placeHolders.append("?, ");
		}
		insertCommandSql.setLength(insertCommandSql.length() - 2);
		placeHolders.setLength(placeHolders.length() - 2);
		insertCommandSql.append(") values (").append(placeHolders).append(")");
		PreparedStatement insertCommand = connection.prepareStatement(insertCommandSql.toString());

		ResultSet oldRef = connection.createStatement().executeQuery("select newApp.id, ref.* from wsn_sp_reference ref join wsn_sp_wsnapplication app on (ref.fk_WsnApplicationID = app.WsnApplicationId) join sp_applications newApp on (app.WsnApplicationId = newApp.old_id) left outer join sp_references newRef on (newRef.application_id = newApp.id) where newRef.id is null");

		int rowCount = 0;
		int displayInterval = 1;
		int executeInterval = 500;
		while (oldRef.next()) {
			rowCount++;
			if (rowCount % displayInterval == 0) {
				log.info("processing row " + rowCount);			
				if (Math.log10(rowCount) >= (Math.log10(displayInterval) + 1)) {
					displayInterval *= 10;
				}
			}
			
			int counter = 1;
			for (String key : columnMap.keySet()) {
				Object oldAnswer = oldRef.getObject(columnMap.get(key));
				Object newAnswer;
				Map<String, String> map = columnToValueMapMapping.get(key);
				if (map != null) {
					newAnswer = map.get(oldAnswer);
				} else {
					newAnswer = oldAnswer;
				}
				insertCommand.setObject(counter, newAnswer);
				counter++;
			}
			insertCommand.addBatch();
			insertCommand.clearParameters();
			
			if (rowCount % executeInterval == 0) {
				executeBulkInsert(insertCommand);
			}
		}
		if (rowCount % executeInterval != 0) { //otherwise, we hit it in the last loop
			executeBulkInsert(insertCommand);
		}
		
		insertCommand.close();
		oldRef.close();
	}

	private void executeBulkInsert(PreparedStatement insertCommand) throws SQLException {
		try {
			int[] results = insertCommand.executeBatch();
		} catch (BatchUpdateException e) {
			int[] results = e.getUpdateCounts();
			log.error("Error executing batch commands; " + results.length + " commands executed.", e);
		}
		insertCommand.clearBatch();
	}
	
	private void importSpiritualReferenceAnswers() throws IOException, SQLException {
		log.debug("Importing spiritual reference answers");
		String valueMappingFilename = "/answerValues.tab";
	
		Map<String, Map<String, String>> allValueMappings = readValueMappings(valueMappingFilename);

		
		String columnMappingFilename = "/spiritualRefAnswerColumns.tab";
		Map<String, Map<String, String>> answerToValueMapMapping = new HashMap<String, Map<String, String>>(); 

		Map<String, String> columnMapping = readColumnMappings(allValueMappings, columnMappingFilename, answerToValueMapMapping);

		log.debug("querying old spiritual references");
		ResultSet oldRef = connection.createStatement().executeQuery("select app.wsnapplicationid as old_id, ref.* from wsn_sp_reference ref join wsn_sp_wsnapplication app on (ref.fk_wsnapplicationID = app.wsnapplicationid) where (ref.referenceType = 'S1' or ref.referenceType = 'S2') order by app.wsnapplicationid, referenceType");
		log.debug("querying new spiritual references");
		ResultSet newRef = connection.createStatement().executeQuery("select app.old_id, ref.* from sp_references ref join sp_applications app on (ref.application_id = app.id) where app.old_id is not null and (ref.type = 'SpSpiritualReference1' or ref.type = 'SpSpiritualReference2') order by cast(old_id as signed), ref.type");

		insertAnswersFromQuery(answerToValueMapMapping, columnMapping, oldRef, newRef);
		
		oldRef.close();
		newRef.close();
	}
	
	private void importPeerReferenceAnswers() throws IOException, SQLException {
		log.debug("Importing peer reference answers");
		String valueMappingFilename = "/answerValues.tab";
	
		Map<String, Map<String, String>> allValueMappings = readValueMappings(valueMappingFilename);

		
		String columnMappingFilename = "/peerRefAnswerColumns.tab";
		Map<String, Map<String, String>> answerToValueMapMapping = new HashMap<String, Map<String, String>>(); 

		Map<String, String> columnMapping = readColumnMappings(allValueMappings, columnMappingFilename, answerToValueMapMapping);

		log.debug("querying old peer references");
		ResultSet oldApp = connection.createStatement().executeQuery("select app.wsnapplicationid as old_id, ref.* from wsn_sp_reference ref join wsn_sp_wsnapplication app on (ref.fk_wsnapplicationID = app.wsnapplicationid) where (ref.referenceType = 'P') order by app.wsnapplicationid, referenceType");
		log.debug("querying new peer references");
		ResultSet newApp = connection.createStatement().executeQuery("select app.old_id, ref.* from sp_references ref join sp_applications app on (ref.application_id = app.id) where app.old_id is not null and (ref.type = 'SpPeerReference') order by cast(old_id as signed), ref.type");

		insertAnswersFromQuery(answerToValueMapMapping, columnMapping, oldApp, newApp);
		
		oldApp.close();
		newApp.close();
	}
	
	
	private void importApplicationAnswers() throws IOException, SQLException {
		log.debug("Importing Application Answers");
		
		String valueMappingFilename = "/answerValues.tab";
	
		Map<String, Map<String, String>> allValueMappings = readValueMappings(valueMappingFilename);

		
		String columnMappingFilename = "/appAnswerColumns.tab";
		Map<String, Map<String, String>> answerToValueMapMapping = new HashMap<String, Map<String, String>>(); 

		Map<String, String> columnMapping = readColumnMappings(allValueMappings, columnMappingFilename, answerToValueMapMapping);
		
		log.debug("querying old applications");
		ResultSet oldApp = connection.createStatement().executeQuery("select app.wsnapplicationId as old_id, app.* from wsn_sp_wsnapplication app order by old_id");
		log.debug("querying new applications");
		ResultSet newApp = connection.createStatement().executeQuery("select app.* from sp_applications app where old_id is not null order by cast(old_id as signed)");

		insertAnswersFromQuery(answerToValueMapMapping, columnMapping, oldApp, newApp);
		
		oldApp.close();
		newApp.close();
		
	}

	/**
	 * oldApp and newApp queries must align - oldApp must contain a column "old_id" that matches "old_id" in newApp
	 * @param answerToValueMapMapping
	 * @param columnMapping
	 * @param oldApp
	 * @param newApp
	 * @throws SQLException
	 */
	private void insertAnswersFromQuery(Map<String, Map<String, String>> answerToValueMapMapping, Map<String, String> columnMapping, ResultSet oldApp, ResultSet newApp) throws SQLException {
		PreparedStatement insertStatement = connection.prepareStatement("insert into sp_answers (question_id, instance_id, answer) values (?,?,?)");
		
		log.debug("iterating through results");
		int rowCount = 0;
		int displayInterval = 1;
		while (newApp.next()){
			rowCount++;
			
			if (rowCount % displayInterval == 0) {
				log.info("processing row " + rowCount);			
				if (Math.log10(rowCount) >= (Math.log10(displayInterval) + 1)) {
					displayInterval *= 10;
				}

			}
			
			int newId = newApp.getInt("id");
			int oldId = newApp.getInt("old_id");
			
			int oldAppId;
			if (!oldApp.next()) {
				throw new RuntimeException(
						"old query returned fewer results than new query!");
			} else {
				oldAppId = oldApp.getInt("old_id");
			}
			
			if (oldAppId != oldId) {
				throw new RuntimeException("old and new queries do not match; old_id: " + oldId + "; oldAppId: " + oldAppId);
			} else {
				List<String> valuesList = new ArrayList<String>();
				for (String answerID : columnMapping.keySet()) {
					String oldColumnName = columnMapping.get(answerID);
					if (!oldColumnName.equals("")) {
						Object oldAnswerObject = oldApp
								.getObject(oldColumnName);
						if (oldAnswerObject != null) {
							String oldAnswer;
							if (oldAnswerObject instanceof Boolean) {
								//doing oldApp.getString() will return "true" or "false"; 
								//not what we want
								if (oldAnswerObject.equals(Boolean.TRUE)) {
									oldAnswer = "1";
								} else {
									oldAnswer = "0";
								}
							} else {
								oldAnswer = oldAnswerObject.toString();
							}
							if (oldAnswer.length() > 4000) {
								oldAnswer = oldAnswer.substring(0, 4000);
							}
							String newAnswer;
							Map<String, String> valueMapping = answerToValueMapMapping
									.get(answerID);
							if (valueMapping != null) {
								newAnswer = valueMapping.get(oldAnswer);
							} else {
								newAnswer = oldAnswer;
							}
							insertStatement.setInt(1, Integer
									.parseInt(answerID));
							insertStatement.setInt(2, newId);
							insertStatement.setString(3, newAnswer);
							String values = "(" + answerID + ", "
							+ newId + ", " + newAnswer + ")";
							valuesList.add(values);
							try {
								insertStatement.addBatch();
							} catch (SQLException e) {
								log.error("Unable to add values " + values +" to command batch", e);
							}
							insertStatement.clearParameters();
						}
					}
				}
				int[] results;
				try {
					results = insertStatement.executeBatch();
				} catch (BatchUpdateException e) {
					results = e.getUpdateCounts();
					String message = "Batch execution failed; values that failed:";
					String endl = System.getProperty("line.separator");
					for (int i = 0; i < results.length; i++) {
						int result = results[i];
						if (result == Statement.EXECUTE_FAILED) {
							message += endl;
							message += "command " + i + ":" + endl;
							message += valuesList.get(i);
						}
					}
					message += endl;
					message += "Number of commands executed: " + results.length;
					log.error(message, e);
				}
				insertStatement.clearBatch();
			}
		}
		insertStatement.close();
	}

	private Map<String, String> readColumnMappings(Map<String, Map<String, String>> allValueMappings, String columnMappingFilename, Map<String, Map<String, String>> answerToValueMapMapping) throws FileNotFoundException, IOException {
		Map<String, String> columnMapping = new HashMap<String, String>();
		FileReader fr;
		fr = new FileReader(mappingDir + columnMappingFilename);
		BufferedReader columnMappingReader = new BufferedReader(fr);

		String header = columnMappingReader.readLine();
		String line = columnMappingReader.readLine();
		while (line != null) {
			String[] words = line.split("\\t");
			if (words.length < 1) {
				throw new RuntimeException("Split failed on line: " + line);
			}
			String answerID = words[0];
			String oldColumnName; 
			if (words.length < 2) {
				oldColumnName = "";
			} else {
				oldColumnName = words[1];
			}
			if (words.length > 2) {
				String valueMappingID = words[2];
				answerToValueMapMapping.put(answerID, allValueMappings.get(valueMappingID));
			}
			columnMapping.put(answerID, oldColumnName);
			line = columnMappingReader.readLine();
		}
		return columnMapping;
	}

	private Map<String, Map<String, String>> readValueMappings(String valueMappingFilename) throws FileNotFoundException, IOException {
		Map<String, Map<String, String>> allValueMappings = new HashMap<String, Map<String, String>>();
		FileReader fr = new FileReader(mappingDir + valueMappingFilename);
		BufferedReader valueMappingReader = new BufferedReader(fr);
		
		String header = valueMappingReader.readLine();
		String line = valueMappingReader.readLine();
		while (line != null) {
			String[] words = line.split("\\t");
			assert words.length == 3 : "Split failed on line: " + line;
			String mappingID = words[0];
			String oldAnswerValue = words[1];
			String newAnswerValue = words[2];
			Map<String, String> valueMapping = allValueMappings.get(mappingID);
			if (valueMapping == null) {
				valueMapping = new HashMap<String, String>();
				allValueMappings.put(mappingID, valueMapping);
			}
			valueMapping.put(oldAnswerValue, newAnswerValue);
			line = valueMappingReader.readLine();
		}
		return allValueMappings;
	}

}
