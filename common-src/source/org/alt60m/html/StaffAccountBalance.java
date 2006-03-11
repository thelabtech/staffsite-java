package org.alt60m.html;

import java.sql.*;
import java.util.*;

/*
q#1
select last_month_bal from staff_last_bal_vw where emplid = '9-digit account number';

q#2
select sum(trans_amount) from staff_trans_vw where a.stf_acct_type = 'PRIME' and a.posted_flag = 'N' and a.emplid = '9-digit account number';

add the results of both queries together to get current account balance

 */


public class StaffAccountBalance implements java.io.Serializable {
    
    Connection m_connection = null;    
    
    public StaffAccountBalance() {}    
    
    public int fetchBalance(String acct) throws java.rmi.RemoteException {
	int v1 = 0;
	int v2 = 0;	

	String staffAccountNo = acct.substring(0,9);

	try {
	    DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
	    Connection m_connection = DriverManager.getConnection("jdbc:oracle:thin:@(description=(address=(host=prddb1.ccci.org)(protocol=tcp)(port=1521))(connect_data=(sid=prod)))", "istcampus", "gocampus"); 
	    
	    if (m_connection != null) {
		Statement statement = m_connection.createStatement();
		ResultSet rs1 = statement.executeQuery("select last_month_bal from staff_last_bal_vw where emplid = '"+ staffAccountNo +"'");
		rs1.next();
		v1 = rs1.getInt("last_month_bal");
		rs1.close();

		ResultSet rs2 = statement.executeQuery("select sum(trans_amount) as dasum from staff_trans_vw a where a.stf_acct_type = 'PRIME' and a.posted_flag = 'N' and a.emplid = '" + staffAccountNo + "'");
		rs2.next();
		v2 = rs2.getInt("dasum");
		rs2.close();

		m_connection.close();
	    }

	} catch (SQLException e) {
	    System.err.println(e);
	}

	return v1 + v2;
    }
    
    
    public static void main(String[] args) {
	StaffAccountBalance acct = new StaffAccountBalance();
	try {
	    System.out.println(acct.fetchBalance("000497260"));
	} catch (java.rmi.RemoteException re) {
	    System.err.println(re);
	    // things may not be all cleaned up yet
	}
    }
}
