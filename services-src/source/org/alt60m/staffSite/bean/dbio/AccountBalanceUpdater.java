package org.alt60m.staffSite.bean.dbio;

import java.sql.*;
import java.util.*;
import org.alt60m.util.DBConnectionFactory;

public class AccountBalanceUpdater {

	final String BALANCE_PREFERENCE_NAME = "CURRENT_BALANCE";    

	Connection m_connection = null;
	UserPreferences _preferences;

	public AccountBalanceUpdater() {}
    
	public void performUpdate(boolean verbose)  {
		try {
			_preferences = new UserPreferences();

			// Connect to the prod database to get the imported table... (wierd??)
			m_connection = DBConnectionFactory.getOracleDatabaseConn();
			 
			if (m_connection == null) {
				System.out.println("Failed to open Oracle database connection!");
				return;
			}

			System.out.println("Connected.");
			
			java.util.Date querystart = new java.util.Date();
			System.out.println("[" + querystart +"] Querying...");
			
			//get all StaffSiteProfiles
			Connection sqlconn = DBConnectionFactory.getDatabaseConn();
			Statement sqlstatement = sqlconn.createStatement();
			String query = "SELECT obj.firstName, obj.lastName, obj.accountNo, obj.StaffSiteProfileID FROM staffsite_staffsiteprofile obj WHERE LEN(obj.accountNo) > 0 ORDER BY obj.lastName";
			ResultSet rs = sqlstatement.executeQuery(query);

			java.util.Date querystop = new java.util.Date();
			System.out.println("[" + querystop + "] Got Recordset.");

			System.out.println("[" + new java.util.Date() + "] Getting current balances.");			
			Hashtable allBalances = getAllBalances();
			m_connection.close();

			String accountNo;
			String profileID;
			int balance;
			Hashtable profile;

			while (rs.next()) {
				accountNo = (String) rs.getString("accountNo");
				profileID = (new Integer(rs.getInt("StaffSiteProfileID"))).toString();
				String dateStamp = (new java.text.SimpleDateFormat ("yyyy.MM.dd")).format(new java.util.Date());
				try {

					if(accountNo.length() < 9) {
						if(verbose) System.out.println("**Account number is malformed for '" + rs.getString("LastName") + ", " + rs.getString("FirstName") + " (acct#" + accountNo + ")'.  ");
					} else {
						String commonAccountNo = accountNo.substring(0,9);

						if(allBalances.containsKey(commonAccountNo)) {
							balance = ((Integer) allBalances.get(commonAccountNo)).intValue();
							_preferences.savePreference(profileID, BALANCE_PREFERENCE_NAME, dateStamp , Integer.toString(balance));
							if (verbose) 
								System.out.println("  Updated balance for '" + rs.getString("LastName") + ", " + rs.getString("FirstName") + " (acct#" + accountNo + ")': " + balance);
						} else { 
							if (verbose) 
								System.out.println("**No balance info available for '" + rs.getString("LastName") + ", " + rs.getString("FirstName") + " (acct#" + accountNo + ")'.  ");
						}
					}
					
				} catch(Exception e) {
					System.out.println("**Failed to update balance for '" + rs.getString("LastName") + ", " + rs.getString("FirstName") + " (acct#" + accountNo + ")'.");
					if(verbose) 
						System.out.println("  Error message: " + e.getMessage());
					else
						System.out.println("  Error message: " + e.toString());

				}
			}
	
			System.out.println("[" + new java.util.Date() +"] Success.");

		} catch (Exception e) {
			System.out.println("[" + new java.util.Date() +"] Failed.");
			System.out.println(e.toString());
			e.printStackTrace();
		}
	}
	
	public Hashtable getAllBalances() throws Exception {
			
	String query = "select lm.emplid as emplid, (lm.last_month_bal + nvl(tm.dasum,0)) as cur_bal from " +
					"(select emplid, last_month_bal from staff_last_bal_vw) lm, (select emplid, sum(trans_amount) as dasum from staff_trans_vw a " + 
					"where a.stf_acct_type = 'PRIME' and trans_date > '01-may-2001' and a.posted_flag = 'N' group by emplid) tm " +
					"where lm.emplid = tm.emplid order by lm.emplid";

		Statement statement = m_connection.createStatement();
		System.out.println("[" + new java.util.Date() +"]before executing query .....");
		ResultSet rs1 = statement.executeQuery(query);
		System.out.println("[" + new java.util.Date() +"]after executing query .....");
		
		Hashtable allBalances = new Hashtable();
		
		while(rs1.next()) {
			allBalances.put(rs1.getString("emplid"), new Integer(rs1.getInt("cur_bal")));
		}

		rs1.close();

		return allBalances;
	}

	public static void main(String[] args) throws Exception {
		if (args.length<1) {
			System.out.println("Usage: AccountBalanceUpdater [-verbose]");
			return;
		}
		org.alt60m.servlet.ObjectMapping.setConfigPath(args[1]);
	
		AccountBalanceUpdater abu = new AccountBalanceUpdater();
		
		if (args.length>=1 && "-verbose".equalsIgnoreCase(args[0]))
			abu.performUpdate(true);
		else
			abu.performUpdate(false);

	}
}
