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
    private static final String ORACLE_PROD_URL = "jdbc:oracle:thin:@(DESCRIPTION = (LOAD_BALANCE = YES) (FAILOVER = ON) (ADDRESS = (PROTOCOL = TCP)(HOST = paorad00v.ccci.org)(PORT = 1521)) (ADDRESS = (PROTOCOL = TCP)(HOST = paorad01v.ccci.org)(PORT = 1521)) (ADDRESS = (PROTOCOL = TCP)(HOST = paorad02v.ccci.org)(PORT = 1521)) (CONNECT_DATA = (SERVER = DEDICATED) (SERVICE_NAME = hcm9papp.ccci.org) (FAILOVER_MODE = (TYPE = SELECT) (METHOD = BASIC) (RETRIES = 20) (DELAY = 1) ) ) )";
	private static final String ORACLE_DEFAULT_USER = "istcampus";
	private static final String ORACLE_DEFAULT_PW = "iStCampus1";

	private static String MYSQL_URL = "jdbc:mysql://Hart-A051:3306";
	private static String MYSQL_DRIVER = "com.mysql.jdbc.Driver";


	private static String DEFAULT_URL = MYSQL_URL;
	private static String DEFAULT_DRIVER = MYSQL_DRIVER;
	private static String DEFAULT_DB;
	private static String DEFAULT_USER;
	private static String DEFAULT_PW;

	private static final String POOL_NAME = Constants.DBPOOL;

	private static DataSource ds;

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
			checkDefaultProperties();
			BasicDataSource bds = new BasicDataSource();
			bds.setUsername(DEFAULT_USER);
			bds.setPassword(DEFAULT_PW);
			bds.setUrl(DEFAULT_URL);
			bds.setDriverClassName(DEFAULT_DRIVER);
			ds = bds;
			ConnectionManager.getInstance().addDataSource(POOL_NAME, ds);
		}
	}

	private static void checkDefaultProperties() {
		if (DEFAULT_URL == null || DEFAULT_PW == null || DEFAULT_USER == null) {
			throw new IllegalStateException("Default properties not set");
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

    public static void setDefaultProperties(String username, String password, String db) {
    	DEFAULT_USER = username;
    	DEFAULT_PW = password;
    	DEFAULT_DB = db;
		DEFAULT_URL = DEFAULT_URL + "/" + DEFAULT_DB;
    }

}


