package org.alt60m.crs.logic;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;

import org.alt60m.crs.logic.Export.Table;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class AccessExportWriter implements ExportWriter {
	private static Log log = LogFactory.getLog(AccessExportWriter.class);

	private Export export;

	/**
	 * While I think I'd like to someday support both odbc and hxtt, right now
	 * we only support hxtt
	 */
	private static boolean useOdbc = false;

	private Connection connection;

	private String connectionUrl;

	public void setExport(Export export) {
		this.export = export;
	}

	public void init(String filename) throws IOException, SQLException {

		try {
			if (useOdbc) {
				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
				connectionUrl = "jdbc:odbc:DRIVER=Microsoft Access Driver (*.mdb); DBQ="
						+ filename;

			} else {
				Class.forName("com.hxtt.sql.access.AccessDriver");
				connectionUrl = "jdbc:access:///" + filename;
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("MS Access driver not available!");
		}
		log.debug("Url: " + connectionUrl);

		// verify we can connect
		try {
			connection = DriverManager.getConnection(connectionUrl);
			Statement statement = connection.createStatement();
			statement.close();
		} finally {
			if (connection != null) {
				connection.close();
				connection = null;
			}
		}
	}

	public void write() throws IOException, SQLException {
		if (export == null) {
			throw new IllegalStateException("Export has not been set!");
		}

		try {
			connection = DriverManager.getConnection(connectionUrl);

			for (Table table : export.getTables()) {
				writeTable(table, connection);
			}
		} finally {
			if (connection != null) {
				connection.close();
				connection = null;
			}
			if (!useOdbc) {
				// You would think something like this is unnecessary, but
				// it isn't. Without it, repeated requests (for the same
				// conference) cause failures.
				com.hxtt.sql.access.AccessDriver.releaseAll();
			}
		}
	}

	private void writeTable(Table table, Connection connection)
			throws SQLException {
		createTable(table, connection);
		copyTable(table, connection);
	}

	/**
	 * Given a query, createTable creates a new table to accommodate the data If
	 * the table exists, it is dropped.
	 */
	private void createTable(Table table, Connection connection)
			throws SQLException {

		Statement statement = null;
		String destinationTable = toLegalTableSyntax(table.getName());
		try {

			log.debug("creating table: " + destinationTable);

			String ddl;
			if (useOdbc) {
				ddl = createTableDDLOdbc(table);
			} else {
				ddl = createTableDDLHxtt(table);
			}
			log.debug("DDL: " + ddl);

			statement = connection.createStatement();
			statement.executeUpdate(ddl);
		} catch (SQLException e) { // table probably already exists
			log.debug("can't create table: " + e);
		} finally {
			if (statement != null) {
				statement.close();
			}
		}
	}


	/**
	 * HXTT-specific
	 * 
	 * @param table
	 * @return
	 * @throws SQLException
	 */
	private String createTableDDLHxtt(Table table) throws SQLException {
		ResultSetMetaData rsmd = table.getData().getMetaData();
		StringBuffer ddl = new StringBuffer();
		ddl.append("CREATE TABLE ").append(toLegalTableSyntax(table.getName()))
				.append(" (");

		int count = rsmd.getColumnCount();
		boolean identityFound = false;

		for (int i = 1; i <= count; i++) {
			String sourceColumnName = rsmd.getColumnName(i);
			int type = rsmd.getColumnType(i);
			if (table.isColumnBoolean(sourceColumnName)) {
				type = Types.BOOLEAN;
			}
			String columnName = toLegalColumnSyntax(sourceColumnName);
			switch (type) {
			case Types.BOOLEAN:
				ddl.append(columnName).append(" BOOLEAN");
				break;
			case Types.BIGINT: 
			case Types.SMALLINT: 
			case Types.INTEGER: 
				if (!identityFound) { // identity
					identityFound = true;
					ddl.append(columnName).append(" INTEGER PRIMARY KEY"); // Note:
																			// with
																			// hxtt
																			// driver,
																			// we
																			// can't
																			// do
																			// autoincrementing
																			// PKs
				} else
					ddl.append(columnName).append(" INTEGER");
				break;
			case Types.CHAR: 
			case Types.VARCHAR:
				if (rsmd.getColumnDisplaySize(i) < 250)
					ddl.append(columnName).append(" VARCHAR(").append(
							rsmd.getColumnDisplaySize(i) + 6).append(")");
				else
					ddl.append(columnName).append(" LONGVARCHAR");
				break;
			case Types.FLOAT: 
			case Types.DOUBLE: 
				ddl.append(columnName).append(" ").append(
						rsmd.getColumnTypeName(i));
				break;
			case Types.TIMESTAMP: 
				ddl.append(columnName).append(" ").append("TIMESTAMP");
				break;
			default:
				log.error("Column: " + columnName + " with type: "
						+ rsmd.getColumnTypeName(i) + " ("
						+ rsmd.getColumnType(i) + ")" + " not yet handled!");
			}
			ddl.append(", ");
		}

		if (count != 0) {
			ddl.setLength(ddl.length() - 2);
		}
		ddl.append(")");

		return ddl.toString();
	}

	/**
	 * Not yet implemented. May never be implemented.
	 * 
	 * @param table
	 * @return
	 * @throws SQLException
	 */
	private String createTableDDLOdbc(Table table) throws SQLException {
		return null;
	}

	private String toLegalColumnSyntax(String columnName) {

		columnName = columnName.replace('\n', '_').replace('\r', '_').replace(
				'[', '|').replace(']', '|').replace(".", "").replace("!", "")
				.trim();
		// hxtt doesn't nicely handle . and !, even when escaped
		return "[" + columnName + "]";
	}

	private String toLegalTableSyntax(String tableName) {
		// probably not an exhaustive list, but should usually work
		tableName = tableName.replace('\n', '_').replace('\r', '_').replace(
				'[', '|').replace(']', '|').replace('(', '_').replace(')', '_')
				.replace('!', ' ').replace('.', '_').replace('-', '_').replace(
						'`', '_').replace('"', '_').replace('\'', '_').replace(
						'?', '_').replace(',', '_').replace(' ', '_').replace(
						'/', '_').replace(";", "").replace(':', '_').replace(
						'#', '_').replace('&', '_').replace('<', '_').replace(
						'>', '_');

		return tableName;
	}

	private void copyTable(Table table, Connection connection)
			throws SQLException {
		String destinationTable = toLegalTableSyntax(table.getName());

		ResultSet rs = table.getData();
		ResultSetMetaData rsmd = rs.getMetaData();
		int colCount = rsmd.getColumnCount();

		StringBuffer insertQuery = new StringBuffer("INSERT INTO "
				+ destinationTable + " (");

		for (int i = 1; i <= colCount; i++) {
			insertQuery.append(toLegalColumnSyntax(rsmd.getColumnName(i))
					+ ", ");
		}
		insertQuery.setLength(insertQuery.length() - 2);
		insertQuery.append(") VALUES (");

		for (int i = 1; i <= colCount; i++) {
			insertQuery.append("?, ");
		}
		insertQuery.setLength(insertQuery.length() - 2);
		insertQuery.append(")");
		PreparedStatement ps = null;
		String id = "(none)";
		try {
			ps = connection.prepareStatement(insertQuery.toString());

			while (rs.next()) {
				ps.clearParameters();
				id = rs.getObject(1).toString();
				for (int i = 1; i <= colCount; i++) {
					Object value = rs.getObject(i);
					int type = rsmd.getColumnType(i);
					ps.setObject(i, value, type);
				}
				ps.executeUpdate();
			}
		} catch (SQLException e) {
			//assume id is the first column
			log.error("insert query failed for id " + id + ":" + insertQuery, e);
			throw e;
		}

		finally {
			if (ps != null) {
				ps.close();
			}
		}
	}
}
