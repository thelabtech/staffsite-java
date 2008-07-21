package org.alt60m.wsn.sp.bean.dbio;

import java.sql.BatchUpdateException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import org.alt60m.hr.ms.servlet.dbio.MSInfo;
import org.alt60m.util.DBConnectionFactory;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.BasicConfigurator;

public class WsnApplicationAccountBalanceUpdater {

	private static final String donationsTable = "sp_donations";

	private static Log log = LogFactory.getLog(WsnApplicationAccountBalanceUpdater.class);

	private final int donationsYear = MSInfo.CURRENT_WSN_YEAR_INT ;
    public WsnApplicationAccountBalanceUpdater() {}

    public void run() {
    	Connection connection = null;
		try {
			connection = org.alt60m.util.DBConnectionFactory.getDatabaseConn();

			log.info("Load PS Financial records....");
			loadDonations(connection);
			log.info("...Done!");
		} catch (SQLException e) {
			log.error(e, e);
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.error("Unable to close connection", e);
			}
		}
    }

    // Load Donations records from Oracle/PS Financial system into sqlServer
	public void loadDonations(Connection connection)
			throws java.sql.SQLException {
		boolean goodRecord = true;
		Connection oracleConnection = null;
		Statement oracleStatement = null;
		ResultSet oracleResults = null;
		try {
			oracleConnection = org.alt60m.util.DBConnectionFactory
					.getOracleDatabaseConn();

			oracleStatement = oracleConnection.createStatement();
			oracleResults = oracleStatement
					.executeQuery("select ROWNUM, JRNL_LN_REF, MONETARY_AMOUNT from finprod.ps_jrnl_ln where (business_unit='CAMPS' or business_unit='KEYNT') and journal_id like 'CN%' and journal_date > '1-Jan-"
							+ donationsYear + "'");

			String deleteSql = "DELETE FROM " + donationsTable;
			Statement deleteStatement = null;
			try {
				log.info("Deleting " + donationsTable + "....");
				deleteStatement = connection.createStatement();
				deleteStatement.executeUpdate(deleteSql);
				log.info("...." + donationsTable + " Deleted!");
			} catch (SQLException e) {
				log.error("CANNOT delete " + donationsTable + "!", e);
				throw e;
			} finally {
				if (deleteStatement != null) {
					deleteStatement.close();
				}
			}
			String sql = "INSERT INTO " + donationsTable + " values (?, ?, ?)";
			PreparedStatement insertStatement = null;
			try {
				int executeInterval = 1000;
				int rowCount = 0;
				insertStatement = connection.prepareStatement(sql);
				while (oracleResults.next()) {
					rowCount++;
					goodRecord = true;
					long rowNum = oracleResults.getLong("ROWNUM");
					String designationNumber = oracleResults.getString("JRNL_LN_REF");
					double monetaryAmount = oracleResults.getDouble("MONETARY_AMOUNT");
					if (oracleResults.getString("ROWNUM").trim().length() < 1) {
						goodRecord = false;
					}
					if (oracleResults.getString("JRNL_LN_REF").trim().length() < 1) {
						goodRecord = false;
					}
					if (oracleResults.getString("MONETARY_AMOUNT").trim().length() < 1) {
						goodRecord = false;
					}

					if (goodRecord) {
						try {
							insertStatement.setLong(1, rowNum);
							insertStatement.setString(2, designationNumber);
							insertStatement.setDouble(3, monetaryAmount);
							insertStatement.addBatch();
							insertStatement.clearParameters();
						} catch (SQLException e) {
							log.error("Error inserting row; Record Number: "
									+ rowNum + "; Account Number: " + designationNumber,
									e);
						}
					} else {
						log.debug("bad record: " + rowNum + " " + designationNumber + " " + monetaryAmount);
					}

					if (rowCount % executeInterval == 0) {
						executeBulkInsert(insertStatement);
					}
				}
				if (rowCount % executeInterval != 0) { //otherwise, we hit it in the last loop
					executeBulkInsert(insertStatement);
				}
			} finally {
				if (insertStatement != null) {
					insertStatement.close();
				}
			}
			oracleResults.close();
			oracleStatement.close();
		} finally {
			if (oracleConnection != null) {
				oracleConnection.close();
			}
		}
	}
	private void executeBulkInsert(PreparedStatement insertCommand) throws SQLException {
		try {
			insertCommand.executeBatch();
		} catch (BatchUpdateException e) {
			int[] results = e.getUpdateCounts();
			log.error("Error executing batch commands; " + results.length + " commands executed.", e);
		}
		insertCommand.clearBatch();
	}

    public static void main(String[] args) {
    	BasicConfigurator.configure();
		WsnApplicationAccountBalanceUpdater updater = new WsnApplicationAccountBalanceUpdater();
		Date begin = new Date();
		log.info("Starting at " + begin + "...");
		log.info("username: " + args[0]);
		log.info("password: " + args[1]);
		log.info("db: " + args[2]);
		// Main
		DBConnectionFactory.setDefaultProperties(args[0], args[1], args[2]);
		DBConnectionFactory.setupPool();
		//Oracle connection for getting current balances
		try {
			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
		} catch (SQLException e) {
			log.error("Unable to register Oracle Driver!", e);
		}

		updater.run();
		Date end = new Date();
		log.info("...Finished at " + end + ".");
    }
}
