package org.alt60m.ministry.bean;

import java.sql.*;
import java.util.*;
//import org.alt60m.ministry.*;
import org.alt60m.util.DBConnectionFactory;
import org.alt60m.util.ObjectHashUtil;
import org.alt60m.ministry.model.dbio.*;
//import org.alt60m.util.TextUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Staff Updater
 *		
 * @author Mark Petrotta
 * 
 */

public class TestStaffUpdater {
	private static Log log = LogFactory.getLog(StaffUpdater.class);
	
	private static final String PS_EMPL_TBL = "sysadm.PS_EMPLOYEES";
    private static final String PS_TAX_TBL = "sysadm.PS_TAX_LOCATION1";
    private static final String PS_EMPL_ID  = "emplid";
    private static final String STAFF_TBL = "ministry_staff";

    Connection _connection;
    boolean _verbose = true;
    boolean _stopOnFail = false;
	



    public TestStaffUpdater() {    }
    private void initMinistry() throws Exception {
		log.info("initializing TestStaffUpdater...");
	    Connection conn = org.alt60m.util.DBConnectionFactory.getOracleDatabaseConn();
	    Statement statement = conn.createStatement();
	    ResultSet rs;

	    String qry = "SELECT SYSADM.PS_CCC_MINISTRIES.CCC_MINISTRY, SYSADM.PS_DEPT_TBL.DESCR FROM SYSADM.PS_CCC_MINISTRIES, SYSADM.PS_DEPT_TBL where SYSADM.PS_CCC_MINISTRIES.CCC_MINISTRY = SYSADM.PS_DEPT_TBL.DEPTID";

		log.info("preparing to execute query...");
	    rs = statement.executeQuery(qry);
		log.info("...executed.");

	    
	    conn.close();
		log.info("...done initializing TestStaffUpdater.");
    }

	



    public void initRespScope() throws Exception {
		log.info("initializing TestStaffUpdaterRespScope...");
		Connection conn = org.alt60m.util.DBConnectionFactory.getOracleDatabaseConn();
		Statement statement = conn.createStatement();
		ResultSet rs;
	
		String qry = "SELECT FIELDVALUE, XLATLONGNAME FROM SYSADM.PSXLATITEM where FIELDNAME = 'RESPONS_SCOPE'";
	
		log.info("preparing to execute query...");
		rs = statement.executeQuery(qry);
		log.info("...executed.");
	
		
		conn.close();
		log.info("...done initializing TestStaffUpdaterRespScope.");  
    }
    

    public void performUpdate() {
	try {
	    _connection = org.alt60m.util.DBConnectionFactory.getOracleDatabaseConn(); //DriverManager.getConnection(CONNECTION_INFO, USERNAME, PASSWORD); 
			 
	    if (_connection != null) {
			log.info("TestStaffUpdater Connected.");
			
			} else {
				log.error("The connection is null");
			}
		} catch (Exception e) {
			log.error("Error opening database connection",e);				
		}
    }


	private void insertStaffObjects() throws Exception {
		log.info("making Oracle connection ... ");
		Connection psconn = org.alt60m.util.DBConnectionFactory.getOracleDatabaseConn();
		Statement psstatement = psconn.createStatement();
		
		log.info("making sql connection ... ");
		Connection sqlconn = org.alt60m.util.DBConnectionFactory.getDatabaseConn();
		Statement sqlstatement = sqlconn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		
		ResultSet sqlrs;
		ResultSet psrs;

		log.info("[" + new java.util.Date() + "] Querying...");

		String qry = "select distinct accountNo from " + STAFF_TBL + " order by accountNo desc";
		log.info(qry);
		sqlrs = sqlstatement.executeQuery(qry);
		ArrayList<String> sqlResults = new ArrayList<String>();
		while (sqlrs.next()) {
			sqlResults.add(sqlrs.getString("accountNo"));
		}

		String psqry = "select distinct "+PS_EMPL_ID+" from "+PS_EMPL_TBL+" order by "+PS_EMPL_ID+" desc";
		log.info(psqry);
		psrs = psstatement.executeQuery(psqry);	
		
		
		psrs.close();
		sqlrs.close();

		psstatement.close();
		sqlstatement.close();
		
		psconn.close();
		sqlconn.close();
	}

    private void updateStaffObjects() throws Exception {
		insertStaffObjects();
//		Connection conn = org.alt60m.util.DBConnectionFactory.getOracleDatabaseConn();
		Statement statement = _connection.createStatement();
		ResultSet rs = null;

		log.info("[" + new java.util.Date() +"] Querying...");
		java.sql.Date currDate = new java.sql.Date(new java.util.Date().getTime());
		String qry = "select emp.*, tax.descr as tax_descr, tax.country as tax_country, tax.city as tax_city, tax.state as tax_state from " + PS_EMPL_TBL + " emp LEFT JOIN " + PS_TAX_TBL + " tax ON emp.tax_location_cd = tax.tax_location_cd WHERE emp.empl_rcd = 0 AND emp.effdt <= to_date('" + currDate.toString() + "','yyyy-mm-dd') order by " + PS_EMPL_ID + " desc";
		log.debug(qry);
		rs = statement.executeQuery(qry);
		
	
		   
		
    }
    


	private void setStaffAttributes(Staff staff, ResultSet rs)
		throws java.sql.SQLException, Exception {
	}
	private void showWhatChanged(Hashtable before, Hashtable after) {
		}

	private String translateMinistry="";
    
	private String translateRegion="";
    
	private String translateStrategy="";
    
    private String translateRespScope="";

    private void updateSpouseInfo(Staff staff, ResultSet rs) throws java.sql.SQLException {
    }

    private void setAddr(Staff staff, ResultSet rs) throws java.sql.SQLException {
    } 

	public static void main(String[] args) {
		try {
			StaffUpdater su = new StaffUpdater();
			DBConnectionFactory.setDefaultProperties(args[0], args[1], args[2]);
			log.info("Updating Staff");
			su.performUpdate();
		} catch (Exception e) {
			log.fatal("Failed!", e);
		}
	}
}
