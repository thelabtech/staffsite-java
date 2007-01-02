/* Generated by Together */
package org.alt60m.util;

import java.sql.*;
import java.util.*;
import java.io.*;
import javax.naming.*;
import javax.sql.*;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.kenburcham.framework.Constants;
import com.kenburcham.framework.system.ConnectionManager;;

public class DBConnectionFactory {


	protected static Log log = LogFactory.getLog(DBConnectionFactory.class);
	
	private static final String ORACLE_DRIVER = "oracle.jdbc.OracleDriver";
    private static final String ORACLE_PROD_URL = "jdbc:oracle:thin:@hart-a801v.ccci.org:1521:prod2";
	private static final String ORACLE_DEFAULT_USER = "istcampus";
	private static final String ORACLE_DEFAULT_PW = "gocampus";

	private static final String MSSQL_DRIVER = "com.microsoft.jdbc.sqlserver.SQLServerDriver";
    private static String MSSQL_A022_URL = "jdbc:microsoft:sqlserver://hart-a051:1433";
    
    private static final String MSSQL_JTDS_DRIVER = "net.sourceforge.jtds.jdbc.Driver";
    private static String MSSQL_JTDS_URL = "jdbc:jtds:sqlserver://Hart-A051:1433;tds=8.0";
	
	private static String MYSQL_URL = "jdbc:mysql://Hart-A051:3306";
	private static String MYSQL_DRIVER = "com.mysql.jdbc.Driver";
	
	
	private static String DEFAULT_URL = MYSQL_URL;
	private static String DEFAULT_DRIVER = MYSQL_DRIVER;
	private static String DEFAULT_DB;
	private static String DEFAULT_USER;
	private static String DEFAULT_PW;

	private static final String POOL_NAME = Constants.DBPOOL;
	
	private static DataSource ds;
	static {

		setupPool();
	}

	/**
	 * 
	 */
	public static void setupPool() {
		try {
			Context init = new InitialContext();
			Context ctx = (Context) init.lookup("java:comp/env");
			ds = (DataSource) ctx.lookup(POOL_NAME);
			ConnectionManager.getInstance().addDataSource(POOL_NAME, ds);
		} catch (NamingException e) {
			log.warn("JNDI lookup failed; using default datasource");
			getConfigProperties();
			BasicDataSource bds = new BasicDataSource();
			bds.setUsername(DEFAULT_USER);
			bds.setPassword(DEFAULT_PW);
			bds.setUrl(DEFAULT_URL);
			bds.setDriverClassName(DEFAULT_DRIVER);
			ds = bds;
			ConnectionManager.getInstance().addDataSource(POOL_NAME, ds);
		}
	}

	static public Connection getDatabaseConn() throws SQLException {

		Connection con = ConnectionManager.getInstance().getConnection(
				POOL_NAME);
		if (con == null) {
			con = ds.getConnection();
			if (ds == null) {
				throw new SQLException("No connection available");
			}
		}
		return con;
	}
    
    static public Connection getDatabaseConn(String username, String password) throws ClassNotFoundException, SQLException {
		return _getDatabaseConn(DEFAULT_DRIVER , DEFAULT_URL, username, password);
	}

    static public Connection getOracleDatabaseConn() throws SQLException {
		try {
			return getOracleDatabaseConn(ORACLE_DEFAULT_USER, ORACLE_DEFAULT_PW);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Oracle Driver class not found!", e);
		}
	}
    static public Connection getOracleDatabaseConn(String username, String password) throws ClassNotFoundException, SQLException {
		return _getDatabaseConn(ORACLE_DRIVER, ORACLE_PROD_URL, username, password);
	}

    static private Connection _getDatabaseConn(String clazz, String url, String username, String password) throws ClassNotFoundException, SQLException {
		Class.forName(clazz);
		return DriverManager.getConnection(url, username, password);
    }
    
	private static void getConfigProperties() {
		try {
			Properties p = new Properties();
			p.load(new FileInputStream(org.alt60m.servlet.ObjectMapping.getConfigPath() + "/database.properties"));
			DEFAULT_USER = p.getProperty("username");
			DEFAULT_PW = p.getProperty("password");
			DEFAULT_DB = p.getProperty("database");
			if (DEFAULT_DB != null)
				DEFAULT_URL = DEFAULT_URL + "/" + DEFAULT_DB;
			else
				log.info("No Default database selected; continuing");
			if(p.getProperty("server")!=null) MSSQL_A022_URL = "jdbc:microsoft:sqlserver://"+p.getProperty("server")+":1433";
			log.info("Finished loading database properties");
		} catch (Exception e) {
			log.error("Failed loading database properties: ", e);
		}
	}
}


