package org.alt60m.wsn.sp.bean.dbio;

import java.sql.*;
import java.util.*;
import java.text.*;
import org.alt60m.hr.ms.servlet.dbio.MSInfo;

public class WsnApplicationAccountBalanceUpdater implements java.io.Serializable {
    
//    String conn = new String("jdbc:oracle:thin:@(description=(address=(host=hart-ca009v)(protocol=tcp)(port=1526))(connect_data=(sid=prod)))");
//    String oracleun = new String("istcampus");
//    String oraclepw = new String( "gocampus");
    String deleteStatementText = new String("");
    String insertStatementText = new String("");
	boolean loaded = false;
	private final String currentWsnYear = MSInfo.CURRENT_WSN_YEAR;
    
    public WsnApplicationAccountBalanceUpdater() {}

    public void doIt() {
		try {
			//Oracle connection for getting current balances
			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());

			java.sql.Connection sqlconnInsert = org.alt60m.util.DBConnectionFactory.getDatabaseConn();
			java.sql.Statement sqlstmtInsert = sqlconnInsert.createStatement();

			System.out.println("Load PS Financial records....");
			loaded = loadDonations(sqlstmtInsert);
			System.out.println("...Loading!");

			sqlstmtInsert.close();
			sqlconnInsert.close();

			//ms sql connection for saving balance
			java.sql.Connection sqlconn = org.alt60m.util.DBConnectionFactory.getDatabaseConn();
			java.sql.Statement sqlstmt = sqlconn.createStatement();
			java.sql.ResultSet accounts = sqlstmt.executeQuery("SELECT APPLACCOUNTNO, WsnApplicationID FROM wsn_sp_viewApplication WHERE wsnYear = '"+currentWsnYear+"' and isstaff = '0' and applaccountno IS NOT NULL");

			while (accounts.next()) {
				String accountNo = accounts.getString("applaccountno");
				String WsnApplicationID = accounts.getString("WsnApplicationid");
				// check for applicants with account numbers
				if (!accountNo.equals("")) {
					System.out.print("Updating " + accountNo + "...");
					try {
						double bal = fetchBalance(accountNo, sqlconn);
						java.sql.Statement sqlstmt2 = sqlconn.createStatement();
						sqlstmt2.executeUpdate("update wsn_sp_WsnApplication set supportbalance = " + bal + " where WsnApplicationID = '" + WsnApplicationID + "'");
						System.out.println(" updated with " + bal);
						sqlstmt2.close();
					} catch (SQLException e) {
						System.err.println("Error fetching " + accountNo);
						System.err.println(e);
					}
				}
			} 
			sqlconn.close();

		} catch (SQLException e) {
			System.err.println("SQL Error in people loop: " + e.toString());
		} catch (Exception e) {
			System.err.println("General Error in people loop: " + e.toString());
		}
    }
    

    public double fetchBalance(String acct, Connection sqlconn) throws java.sql.SQLException {
		double v1 = 0;
		double v2 = 0;	
		String AccountNo = acct;
		
		Statement statement = sqlconn.createStatement();
		ResultSet rs2 = statement.executeQuery("select sum(monetary_amount) from wsn_sp_WsnDonations where accountno='" + AccountNo + "'");
		
		rs2.next();
		v2 = rs2.getDouble(1)*-1;
		rs2.close();
		statement.close();

		return v2;
    }
    
    //Load Donations records from Oracle/PS Financial system into sqlServer
    public boolean loadDonations(java.sql.Statement sqlstmtInsert) throws java.sql.SQLException {
		boolean goodRecord = true;
		try {
			Connection oracleConnection = org.alt60m.util.DBConnectionFactory.getOracleDatabaseConn();

			if (oracleConnection != null) {
				Statement oracleStatement = oracleConnection.createStatement();
				ResultSet oracleRS2 = oracleStatement.executeQuery("select ROWNUM, JRNL_LN_REF, MONETARY_AMOUNT from finprod.ps_jrnl_ln where business_unit='CAMPS' and journal_id like 'CN%' and journal_date > '1-Jan-"+currentWsnYear+"'");

				deleteStatementText = "DELETE FROM wsn_sp_WsnDonations";
				try {
					System.out.println("Deleting wsn_sp_Donations....");
					sqlstmtInsert.executeUpdate(deleteStatementText);
					System.out.println("....wsn_sp_Donations Deleted!");
				} catch (SQLException e) {
					System.err.println("CANNOT delete wsn_sp_WsnDonations!");
					System.err.println(e);
				}
				while (oracleRS2.next()) {
					goodRecord = true;
					String rowNum = oracleRS2.getString("ROWNUM");
					String jLineRef = oracleRS2.getString("JRNL_LN_REF");
					String monAmt = oracleRS2.getString("MONETARY_AMOUNT");
					if (jLineRef.trim().length() < 1)
					{
						goodRecord = false;
					} else {
					}
					if (rowNum.trim().length() < 1)
					{
						goodRecord = false;
					} else {
					}
					if (monAmt.trim().length() < 1)
					{
						goodRecord = false;
					} else {
					}

					if (goodRecord)
					{
						// Insert donation record into our SQL Server database
						//ms sql connection for saving balance
						insertStatementText = "INSERT INTO wsn_sp_WsnDonations values (" + rowNum + ", '" + jLineRef + "', " + monAmt + ")";
						try
						{
							sqlstmtInsert.executeUpdate(insertStatementText);
						} catch (SQLException e) {
							System.err.println("Error fetching Record Number " + rowNum + " Account Number " + jLineRef);
							System.err.println(e);
						}
					}
				}
				oracleRS2.close();
				oracleStatement.close();
				oracleConnection.close();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			System.err.println("Where having real problems if this gets thrown!");
			System.err.println(e);
		}
		return true;
    }
    
    
    public static void main(String[] args) {
		WsnApplicationAccountBalanceUpdater updater = new WsnApplicationAccountBalanceUpdater();
		java.util.Date today;
		java.util.Date today2;
		String timeOut;
		String timeOut2;
		String dateOut;
		Locale currentLocale;
		DateFormat dateFormatter;
		DateFormat dateFormatter2;
		currentLocale = new Locale("en", "US");

		//Print out time stamp start
		dateFormatter = DateFormat.getDateInstance(DateFormat.DEFAULT, currentLocale);
		DateFormat timeFormatter = DateFormat.getTimeInstance(DateFormat.DEFAULT, currentLocale);
		today = new java.util.Date();
		timeOut = timeFormatter.format(today);
		System.out.println("Starting..." + timeOut);

		// Main
		org.alt60m.servlet.ObjectMapping.setConfigPath(args[0]);
		updater.doIt();

		//Print out time stamp end
		today2 = new java.util.Date();
		DateFormat timeFormatter2 = DateFormat.getTimeInstance(DateFormat.DEFAULT, currentLocale);
		timeOut2 = timeFormatter2.format(today2);
		System.out.println("\n...Finished..." + timeOut2);
    }
}
